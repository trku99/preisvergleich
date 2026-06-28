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
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Berichte</h1>
      <div className="grid md:grid-cols-2 gap-6">
        <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="font-semibold text-zinc-800 mb-3 text-sm">Produkte pro Geschäft</h2>
          {stats?.shop_stats?.map((s: any, i: number) => (
            <div key={s.name} className="flex justify-between text-sm py-2 border-b border-zinc-100 last:border-0">
              <span className="text-zinc-600">{s.name}</span>
              <span className="font-medium text-zinc-800">{s.count}</span>
            </div>
          ))}
        </div>
        <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="font-semibold text-zinc-800 mb-3 text-sm">Zusammenfassung</h2>
          <div className="space-y-3 text-sm">
            {[
              { label: "Produkte Gesamt", value: stats?.total_products },
              { label: "Geschäfte Gesamt", value: stats?.total_shops },
              { label: "Kategorien Gesamt", value: stats?.total_categories },
              { label: "Shop-Verknüpfungen", value: stats?.total_product_shops },
              { label: "Preiseinträge", value: stats?.total_price_records },
            ].map((item) => (
              <div key={item.label} className="flex justify-between py-1">
                <span className="text-zinc-600">{item.label}</span>
                <span className="font-medium text-zinc-800">{item.value || 0}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
