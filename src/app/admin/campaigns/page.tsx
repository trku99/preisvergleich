"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Campaign = {
  id: string
  title: string
  slug: string
  description: string
  discount_percent: number
  start_date: string
  end_date: string
  is_active: boolean
  banner_url: string
}

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
    if (!confirm("Silinsin mi?")) return
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
      <h1 className="text-2xl font-bold mb-6">Kampanyalar</h1>
      <div className="bg-white rounded-xl border p-4 mb-6 max-w-lg">
        <h2 className="font-medium mb-3">{editing ? "Kampanya Düzenle" : "Yeni Kampanya"}</h2>
        <div className="space-y-3">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Başlık</label>
              <input type="text" value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value, slug: slugify(e.target.value) })} className="w-full rounded border px-3 py-2 text-sm" />
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">İndirim %</label>
              <input type="number" value={form.discount_percent} onChange={(e) => setForm({ ...form, discount_percent: parseInt(e.target.value) || 0 })} className="w-full rounded border px-3 py-2 text-sm" />
            </div>
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Başlangıç</label>
              <input type="datetime-local" value={form.start_date} onChange={(e) => setForm({ ...form, start_date: e.target.value })} className="w-full rounded border px-3 py-2 text-sm" />
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">Bitiş</label>
              <input type="datetime-local" value={form.end_date} onChange={(e) => setForm({ ...form, end_date: e.target.value })} className="w-full rounded border px-3 py-2 text-sm" />
            </div>
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Açıklama</label>
            <textarea value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} rows={2} className="w-full rounded border px-3 py-2 text-sm" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Banner URL</label>
            <input type="text" value={form.banner_url} onChange={(e) => setForm({ ...form, banner_url: e.target.value })} className="w-full rounded border px-3 py-2 text-sm" />
          </div>
          {editing && (
            <label className="flex items-center gap-2 text-sm">
              <input type="checkbox" checked={form.is_active} onChange={(e) => setForm({ ...form, is_active: e.target.checked })} />
              Aktif
            </label>
          )}
          <div className="flex gap-2 pt-2">
            <button onClick={save} disabled={saving} className="rounded bg-blue-600 px-4 py-2 text-xs text-white hover:bg-blue-700 disabled:opacity-50">
              {saving ? "..." : editing ? "Güncelle" : "Ekle"}
            </button>
            {editing && <button onClick={reset} className="rounded border px-4 py-2 text-xs text-zinc-600">İptal</button>}
          </div>
        </div>
      </div>

      {loading ? <p className="text-zinc-500">Yükleniyor...</p> : (
        <div className="bg-white rounded-xl border overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b">
              <tr className="text-left text-zinc-500">
                <th className="px-4 py-3 font-medium">Kampanya</th>
                <th className="px-4 py-3 font-medium">İndirim</th>
                <th className="px-4 py-3 font-medium">Tarih</th>
                <th className="px-4 py-3 font-medium">Durum</th>
                <th className="px-4 py-3 w-24"></th>
              </tr>
            </thead>
            <tbody>
              {campaigns.map((c) => (
                <tr key={c.id} className="border-b hover:bg-zinc-50">
                  <td className="px-4 py-3 font-medium">{c.title}</td>
                  <td className="px-4 py-3 text-green-600 font-medium">%{c.discount_percent}</td>
                  <td className="px-4 py-3 text-xs text-zinc-400">
                    {c.start_date ? new Date(c.start_date).toLocaleDateString("de-CH") : "?"} - {c.end_date ? new Date(c.end_date).toLocaleDateString("de-CH") : "?"}
                  </td>
                  <td className="px-4 py-3">{c.is_active ? <span className="text-green-600 text-xs">Aktif</span> : <span className="text-zinc-400 text-xs">Pasif</span>}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(c)} className="text-blue-600 text-xs">Düzenle</button>
                    <button onClick={() => remove(c.id)} className="text-red-500 text-xs">Sil</button>
                  </td>
                </tr>
              ))}
              {campaigns.length === 0 && <tr><td colSpan={5} className="px-4 py-8 text-center text-zinc-400">Henüz kampanya yok.</td></tr>}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
