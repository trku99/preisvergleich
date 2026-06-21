import { supabase } from "../src/lib/supabase"

async function seed() {
  // Insert shops
  const { data: shops } = await supabase.from("shops").upsert([
    { name: "Galaxus", slug: "galaxus", base_url: "https://www.galaxus.ch" },
    { name: "Digitec", slug: "digitec", base_url: "https://www.digitec.ch" },
    { name: "Microspot", slug: "microspot", base_url: "https://www.microspot.ch" },
    { name: "Brack", slug: "brack", base_url: "https://www.brack.ch" },
    { name: "MediaMarkt", slug: "mediamarkt", base_url: "https://www.mediamarkt.ch" },
    { name: "Interdiscount", slug: "interdiscount", base_url: "https://www.interdiscount.ch" },
  ]).select()

  if (!shops) return

  const shopMap = Object.fromEntries(shops.map((s: any) => [s.slug, s.id]))

  // Insert products
  const products = [
    { name: "Sony WH-1000XM5 Kabellos Noise Cancelling", slug: "sony-wh-1000xm5", brand: "Sony", description: "Industry-leading noise cancellation with Auto NC Optimizer. 30-hour battery life.", ean: "0272429237655" },
    { name: "Apple AirPods Pro 3 mit MagSafe", slug: "apple-airpods-pro-3", brand: "Apple", description: "Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case.", ean: "0194256891234" },
    { name: "Samsung Galaxy S25 Ultra 256GB", slug: "samsung-galaxy-s25-ultra", brand: "Samsung", description: "Galaxy AI, 200MP Kamera, S Pen integriert, 12GB RAM.", ean: "0880609332917" },
    { name: "Apple iPhone 17 Pro 256GB", slug: "apple-iphone-17-pro", brand: "Apple", description: "A19 Chip, 48MP Triple-Kamera, Titanium Design.", ean: "0194265738291" },
    { name: "Nintendo Switch 2", slug: "nintendo-switch-2", brand: "Nintendo", description: "Next-gen gaming mit 7.9 Zoll Display, 4K Output.", ean: "045496454321" },
    { name: "Apple Watch Ultra 3 GPS + Cellular", slug: "apple-watch-ultra-3", brand: "Apple", description: "49mm Titanium, Precision Dual-Frequency GPS, 36h Battery.", ean: "0194265918273" },
    { name: "Dyson V15 Detect Staubsauger", slug: "dyson-v15-detect", brand: "Dyson", description: "Laser detection, Piezo-Sensor, 60 Minuten Laufzeit.", ean: "0885294562391" },
    { name: "LG OLED C4 65 Zoll 4K TV", slug: "lg-oled-c4-65", brand: "LG", description: "OLED evo, a9 AI Prozessor, Dolby Vision, 120Hz.", ean: "0880609330128" },
  ]

  const { data: inserted } = await supabase.from("products").upsert(products).select()
  if (!inserted) return

  // Link products to shops with prices
  const priceConfig: Record<string, [string, number, boolean][]> = {
    "sony-wh-1000xm5": [["digitec", 239, true], ["galaxus", 249, false], ["microspot", 259, false], ["brack", 264, false], ["mediamarkt", 279, false], ["interdiscount", 329, false]],
    "apple-airpods-pro-3": [["galaxus", 199, true], ["digitec", 209, false], ["microspot", 219, false], ["mediamarkt", 229, false], ["brack", 259, false]],
    "samsung-galaxy-s25-ultra": [["digitec", 1049, false], ["galaxus", 1079, false], ["microspot", 1099, false], ["brack", 1129, false], ["mediamarkt", 1149, true], ["interdiscount", 1299, false]],
    "apple-iphone-17-pro": [["galaxus", 1199, false], ["digitec", 1229, false], ["microspot", 1249, false], ["brack", 1279, false], ["mediamarkt", 1299, true], ["interdiscount", 1449, false]],
    "nintendo-switch-2": [["digitec", 339, false], ["galaxus", 349, false], ["microspot", 359, false], ["brack", 379, false], ["mediamarkt", 429, false]],
    "apple-watch-ultra-3": [["digitec", 699, false], ["galaxus", 719, false], ["microspot", 749, false], ["brack", 849, false]],
    "dyson-v15-detect": [["galaxus", 499, true], ["digitec", 529, false], ["brack", 549, false], ["microspot", 579, false], ["mediamarkt", 649, false]],
    "lg-oled-c4-65": [["digitec", 1299, false], ["galaxus", 1349, false], ["microspot", 1399, false], ["mediamarkt", 1449, true], ["interdiscount", 1599, false]],
  }

  for (const product of products) {
    const prod = inserted.find((p: any) => p.slug === product.slug)
    if (!prod) continue
    const config = priceConfig[product.slug]
    if (!config) continue

    for (const [shopSlug, price, isPromotion] of config) {
      const shopId = shopMap[shopSlug]
      if (!shopId) continue

      const { data: ps } = await supabase.from("product_shops").upsert({
        product_id: prod.id,
        shop_id: shopId,
        product_url: `https://www.${shopSlug}.ch/products/${product.slug}`,
        in_stock: Math.random() > 0.2,
      }).select()

      if (ps?.[0]) {
        await supabase.from("price_history").insert({
          product_shop_id: ps[0].id,
          price,
          currency: "CHF",
          is_promotion: isPromotion,
        })
      }
    }
  }

  console.log("✅ Seed complete!")
}

seed().catch(console.error)
