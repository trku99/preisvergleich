"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Stats = {
  total_products: number; total_shops: number; total_categories: number
  total_product_shops: number; total_price_records: number
  recent_products: { id: string; name: string; slug: string; created_at: string }[]
  shop_stats: { name: string; count: number }[]
}

type ChartStats = {
  price_trend: { date: string; count: number }[]
  category_distribution: { name: string; count: number }[]
  brand_distribution: { name: string; count: number }[]
}

const statCards = [
  { key: "total_products", label: "Produkte", icon: "📦", gradient: "from-indigo-500 to-purple-600", delay: 0 },
  { key: "total_shops", label: "Geschäfte", icon: "🏪", gradient: "from-emerald-500 to-teal-600", delay: 100 },
  { key: "total_categories", label: "Kategorien", icon: "📂", gradient: "from-amber-500 to-orange-600", delay: 200 },
  { key: "total_product_shops", label: "Shop-Verbindungen", icon: "🔗", gradient: "from-rose-500 to-pink-600", delay: 300 },
  { key: "total_price_records", label: "Preisaufzeichnungen", icon: "💰", gradient: "from-cyan-500 to-blue-600", delay: 400 },
]

export default function AdminDashboard() {
  const [stats, setStats] = useState<Stats | null>(null)
  const [chartStats, setChartStats] = useState<ChartStats | null>(null)
  const supabase = createClient()

  useEffect(() => { loadAll() }, [])

  async function loadAll() {
    const [s, c] = await Promise.all([
      supabase.rpc("admin_dashboard_stats"),
      supabase.rpc("admin_chart_stats"),
    ])
    if (s.data) setStats(s.data as Stats)
    if (c.data) setChartStats(c.data as ChartStats)
  }

  const maxCount = chartStats?.price_trend ? Math.max(...chartStats.price_trend.map(d => d.count), 1) : 1

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-1">Dashboard</h1>
      <p className="text-sm text-zinc-400 mb-6">Plattform-Statistiken und Übersicht</p>

      {!stats ? (
        <p className="text-zinc-400 animate-pulse">Wird geladen...</p>
      ) : (
        <>
          <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
            {statCards.map((card) => (
              <div key={card.key} className="relative group rounded-2xl p-5 overflow-hidden transition-all duration-500 hover:scale-[1.02] hover:shadow-xl shadow-md"
                style={{ animation: `fade-in-up 0.5s ease-out ${card.delay}ms both` }}>
                <div className={`absolute inset-0 bg-gradient-to-br ${card.gradient}`} />
                <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_120%,rgba(255,255,255,0.2),transparent_70%)]" />
                <div className="relative z-10">
                  <div className="text-2xl mb-1">{card.icon}</div>
                  <div className="text-3xl font-bold text-white drop-shadow-lg">{stats[card.key as keyof Stats] as number}</div>
                  <div className="text-xs text-white/70 mt-1">{card.label}</div>
                </div>
              </div>
            ))}
          </div>

          <div className="grid md:grid-cols-2 gap-6 mb-6">
            <div className="bg-white rounded-2xl border border-zinc-200 p-6 shadow-sm">
              <h2 className="text-sm font-semibold text-zinc-700 mb-4">Produkte pro Geschäft</h2>
              <div className="space-y-3">
                {stats.shop_stats.map((s, i) => (
                  <div key={s.name} style={{ animation: `slide-in 0.3s ease-out ${i * 50}ms both` }}>
                    <div className="flex items-center justify-between text-sm mb-1">
                      <span className="text-zinc-600">{s.name}</span>
                      <span className="text-zinc-800 font-medium">{s.count} Produkte</span>
                    </div>
                    <div className="w-full h-1.5 rounded-full bg-zinc-100 overflow-hidden">
                      <div className="h-full rounded-full bg-gradient-to-r from-indigo-500 to-purple-500 transition-all duration-1000"
                        style={{ width: `${Math.min(100, (s.count / Math.max(...stats.shop_stats.map(x => x.count))) * 100)}%` }} />
                    </div>
                  </div>
                ))}
              </div>
            </div>

            <div className="bg-white rounded-2xl border border-zinc-200 p-6 shadow-sm">
              <h2 className="text-sm font-semibold text-zinc-700 mb-4">Neueste Produkte</h2>
              <div className="space-y-2">
                {stats.recent_products.map((p, i) => (
                  <div key={p.id} className="flex items-center justify-between py-2 px-3 rounded-xl hover:bg-zinc-50 transition-colors"
                    style={{ animation: `slide-in 0.3s ease-out ${i * 50}ms both` }}>
                    <span className="text-zinc-600 text-sm">{p.name}</span>
                    <span className="text-zinc-400 text-xs">{new Date(p.created_at).toLocaleDateString("de-CH")}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Charts */}
          {chartStats && (
            <div className="grid md:grid-cols-3 gap-6">
              <div className="bg-white rounded-2xl border border-zinc-200 p-6 shadow-sm md:col-span-2">
                <h2 className="text-sm font-semibold text-zinc-700 mb-4">Preiseinträge (letzte 30 Tage)</h2>
                <div className="flex items-end gap-1 h-32">
                  {chartStats.price_trend.map((d, i) => (
                    <div key={d.date} className="flex-1 flex flex-col items-center gap-1 group relative">
                      <div className="w-full rounded-t bg-gradient-to-t from-indigo-500 to-purple-500 transition-all duration-300 hover:opacity-80"
                        style={{ height: `${(d.count / maxCount) * 100}%`, minHeight: d.count > 0 ? '4px' : '0' }} />
                      {d.count > 0 && (
                        <div className="absolute -top-6 left-1/2 -translate-x-1/2 text-xs text-zinc-500 opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap bg-white px-2 py-0.5 rounded shadow-sm border">
                          {d.count} am {new Date(d.date).toLocaleDateString("de-CH")}
                        </div>
                      )}
                    </div>
                  ))}
                </div>
                <div className="flex justify-between mt-2 text-xs text-zinc-400">
                  <span>{chartStats.price_trend[0]?.date?.slice(5) || ""}</span>
                  <span>{chartStats.price_trend[chartStats.price_trend.length - 1]?.date?.slice(5) || ""}</span>
                </div>
              </div>

              <div className="bg-white rounded-2xl border border-zinc-200 p-6 shadow-sm">
                <h2 className="text-sm font-semibold text-zinc-700 mb-4">Kategorien</h2>
                <div className="space-y-2">
                  {chartStats.category_distribution.map((c) => (
                    <div key={c.name} className="flex items-center gap-2 text-sm">
                      <span className="w-2 h-2 rounded-full bg-indigo-500 shrink-0" />
                      <span className="text-zinc-600 flex-1 truncate">{c.name}</span>
                      <span className="text-zinc-800 font-medium">{c.count}</span>
                    </div>
                  ))}
                </div>
              </div>

              <div className="bg-white rounded-2xl border border-zinc-200 p-6 shadow-sm md:col-span-3">
                <h2 className="text-sm font-semibold text-zinc-700 mb-4">Top Marken</h2>
                <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
                  {chartStats.brand_distribution.map((b) => {
                    const maxBrand = Math.max(...chartStats.brand_distribution.map(x => x.count), 1)
                    return (
                      <div key={b.name} className="text-center p-3 rounded-xl bg-zinc-50 border border-zinc-100">
                        <div className="text-lg font-bold text-indigo-600">{b.count}</div>
                        <div className="text-xs text-zinc-500 mt-1 truncate">{b.name}</div>
                        <div className="w-full h-1 rounded-full bg-zinc-200 mt-2 overflow-hidden">
                          <div className="h-full rounded-full bg-gradient-to-r from-indigo-500 to-purple-500" style={{ width: `${(b.count / maxBrand) * 100}%` }} />
                        </div>
                      </div>
                    )
                  })}
                </div>
              </div>
            </div>
          )}
        </>
      )}
    </div>
  )
}
