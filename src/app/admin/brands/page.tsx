"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminBrands() {
  const [brands, setBrands] = useState<{ brand: string; count: number }[]>([])
  const supabase = createClient()

  useEffect(() => {
    supabase.from("products").select("brand").then(({ data }) => {
      if (!data) return
      const map = new Map<string, number>()
      data.forEach((p) => {
        if (p.brand) map.set(p.brand, (map.get(p.brand) || 0) + 1)
      })
      setBrands(Array.from(map.entries()).map(([brand, count]) => ({ brand, count })).sort((a, b) => b.count - a.count))
    })
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Marken</h1>
      <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden max-w-lg shadow-sm">
        <table className="w-full text-sm">
          <thead className="bg-zinc-50 border-b border-zinc-200">
            <tr className="text-left text-zinc-400">
              <th className="px-4 py-3 font-medium">Marke</th>
              <th className="px-4 py-3 font-medium">Produkte</th>
            </tr>
          </thead>
          <tbody>
            {brands.map((b) => (
              <tr key={b.brand} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                <td className="px-4 py-3 font-medium text-zinc-800">{b.brand}</td>
                <td className="px-4 py-3 text-zinc-500">{b.count} Produkte</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
