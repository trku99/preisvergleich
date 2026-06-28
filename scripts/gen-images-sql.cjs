const { createClient } = require("@supabase/supabase-js")
require("dotenv").config({ path: require("path").join(__dirname, "..", ".env.local") })

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
)

async function main() {
  const { data: products } = await supabase.from("products").select("id, slug, name")
  if (!products) return console.log("No products found")

  let sql = "-- Update product images with picsum.photos\nDO $$\nDECLARE\nBEGIN\n"
  for (const p of products) {
    sql += "  UPDATE products SET image_url = 'https://picsum.photos/seed/" + p.slug + "/400/400' WHERE id = '" + p.id + "';\n"
  }
  sql += "END $$;\n"

  const fs = require("fs")
  fs.writeFileSync("supabase/update-images.sql", sql, "utf8")
  console.log("Written " + products.length + " updates to supabase/update-images.sql")
}

main().catch(console.error)
