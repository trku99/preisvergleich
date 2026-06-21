const { createClient } = require("@supabase/supabase-js")

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing Supabase env vars")
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

function randomPriceChange(basePrice) {
  const change = (Math.random() - 0.5) * basePrice * 0.1
  const newPrice = Math.round((basePrice + change) * 100) / 100
  return Math.max(Math.round(basePrice * 0.85), newPrice)
}

async function updatePrices() {
  console.log("Updating prices...")

  const { data: shops } = await supabase.from("shops").select("id, name")
  if (!shops) return

  console.log(`Found ${shops.length} shops`)

  let total = 0

  for (const shop of shops) {
    const { data: productShops } = await supabase
      .from("product_shops")
      .select("id, product_id")
      .eq("shop_id", shop.id)

    if (!productShops) continue

    for (const ps of productShops) {
      const { data: lastPrice } = await supabase
        .from("price_history")
        .select("price")
        .eq("product_shop_id", ps.id)
        .order("scraped_at", { ascending: false })
        .limit(1)
        .single()

      const basePrice = lastPrice?.price || 100
      const newPrice = randomPriceChange(basePrice)
      const isPromotion = Math.random() < 0.15

      await supabase.from("price_history").insert({
        product_shop_id: ps.id,
        price: newPrice,
        currency: "CHF",
        is_promotion: isPromotion,
      })

      await supabase.from("product_shops").update({ in_stock: Math.random() > 0.1 }).eq("id", ps.id)

      total++
    }
  }

  console.log(`Updated ${total} prices across ${shops.length} shops`)
}

updatePrices().catch(console.error)
