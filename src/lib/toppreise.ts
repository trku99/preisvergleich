interface ToppreiseProduct {
  id: string
  name: string
  price: number
  currency: string
  url: string
  image?: string
  shopCount?: number
}

export async function searchToppreise(query: string): Promise<ToppreiseProduct[]> {
  try {
    const url = `https://www.toppreise.ch/de/search?q=${encodeURIComponent(query)}`
    const res = await fetch(url, {
      headers: {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml",
        "Accept-Language": "de-CH,de;q=0.9",
      },
      signal: AbortSignal.timeout(15000),
    })
    if (!res.ok) return []
    const html = await res.text()

    const products: ToppreiseProduct[] = []

    const linkRegex = /<a[^>]*href="(\/de\/p\d+[^"]*)"[^>]*class="[^"]*product[^"]*"[^>]*>/gi
    let linkMatch
    while ((linkMatch = linkRegex.exec(html)) !== null) {
      const productPath = linkMatch[1]
      const id = productPath.match(/p(\d+)/)?.[1] || productPath

      const snippetStart = Math.max(0, linkMatch.index - 500)
      const snippet = html.slice(snippetStart, linkMatch.index + 1000)

      const nameMatch = snippet.match(/<h3[^>]*>([\s\S]*?)<\/h3>/i) || snippet.match(/class="[^"]*name[^"]*"[^>]*>([\s\S]*?)<\//i)
      const name = nameMatch ? nameMatch[1].replace(/<[^>]*>/g, "").trim() : ""

      const priceMatch = snippet.match(/CHF\s*([0-9'’.,]+)/) || snippet.match(/([0-9]+[’'.]?[0-9]*)\s*CHF/)
      const priceStr = priceMatch ? priceMatch[1].replace(/[^0-9,.]/g, "") : ""
      const price = parseFloat(priceStr.replace(",", "."))

      if (name && price > 0 && !products.some(p => p.id === id)) {
        products.push({
          id,
          name,
          price,
          currency: "CHF",
          url: `https://www.toppreise.ch${productPath}`,
        })
      }
    }

    if (products.length === 0) {
      const allNames = html.match(/<h3[^>]*>([\s\S]*?)<\/h3>/gi) || []
      const allPrices = html.match(/CHF\s*([0-9'’.,]+)/g) || []
      if (allNames.length > 0 && allPrices.length > 0) {
        const count = Math.min(allNames.length, allPrices.length, 5)
        for (let i = 0; i < count; i++) {
          const name = allNames[i].replace(/<[^>]*>/g, "").trim()
          const priceStr = allPrices[i].replace(/CHF\s*/, "").replace(/[^0-9,.]/g, "")
          const price = parseFloat(priceStr.replace(",", "."))
          if (name && price > 0) {
            products.push({
              id: `tp-${i}`,
              name,
              price,
              currency: "CHF",
              url: `https://www.toppreise.ch/de/search?q=${encodeURIComponent(name.slice(0, 30))}`,
            })
          }
        }
      }
    }

    return products.slice(0, 8)
  } catch (e) {
    console.error("Toppreise search error:", e)
    return []
  }
}
