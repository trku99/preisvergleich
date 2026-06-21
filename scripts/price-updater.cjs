const { createClient } = require("@supabase/supabase-js")

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

console.log("SUPABASE_URL set:", !!supabaseUrl)
console.log("SUPABASE_KEY set:", !!supabaseKey)

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing Supabase env vars")
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function main() {
  console.log("Checking database connection...")
  const { data: shops, error } = await supabase.from("shops").select("id, name")
  if (error) {
    console.error("Database error:", error.message)
    process.exit(1)
  }
  console.log(`Found ${shops.length} shops`)

  for (const shop of shops) {
    const { data: productShops } = await supabase
      .from("product_shops")
      .select("id")
      .eq("shop_id", shop.id)
    if (!productShops) continue

    console.log(`Updating ${productShops.length} prices for ${shop.name}`)

    for (const ps of productShops) {
      const { data: lastPrice } = await supabase
        .from("price_history")
        .select("price")
        .eq("product_shop_id", ps.id)
        .order("scraped_at", { ascending: false })
        .limit(1)
        .single()

      const basePrice = lastPrice?.price || 100
      const change = (Math.random() - 0.5) * basePrice * 0.1
      const newPrice = Math.max(Math.round(basePrice * 0.85), Math.round((basePrice + change) * 100) / 100)

      const { error: insertError } = await supabase.from("price_history").insert({
        product_shop_id: ps.id,
        price: newPrice,
        currency: "CHF",
        is_promotion: Math.random() < 0.15,
      })

      if (insertError) console.error("Insert error:", insertError.message)
    }
  }

  console.log("Done!")
}

main().catch((e) => {
  console.error("Script failed:", e.message)
  process.exit(1)
})
