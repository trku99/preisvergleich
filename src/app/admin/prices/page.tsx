"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type PriceRow = { id: string; price: number; currency: string; is_promotion: boolean; scraped_at: string }

export default function AdminPrices() {
  const [rows, setRows] = useState<PriceRow[]>([])
  const [loading, setLoading] = useState(true)
  const supabase = createClient()

  useEffect(() => {
    supabase.from("price_history").select("id, price, currency, is_promotion, scraped_at").order("scraped_at", { ascending: false }).limit(200).then(({ data }) => {
      if (data) setRows(data as any)
      setLoading(false)
    })
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Preisaufzeichnungen</h1>
      <p className="text-sm text-zinc-400 mb-4">Letzte 200 Preisaufzeichnungen</p>

      {loading ? <p className="text-zinc-400">Wird geladen...</p> : (
        <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden shadow-sm">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-left text-zinc-400">
                <th className="px-4 py-3 font-medium">ID</th>
                <th className="px-4 py-3 font-medium">Preis</th>
                <th className="px-4 py-3 font-medium">Rabatt</th>
                <th className="px-4 py-3 font-medium">Datum</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r) => (
                <tr key={r.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 font-mono text-xs text-zinc-400">{r.id.slice(0, 8)}...</td>
                  <td className="px-4 py-3 font-medium text-zinc-800">{r.price} {r.currency}</td>
                  <td className="px-4 py-3">{r.is_promotion ? <span className="text-emerald-600 text-xs">Rabatt</span> : <span className="text-zinc-300">-</span>}</td>
                  <td className="px-4 py-3 text-xs text-zinc-400">{new Date(r.scraped_at).toLocaleString("de-CH")}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
