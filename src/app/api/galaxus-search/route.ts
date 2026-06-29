import { NextRequest, NextResponse } from "next/server"
import { searchGalaxus } from "@/lib/galaxus"

export async function GET(req: NextRequest) {
  const q = req.nextUrl.searchParams.get("q")
  if (!q || q.length < 2) return NextResponse.json({ results: [] })
  const results = await searchGalaxus(q)
  return NextResponse.json({ results })
}
