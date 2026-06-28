"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Campaign = { id: string; title: string; slug: string; description: string; discount_percent: number; start_date: string; end_date: string; is_active: boolean; banner_url: string }

export default function AdminCampaigns() {
  const [campaigns, setCampaigns] = useState<Campaign[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ title: "", slug: "", description: "", discount_percent: 0, start_date: "", end_date: "", banner_url: "", is_active: true })
  const [editing, setEditing] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("campaigns").select("*").order("created_at", { ascending: false })
    if (data) setCampaigns(data)
    setLoading(false)
  }

  function slugify(t: string) { return t.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "") }

  async function save() {
    if (!form.title) return
    setSaving(true)
    const fn = editing ? "admin_update_campaign" : "admin_insert_campaign"
    const args: any = editing
      ? { p_id: editing, p_title: form.title, p_slug: form.slug, p_description: form.description, p_discount_percent: form.discount_percent, p_start_date: form.start_date || null, p_end_date: form.end_date || null, p_is_active: form.is_active, p_banner_url: form.banner_url }
      : { p_title: form.title, p_slug: form.slug, p_description: form.description, p_discount_percent: form.discount_percent, p_start_date: form.start_date || null, p_end_date: form.end_date || null, p_banner_url: form.banner_url }
    const { error } = await supabase.rpc(fn, args)
    if (error) alert("Hata: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Wirklich löschen?")) return
    const { error } = await supabase.rpc("admin_delete_campaign", { p_id: id })
    if (!error) fetch()
  }

  function edit(c: Campaign) {
    setEditing(c.id)
    setForm({ title: c.title, slug: c.slug, description: c.description || "", discount_percent: c.discount_percent || 0, start_date: c.start_date?.slice(0, 16) || "", end_date: c.end_date?.slice(0, 16) || "", banner_url: c.banner_url || "", is_active: c.is_active })
  }

  function reset() { setEditing(null); setForm({ title: "", slug: "", description: "", discount_percent: 0, start_date: "", end_date: "", banner_url: "", is_active: true }) }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Aktionen</h1>
      <div className="bg-white rounded-2xl border border-zinc-200 p-5 mb-6 max-w-lg shadow-sm">
        <h2 className="font-medium text-zinc-800 mb-3 text-sm">{editing ? "Aktion bearbeiten" : "Neue Aktion"}</h2>
        <div className="space-y-3">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Titel</label>
              <input type="text" value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value, slug: slugify(e.target.value) })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Rabatt %</label>
              <input type="number" value={form.discount_percent} onChange={(e) => setForm({ ...form, discount_percent: parseInt(e.target.value) || 0 })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Start</label>
              <input type="datetime-local" value={form.start_date} onChange={(e) => setForm({ ...form, start_date: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Ende</label>
              <input type="datetime-local" value={form.end_date} onChange={(e) => setForm({ ...form, end_date: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
          </div>
          <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Beschreibung</label>
            <textarea value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} rows={2} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Banner URL</label>
            <input type="text" value={form.banner_url} onChange={(e) => setForm({ ...form, banner_url: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          {editing && (
            <label className="flex items-center gap-2 text-sm text-zinc-600">
              <input type="checkbox" checked={form.is_active} onChange={(e) => setForm({ ...form, is_active: e.target.checked })} className="accent-indigo-600" />
              Aktiv
            </label>
          )}
          <div className="flex gap-2 pt-2">
            <button onClick={save} disabled={saving} className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-4 py-2 text-xs text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all shadow-md">
              {saving ? "..." : editing ? "Aktualisieren" : "Hinzufügen"}
            </button>
            {editing && <button onClick={reset} className="rounded-lg border border-zinc-300 px-4 py-2 text-xs text-zinc-600 hover:text-zinc-700">Abbrechen</button>}
          </div>
        </div>
      </div>

      {loading ? <p className="text-zinc-400">Wird geladen...</p> : (
        <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden shadow-sm">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-left text-zinc-400">
                <th className="px-4 py-3 font-medium">Aktion</th>
                <th className="px-4 py-3 font-medium">Rabatt</th>
                <th className="px-4 py-3 font-medium">Datum</th>
                <th className="px-4 py-3 font-medium">Status</th>
                <th className="px-4 py-3 w-24"></th>
              </tr>
            </thead>
            <tbody>
              {campaigns.map((c) => (
                <tr key={c.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 font-medium text-zinc-800">{c.title}</td>
                  <td className="px-4 py-3 text-emerald-600 font-medium">%{c.discount_percent}</td>
                  <td className="px-4 py-3 text-xs text-zinc-400">
                    {c.start_date ? new Date(c.start_date).toLocaleDateString("de-CH") : "?"} - {c.end_date ? new Date(c.end_date).toLocaleDateString("de-CH") : "?"}
                  </td>
                  <td className="px-4 py-3">{c.is_active ? <span className="text-emerald-600 text-xs">Aktiv</span> : <span className="text-zinc-400 text-xs">Inaktiv</span>}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(c)} className="text-indigo-600 hover:text-indigo-700 text-xs">Bearbeiten</button>
                    <button onClick={() => remove(c.id)} className="text-red-500 hover:text-red-600 text-xs">Löschen</button>
                  </td>
                </tr>
              ))}
              {campaigns.length === 0 && <tr><td colSpan={5} className="px-4 py-8 text-center text-zinc-400">Noch keine Aktionen vorhanden.</td></tr>}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
