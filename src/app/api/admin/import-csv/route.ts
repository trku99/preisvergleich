import { NextRequest, NextResponse } from "next/server"
import { createClient } from "@/lib/supabase-server"

export async function POST(req: NextRequest) {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 })

    const formData = await req.formData()
    const file = formData.get("file") as File
    if (!file) return NextResponse.json({ error: "No file" }, { status: 400 })

    const text = await file.text()
    const lines = text.split("\n").filter(l => l.trim())
    if (lines.length < 2) return NextResponse.json({ error: "Empty file" }, { status: 400 })

    const headers = lines[0].split(",").map(h => h.trim().toLowerCase())
    const required = ["name"]
    const missing = required.filter(r => !headers.includes(r))
    if (missing.length > 0) return NextResponse.json({ error: `Missing columns: ${missing.join(", ")}` }, { status: 400 })

    const products: any[] = []
    const errors: string[] = []

    for (let i = 1; i < lines.length; i++) {
      const vals = lines[i].split(",").map(v => v.trim().replace(/^"|"$/g, ""))
      const row: any = {}
      headers.forEach((h, idx) => { row[h] = vals[idx] || "" })
      if (!row.name) { errors.push(`Row ${i + 1}: missing name`); continue }
      products.push(row)
    }

    if (products.length === 0) return NextResponse.json({ error: "No valid rows", errors }, { status: 400 })

    const { data, error } = await supabase.rpc("admin_bulk_insert_products", { p_products: JSON.stringify(products) })
    if (error) return NextResponse.json({ error: error.message }, { status: 500 })

    return NextResponse.json({ result: data, errors, total: products.length })
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 })
  }
}
