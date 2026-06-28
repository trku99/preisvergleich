"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Ad = { id: string; name: string; position: string; image_url: string; link_url: string; is_active: boolean; start_date: string; end_date: string; impressions: number; clicks: number; created_at: string }

const positions = ["sidebar", "banner_top", "banner_bottom", "between_products", "hero"]

export default function AdminAds() {
  const [ads, setAds] = useState<Ad[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ name: "", position: "sidebar", image_url: "", link_url: "", start_date: "", end_date: "", is_active: true })
  const [editing, setEditing] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("ad_placements").select("*").order("created_at", { ascending: false })
    if (data) setAds(data)
    setLoading(false)
  }

  async function save() {
    if (!form.name) return
    setSaving(true)
    const fn = editing ? "admin_update_ad" : "admin_insert_ad"
    const args: any = editing
      ? { p_id: editing, p_name: form.name, p_position: form.position, p_image_url: form.image_url, p_link_url: form.link_url, p_is_active: form.is_active, p_start_date: form.start_date || null, p_end_date: form.end_date || null }
      : { p_name: form.name, p_position: form.position, p_image_url: form.image_url, p_link_url: form.link_url, p_start_date: form.start_date || null, p_end_date: form.end_date || null }
    const { error } = await supabase.rpc(fn, args)
    if (error) alert("Fehler: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Werbung löschen?")) return
    await supabase.rpc("admin_delete_ad", { p_id: id })
    fetch()
  }

  function edit(a: Ad) {
    setEditing(a.id)
    setForm({ name: a.name, position: a.position, image_url: a.image_url || "", link_url: a.link_url || "", start_date: a.start_date?.slice(0, 16) || "", end_date: a.end_date?.slice(0, 16) || "", is_active: a.is_active })
  }

  function reset() { setEditing(null); setForm({ name: "", position: "sidebar", image_url: "", link_url: "", start_date: "", end_date: "", is_active: true }) }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Werbung</h1>

      <div className="bg-white rounded-2xl border border-zinc-200 p-5 mb-6 max-w-lg shadow-sm">
        <h2 className="font-medium text-zinc-800 mb-3 text-sm">{editing ? "Werbung bearbeiten" : "Neue Werbung"}</h2>
        <div className="space-y-3">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Name</label>
              <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Position</label>
              <select value={form.position} onChange={(e) => setForm({ ...form, position: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
                {positions.map((p) => <option key={p} value={p}>{p}</option>)}
              </select>
            </div>
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Bild-URL</label>
            <input type="text" value={form.image_url} onChange={(e) => setForm({ ...form, image_url: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Link-URL</label>
            <input type="text" value={form.link_url} onChange={(e) => setForm({ ...form, link_url: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
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
          {editing && (
            <label className="flex items-center gap-2 text-sm text-zinc-600">
              <input type="checkbox" checked={form.is_active} onChange={(e) => setForm({ ...form, is_active: e.target.checked })} className="accent-indigo-600" />
              Aktiv
            </label>
          )}
          <div className="flex gap-2 pt-2">
            <button onClick={save} disabled={saving} className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-4 py-2 text-xs text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all shadow-lg shadow-indigo-600/20">
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
                <th className="px-4 py-3 font-medium">Werbung</th>
                <th className="px-4 py-3 font-medium">Position</th>
                <th className="px-4 py-3 font-medium">Impressionen</th>
                <th className="px-4 py-3 font-medium">Klicks</th>
                <th className="px-4 py-3 font-medium">Status</th>
                <th className="px-4 py-3 w-24"></th>
              </tr>
            </thead>
            <tbody>
              {ads.map((a) => (
                <tr key={a.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 font-medium text-zinc-800">{a.name}</td>
                  <td className="px-4 py-3 text-xs text-zinc-400">{a.position}</td>
                  <td className="px-4 py-3 text-xs text-zinc-600">{a.impressions}</td>
                  <td className="px-4 py-3 text-xs text-zinc-600">{a.clicks}</td>
                  <td className="px-4 py-3">{a.is_active ? <span className="text-emerald-600 text-xs">Aktiv</span> : <span className="text-zinc-400 text-xs">Inaktiv</span>}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(a)} className="text-indigo-600 hover:text-indigo-700 text-xs">Bearbeiten</button>
                    <button onClick={() => remove(a.id)} className="text-red-500 hover:text-red-600 text-xs">Löschen</button>
                  </td>
                </tr>
              ))}
              {ads.length === 0 && <tr><td colSpan={6} className="px-4 py-8 text-center text-zinc-400">Noch keine Werbung vorhanden.</td></tr>}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
