const GALAXUS_API = "https://www.galaxus.ch/api/graphql/enter-search"
const DIGITEC_API = "https://www.digitec.ch/api/graphql/enter-search"

interface GalaxusProduct {
  id: string
  name: string
  brand: string
  price: number
  currency: string
  priceBefore?: number
  image?: string
  url: string
  inStock: boolean
  rating?: number
  reviewCount?: number
}

function searchQuery(searchTerm: string, limit = 5) {
  return {
    operationName: "ENTER_SEARCH",
    variables: { searchTerm, limit },
    query: `
      query ENTER_SEARCH($searchTerm: String!, $limit: Int) {
        productSearch(searchTerm: $searchTerm, limit: $limit) {
          results {
            searchScore
            product {
              productId
              name
              brandName
              images { url width height }
            }
            offer {
              price { amountIncl currency }
              insteadOfPrice { price { amountIncl } }
              salesInformation { numberOfItems numberOfItemsSold }
            }
          }
        }
      }
    `.replace(/\s+/g, " "),
  }
}

async function fetchFromGalaxus(query: string, endpoint: string): Promise<GalaxusProduct[]> {
  try {
    const res = await fetch(endpoint, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36",
        "Origin": new URL(endpoint).origin,
        "Accept": "*/*",
      },
      body: JSON.stringify(searchQuery(query)),
      signal: AbortSignal.timeout(8000),
    })
    if (!res.ok) return []
    const json = await res.json()
    const results = json?.data?.productSearch?.results || []
    return results.map((r: any): GalaxusProduct => {
      const p = r.product || {}
      const o = r.offer || {}
      const price = o.price || {}
      const insteadOf = o.insteadOfPrice?.price
      return {
        id: String(p.productId || ""),
        name: p.name || "",
        brand: p.brandName || "",
        price: price.amountIncl || 0,
        currency: price.currency || "CHF",
        priceBefore: insteadOf?.amountIncl || undefined,
        image: p.images?.[0]?.url || undefined,
        url: `https://www.galaxus.ch/product/${p.productId}`,
        inStock: o.salesInformation?.numberOfItems > 0,
      }
    }).filter((p: GalaxusProduct) => p.price > 0)
  } catch {
    return []
  }
}

export async function searchGalaxus(query: string): Promise<GalaxusProduct[]> {
  const [galaxus, digitec] = await Promise.all([
    fetchFromGalaxus(query, GALAXUS_API),
    fetchFromGalaxus(query, DIGITEC_API),
  ])
  const seen = new Set<string>()
  return [...galaxus, ...digitec].filter((p) => {
    if (seen.has(p.id)) return false
    seen.add(p.id)
    return true
  })
}

export async function searchGalaxusByEAN(ean: string): Promise<GalaxusProduct | null> {
  const results = await searchGalaxus(ean)
  return results[0] || null
}

export type { GalaxusProduct }
