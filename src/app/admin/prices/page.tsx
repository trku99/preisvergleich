"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type PriceRow = {
  id: string
  product_name: string
  shop_name: string
  price: number
  currency: string
  is_promotion: boolean
  scraped_at: string
}

export default function AdminPrices() {
  const [rows, setRows] = useState<PriceRow[]>([])
  const [loading, setLoading] = useState(true)
  const supabase = createClient()

  useEffect(() => {
    supabase
      .from("price_history")
      .select(`id, price, currency, is_promotion, scraped_at, product_shop:product_shops!inner(product_id, shop_id)`)
      .order("scraped_at", { ascending: false })
      .limit(200)
      .then(({ data }) => {
        if (data) setRows(data as any)
        setLoading(false)
      })
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Fiyat Kayıtları</h1>
      <p className="text-sm text-zinc-500 mb-4">Son 200 fiyat kaydı (gerçek ürün/shop isimleri için JOIN optimize edilecek)</p>

      {loading ? <p className="text-zinc-500">Yükleniyor...</p> : (
        <div className="bg-white rounded-xl border overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b">
              <tr className="text-left text-zinc-500">
                <th className="px-4 py-3 font-medium">Ürün ID</th>
                <th className="px-4 py-3 font-medium">Fiyat</th>
                <th className="px-4 py-3 font-medium">İndirim</th>
                <th className="px-4 py-3 font-medium">Tarih</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r) => (
                <tr key={r.id} className="border-b hover:bg-zinc-50">
                  <td className="px-4 py-3 font-mono text-xs">{r.id.slice(0, 8)}...</td>
                  <td className="px-4 py-3 font-medium">{r.price} {r.currency}</td>
                  <td className="px-4 py-3">{r.is_promotion ? <span className="text-green-600 text-xs">İndirim</span> : "-"}</td>
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
