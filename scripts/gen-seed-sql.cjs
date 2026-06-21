// Generates seed SQL file for Supabase SQL Editor
const fs = require("fs")

const shops = [
  { slug: "galaxus", base: "https://www.galaxus.ch" },
  { slug: "digitec", base: "https://www.digitec.ch" },
  { slug: "microspot", base: "https://www.microspot.ch" },
  { slug: "brack", base: "https://www.brack.ch" },
  { slug: "mediamarkt", base: "https://www.mediamarkt.ch" },
  { slug: "interdiscount", base: "https://www.interdiscount.ch" },
]

const products = [
  // [name, brand, cat_slug, base_price]
  // Smartphones
  ["Apple iPhone 17 Pro Max", "Apple", "smartphones", 1299],
  ["Apple iPhone 17 Pro", "Apple", "smartphones", 1099],
  ["Apple iPhone 17", "Apple", "smartphones", 899],
  ["Apple iPhone 16 Pro Max", "Apple", "smartphones", 1199],
  ["Apple iPhone 16", "Apple", "smartphones", 799],
  ["Apple iPhone SE 4", "Apple", "smartphones", 549],
  ["Samsung Galaxy S26 Ultra", "Samsung", "smartphones", 1249],
  ["Samsung Galaxy S26+", "Samsung", "smartphones", 1049],
  ["Samsung Galaxy S26", "Samsung", "smartphones", 849],
  ["Samsung Galaxy S25", "Samsung", "smartphones", 749],
  ["Samsung Galaxy A56", "Samsung", "smartphones", 399],
  ["Samsung Galaxy A36", "Samsung", "smartphones", 279],
  ["Google Pixel 10 Pro", "Google", "smartphones", 999],
  ["Google Pixel 10", "Google", "smartphones", 799],
  ["Xiaomi 15 Ultra", "Xiaomi", "smartphones", 1099],
  ["Xiaomi 15", "Xiaomi", "smartphones", 799],
  ["Xiaomi Redmi Note 14 Pro", "Xiaomi", "smartphones", 349],
  ["OnePlus 13", "OnePlus", "smartphones", 899],
  ["Nothing Phone 3", "Nothing", "smartphones", 699],
  ["Sony Xperia 1 VII", "Sony", "smartphones", 1199],
  ["Motorola Edge 50 Pro", "Motorola", "smartphones", 599],
  ["Fairphone 5", "Fairphone", "smartphones", 599],
  ["Huawei P80 Pro", "Huawei", "smartphones", 999],
  ["Asus Zenfone 12", "Asus", "smartphones", 799],
  // Kopfhörer
  ["Sony WH-1000XM6", "Sony", "kopfhorer", 399],
  ["Sony WF-1000XM6", "Sony", "kopfhorer", 349],
  ["AirPods Max 2", "Apple", "kopfhorer", 599],
  ["AirPods Pro 3", "Apple", "kopfhorer", 279],
  ["AirPods 4", "Apple", "kopfhorer", 179],
  ["Bose QuietComfort Ultra", "Bose", "kopfhorer", 449],
  ["Bose QC Ultra Earbuds", "Bose", "kopfhorer", 349],
  ["Sennheiser Momentum 5", "Sennheiser", "kopfhorer", 499],
  ["Sennheiser Momentum TW 5", "Sennheiser", "kopfhorer", 349],
  ["Beats Studio Pro", "Beats", "kopfhorer", 399],
  ["Jabra Elite 10 Gen 2", "Jabra", "kopfhorer", 279],
  ["Marshall Monitor III", "Marshall", "kopfhorer", 349],
  ["Nothing Ear 4", "Nothing", "kopfhorer", 149],
  ["JBL Tune 770NC", "JBL", "kopfhorer", 129],
  ["Shure Aonic 50 Gen 2", "Shure", "kopfhorer", 499],
  // Gaming
  ["Sony PlayStation 6", "Sony", "gaming", 599],
  ["Sony PS6 DualSense 2", "Sony", "gaming", 79],
  ["Nintendo Switch OLED", "Nintendo", "gaming", 319],
  ["Xbox Series X 2TB", "Microsoft", "gaming", 549],
  ["Xbox Series S 1TB", "Microsoft", "gaming", 349],
  ["Asus ROG Ally X", "Asus", "gaming", 899],
  ["Steam Deck OLED", "Valve", "gaming", 679],
  ["Logitech G Pro X Superlight 2", "Logitech", "gaming", 139],
  ["Razer DeathAdder V4 Pro", "Razer", "gaming", 149],
  ["Corsair K70 Max", "Corsair", "gaming", 229],
  ["HyperX Cloud Alpha Wireless", "HyperX", "gaming", 179],
  ["Razer Kraken V4 Pro", "Razer", "gaming", 199],
  // Smartwatches
  ["Apple Watch Ultra 3", "Apple", "smartwatches", 849],
  ["Apple Watch Series 11", "Apple", "smartwatches", 499],
  ["Apple Watch SE 3", "Apple", "smartwatches", 299],
  ["Samsung Galaxy Watch 8", "Samsung", "smartwatches", 429],
  ["Samsung Galaxy Watch 8 Classic", "Samsung", "smartwatches", 499],
  ["Garmin Fenix 8", "Garmin", "smartwatches", 899],
  ["Garmin Forerunner 265", "Garmin", "smartwatches", 499],
  ["Garmin Venu 4", "Garmin", "smartwatches", 399],
  ["Google Pixel Watch 4", "Google", "smartwatches", 399],
  ["Google Pixel Watch 4 Pro", "Google", "smartwatches", 549],
  ["Withings ScanWatch Nova", "Withings", "smartwatches", 599],
  ["Huawei Watch GT 6", "Huawei", "smartwatches", 349],
  ["Fitbit Charge 7", "Fitbit", "smartwatches", 179],
  ["Amazfit T-Rex 4", "Amazfit", "smartwatches", 199],
  ["OnePlus Watch 3", "OnePlus", "smartwatches", 329],
  // TV & Audio
  ['Samsung OLED S95F 65"', "Samsung", "tv-audio", 2499],
  ['Samsung Neo QLED QN90F 65"', "Samsung", "tv-audio", 1799],
  ['Samsung Neo QLED QN90F 55"', "Samsung", "tv-audio", 1299],
  ['LG G5 OLED 65"', "LG", "tv-audio", 2799],
  ['LG C5 OLED 65"', "LG", "tv-audio", 1999],
  ['LG C5 OLED 55"', "LG", "tv-audio", 1499],
  ['Sony Bravia 9 65"', "Sony", "tv-audio", 2299],
  ['Sony Bravia 8 OLED 65"', "Sony", "tv-audio", 1999],
  ['Panasonic Z95C OLED 65"', "Panasonic", "tv-audio", 2699],
  ["Samsung Soundbar HW-Q990F", "Samsung", "tv-audio", 1499],
  ["Samsung Soundbar HW-Q800F", "Samsung", "tv-audio", 799],
  ["Sonos Arc Ultra", "Sonos", "tv-audio", 999],
  ["Sonos Beam Gen 3", "Sonos", "tv-audio", 499],
  ["Sonos Era 300", "Sonos", "tv-audio", 499],
  ["Sonos Era 100", "Sonos", "tv-audio", 279],
  ["Marshall Stanmore III", "Marshall", "tv-audio", 379],
  ["Marshall Woburn III", "Marshall", "tv-audio", 529],
  ["JBL PartyBox 320", "JBL", "tv-audio", 399],
  ["Apple HomePod 3", "Apple", "tv-audio", 349],
  // Haushalt
  ["Dyson V15 Detect Staubsauger", "Dyson", "haushalt", 499],
  ["Dyson V12 Detect Slim", "Dyson", "haushalt", 399],
  ["Dyson Gen5Detect", "Dyson", "haushalt", 699],
  ["Dyson 360 Vis Nav", "Dyson", "haushalt", 999],
  ["Dyson Airwrap Multi-Styler", "Dyson", "haushalt", 449],
  ["Dyson Supersonic Nural", "Dyson", "haushalt", 399],
  ["iRobot Roomba J9+", "iRobot", "haushalt", 899],
  ["Philips Airfryer XXL", "Philips", "haushalt", 249],
  ["Samsung Bespoke Jet AI", "Samsung", "haushalt", 799],
  ["Samsung Bespoke Fridge 4-Tür", "Samsung", "haushalt", 2499],
  ["Bosch Series 8 Waschmaschine", "Bosch", "haushalt", 1299],
  ["Miele Complete C3 Staubsauger", "Miele", "haushalt", 349],
  ["Miele Triflex HX2", "Miele", "haushalt", 499],
  ["KitchenAid Artisan 5KSM175", "KitchenAid", "haushalt", 499],
  ["Nespresso Vertuo Next", "Nespresso", "haushalt", 119],
  ["De''Longhi Magnifica S", "De''Longhi", "haushalt", 499],
  // Laptops
  ['MacBook Pro 16" M4 Max', "Apple", "laptops", 3499],
  ['MacBook Pro 14" M4 Pro', "Apple", "laptops", 2499],
  ['MacBook Air 15" M4', "Apple", "laptops", 1499],
  ['MacBook Air 13" M4', "Apple", "laptops", 1199],
  ['MacBook Air 13" M3', "Apple", "laptops", 999],
  ["Dell XPS 16 9640", "Dell", "laptops", 2199],
  ["Dell XPS 14 9440", "Dell", "laptops", 1799],
  ["Lenovo ThinkPad X1 Carbon Gen 12", "Lenovo", "laptops", 2699],
  ["Lenovo ThinkPad T16 Gen 3", "Lenovo", "laptops", 1999],
  ["HP Spectre x360 16", "HP", "laptops", 1899],
  ["Asus ROG Zephyrus G16", "Asus", "laptops", 2499],
  ["Asus ZenBook S 16", "Asus", "laptops", 1499],
  ["Microsoft Surface Laptop 7", "Microsoft", "laptops", 1299],
  ["Samsung Galaxy Book4 Ultra", "Samsung", "laptops", 2899],
  ["Acer Swift Go 16", "Acer", "laptops", 999],
  ["Framework 16", "Framework", "laptops", 1799],
  // Kameras
  ["Sony A7 V", "Sony", "kameras", 3499],
  ["Sony A7R V", "Sony", "kameras", 4299],
  ["Sony A6700", "Sony", "kameras", 1499],
  ["Sony ZV-E10 II", "Sony", "kameras", 1099],
  ["Canon EOS R6 Mark III", "Canon", "kameras", 2999],
  ["Canon EOS R5 Mark II", "Canon", "kameras", 4499],
  ["Canon EOS R100", "Canon", "kameras", 549],
  ["Nikon Z6 III", "Nikon", "kameras", 2799],
  ["Nikon Z8", "Nikon", "kameras", 3999],
  ["Fujifilm X-T6", "Fujifilm", "kameras", 1799],
  ["Fujifilm X100 VI", "Fujifilm", "kameras", 1699],
  ["Leica Q3 43", "Leica", "kameras", 6999],
  ["DJI Osmo Pocket 3", "DJI", "kameras", 499],
  ["GoPro Hero 13 Black", "GoPro", "kameras", 449],
  ["Insta360 X4", "Insta360", "kameras", 499],
  ["Panasonic Lumix S5 IIX", "Panasonic", "kameras", 1999],
]

function slugify(t) { return t.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "") }

function shopUrl(slug, name) {
  const q = encodeURIComponent(name)
  const urls = {
    galaxus: `https://www.galaxus.ch/en/search?q=${q}`,
    digitec: `https://www.digitec.ch/en/search?q=${q}`,
    microspot: `https://www.microspot.ch/search?q=${q}`,
    brack: `https://www.brack.ch/search?q=${q}`,
    mediamarkt: `https://www.mediamarkt.ch/ch/de/search.html?query=${q}`,
    interdiscount: `https://www.interdiscount.ch/search?q=${q}`,
  }
  return urls[slug]
}

function randPrice(base) { return Math.round((base * (0.85 + Math.random() * 0.3)) * 100) / 100 }
function randDays() { return Math.floor(Math.random() * 30) }

let sql = `-- Generated bulk seed. Paste into Supabase SQL Editor.
-- First ensure missing categories exist
INSERT INTO categories (name, slug) VALUES ('Laptops', 'laptops'), ('Kameras', 'kameras')
ON CONFLICT (slug) DO NOTHING;

DO $$ 
DECLARE
  prod_id UUID; ps_id UUID; base_price NUMERIC;
  p_name TEXT; p_brand TEXT; p_slug TEXT; p_cat UUID;
  shop_ids UUID[];
  shop_url TEXT; shop_price NUMERIC; days_ago INT;
BEGIN
  -- Get category IDs
  SELECT id INTO p_cat FROM categories WHERE slug = 'laptops';
  shop_ids := ARRAY[`

for (const s of shops) sql += `(SELECT id FROM shops WHERE slug = '${s.slug}'),`
sql = sql.slice(0, -1) + `];

  -- Laptops
`

for (const [name, brand, cat, basePrice] of products) {
  if (cat === "laptops") {
    const slug = slugify(name)
    const escapedName = name.replace(/'/g, "''")
    sql += `  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('${escapedName}', '${slug}', '${brand}', '${escapedName} - Top Preis in der Schweiz.', 'https://placehold.co/400x400/e2e8f0/64748b?text=${brand}', p_cat, '1${Math.floor(Math.random() * 900000000000)}')
    RETURNING id INTO prod_id;
`
    for (const s of shops) {
      if (Math.random() < 0.2) continue
      shop_url = shopUrl(s.slug, name).replace(/'/g, "''")
      shop_price = randPrice(basePrice)
      sql += `  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = '${s.slug}'), '${shop_url}', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, ${shop_price}, 'CHF', NOW() - INTERVAL '${randDays()} days');
`
    }
  }
}

// Now do the same for other categories
const catVars = {
  smartphones: "cat_smartphones",
  kopfhorer: "cat_kopfhorer",
  gaming: "cat_gaming",
  smartwatches: "cat_smartwatches",
  "tv-audio": "cat_tvaudio",
  haushalt: "cat_haushalt",
  kameras: "cat_kameras",
}

const catDeclares = {
  smartphones: "SELECT id INTO cat_smartphones FROM categories WHERE slug = 'smartphones';",
  kopfhorer: "SELECT id INTO cat_kopfhorer FROM categories WHERE slug = 'kopfhorer';",
  gaming: "SELECT id INTO cat_gaming FROM categories WHERE slug = 'gaming';",
  smartwatches: "SELECT id INTO cat_smartwatches FROM categories WHERE slug = 'smartwatches';",
  "tv-audio": "SELECT id INTO cat_tvaudio FROM categories WHERE slug = 'tv-audio';",
  haushalt: "SELECT id INTO cat_haushalt FROM categories WHERE slug = 'haushalt';",
  kameras: "SELECT id INTO cat_kameras FROM categories WHERE slug = 'kameras';",
}

sql = `-- Generated bulk seed for PreisVergleich.ch
-- Paste into Supabase SQL Editor and run

INSERT INTO categories (name, slug) VALUES ('Laptops', 'laptops'), ('Kameras', 'kameras')
ON CONFLICT (slug) DO NOTHING;

DO $$
DECLARE
  cat_smartphones UUID; cat_kopfhorer UUID; cat_gaming UUID;
  cat_smartwatches UUID; cat_tvaudio UUID; cat_haushalt UUID;
  cat_laptops UUID; cat_kameras UUID;
  prod_id UUID; ps_id UUID;
BEGIN
`

for (const [cat, declare] of Object.entries(catDeclares)) {
  sql += `  ${declare}\n`
}
sql += `  SELECT id INTO cat_laptops FROM categories WHERE slug = 'laptops';\n`

const productGroups = {}
for (const p of products) {
  if (!productGroups[p[2]]) productGroups[p[2]] = []
  productGroups[p[2]].push(p)
}

for (const [cat, items] of Object.entries(productGroups)) {
  const catVar = catVars[cat] || `cat_${cat.replace("-", "")}`
  sql += `\n  -- ${cat.toUpperCase()}\n`
  for (const [name, brand, _cat, basePrice] of items) {
    const slug = slugify(name)
    const escapedName = name.replace(/'/g, "''")
    const ean = '2' + String(Math.floor(Math.random() * 900000000000)).padStart(12, "0")
    sql += `  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('${escapedName}', '${slug}', '${brand}', '${escapedName} - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=${brand}', ${catVar}, '${ean}')
    RETURNING id INTO prod_id;
`
    for (const s of shops) {
      if (Math.random() < 0.2) continue
      shop_url = shopUrl(s.slug, escapedName).replace(/'/g, "''")
      shop_price = randPrice(basePrice)
      const inStock = Math.random() < 0.85 ? "true" : "false"
      sql += `  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = '${s.slug}'), '${shop_url}', ${inStock}) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, ${shop_price}, 'CHF', NOW() - INTERVAL '${randDays()} days');
`
    }
  }
}

sql += `END $$;\n`

fs.writeFileSync("supabase/seed-bulk.sql", sql)
console.log("Generated supabase/seed-bulk.sql")
console.log(`Products: ${products.length}, Shops per product: ~${shops.length - 1}`)
