import { NextResponse } from "next/server"
import { createClient } from "@/lib/supabase-server"

export async function POST(req: Request) {
  try {
    const { feed_id } = await req.json()
    if (!feed_id) return NextResponse.json({ error: "feed_id required" }, { status: 400 })

    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 })

    // Get feed source info
    const { data: feed } = await supabase
      .from("feed_sources")
      .select("*, shops!inner(id, slug, name)")
      .eq("id", feed_id)
      .single()

    if (!feed) return NextResponse.json({ error: "Feed not found" }, { status: 404 })

    // Mark as running
    await supabase.from("feed_sources").update({
      last_status: "running", last_fetched_at: new Date().toISOString()
    }).eq("id", feed_id)

    // Fetch feed
    let raw: string
    try {
      const res = await fetch(feed.feed_url, { signal: AbortSignal.timeout(30000) })
      if (!res.ok) throw new Error(`HTTP ${res.status}`)
      raw = await res.text()
    } catch (err: any) {
      await logAndUpdate(supabase, feed_id, "error", 0, 0, 0, err.message)
      return NextResponse.json({ error: err.message }, { status: 500 })
    }

    // Parse products
    let products: any[] = []
    try {
      if (feed.feed_type === "xml") {
        const { XMLParser } = await import("fast-xml-parser")
        const parser = new XMLParser({ ignoreAttributes: false, attributeNamePrefix: "@_" })
        const doc = parser.parse(raw)
        const items = doc?.rss?.channel?.item || doc?.feed?.entry || []
        products = (Array.isArray(items) ? items : [items]).map((item: any) => {
          const g = item["g:"] || {}
          return {
            name: item.title || g.title || "",
            brand: g.brand || "",
            ean: g.ean || g.gtin || "",
            mpn: g.mpn || "",
            price: parseFloat(String(g.price || item.price || "0").replace(/[^0-9.]/g, "")),
            image_url: g.image_link || "",
            product_url: g.link || item.link || "",
            sku: g.id || "",
            description: g.description || "",
          }
        }).filter((p: any) => p.name)
      }
    } catch (err: any) {
      await logAndUpdate(supabase, feed_id, "error", 0, 0, 0, "Parse error: " + err.message)
      return NextResponse.json({ error: err.message }, { status: 500 })
    }

    // Import products
    let imported = 0, updated = 0
    for (const p of products) {
      const { data: existing } = await supabase
        .from("products")
        .select("id")
        .or(p.ean ? `ean.eq.${p.ean}` : `name.eq.${p.name.replace(/'/g, "''")}`)
        .maybeSingle()

      let productId
      if (existing) {
        productId = existing.id; updated++
      } else {
        const slug = p.name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 100)
        const { data: slugCheck } = await supabase.from("products").select("id").eq("slug", slug).maybeSingle()
        const finalSlug = slugCheck ? slug + "-" + Math.random().toString(36).slice(2, 6) : slug

        const { data: newProduct } = await supabase.rpc("admin_insert_product", {
          p_name: p.name, p_slug: finalSlug, p_description: p.description || "",
          p_image_url: p.image_url || "", p_category_id: null,
          p_ean: p.ean || "", p_mpn: p.mpn || "", p_brand: p.brand || "",
        })
        productId = newProduct; imported++
      }

      if (productId && p.product_url) {
        await supabase.rpc("admin_upsert_product_shop", {
          p_product_id: productId, p_shop_id: feed.shops.id,
          p_product_url: p.product_url, p_sku: p.sku || "", p_in_stock: true,
        })
      }
    }

    await logAndUpdate(supabase, feed_id, "success", products.length, imported, updated, "")

    return NextResponse.json({
      status: "success", products_found: products.length,
      products_imported: imported, products_updated: updated,
    })
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 })
  }
}

async function logAndUpdate(supabase: any, feedId: string, status: string,
  found: number, imported: number, updated: number, error: string) {
  await supabase.rpc("admin_insert_feed_log", {
    p_feed_source_id: feedId, p_status: status,
    p_products_found: found, p_products_imported: imported,
    p_products_updated: updated, p_error_message: error,
  })
  await supabase.from("feed_sources").update({
    last_status: status, last_error: error || null,
    last_fetched_at: new Date().toISOString(),
  }).eq("id", feedId)
}
