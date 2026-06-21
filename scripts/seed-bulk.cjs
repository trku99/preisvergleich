// Generates bulk seed data for Supabase with realistic products and shop URLs
const { createClient } = require("@supabase/supabase-js")
require("dotenv").config({ path: ".env.local" })

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
)

const categories = [
  { name: "Smartphones", slug: "smartphones" },
  { name: "Kopfhörer", slug: "kopfhorer" },
  { name: "Gaming", slug: "gaming" },
  { name: "Smartwatches", slug: "smartwatches" },
  { name: "TV & Audio", slug: "tv-audio" },
  { name: "Haushalt", slug: "haushalt" },
  { name: "Laptops", slug: "laptops" },
  { name: "Kameras", slug: "kameras" },
]

const shops = [
  { name: "Galaxus", slug: "galaxus", base_url: "https://www.galaxus.ch" },
  { name: "Digitec", slug: "digitec", base_url: "https://www.digitec.ch" },
  { name: "Microspot", slug: "microspot", base_url: "https://www.microspot.ch" },
  { name: "Brack", slug: "brack", base_url: "https://www.brack.ch" },
  { name: "MediaMarkt", slug: "mediamarkt", base_url: "https://www.mediamarkt.ch" },
  { name: "Interdiscount", slug: "interdiscount", base_url: "https://www.interdiscount.ch" },
]

const products = [
  // Smartphones
  { name: "Apple iPhone 17 Pro Max", brand: "Apple", cat: "smartphones", basePrice: 1299 },
  { name: "Apple iPhone 17 Pro", brand: "Apple", cat: "smartphones", basePrice: 1099 },
  { name: "Apple iPhone 17", brand: "Apple", cat: "smartphones", basePrice: 899 },
  { name: "Apple iPhone 16 Pro Max", brand: "Apple", cat: "smartphones", basePrice: 1199 },
  { name: "Apple iPhone 16 Pro", brand: "Apple", cat: "smartphones", basePrice: 999 },
  { name: "Apple iPhone 16", brand: "Apple", cat: "smartphones", basePrice: 799 },
  { name: "Apple iPhone SE 4", brand: "Apple", cat: "smartphones", basePrice: 549 },
  { name: "Samsung Galaxy S26 Ultra", brand: "Samsung", cat: "smartphones", basePrice: 1249 },
  { name: "Samsung Galaxy S26+", brand: "Samsung", cat: "smartphones", basePrice: 1049 },
  { name: "Samsung Galaxy S26", brand: "Samsung", cat: "smartphones", basePrice: 849 },
  { name: "Samsung Galaxy S25 Ultra", brand: "Samsung", cat: "smartphones", basePrice: 1149 },
  { name: "Samsung Galaxy S25", brand: "Samsung", cat: "smartphones", basePrice: 749 },
  { name: "Samsung Galaxy A56", brand: "Samsung", cat: "smartphones", basePrice: 399 },
  { name: "Samsung Galaxy A36", brand: "Samsung", cat: "smartphones", basePrice: 279 },
  { name: "Google Pixel 10 Pro", brand: "Google", cat: "smartphones", basePrice: 999 },
  { name: "Google Pixel 10", brand: "Google", cat: "smartphones", basePrice: 799 },
  { name: "Google Pixel 9 Pro", brand: "Google", cat: "smartphones", basePrice: 899 },
  { name: "Xiaomi 15 Ultra", brand: "Xiaomi", cat: "smartphones", basePrice: 1099 },
  { name: "Xiaomi 15", brand: "Xiaomi", cat: "smartphones", basePrice: 799 },
  { name: "Xiaomi Redmi Note 14 Pro", brand: "Xiaomi", cat: "smartphones", basePrice: 349 },
  { name: "OnePlus 13", brand: "OnePlus", cat: "smartphones", basePrice: 899 },
  { name: "OnePlus 13R", brand: "OnePlus", cat: "smartphones", basePrice: 599 },
  { name: "Nothing Phone 3", brand: "Nothing", cat: "smartphones", basePrice: 699 },
  { name: "Sony Xperia 1 VII", brand: "Sony", cat: "smartphones", basePrice: 1199 },
  { name: "Motorola Edge 50 Pro", brand: "Motorola", cat: "smartphones", basePrice: 599 },
  { name: "Fairphone 5", brand: "Fairphone", cat: "smartphones", basePrice: 599 },
  { name: "Huawei P80 Pro", brand: "Huawei", cat: "smartphones", basePrice: 999 },
  { name: "Asus Zenfone 12", brand: "Asus", cat: "smartphones", basePrice: 799 },

  // Kopfhörer
  { name: "Sony WH-1000XM6", brand: "Sony", cat: "kopfhorer", basePrice: 399 },
  { name: "Sony WH-1000XM5", brand: "Sony", cat: "kopfhorer", basePrice: 329 },
  { name: "Sony WF-1000XM6", brand: "Sony", cat: "kopfhorer", basePrice: 349 },
  { name: "AirPods Max 2", brand: "Apple", cat: "kopfhorer", basePrice: 599 },
  { name: "AirPods Pro 3", brand: "Apple", cat: "kopfhorer", basePrice: 279 },
  { name: "AirPods 4", brand: "Apple", cat: "kopfhorer", basePrice: 179 },
  { name: "Bose QuietComfort Ultra", brand: "Bose", cat: "kopfhorer", basePrice: 449 },
  { name: "Bose QC Ultra Earbuds", brand: "Bose", cat: "kopfhorer", basePrice: 349 },
  { name: "Sennheiser Momentum 5", brand: "Sennheiser", cat: "kopfhorer", basePrice: 499 },
  { name: "Sennheiser Momentum True Wireless 5", brand: "Sennheiser", cat: "kopfhorer", basePrice: 349 },
  { name: "Beats Studio Pro", brand: "Beats", cat: "kopfhorer", basePrice: 399 },
  { name: "Beats Fit Pro 2", brand: "Beats", cat: "kopfhorer", basePrice: 249 },
  { name: "Jabra Elite 10 Gen 2", brand: "Jabra", cat: "kopfhorer", basePrice: 279 },
  { name: "Marshall Monitor III", brand: "Marshall", cat: "kopfhorer", basePrice: 349 },
  { name: "Nothing Ear 4", brand: "Nothing", cat: "kopfhorer", basePrice: 149 },
  { name: "Nothing Ear Stick 2", brand: "Nothing", cat: "kopfhorer", basePrice: 119 },
  { name: "JBL Tune 770NC", brand: "JBL", cat: "kopfhorer", basePrice: 129 },
  { name: "Shure Aonic 50 Gen 2", brand: "Shure", cat: "kopfhorer", basePrice: 499 },

  // Gaming
  { name: "Sony PlayStation 6", brand: "Sony", cat: "gaming", basePrice: 599 },
  { name: "Sony PS6 DualSense 2", brand: "Sony", cat: "gaming", basePrice: 79 },
  { name: "Nintendo Switch 2", brand: "Nintendo", cat: "gaming", basePrice: 399 },
  { name: "Nintendo Switch OLED", brand: "Nintendo", cat: "gaming", basePrice: 319 },
  { name: "Xbox Series X 2TB", brand: "Microsoft", cat: "gaming", basePrice: 549 },
  { name: "Xbox Series S 1TB", brand: "Microsoft", cat: "gaming", basePrice: 349 },
  { name: "Asus ROG Ally X", brand: "Asus", cat: "gaming", basePrice: 899 },
  { name: "Steam Deck OLED", brand: "Valve", cat: "gaming", basePrice: 679 },
  { name: "Logitech G Pro X Superlight 2", brand: "Logitech", cat: "gaming", basePrice: 139 },
  { name: "Razer DeathAdder V4 Pro", brand: "Razer", cat: "gaming", basePrice: 149 },
  { name: "Corsair K70 Max", brand: "Corsair", cat: "gaming", basePrice: 229 },
  { name: "HyperX Cloud Alpha Wireless", brand: "HyperX", cat: "gaming", basePrice: 179 },
  { name: "Sony Pulse Explore", brand: "Sony", cat: "gaming", basePrice: 149 },
  { name: "Nintendo Joy-Con 2", brand: "Nintendo", cat: "gaming", basePrice: 89 },
  { name: "Razer Kraken V4 Pro", brand: "Razer", cat: "gaming", basePrice: 199 },

  // Smartwatches
  { name: "Apple Watch Ultra 3", brand: "Apple", cat: "smartwatches", basePrice: 849 },
  { name: "Apple Watch Series 11", brand: "Apple", cat: "smartwatches", basePrice: 499 },
  { name: "Apple Watch SE 3", brand: "Apple", cat: "smartwatches", basePrice: 299 },
  { name: "Samsung Galaxy Watch 8", brand: "Samsung", cat: "smartwatches", basePrice: 429 },
  { name: "Samsung Galaxy Watch 8 Classic", brand: "Samsung", cat: "smartwatches", basePrice: 499 },
  { name: "Samsung Galaxy Watch FE 2", brand: "Samsung", cat: "smartwatches", basePrice: 249 },
  { name: "Garmin Fenix 8", brand: "Garmin", cat: "smartwatches", basePrice: 899 },
  { name: "Garmin Forerunner 265", brand: "Garmin", cat: "smartwatches", basePrice: 499 },
  { name: "Garmin Venu 4", brand: "Garmin", cat: "smartwatches", basePrice: 399 },
  { name: "Google Pixel Watch 4", brand: "Google", cat: "smartwatches", basePrice: 399 },
  { name: "Google Pixel Watch 4 Pro", brand: "Google", cat: "smartwatches", basePrice: 549 },
  { name: "Withings ScanWatch Nova", brand: "Withings", cat: "smartwatches", basePrice: 599 },
  { name: "Huawei Watch GT 6", brand: "Huawei", cat: "smartwatches", basePrice: 349 },
  { name: "Fitbit Charge 7", brand: "Fitbit", cat: "smartwatches", basePrice: 179 },
  { name: "Amazfit T-Rex 4", brand: "Amazfit", cat: "smartwatches", basePrice: 199 },
  { name: "OnePlus Watch 3", brand: "OnePlus", cat: "smartwatches", basePrice: 329 },

  // TV & Audio
  { name: "Samsung OLED S95F 65\"", brand: "Samsung", cat: "tv-audio", basePrice: 2499 },
  { name: "Samsung Neo QLED QN90F 65\"", brand: "Samsung", cat: "tv-audio", basePrice: 1799 },
  { name: "Samsung Neo QLED QN90F 55\"", brand: "Samsung", cat: "tv-audio", basePrice: 1299 },
  { name: "LG G5 OLED 65\"", brand: "LG", cat: "tv-audio", basePrice: 2799 },
  { name: "LG C5 OLED 65\"", brand: "LG", cat: "tv-audio", basePrice: 1999 },
  { name: "LG C5 OLED 55\"", brand: "LG", cat: "tv-audio", basePrice: 1499 },
  { name: "Sony Bravia 9 65\"", brand: "Sony", cat: "tv-audio", basePrice: 2299 },
  { name: "Sony Bravia 8 OLED 65\"", brand: "Sony", cat: "tv-audio", basePrice: 1999 },
  { name: "Panasonic Z95C OLED 65\"", brand: "Panasonic", cat: "tv-audio", basePrice: 2699 },
  { name: "Samsung Soundbar HW-Q990F", brand: "Samsung", cat: "tv-audio", basePrice: 1499 },
  { name: "Samsung Soundbar HW-Q800F", brand: "Samsung", cat: "tv-audio", basePrice: 799 },
  { name: "Sonos Arc Ultra", brand: "Sonos", cat: "tv-audio", basePrice: 999 },
  { name: "Sonos Beam Gen 3", brand: "Sonos", cat: "tv-audio", basePrice: 499 },
  { name: "Sonos Era 300", brand: "Sonos", cat: "tv-audio", basePrice: 499 },
  { name: "Sonos Era 100", brand: "Sonos", cat: "tv-audio", basePrice: 279 },
  { name: "Denon AVC-X6800H", brand: "Denon", cat: "tv-audio", basePrice: 3499 },
  { name: "Marshall Stanmore III", brand: "Marshall", cat: "tv-audio", basePrice: 379 },
  { name: "Marshall Woburn III", brand: "Marshall", cat: "tv-audio", basePrice: 529 },
  { name: "JBL PartyBox 320", brand: "JBL", cat: "tv-audio", basePrice: 399 },
  { name: "Apple HomePod 3", brand: "Apple", cat: "tv-audio", basePrice: 349 },

  // Haushalt
  { name: "Dyson V15 Detect Staubsauger", brand: "Dyson", cat: "haushalt", basePrice: 499 },
  { name: "Dyson V12 Detect Slim", brand: "Dyson", cat: "haushalt", basePrice: 399 },
  { name: "Dyson Gen5Detect", brand: "Dyson", cat: "haushalt", basePrice: 699 },
  { name: "Dyson 360 Vis Nav", brand: "Dyson", cat: "haushalt", basePrice: 999 },
  { name: "Dyson Airwrap Multi-Styler", brand: "Dyson", cat: "haushalt", basePrice: 449 },
  { name: "Dyson Supersonic Nural", brand: "Dyson", cat: "haushalt", basePrice: 399 },
  { name: "iRobot Roomba J9+", brand: "iRobot", cat: "haushalt", basePrice: 899 },
  { name: "iRobot Braava Jet M6", brand: "iRobot", cat: "haushalt", basePrice: 499 },
  { name: "Philips Airfryer XXL", brand: "Philips", cat: "haushalt", basePrice: 249 },
  { name: "Philips Senseo Plus", brand: "Philips", cat: "haushalt", basePrice: 99 },
  { name: "Samsung Bespoke Jet AI", brand: "Samsung", cat: "haushalt", basePrice: 799 },
  { name: "Samsung Bespoke Fridge 4-Tür", brand: "Samsung", cat: "haushalt", basePrice: 2499 },
  { name: "Bosch Series 8 Waschmaschine", brand: "Bosch", cat: "haushalt", basePrice: 1299 },
  { name: "Bosch Series 8 Trockner", brand: "Bosch", cat: "haushalt", basePrice: 1099 },
  { name: "Miele Complete C3 Staubsauger", brand: "Miele", cat: "haushalt", basePrice: 349 },
  { name: "Miele Triflex HX2", brand: "Miele", cat: "haushalt", basePrice: 499 },
  { name: "Roomba Combo 10 Max", brand: "iRobot", cat: "haushalt", basePrice: 1299 },
  { name: "KitchenAid Artisan 5KSM175", brand: "KitchenAid", cat: "haushalt", basePrice: 499 },
  { name: "Nespresso Vertuo Next", brand: "Nespresso", cat: "haushalt", basePrice: 119 },
  { name: "De'Longhi Magnifica S", brand: "De'Longhi", cat: "haushalt", basePrice: 499 },

  // Laptops
  { name: "MacBook Pro 16\" M4 Max", brand: "Apple", cat: "laptops", basePrice: 3499 },
  { name: "MacBook Pro 14\" M4 Pro", brand: "Apple", cat: "laptops", basePrice: 2499 },
  { name: "MacBook Air 15\" M4", brand: "Apple", cat: "laptops", basePrice: 1499 },
  { name: "MacBook Air 13\" M4", brand: "Apple", cat: "laptops", basePrice: 1199 },
  { name: "MacBook Air 13\" M3", brand: "Apple", cat: "laptops", basePrice: 999 },
  { name: "Dell XPS 16 9640", brand: "Dell", cat: "laptops", basePrice: 2199 },
  { name: "Dell XPS 14 9440", brand: "Dell", cat: "laptops", basePrice: 1799 },
  { name: "Lenovo ThinkPad X1 Carbon Gen 12", brand: "Lenovo", cat: "laptops", basePrice: 2699 },
  { name: "Lenovo ThinkPad T16 Gen 3", brand: "Lenovo", cat: "laptops", basePrice: 1999 },
  { name: "Lenovo Yoga 9i Gen 9", brand: "Lenovo", cat: "laptops", basePrice: 1699 },
  { name: "HP Spectre x360 16", brand: "HP", cat: "laptops", basePrice: 1899 },
  { name: "HP Envy 16", brand: "HP", cat: "laptops", basePrice: 1399 },
  { name: "Asus ROG Zephyrus G16", brand: "Asus", cat: "laptops", basePrice: 2499 },
  { name: "Asus ZenBook S 16", brand: "Asus", cat: "laptops", basePrice: 1499 },
  { name: "Microsoft Surface Laptop 7", brand: "Microsoft", cat: "laptops", basePrice: 1299 },
  { name: "Samsung Galaxy Book4 Ultra", brand: "Samsung", cat: "laptops", basePrice: 2899 },
  { name: "Acer Swift Go 16", brand: "Acer", cat: "laptops", basePrice: 999 },
  { name: "Framework 16", brand: "Framework", cat: "laptops", basePrice: 1799 },

  // Kameras
  { name: "Sony A7 V", brand: "Sony", cat: "kameras", basePrice: 3499 },
  { name: "Sony A7R V", brand: "Sony", cat: "kameras", basePrice: 4299 },
  { name: "Sony A6700", brand: "Sony", cat: "kameras", basePrice: 1499 },
  { name: "Sony ZV-E10 II", brand: "Sony", cat: "kameras", basePrice: 1099 },
  { name: "Canon EOS R6 Mark III", brand: "Canon", cat: "kameras", basePrice: 2999 },
  { name: "Canon EOS R5 Mark II", brand: "Canon", cat: "kameras", basePrice: 4499 },
  { name: "Canon EOS R100", brand: "Canon", cat: "kameras", basePrice: 549 },
  { name: "Nikon Z6 III", brand: "Nikon", cat: "kameras", basePrice: 2799 },
  { name: "Nikon Z8", brand: "Nikon", cat: "kameras", basePrice: 3999 },
  { name: "Fujifilm X-T6", brand: "Fujifilm", cat: "kameras", basePrice: 1799 },
  { name: "Fujifilm X100 VI", brand: "Fujifilm", cat: "kameras", basePrice: 1699 },
  { name: "Leica Q3 43", brand: "Leica", cat: "kameras", basePrice: 6999 },
  { name: "DJI Osmo Pocket 3", brand: "DJI", cat: "kameras", basePrice: 499 },
  { name: "GoPro Hero 13 Black", brand: "GoPro", cat: "kameras", basePrice: 449 },
  { name: "Insta360 X4", brand: "Insta360", cat: "kameras", basePrice: 499 },
  { name: "Panasonic Lumix S5 IIX", brand: "Panasonic", cat: "kameras", basePrice: 1999 },
]

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
}

function getShopUrl(shopSlug, productName, baseUrl) {
  const query = encodeURIComponent(productName)
  switch (shopSlug) {
    case "galaxus": return `${baseUrl}/en/search?q=${query}`
    case "digitec": return `${baseUrl}/en/search?q=${query}`
    case "microspot": return `${baseUrl}/search?q=${query}`
    case "brack": return `${baseUrl}/search?q=${query}`
    case "mediamarkt": return `${baseUrl}/ch/de/search.html?query=${query}`
    case "interdiscount": return `${baseUrl}/search?q=${query}`
    default: return `${baseUrl}/search?q=${query}`
  }
}

function randomPrice(basePrice, variance = 0.15) {
  const min = basePrice * (1 - variance)
  const max = basePrice * (1 + variance)
  return Math.round((min + Math.random() * (max - min)) * 100) / 100
}

async function seed() {
  console.log("Starting seed...")

  // Get or create categories
  const catMap = {}
  for (const cat of categories) {
    const { data: existing } = await supabase.from("categories").select("id").eq("slug", cat.slug).maybeSingle()
    if (existing) {
      catMap[cat.slug] = existing.id
      console.log(`  Category ${cat.name}: ${existing.id}`)
    } else {
      const { data: inserted } = await supabase.from("categories").insert({ name: cat.name, slug: cat.slug }).select("id").single()
      if (inserted) {
        catMap[cat.slug] = inserted.id
        console.log(`  Category ${cat.name} (new): ${inserted.id}`)
      }
    }
  }

  // Get or create shops
  const shopMap = {}
  for (const shop of shops) {
    const { data: existing } = await supabase.from("shops").select("id").eq("slug", shop.slug).maybeSingle()
    if (existing) {
      shopMap[shop.slug] = existing.id
      console.log(`  Shop ${shop.name}: ${existing.id}`)
    } else {
      const { data: inserted } = await supabase.from("shops").insert({ name: shop.name, slug: shop.slug, base_url: shop.base_url }).select("id").single()
      if (inserted) {
        shopMap[shop.slug] = inserted.id
        console.log(`  Shop ${shop.name} (new): ${inserted.id}`)
      }
    }
  }

  // Insert products
  let insertedCount = 0
  for (const p of products) {
    const slug = slugify(p.name)
    // Check if product already exists
    const { data: existing } = await supabase.from("products").select("id").eq("slug", slug).maybeSingle()
    if (existing) {
      console.log(`  Skipping ${p.name} (already exists)`)
      continue
    }

    const { data: prod, error } = await supabase.from("products").insert({
      name: p.name,
      slug,
      brand: p.brand,
      description: `${p.brand} ${p.name} - Top Preis in der Schweiz. Jetzt vergleichen und sparen.`,
      image_url: `https://placehold.co/400x400/e2e8f0/64748b?text=${encodeURIComponent(p.brand)}`,
      category_id: catMap[p.cat],
      ean: String(1000000000000 + Math.floor(Math.random() * 900000000000)),
    }).select("id").single()

    if (error) {
      console.error(`  Error inserting ${p.name}:`, error.message)
      continue
    }
    console.log(`  Inserted ${p.name}`)
    insertedCount++

    // Add product_shop entries with prices
    for (const shop of shops) {
      // 80% chance a product is available in this shop
      if (Math.random() < 0.2) continue

      const price = randomPrice(p.basePrice)
      const shopUrl = getShopUrl(shop.slug, p.name, shop.base_url)

      const { data: ps } = await supabase.from("product_shops").insert({
        product_id: prod.id,
        shop_id: shopMap[shop.slug],
        product_url: shopUrl,
        in_stock: Math.random() < 0.85,
      }).select("id").single()

      if (ps) {
        // Add price history (1-3 random price points in the past 30 days)
        const historyCount = 1 + Math.floor(Math.random() * 3)
        for (let h = 0; h < historyCount; h++) {
          const daysAgo = Math.floor(Math.random() * 30)
          const histPrice = randomPrice(p.basePrice)
          await supabase.from("price_history").insert({
            product_shop_id: ps.id,
            price: histPrice,
            currency: "CHF",
            is_promotion: Math.random() < 0.1,
            scraped_at: new Date(Date.now() - daysAgo * 86400000).toISOString(),
          })
        }
      }
    }
  }

  console.log(`\nDone! Inserted ${insertedCount} new products.`)
}

seed().catch(console.error)
