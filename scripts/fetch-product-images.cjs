const { createClient } = require("@supabase/supabase-js")
require("dotenv").config({ path: require("path").join(__dirname, "..", ".env.local") })

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
)

async function fetchWithTimeout(url, timeout = 10000) {
  const controller = new AbortController()
  const id = setTimeout(() => controller.abort(), timeout)
  try {
    const res = await fetch(url, { signal: controller.signal })
    clearTimeout(id)
    return res.ok ? await res.text() : null
  } catch {
    clearTimeout(id)
    return null
  }
}

function extractOgImage(html) {
  // Try og:image first
  const match = html.match(/<meta\s+property=["']og:image["']\s+content=["']([^"']+)["']/i)
  if (match) return match[1]
  // Try og:image:secure_url
  const match2 = html.match(/<meta\s+property=["']og:image:secure_url["']\s+content=["']([^"']+)["']/i)
  if (match2) return match2[1]
  // Try first large image in HTML
  const match3 = html.match(/<img[^>]+src=["']([^"']+\.(?:jpg|jpeg|png|webp))["']/i)
  if (match3) return match3[1]
  return null
}

async function main() {
  const { data: interShop } = await supabase.from("shops").select("id").eq("slug", "interdiscount").single()
  const shopId = interShop?.id
  if (!shopId) { console.log("Interdiscount shop not found"); return }

  const { data: allLinks } = await supabase
    .from("product_shops")
    .select("id, product_id, product_url, products!inner(id, slug, name)")
    .eq("shop_id", shopId)
    .not("product_url", "is", null)
    .neq("product_url", "")

  const productShops = (allLinks || []).filter(p => p.product_url && p.product_url.includes("/product/"))

  if (!productShops || productShops.length === 0) {
    console.log("No Interdiscount product URLs found")
    return
  }

  console.log(`Found ${productShops.length} Interdiscount products to check`)

  let sql = "-- Update Interdiscount product images\nDO $$\nDECLARE\nBEGIN\n"
  let matched = 0

  for (const ps of productShops) {
    const url = ps.product_url
    console.log(`Fetching ${url}...`)
    const html = await fetchWithTimeout(url)

    if (!html) {
      console.log(`  -> Failed to fetch`)
      continue
    }

    const imgUrl = extractOgImage(html)
    if (imgUrl) {
      // Make absolute URL if relative
      const absoluteUrl = imgUrl.startsWith("http") ? imgUrl : new URL(imgUrl, url).href
      sql += `  UPDATE products SET image_url = '${absoluteUrl}' WHERE id = '${ps.product_id}';\n`
      matched++
      console.log(`  -> ${absoluteUrl}`)
    } else {
      console.log(`  -> No image found`)
    }
  }

  sql += "END $$;\n"
  console.log(`\nMatched ${matched}/${productShops.length} products`)

  if (matched > 0) {
    const fs = require("fs")
    fs.writeFileSync("supabase/update-images-interdiscount.sql", sql, "utf8")
    console.log("SQL written to supabase/update-images-interdiscount.sql")
  }
}

main().catch(console.error)
