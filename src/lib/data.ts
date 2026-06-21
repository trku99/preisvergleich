import { Product, Shop, Category } from "./types"

export const shops: Shop[] = [
  { id: "galaxus", name: "Galaxus", slug: "galaxus", logo: "G", rating: 4.5, deliveryCost: 0, deliveryTime: "1-3 Werktage" },
  { id: "digitec", name: "Digitec", slug: "digitec", logo: "D", rating: 4.6, deliveryCost: 0, deliveryTime: "1-3 Werktage" },
  { id: "microspot", name: "Microspot", slug: "microspot", logo: "M", rating: 4.3, deliveryCost: 4.90, deliveryTime: "2-5 Werktage" },
  { id: "brack", name: "Brack", slug: "brack", logo: "B", rating: 4.4, deliveryCost: 5.90, deliveryTime: "2-4 Werktage" },
  { id: "mediamarkt", name: "MediaMarkt", slug: "mediamarkt", logo: "MM", rating: 4.2, deliveryCost: 3.99, deliveryTime: "2-4 Werktage" },
  { id: "interdiscount", name: "Interdiscount", slug: "interdiscount", logo: "I", rating: 4.1, deliveryCost: 4.90, deliveryTime: "3-5 Werktage" },
]

function generatePriceHistory(basePrice: number, days: number): { date: string; price: number; shopId: string }[] {
  const history: { date: string; price: number; shopId: string }[] = []
  let price = basePrice
  for (let i = days; i >= 0; i--) {
    const date = new Date()
    date.setDate(date.getDate() - i)
    price = price + (Math.random() - 0.5) * 15
    price = Math.max(basePrice * 0.8, Math.round(price * 100) / 100)
    history.push({
      date: date.toISOString().split("T")[0],
      price,
      shopId: shops[i % shops.length].id,
    })
  }
  return history
}

export const products: Product[] = [
  {
    id: "1",
    name: "Sony WH-1000XM5 Kabellos Noise Cancelling",
    slug: "sony-wh-1000xm5",
    description: "Industry-leading noise cancellation with Auto NC Optimizer. 30-hour battery life, crystal-clear hands-free calling, and exceptional comfort.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=XM5",
    brand: "Sony",
    category: "Kopfhörer",
    categorySlug: "kopfhorer",
    ean: "0272429237655",
    lowestPrice: 239,
    highestPrice: 329,
    currency: "CHF",
    shopCount: 6,
    prices: [
      { shopId: "digitec", price: 239, currency: "CHF", isPromotion: true, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "galaxus", price: 249, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 259, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
      { shopId: "brack", price: 264, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "mediamarkt", price: 279, currency: "CHF", isPromotion: false, inStock: false, url: "#", updatedAt: "2026-06-19" },
      { shopId: "interdiscount", price: 329, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
    ],
    priceHistory: generatePriceHistory(269, 30),
  },
  {
    id: "2",
    name: "Apple AirPods Pro 3 mit MagSafe",
    slug: "apple-airpods-pro-3",
    description: "Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=AirPods+Pro+3",
    brand: "Apple",
    category: "Kopfhörer",
    categorySlug: "kopfhorer",
    ean: "0194256891234",
    lowestPrice: 199,
    highestPrice: 259,
    currency: "CHF",
    shopCount: 5,
    prices: [
      { shopId: "galaxus", price: 199, currency: "CHF", isPromotion: true, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "digitec", price: 209, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 219, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
      { shopId: "mediamarkt", price: 229, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "brack", price: 259, currency: "CHF", isPromotion: false, inStock: false, url: "#", updatedAt: "2026-06-19" },
    ],
    priceHistory: generatePriceHistory(229, 30),
  },
  {
    id: "3",
    name: "Samsung Galaxy S25 Ultra 256GB",
    slug: "samsung-galaxy-s25-ultra",
    description: "Galaxy AI, 200MP Kamera, S Pen integriert, 12GB RAM, 256GB Speicher.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=S25+Ultra",
    brand: "Samsung",
    category: "Smartphones",
    categorySlug: "smartphones",
    ean: "0880609332917",
    lowestPrice: 1049,
    highestPrice: 1299,
    currency: "CHF",
    shopCount: 6,
    prices: [
      { shopId: "digitec", price: 1049, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "galaxus", price: 1079, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 1099, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
      { shopId: "brack", price: 1129, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "mediamarkt", price: 1149, currency: "CHF", isPromotion: true, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "interdiscount", price: 1299, currency: "CHF", isPromotion: false, inStock: false, url: "#", updatedAt: "2026-06-18" },
    ],
    priceHistory: generatePriceHistory(1149, 30),
  },
  {
    id: "4",
    name: "Apple iPhone 17 Pro 256GB",
    slug: "apple-iphone-17-pro",
    description: "A19 Chip, 48MP Triple-Kamera, Titanium Design, 256GB Speicher.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=iPhone+17+Pro",
    brand: "Apple",
    category: "Smartphones",
    categorySlug: "smartphones",
    ean: "0194265738291",
    lowestPrice: 1199,
    highestPrice: 1449,
    currency: "CHF",
    shopCount: 6,
    prices: [
      { shopId: "galaxus", price: 1199, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "digitec", price: 1229, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 1249, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
      { shopId: "brack", price: 1279, currency: "CHF", isPromotion: false, inStock: false, url: "#", updatedAt: "2026-06-21" },
      { shopId: "mediamarkt", price: 1299, currency: "CHF", isPromotion: true, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "interdiscount", price: 1449, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
    ],
    priceHistory: generatePriceHistory(1329, 30),
  },
  {
    id: "5",
    name: "Nintendo Switch 2",
    slug: "nintendo-switch-2",
    description: "Next-gen gaming mit 7.9 Zoll Display, 4K Output, abwärtskompatibel.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=Switch+2",
    brand: "Nintendo",
    category: "Gaming",
    categorySlug: "gaming",
    ean: "045496454321",
    lowestPrice: 339,
    highestPrice: 429,
    currency: "CHF",
    shopCount: 5,
    prices: [
      { shopId: "digitec", price: 339, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "galaxus", price: 349, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 359, currency: "CHF", isPromotion: false, inStock: false, url: "#", updatedAt: "2026-06-20" },
      { shopId: "brack", price: 379, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "mediamarkt", price: 429, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-19" },
    ],
    priceHistory: generatePriceHistory(379, 30),
  },
  {
    id: "6",
    name: "Apple Watch Ultra 3 GPS + Cellular",
    slug: "apple-watch-ultra-3",
    description: "49mm Titanium, Precision Dual-Frequency GPS, Action Button, 36h Battery.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=Watch+Ultra+3",
    brand: "Apple",
    category: "Smartwatches",
    categorySlug: "smartwatches",
    ean: "0194265918273",
    lowestPrice: 699,
    highestPrice: 849,
    currency: "CHF",
    shopCount: 4,
    prices: [
      { shopId: "digitec", price: 699, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "galaxus", price: 719, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 749, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
      { shopId: "brack", price: 849, currency: "CHF", isPromotion: false, inStock: false, url: "#", updatedAt: "2026-06-19" },
    ],
    priceHistory: generatePriceHistory(769, 30),
  },
  {
    id: "7",
    name: "Dyson V15 Detect Staubsauger",
    slug: "dyson-v15-detect",
    description: "Laser detection, Piezo-Sensor, 60 Minuten Laufzeit, 5 Filterstufen.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=Dyson+V15",
    brand: "Dyson",
    category: "Haushalt",
    categorySlug: "haushalt",
    ean: "0885294562391",
    lowestPrice: 499,
    highestPrice: 649,
    currency: "CHF",
    shopCount: 5,
    prices: [
      { shopId: "galaxus", price: 499, currency: "CHF", isPromotion: true, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "digitec", price: 529, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "brack", price: 549, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 579, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
      { shopId: "mediamarkt", price: 649, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-19" },
    ],
    priceHistory: generatePriceHistory(569, 30),
  },
  {
    id: "8",
    name: "LG OLED C4 65 Zoll 4K TV",
    slug: "lg-oled-c4-65",
    description: "OLED evo, α9 AI Prozessor, Dolby Vision, 120Hz, Smart TV webOS.",
    image: "https://placehold.co/400x400/e2e8f0/64748b?text=LG+OLED+C4",
    brand: "LG",
    category: "TV & Audio",
    categorySlug: "tv-audio",
    ean: "0880609330128",
    lowestPrice: 1299,
    highestPrice: 1599,
    currency: "CHF",
    shopCount: 5,
    prices: [
      { shopId: "digitec", price: 1299, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "galaxus", price: 1349, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "microspot", price: 1399, currency: "CHF", isPromotion: false, inStock: false, url: "#", updatedAt: "2026-06-20" },
      { shopId: "mediamarkt", price: 1449, currency: "CHF", isPromotion: true, inStock: true, url: "#", updatedAt: "2026-06-21" },
      { shopId: "interdiscount", price: 1599, currency: "CHF", isPromotion: false, inStock: true, url: "#", updatedAt: "2026-06-20" },
    ],
    priceHistory: generatePriceHistory(1449, 30),
  },
]

export function getProductBySlug(slug: string): Product | undefined {
  return products.find((p) => p.slug === slug)
}

export function getProductsByCategory(categorySlug: string): Product[] {
  return products.filter((p) => p.categorySlug === categorySlug)
}

export function searchProducts(query: string): Product[] {
  const q = query.toLowerCase()
  return products.filter(
    (p) =>
      p.name.toLowerCase().includes(q) ||
      p.brand.toLowerCase().includes(q) ||
      p.category.toLowerCase().includes(q)
  )
}

export function getShopById(id: string): Shop | undefined {
  return shops.find((s) => s.id === id)
}

export const categories: Category[] = [
  { name: "Smartphones", slug: "smartphones", icon: "📱", productCount: 2 },
  { name: "Kopfhörer", slug: "kopfhorer", icon: "🎧", productCount: 2 },
  { name: "Gaming", slug: "gaming", icon: "🎮", productCount: 1 },
  { name: "Smartwatches", slug: "smartwatches", icon: "⌚", productCount: 1 },
  { name: "TV & Audio", slug: "tv-audio", icon: "📺", productCount: 1 },
  { name: "Haushalt", slug: "haushalt", icon: "🏠", productCount: 1 },
]
