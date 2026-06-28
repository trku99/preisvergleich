"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminReports() {
  const [stats, setStats] = useState<any>(null)
  const supabase = createClient()

  useEffect(() => {
    supabase.rpc("admin_dashboard_stats").then(({ data }) => setStats(data))
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Raporlar</h1>
      <div className="grid md:grid-cols-2 gap-6">
        <div className="bg-white rounded-xl border p-5">
          <h2 className="font-semibold mb-3">Mağaza Bazında Ürün Dağılımı</h2>
          {stats?.shop_stats?.map((s: any) => (
            <div key={s.name} className="flex justify-between text-sm py-1 border-b last:border-0">
              <span>{s.name}</span>
              <span className="font-medium">{s.count}</span>
            </div>
          ))}
        </div>
        <div className="bg-white rounded-xl border p-5">
          <h2 className="font-semibold mb-3">Özet</h2>
          <div className="space-y-2 text-sm">
            <div className="flex justify-between"><span>Toplam Ürün</span><span className="font-medium">{stats?.total_products || 0}</span></div>
            <div className="flex justify-between"><span>Toplam Mağaza</span><span className="font-medium">{stats?.total_shops || 0}</span></div>
            <div className="flex justify-between"><span>Toplam Kategori</span><span className="font-medium">{stats?.total_categories || 0}</span></div>
            <div className="flex justify-between"><span>Shop Bağlantısı</span><span className="font-medium">{stats?.total_product_shops || 0}</span></div>
            <div className="flex justify-between"><span>Fiyat Kaydı</span><span className="font-medium">{stats?.total_price_records || 0}</span></div>
          </div>
        </div>
      </div>
    </div>
  )
}
