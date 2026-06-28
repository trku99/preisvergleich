"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Stats = {
  total_products: number
  total_shops: number
  total_categories: number
  total_product_shops: number
  total_price_records: number
  recent_products: { id: string; name: string; slug: string; created_at: string }[]
  shop_stats: { name: string; count: number }[]
}

export default function AdminDashboard() {
  const [stats, setStats] = useState<Stats | null>(null)
  const supabase = createClient()

  useEffect(() => {
    loadStats()
  }, [])

  async function loadStats() {
    const { data } = await supabase.rpc("admin_dashboard_stats")
    if (data) setStats(data as Stats)
  }

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Dashboard</h1>

      {!stats ? (
        <p className="text-zinc-500">Yükleniyor...</p>
      ) : (
        <>
          <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
            <StatCard label="Ürünler" value={stats.total_products} color="blue" />
            <StatCard label="Mağazalar" value={stats.total_shops} color="green" />
            <StatCard label="Kategoriler" value={stats.total_categories} color="purple" />
            <StatCard label="Shop Bağlantıları" value={stats.total_product_shops} color="amber" />
            <StatCard label="Fiyat Kaydı" value={stats.total_price_records} color="rose" />
          </div>

          <div className="grid md:grid-cols-2 gap-6">
            <div className="bg-white rounded-xl p-5 border">
              <h2 className="font-semibold mb-3">Mağaza Bazında Ürün Sayısı</h2>
              <div className="space-y-2">
                {stats.shop_stats.map((s) => (
                  <div key={s.name} className="flex items-center justify-between text-sm">
                    <span>{s.name}</span>
                    <span className="font-medium">{s.count} ürün</span>
                  </div>
                ))}
              </div>
            </div>

            <div className="bg-white rounded-xl p-5 border">
              <h2 className="font-semibold mb-3">Son Eklenen Ürünler</h2>
              <div className="space-y-2">
                {stats.recent_products.map((p) => (
                  <div key={p.id} className="flex items-center justify-between text-sm">
                    <span>{p.name}</span>
                    <span className="text-zinc-400 text-xs">{new Date(p.created_at).toLocaleDateString("de-CH")}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  )
}

function StatCard({ label, value, color }: { label: string; value: number; color: string }) {
  const colors: Record<string, string> = {
    blue: "bg-blue-50 text-blue-700 border-blue-200",
    green: "bg-green-50 text-green-700 border-green-200",
    purple: "bg-purple-50 text-purple-700 border-purple-200",
    amber: "bg-amber-50 text-amber-700 border-amber-200",
    rose: "bg-rose-50 text-rose-700 border-rose-200",
  }
  return (
    <div className={`rounded-xl p-4 border ${colors[color] || colors.blue}`}>
      <div className="text-2xl font-bold">{value}</div>
      <div className="text-xs mt-1 opacity-80">{label}</div>
    </div>
  )
}
