import { NextRequest, NextResponse } from "next/server"
import { supabase } from "@/lib/supabase"

export async function POST(req: NextRequest) {
  try {
    const { productId, galaxusId, price, currency, inStock } = await req.json()
    if (!productId || !galaxusId || !price) {
      return NextResponse.json({ error: "Missing fields" }, { status: 400 })
    }

    await supabase.from("products").update({
      galaxus_id: galaxusId,
      galaxus_price: price,
      galaxus_currency: currency || "CHF",
      galaxus_in_stock: inStock ?? true,
      galaxus_updated_at: new Date().toISOString(),
    }).eq("id", productId)

    return NextResponse.json({ ok: true })
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 })
  }
}
