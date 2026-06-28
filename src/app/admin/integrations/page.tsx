"use client"

import { useState } from "react"
import { createClient } from "@/lib/supabase-client"

const services = [
  { id: "ga4", name: "Google Analytics 4", icon: "📊", desc: "GA4 Measurement ID", field: "G-XXXXXXXX" },
  { id: "gtm", name: "Google Tag Manager", icon: "🏷️", desc: "GTM Container ID", field: "GTM-XXXXXXX" },
  { id: "gsc", name: "Google Search Console", icon: "🔍", desc: "Site doğrulama", field: "meta tag" },
  { id: "smtp", name: "SMTP", icon: "📧", desc: "E-posta gönderimi", field: "smtp.example.com" },
  { id: "affiliate", name: "Affiliate Network", icon: "🔗", desc: "Komisyon takibi", field: "API Key" },
]

export default function AdminIntegrations() {
  const [configs, setConfigs] = useState<Record<string, string>>({})
  const [saving, setSaving] = useState<string | null>(null)
  const supabase = createClient()

  function setVal(id: string, val: string) { setConfigs({ ...configs, [id]: val }) }

  async function save(id: string) {
    setSaving(id)
    // For now just simulate - real implementation would use a settings table
    await new Promise(r => setTimeout(r, 500))
    setSaving(null)
    alert(`${services.find(s => s.id === id)?.name} ayarlandı.`)
  }

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Entegrasyonlar</h1>
      <p className="text-sm text-zinc-500 mb-6">Harici servis bağlantı ayarları. (Yakında veritabanına kaydedilecek)</p>

      <div className="grid md:grid-cols-2 gap-4">
        {services.map((s) => (
          <div key={s.id} className="bg-white rounded-xl border p-5">
            <div className="flex items-center gap-3 mb-3">
              <span className="text-2xl">{s.icon}</span>
              <div>
                <div className="font-medium text-sm">{s.name}</div>
                <div className="text-xs text-zinc-400">{s.desc}</div>
              </div>
            </div>
            <div className="flex gap-2">
              <input
                type="text"
                value={configs[s.id] || ""}
                onChange={(e) => setVal(s.id, e.target.value)}
                placeholder={s.field}
                className="flex-1 rounded border px-3 py-2 text-xs"
              />
              <button
                onClick={() => save(s.id)}
                disabled={saving === s.id}
                className="rounded bg-blue-600 px-3 py-2 text-xs text-white hover:bg-blue-700 disabled:opacity-50"
              >
                {saving === s.id ? "..." : "Kaydet"}
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
