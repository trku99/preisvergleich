const { chromium } = require("playwright")
const { createClient } = require("@supabase/supabase-js")

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing Supabase env vars")
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function scrape() {
  console.log("Starting scraper...")

  const { data: products } = await supabase.from("products").select("id, name, slug")
  if (!products || products.length === 0) {
    console.log("No products found")
    return
  }

  console.log(`Found ${products.length} products`)

  const browser = await chromium.launch({
    headless: true,
    args: ["--disable-blink-features=AutomationControlled", "--no-sandbox"],
  })

  const context = await browser.newContext({
    userAgent:
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36",
    viewport: { width: 1920, height: 1080 },
    locale: "de-CH",
  })

  await context.addInitScript(() => {
    Object.defineProperty(navigator, "webdriver", { get: () => false })
  })

  const page = await context.newPage()
  let scraped = 0

  for (const product of products) {
    console.log(`\nScraping: ${product.name}`)

    try {
      const searchUrl = `https://www.galaxus.ch/de/search?q=${encodeURIComponent(product.name)}`
      console.log(`  Searching: ${searchUrl}`)

      await page.goto(searchUrl, { waitUntil: "domcontentloaded", timeout: 20000 })
      await page.waitForTimeout(3000)

      const content = await page.content()
      if (content.includes("Robot") || content.includes("captcha") || content.includes("blocked")) {
        console.log("  ⚠ Blocked by Galaxus bot protection!")
        continue
      }

      const link = await page.$("a[href*='/de/']")
      if (!link) {
        console.log("  No product link found")
        continue
      }

      const href = await link.getAttribute("href")
      const productUrl = href.startsWith("http") ? href : `https://www.galaxus.ch${href}`
      console.log(`  Product URL: ${productUrl}`)

      await page.goto(productUrl, { waitUntil: "domcontentloaded", timeout: 20000 })
      await page.waitForTimeout(2000)

      const text = await page.textContent("body")
      const priceMatch = text.match(/CHF\s*([\d\'\,]+)/)
      if (!priceMatch) {
        console.log("  No price found")
        continue
      }

      const price = parseFloat(priceMatch[1].replace(/[',\s]/g, "").replace(",", "."))
      console.log(`  Price: CHF ${price}`)

      const { data: shop } = await supabase.from("shops").select("id").eq("slug", "galaxus").single()
      if (!shop) continue

      const { data: existing } = await supabase
        .from("product_shops")
        .select("id")
        .eq("product_id", product.id)
        .eq("shop_id", shop.id)
        .maybeSingle()

      let psId = existing?.id

      if (!psId) {
        const { data: newPs } = await supabase
          .from("product_shops")
          .insert({ product_id: product.id, shop_id: shop.id, product_url: productUrl })
          .select()
          .single()
        if (newPs) psId = newPs.id
      }

      if (psId) {
        await supabase.from("price_history").insert({
          product_shop_id: psId,
          price,
          currency: "CHF",
        })
        console.log("  ✅ Saved!")
        scraped++
      }
    } catch (e) {
      console.log(`  Error: ${e.message}`)
    }

    await page.waitForTimeout(4000)
  }

  await browser.close()
  console.log(`\nDone! ${scraped}/${products.length} scraped`)
}

scrape().catch(console.error)
