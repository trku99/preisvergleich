// Download Interdiscount sitemaps, extract product URLs, match with our DB
const { createClient } = require("@supabase/supabase-js")
require("dotenv").config({ path: ".env.local" })

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
)

const SITEMAP_INDEX = "https://www.interdiscount.ch/sitemap.xml"

function sleep(ms) { return new Promise(r => setTimeout(r, ms)) }

async function fetchXml(url) {
  const res = await fetch(url, {
    headers: { "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" }
  })
  return res.text()
}

function extractUrls(xml, pattern) {
  const urls = []
  const regex = new RegExp(`<loc>(${pattern})</loc>`, "gi")
  let match
  while ((match = regex.exec(xml)) !== null) {
    urls.push(match[1])
  }
  return urls
}

function extractProductNameFromUrl(url) {
  // https://www.interdiscount.ch/de/product/product-name-000123456
  const match = url.match(/\/product\/(.+?)-\d+$/)
  if (match) return match[1].replace(/-/g, " ").toLowerCase()
  return null
}

function normalize(text) {
  return text.toLowerCase()
    .replace(/['']/g, "")
    .replace(/[^a-z0-9 ]/g, " ")
    .replace(/\s+/g, " ")
    .trim()
}

async function main() {
  console.log("Fetching sitemap index...")
  const indexXml = await fetchXml(SITEMAP_INDEX)
  const prodSitemaps = extractUrls(indexXml, "https://www\\.interdiscount\\.ch/sitemap/siteMap_prod_de\\d+\\.xml")
  console.log(`Found ${prodSitemaps.length} product sitemaps for DE`)

  // Get all our products
  const { data: products } = await supabase.from("products").select("id, name, slug")
  if (!products) { console.error("No products found"); return }
  console.log(`Our products: ${products.length}`)

  // Create normalized name -> product map
  const productMap = {}
  for (const p of products) {
    productMap[normalize(p.name)] = p
  }

  // Get Interdiscount shop ID
  const { data: shop } = await supabase.from("shops").select("id").eq("slug", "interdiscount").single()

  let matched = 0
  let updated = 0

  for (const sitemapUrl of prodSitemaps) {
    console.log(`\nFetching ${sitemapUrl}...`)
    const xml = await fetchXml(sitemapUrl)
    const productUrls = extractUrls(xml, "https://www\\.interdiscount\\.ch/de/product/[^<]+")
    console.log(`  URLs: ${productUrls.length}`)

    for (const url of productUrls.slice(0, 200)) { // limit per sitemap
      const urlName = extractProductNameFromUrl(url)
      if (!urlName) continue

      const normalized = normalize(urlName)
      const matchedProduct = productMap[normalized]

      if (matchedProduct) {
        matched++
        // Update product_shop URL for Interdiscount
        const { error } = await supabase
          .from("product_shops")
          .update({ product_url: url })
          .eq("product_id", matchedProduct.id)
          .eq("shop_id", shop.id)

        if (!error) {
          updated++
          console.log(`  ✓ ${matchedProduct.name} -> ${url.substring(0, 80)}...`)
        }
      }
    }

    await sleep(1000) // be nice to the server
  }

  console.log(`\nDone! Matched: ${matched}, Updated: ${updated}`)
}

main().catch(console.error)
