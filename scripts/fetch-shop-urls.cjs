// Download Interdiscount sitemaps, match products, generate SQL update
require("dotenv").config({ path: ".env.local" })
const fs = require("fs")

const SITEMAP_INDEX = "https://www.interdiscount.ch/sitemap.xml"

function sleep(ms) { return new Promise(r => setTimeout(r, ms)) }

async function fetchXml(url) {
  const res = await fetch(url, {
    headers: { "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36" }
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
  const match = url.match(/\/product\/(.+?)-\d+$/)
  if (!match) return null
  let name = match[1]
  // Remove all variant info: storage, colors, specs
  name = name.replace(/-\d+-gb/gi, " ")
  name = name.replace(/-\d+-tb/gi, " ")
  name = name.replace(/-\d+-mah/gi, " ")
  name = name.replace(/-\d+-w/gi, " ")
  name = name.replace(/-\d+[a-z]*/gi, " ")
  name = name.replace(/-(?:schwarz|weiss|silber|blau|tiefblau|rot|grun|gelb|lila|rosa|hellrosa|gold|grau|orange|cosmic-orange|nebelblau|salbei|lavender|pink|dunkelblau|mittelblau|stahlblau|graphit|space|polarweiss|mitternachtsblau|sternenlicht|polar)/gi, " ")
  name = name.replace(/-(?:anc|5g|wifi|wlan|bluetooth|led|oled|qled|amoled|hdr|uhd|4k|8k|full-hd|fhd)/gi, " ")
  name = name.replace(/-\d+[.,]?\d*-(?:zoll|inch|cm|mm)/gi, " ")
  name = name.replace(/-\d+[a-z]*/gi, " ")
  name = name.replace(/-/g, " ")
  name = name.replace(/\s+/g, " ").trim().toLowerCase()
  return name
}

function normalize(text) {
  return text.toLowerCase()
    .replace(/[''']/g, "")
    .replace(/[^a-z0-9 ]/g, " ")
    .replace(/\s+/g, " ")
    .trim()
}

// Our products from the seed data (name -> slug)
const products = [
  "Apple iPhone 17 Pro Max", "Apple iPhone 17 Pro", "Apple iPhone 17",
  "Apple iPhone 16 Pro Max", "Apple iPhone 16", "Apple iPhone SE 4",
  "Samsung Galaxy S26 Ultra", "Samsung Galaxy S26+", "Samsung Galaxy S26", "Samsung Galaxy S25",
  "Samsung Galaxy A56", "Samsung Galaxy A36",
  "Google Pixel 10 Pro", "Google Pixel 10",
  "Xiaomi 15 Ultra", "Xiaomi 15", "Xiaomi Redmi Note 14 Pro",
  "OnePlus 13", "Nothing Phone 3",
  "Sony Xperia 1 VII", "Motorola Edge 50 Pro", "Fairphone 5", "Huawei P80 Pro", "Asus Zenfone 12",
  "Sony WH-1000XM6", "Sony WF-1000XM6",
  "AirPods Max 2", "AirPods Pro 3", "AirPods 4",
  "Bose QuietComfort Ultra", "Bose QC Ultra Earbuds",
  "Sennheiser Momentum 5", "Sennheiser Momentum TW 5", "Beats Studio Pro",
  "Jabra Elite 10 Gen 2", "Marshall Monitor III", "Nothing Ear 4", "JBL Tune 770NC", "Shure Aonic 50 Gen 2",
  "Sony PlayStation 6", "Sony PS6 DualSense 2",
  "Nintendo Switch OLED", "Xbox Series X 2TB", "Xbox Series S 1TB",
  "Asus ROG Ally X", "Steam Deck OLED",
  "Logitech G Pro X Superlight 2", "Razer DeathAdder V4 Pro", "Corsair K70 Max", "HyperX Cloud Alpha Wireless", "Razer Kraken V4 Pro",
  "Apple Watch Ultra 3", "Apple Watch Series 11", "Apple Watch SE 3",
  "Samsung Galaxy Watch 8", "Samsung Galaxy Watch 8 Classic",
  "Garmin Fenix 8", "Garmin Forerunner 265", "Garmin Venu 4",
  "Google Pixel Watch 4", "Google Pixel Watch 4 Pro",
  "Withings ScanWatch Nova", "Huawei Watch GT 6", "Fitbit Charge 7", "Amazfit T-Rex 4", "OnePlus Watch 3",
  'Samsung OLED S95F 65"', 'Samsung Neo QLED QN90F 65"', 'Samsung Neo QLED QN90F 55"',
  'LG G5 OLED 65"', 'LG C5 OLED 65"', 'LG C5 OLED 55"',
  'Sony Bravia 9 65"', 'Sony Bravia 8 OLED 65"',
  "Samsung Soundbar HW-Q990F", "Samsung Soundbar HW-Q800F",
  "Sonos Arc Ultra", "Sonos Beam Gen 3", "Sonos Era 300", "Sonos Era 100",
  "Marshall Stanmore III", "Marshall Woburn III", "JBL PartyBox 320", "Apple HomePod 3",
  "Dyson V15 Detect Staubsauger", "Dyson V12 Detect Slim", "Dyson Gen5Detect", "Dyson 360 Vis Nav",
  "Dyson Airwrap Multi-Styler", "Dyson Supersonic Nural",
  "iRobot Roomba J9+", "Philips Airfryer XXL", "Samsung Bespoke Jet AI",
  "Samsung Bespoke Fridge 4-Tür", "Bosch Series 8 Waschmaschine",
  "Miele Complete C3 Staubsauger", "Miele Triflex HX2",
  "KitchenAid Artisan 5KSM175", "Nespresso Vertuo Next", "De'Longhi Magnifica S",
  'MacBook Pro 16" M4 Max', 'MacBook Pro 14" M4 Pro', 'MacBook Air 15" M4', 'MacBook Air 13" M4', 'MacBook Air 13" M3',
  "Dell XPS 16 9640", "Dell XPS 14 9440",
  "Lenovo ThinkPad X1 Carbon Gen 12", "Lenovo ThinkPad T16 Gen 3",
  "HP Spectre x360 16", "Asus ROG Zephyrus G16", "Asus ZenBook S 16",
  "Microsoft Surface Laptop 7", "Samsung Galaxy Book4 Ultra", "Acer Swift Go 16", "Framework 16",
  "Sony A7 V", "Sony A7R V", "Sony A6700", "Sony ZV-E10 II",
  "Canon EOS R6 Mark III", "Canon EOS R5 Mark II", "Canon EOS R100",
  "Nikon Z6 III", "Nikon Z8", "Fujifilm X-T6", "Fujifilm X100 VI",
  "Leica Q3 43", "DJI Osmo Pocket 3", "GoPro Hero 13 Black", "Insta360 X4", "Panasonic Lumix S5 IIX",
]

// Build normalized map
const productMap = {}
for (const p of products) {
  const slug = p.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "")
  productMap[normalize(p)] = { name: p, slug }
}

async function main() {
  console.log("Fetching sitemap index...")
  const indexXml = await fetchXml(SITEMAP_INDEX)
  const prodSitemaps = extractUrls(indexXml, "https://www\\.interdiscount\\.ch/sitemap/siteMap_prod_de\\d+\\.xml")
  console.log(`Found ${prodSitemaps.length} product sitemaps`)

  let sql = `-- Update Interdiscount product URLs\nDO $$ \nDECLARE\n  shop_id UUID;\n  prod RECORD;\nBEGIN\n  SELECT id INTO shop_id FROM shops WHERE slug = 'interdiscount';\n`
  let matchedCount = 0
  let totalChecked = 0

  for (const sitemapUrl of prodSitemaps) {
    console.log(`\nFetching ${sitemapUrl}...`)
    const xml = await fetchXml(sitemapUrl)
    const productUrls = extractUrls(xml, "https://www\\.interdiscount\\.ch/de/product/[^<]+")
    console.log(`  URLs: ${productUrls.length}`)
    totalChecked += productUrls.length

    for (const url of productUrls) {
      const urlName = extractProductNameFromUrl(url)
      if (!urlName) continue

      // Try to match by checking if key words match
      let found = false
      const urlWords = urlName.split(/\s+/)
      for (const [key, product] of Object.entries(productMap)) {
        const prodWords = key.split(/\s+/)
        // Check if all product words appear in URL name
        const allMatch = prodWords.every(w => urlName.includes(w))
        if (allMatch) {
          matchedCount++
          sql += `  UPDATE product_shops SET product_url = '${url}' WHERE product_id = (SELECT id FROM products WHERE slug = '${product.slug}') AND product_shops.shop_id = shop_id;\n`
          console.log(`  ✓ ${product.name} -> ${url.substring(0, 80)}`)
          delete productMap[key]
          found = true
          break
        }
      }
      if (found && Object.keys(productMap).length === 0) break // all matched
    }
    if (Object.keys(productMap).length === 0) break // stop early

    await sleep(1000)
  }

  sql += "END $$;\n"
  sql += `\n-- Matched ${matchedCount} products out of ${products.length}\n`
  sql += `-- Checked ${totalChecked} URLs from sitemaps\n`

  fs.writeFileSync("supabase/update-interdiscount-urls.sql", sql)
  console.log(`\n=== SUMMARY ===`)
  console.log(`Checked: ${totalChecked} URLs`)
  console.log(`Matched: ${matchedCount} products`)
  console.log(`Unmatched: ${Object.keys(productMap).length}`)
  console.log(`SQL saved to supabase/update-interdiscount-urls.sql`)
}

main().catch(console.error)
