interface ToppreiseProduct {
  id: string
  name: string
  price: number
  currency: string
  url: string
  image?: string
  shopCount?: number
}

interface ToppreiseOffer {
  shopName: string
  price: number
  currency: string
  url: string
  inStock: boolean
}

/** Search products on toppreise.ch */
export async function searchToppreise(query: string): Promise<ToppreiseProduct[]> {
  try {
    const url = `https://www.toppreise.ch/de/search?q=${encodeURIComponent(query)}`
    const res = await fetch(url, {
      headers: {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml",
        "Accept-Language": "de-CH,de;q=0.9",
      },
      signal: AbortSignal.timeout(10000),
    })
    if (!res.ok) return []
    const html = await res.text()

    const products: ToppreiseProduct[] = []

    const productRegex = /<div class="product-item"[^>]*>[\s\S]*?<a href="([^"]+)"[^>]*>[\s\S]*?<h3[^>]*>([\s\S]*?)<\/h3>[\s\S]*?class="price"[^>]*>([\s\S]*?)<\//g
    let match
    while ((match = productRegex.exec(html)) !== null) {
      const path = match[1]
      const name = match[2].replace(/<[^>]*>/g, "").trim()
      const priceText = match[3].replace(/<[^>]*>/g, "").trim()
      const price = parseFloat(priceText.replace(/[^0-9,.]/g, "").replace(",", "."))
      if (path && name && price > 0) {
        const id = path.split("/").pop() || path
        products.push({
          id,
          name,
          price,
          currency: "CHF",
          url: `https://www.toppreise.ch${path}`,
        })
      }
    }

    if (products.length === 0) {
      const altRegex = /<a[^>]*href="(\/de\/p\d+\/[^"]+)"[^>]*>[\s\S]*?<span[^>]*class="name"[^>]*>([\s\S]*?)<\/span>[\s\S]*?<span[^>]*class="price"[^>]*>([\s\S]*?)<\/span>/g
      while ((match = altRegex.exec(html)) !== null) {
        const path = match[1]
        const name = match[2].replace(/<[^>]*>/g, "").trim()
        const priceText = match[3].replace(/<[^>]*>/g, "").trim()
        const price = parseFloat(priceText.replace(/[^0-9,.]/g, "").replace(",", "."))
        if (path && name && price > 0) {
          const id = path.split("/").pop() || path
          products.push({
            id,
            name,
            price,
            currency: "CHF",
            url: `https://www.toppreise.ch${path}`,
          })
        }
      }
    }

    return products.slice(0, 8)
  } catch {
    return []
  }
}

/** Get all offers for a product from its detail page */
export async function getToppreiseOffers(url: string): Promise<ToppreiseOffer[]> {
  try {
    const res = await fetch(url, {
      headers: {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
        "Accept": "text/html",
        "Accept-Language": "de-CH,de;q=0.9",
      },
      signal: AbortSignal.timeout(10000),
    })
    if (!res.ok) return []
    const html = await res.text()

    const offers: ToppreiseOffer[] = []

    const offerRegex = /<tr[^>]*class="offer"[^>]*>[\s\S]*?<a[^>]*href="([^"]*go\.toppreise\.ch[^"]*)"[\s\S]*?<img[^>]*alt="([^"]*)"[\s\S]*?class="price"[^>]*>([\s\S]*?)<\//g
    let match
    while ((match = offerRegex.exec(html)) !== null) {
      const url = match[1]
      const shopName = match[2].trim()
      const priceText = match[3].replace(/<[^>]*>/g, "").trim()
      const price = parseFloat(priceText.replace(/[^0-9,.]/g, "").replace(",", "."))
      if (url && shopName && price > 0) {
        offers.push({
          shopName,
          price,
          currency: "CHF",
          url,
          inStock: true,
        })
      }
    }

    return offers
  } catch {
    return []
  }
}

export type { ToppreiseProduct, ToppreiseOffer }
