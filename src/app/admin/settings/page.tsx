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
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Einstellungen</h1>
      <div className="grid md:grid-cols-2 gap-6">
        <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="font-semibold text-zinc-800 mb-3 text-sm">Website-Informationen</h2>
          <div className="space-y-3 text-sm">
            {[
              { label: "Seitenname", value: "PreisVergleich.ch" },
              { label: "Sprachen", value: "DE / FR / IT" },
              { label: "Währung", value: "CHF" },
              { label: "Plattform", value: "Next.js 16 + Supabase" },
              { label: "Hosting", value: "Vercel" },
            ].map((item) => (
              <div key={item.label} className="flex justify-between py-1">
                <span className="text-zinc-600">{item.label}</span>
                <span className="font-medium text-zinc-800">{item.value}</span>
              </div>
            ))}
          </div>
        </div>
        <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="font-semibold text-zinc-800 mb-3 text-sm">Datenbank</h2>
          <div className="space-y-3 text-sm">
            {[
              { label: "Produkte", value: stats?.total_products },
              { label: "Geschäfte", value: stats?.total_shops },
              { label: "Kategorien", value: stats?.total_categories },
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
      <div className="border-amber-200 p-4 mt-6 bg-amber-50">
        <p className="text-sm text-amber-700">🔧 Wartungsmodus, Theme-Änderungen, Logo-Upload folgen bald.</p>
      </div>
    </div>
  )
}
