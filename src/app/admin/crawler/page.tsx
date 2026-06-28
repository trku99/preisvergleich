"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminCrawler() {
  const [stats, setStats] = useState({ products: 0, shops: 0, prices: 0 })
  const supabase = createClient()

  useEffect(() => {
    Promise.all([
      supabase.from("products").select("id", { count: "exact", head: true }),
      supabase.from("shops").select("id", { count: "exact", head: true }),
      supabase.from("price_history").select("id", { count: "exact", head: true }),
    ]).then(([p, s, ph]) => {
      setStats({ products: p.count || 0, shops: s.count || 0, prices: ph.count || 0 })
    })
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Veri Çekme (Crawler)</h1>

      <div className="grid grid-cols-3 gap-4 mb-6">
        <div className="bg-white rounded-xl border p-4"><div className="text-2xl font-bold">{stats.products}</div><div className="text-xs text-zinc-500">Ürün</div></div>
        <div className="bg-white rounded-xl border p-4"><div className="text-2xl font-bold">{stats.shops}</div><div className="text-xs text-zinc-500">Mağaza</div></div>
        <div className="bg-white rounded-xl border p-4"><div className="text-2xl font-bold">{stats.prices}</div><div className="text-xs text-zinc-500">Fiyat Kaydı</div></div>
      </div>

      <div className="bg-white rounded-xl border p-5 mb-4">
        <h2 className="font-semibold mb-2">Price Updater (GitHub Actions)</h2>
        <p className="text-sm text-zinc-500 mb-3">Her 6 saatte bir otomatik çalışır.</p>
        <a href="https://github.com/trku99/preisvergleich/actions/workflows/price-updater.yml" target="_blank" className="text-blue-600 text-sm hover:underline">
          GitHub Actions →
        </a>
      </div>

      <div className="bg-white rounded-xl border p-5">
        <h2 className="font-semibold mb-2">Sitemap Scraper</h2>
        <p className="text-sm text-zinc-500">Interdiscount sitemap'lerinden URL çekildi (36 ürün eşleşti). Diğer mağazalar Cloudflare/ENGELLI.</p>
      </div>
    </div>
  )
}
