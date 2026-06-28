"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminBrands() {
  const [brands, setBrands] = useState<{ brand: string; count: number }[]>([])
  const supabase = createClient()

  useEffect(() => {
    supabase.rpc("admin_dashboard_stats").then(({ data }) => {
      // get brands from products table
    })
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
      <h1 className="text-2xl font-bold mb-6">Markalar</h1>
      <div className="bg-white rounded-xl border overflow-hidden max-w-lg">
        <table className="w-full text-sm">
          <thead className="bg-zinc-50 border-b">
            <tr className="text-left text-zinc-500">
              <th className="px-4 py-3 font-medium">Marka</th>
              <th className="px-4 py-3 font-medium">Ürün Sayısı</th>
            </tr>
          </thead>
          <tbody>
            {brands.map((b) => (
              <tr key={b.brand} className="border-b hover:bg-zinc-50">
                <td className="px-4 py-3 font-medium">{b.brand}</td>
                <td className="px-4 py-3">{b.count} ürün</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
