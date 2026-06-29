import { NextRequest, NextResponse } from "next/server"

export async function GET(req: NextRequest) {
  const q = req.nextUrl.searchParams.get("q") || "iPhone"
  const results: any[] = []
  const errors: string[] = []

  // Test 1: Toppreise.ch
  try {
    const url = `https://www.toppreise.ch/de/search?q=${encodeURIComponent(q)}`
    const res = await fetch(url, {
      headers: {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/125.0.0.0 Safari/537.36",
        "Accept": "text/html",
      },
      signal: AbortSignal.timeout(10000),
    })
    const html = await res.text()
    results.push({
      test: "toppreise.ch fetch",
      status: res.status,
      htmlLength: html.length,
      preview: html.slice(0, 2000),
      containsProducts: html.includes("product-item") || html.includes("price") || html.includes("CHF"),
    })
  } catch (e: any) {
    errors.push(`toppreise.ch error: ${e.message}`)
  }

  // Test 2: Galaxus enter-search
  try {
    const res = await fetch("https://www.galaxus.ch/api/graphql/enter-search", {
      method: "POST",
      headers: { "Content-Type": "application/json", "User-Agent": "Mozilla/5.0" },
      body: JSON.stringify([{
        operationName: "ENTER_SEARCH",
        variables: { searchTerm: q, limit: 3 },
        query: "query ENTER_SEARCH($searchTerm: String!, $limit: Int) { productSearch(searchTerm: $searchTerm, limit: $limit) { results { searchScore product { productId name brandName } } } }",
      }]),
      signal: AbortSignal.timeout(5000),
    })
    const text = await res.text()
    results.push({
      test: "galaxus enter-search",
      status: res.status,
      body: text.slice(0, 1000),
    })
  } catch (e: any) {
    errors.push(`galaxus error: ${e.message}`)
  }

  return NextResponse.json({ results, errors })
}
