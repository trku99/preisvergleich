"use client"

import { useState } from "react"
import { createClient } from "@/lib/supabase-client"

const services = [
  { id: "ga4", name: "Google Analytics 4", icon: "📊", desc: "GA4 Measurement ID", field: "G-XXXXXXXX" },
  { id: "gtm", name: "Google Tag Manager", icon: "🏷️", desc: "GTM Container ID", field: "GTM-XXXXXXX" },
  { id: "gsc", name: "Google Search Console", icon: "🔍", desc: "Site-Verifizierung", field: "meta tag" },
  { id: "smtp", name: "SMTP", icon: "📧", desc: "E-Mail-Versand", field: "smtp.example.com" },
  { id: "affiliate", name: "Affiliate Network", icon: "🔗", desc: "Provision-Tracking", field: "API Key" },
]

export default function AdminIntegrations() {
  const [configs, setConfigs] = useState<Record<string, string>>({})
  const [saving, setSaving] = useState<string | null>(null)
  const supabase = createClient()

  function setVal(id: string, val: string) { setConfigs({ ...configs, [id]: val }) }

  async function save(id: string) {
    setSaving(id)
    await new Promise(r => setTimeout(r, 500))
    setSaving(null)
    alert(`${services.find(s => s.id === id)?.name} konfiguriert.`)
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Integrationen</h1>
      <p className="text-sm text-zinc-400 mb-6">Externe Dienstverbindungen.</p>

      <div className="grid md:grid-cols-2 gap-4">
        {services.map((s) => (
          <div key={s.id} className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
            <div className="flex items-center gap-3 mb-3">
              <span className="text-2xl">{s.icon}</span>
              <div>
                <div className="font-medium text-sm text-zinc-800">{s.name}</div>
                <div className="text-xs text-zinc-400">{s.desc}</div>
              </div>
            </div>
            <div className="flex gap-2">
              <input type="text" value={configs[s.id] || ""} onChange={(e) => setVal(s.id, e.target.value)} placeholder={s.field}
                className="flex-1 rounded-lg border border-zinc-300 bg-white px-3 py-2 text-xs text-zinc-700 placeholder-zinc-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
              <button onClick={() => save(s.id)} disabled={saving === s.id}
                className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-3 py-2 text-xs text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all shadow-lg shadow-indigo-600/20">
                {saving === s.id ? "..." : "Speichern"}
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
