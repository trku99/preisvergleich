"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminSettings() {
  const [stats, setStats] = useState<any>(null)
  const supabase = createClient()

  useEffect(() => {
    supabase.rpc("admin_dashboard_stats").then(({ data }) => setStats(data))
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Sistem Ayarları</h1>
      <div className="grid md:grid-cols-2 gap-6">
        <div className="bg-white rounded-xl border p-5">
          <h2 className="font-semibold mb-3">Site Bilgileri</h2>
          <div className="space-y-3 text-sm">
            <div className="flex justify-between"><span>Site Adı</span><span className="font-medium">PreisVergleich.ch</span></div>
            <div className="flex justify-between"><span>Diller</span><span className="font-medium">DE / FR / IT</span></div>
            <div className="flex justify-between"><span>Para Birimi</span><span className="font-medium">CHF</span></div>
            <div className="flex justify-between"><span>Platform</span><span className="font-medium">Next.js 16 + Supabase</span></div>
            <div className="flex justify-between"><span>Hosting</span><span className="font-medium">Vercel</span></div>
          </div>
        </div>
        <div className="bg-white rounded-xl border p-5">
          <h2 className="font-semibold mb-3">Veritabanı</h2>
          <div className="space-y-3 text-sm">
            <div className="flex justify-between"><span>Ürünler</span><span className="font-medium">{stats?.total_products || 0}</span></div>
            <div className="flex justify-between"><span>Mağazalar</span><span className="font-medium">{stats?.total_shops || 0}</span></div>
            <div className="flex justify-between"><span>Kategoriler</span><span className="font-medium">{stats?.total_categories || 0}</span></div>
            <div className="flex justify-between"><span>Fiyat Kayıtları</span><span className="font-medium">{stats?.total_price_records || 0}</span></div>
          </div>
        </div>
      </div>
      <div className="bg-amber-50 border border-amber-200 rounded-xl p-4 mt-6">
        <p className="text-sm text-amber-800">
          🔧 Bakım modu, tema değişikliği, logo yükleme gibi ayarlar yakında eklenecek.
        </p>
      </div>
    </div>
  )
}
