import { NextRequest, NextResponse } from "next/server"
import { searchToppreise } from "@/lib/toppreise"

export async function GET(req: NextRequest) {
  const q = req.nextUrl.searchParams.get("q")
  if (!q || q.length < 2) return NextResponse.json({ results: [] })

  const results = await searchToppreise(q)
  return NextResponse.json({ results })
}
