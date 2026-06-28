const { createClient } = require("@supabase/supabase-js")
const { XMLParser } = require("fast-xml-parser")
require("dotenv").config({ path: require("path").join(__dirname, "..", ".env.local") })

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
)

async function fetchFeed(url) {
  const res = await fetch(url, { signal: AbortSignal.timeout(30000) })
  if (!res.ok) throw new Error(`HTTP ${res.status}`)
  return await res.text()
}

function parseXMLProducts(xml) {
  const parser = new XMLParser({ ignoreAttributes: false, attributeNamePrefix: "@_" })
  const doc = parser.parse(xml)

  // Google Shopping XML format
  const items = doc?.rss?.channel?.item || doc?.feed?.entry || []
  const products = Array.isArray(items) ? items : [items]

  return products.map((item) => {
    const g = item["g:"] || {}
    return {
      name: item.title || g.title || "",
      brand: g.brand || "",
      ean: g.ean || g.gtin || g.upc || item.ean || "",
      mpn: g.mpn || item.mpn || "",
      price: parseFloat(g.price?.replace(/[^0-9.]/g, "") || item.price?.replace(/[^0-9.]/g, "") || 0),
      currency: g.price?.includes("CHF") ? "CHF" : "CHF",
      image_url: g.image_link || g.link || item.image_link || "",
      product_url: g.link || item.link || "",
      sku: g.id || item.id || "",
      category: g.product_type || item.category || "",
      description: g.description || item.description || "",
    }
  }).filter((p) => p.name)
}

function parseCSVProducts(csv) {
  const lines = csv.split("\n").filter(Boolean)
  if (lines.length < 2) return []
  const headers = lines[0].split(",").map((h) => h.trim().toLowerCase())
  return lines.slice(1).map((line) => {
    const vals = line.split(",").map((v) => v.trim().replace(/^"|"$/g, ""))
    const row = {}
    headers.forEach((h, i) => (row[h] = vals[i]))
    return {
      name: row.title || row.name || "",
      brand: row.brand || "",
      ean: row.ean || row.gtin || "",
      mpn: row.mpn || "",
      price: parseFloat(row.price?.replace(/[^0-9.]/g, "") || "0"),
      currency: row.currency || "CHF",
      image_url: row.image_link || row.image || "",
      product_url: row.link || row.url || "",
      sku: row.id || row.sku || "",
      category: row.product_type || row.category || "",
      description: row.description || "",
    }
  }).filter((p) => p.name)
}

async function importProducts(shopSlug, products) {
  const { data: shop } = await supabase.from("shops").select("id").eq("slug", shopSlug).single()
  if (!shop) throw new Error(`Shop "${shopSlug}" not found`)

  let imported = 0, updated = 0

  for (const p of products) {
    // Check if product exists by EAN or name
    let { data: existing } = await supabase
      .from("products")
      .select("id")
      .or(`ean.eq.${p.ean},name.eq.${p.name.replace(/'/g, "''")}`)
      .maybeSingle()

    let productId
    if (existing) {
      productId = existing.id
      updated++
    } else {
      const slug = p.name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 100)
      // Check if slug exists, append random if so
      const { data: slugCheck } = await supabase.from("products").select("id").eq("slug", slug).maybeSingle()
      const finalSlug = slugCheck ? slug + "-" + Math.random().toString(36).slice(2, 6) : slug

      const { data: newProduct } = await supabase.rpc("admin_insert_product", {
        p_name: p.name, p_slug: finalSlug, p_description: p.description || "",
        p_image_url: p.image_url || "", p_category_id: null,
        p_ean: p.ean || "", p_mpn: p.mpn || "", p_brand: p.brand || "",
      })
      productId = newProduct
      imported++
    }

    if (productId && p.product_url) {
      await supabase.rpc("admin_upsert_product_shop", {
        p_product_id: productId, p_shop_id: shop.id,
        p_product_url: p.product_url, p_sku: p.sku || "",
        p_in_stock: true,
      })
    }
  }

  return { imported, updated, total: products.length }
}

async function main() {
  const feedId = process.argv[2]
  if (!feedId) {
    console.log("Usage: node scripts/feed-importer.cjs <feed_source_id>")
    process.exit(1)
  }

  const { data: feed } = await supabase.from("feed_sources").select("*, shops!inner(slug)").eq("id", feedId).single()
  if (!feed) { console.log("Feed not found"); process.exit(1) }

  console.log(`Fetching ${feed.feed_url}...`)

  let products = []
  try {
    const raw = await fetchFeed(feed.feed_url)
    if (feed.feed_type === "xml") products = parseXMLProducts(raw)
    else if (feed.feed_type === "csv") products = parseCSVProducts(raw)
    else throw new Error(`Unsupported feed type: ${feed.feed_type}`)
  } catch (err) {
    console.error(`Fetch failed: ${err.message}`)
    await supabase.rpc("admin_insert_feed_log", {
      p_feed_source_id: feedId, p_status: "error",
      p_products_found: 0, p_products_imported: 0, p_products_updated: 0,
      p_error_message: err.message,
    })
    await supabase.from("feed_sources").update({ last_status: "error", last_error: err.message, last_fetched_at: new Date().toISOString() }).eq("id", feedId)
    process.exit(1)
  }

  console.log(`Found ${products.length} products in feed`)

  const result = await importProducts(feed.shops.slug, products)
  console.log(`Imported: ${result.imported}, Updated: ${result.updated}, Total: ${result.total}`)

  await supabase.rpc("admin_insert_feed_log", {
    p_feed_source_id: feedId, p_status: "success",
    p_products_found: result.total, p_products_imported: result.imported,
    p_products_updated: result.updated, p_error_message: "",
  })
  await supabase.from("feed_sources").update({
    last_status: "success", last_error: null, last_fetched_at: new Date().toISOString()
  }).eq("id", feedId)
}

main().catch(console.error)
