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
}

const ENDPOINTS = [
  "https://www.galaxus.ch/api/graphql/enter-search",
  "https://www.digitec.ch/api/graphql/enter-search",
  "https://www.galaxus.ch/api/graphql",
  "https://www.digitec.ch/api/graphql",
]

function buildPayload(searchTerm: string) {
  return [{
    operationName: "ENTER_SEARCH",
    variables: { searchTerm, limit: 5 },
    query: `query ENTER_SEARCH($searchTerm: String!, $limit: Int) { productSearch(searchTerm: $searchTerm, limit: $limit) { results { searchScore product { productId name brandName images { url } } offer { price { amountIncl currency } insteadOfPrice { price { amountIncl } } salesInformation { numberOfItems } } } } }`,
  }]
}

async function tryEndpoint(query: string, url: string): Promise<GalaxusProduct[] | null> {
  try {
    const res = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
        "Origin": new URL(url).origin,
      },
      body: JSON.stringify(buildPayload(query)),
      signal: AbortSignal.timeout(5000),
    })
    if (!res.ok) return null
    const json = await res.json()
    const data = (Array.isArray(json) ? json[0] : json)?.data?.productSearch
    if (!data?.results?.length) return null
    return data.results.map((r: any): GalaxusProduct => {
      const p = r.product || {}
      const o = r.offer || {}
      const price = o.price || {}
      return {
        id: String(p.productId || ""),
        name: p.name || "",
        brand: p.brandName || "",
        price: price.amountIncl || 0,
        currency: price.currency || "CHF",
        priceBefore: o.insteadOfPrice?.price?.amountIncl || undefined,
        image: p.images?.[0]?.url?.replace(/\\u002F/g, "/") || undefined,
        url: `https://www.galaxus.ch/product/${p.productId}`,
        inStock: o.salesInformation?.numberOfItems > 0,
      }
    }).filter((p: GalaxusProduct) => p.price > 0)
  } catch {
    return null
  }
}

export async function searchGalaxus(query: string): Promise<GalaxusProduct[]> {
  for (const ep of ENDPOINTS) {
    try {
      const results = await tryEndpoint(query, ep)
      if (results && results.length > 0) return results
    } catch {}
  }
  return []
}

export async function searchGalaxusByEAN(ean: string): Promise<GalaxusProduct | null> {
  const results = await searchGalaxus(ean)
  return results[0] || null
}

export type { GalaxusProduct }
