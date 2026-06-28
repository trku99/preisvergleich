"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Shop = { id: string; name: string; slug: string; logo_url: string | null; base_url: string; is_active: boolean }

export default function AdminShops() {
  const [shops, setShops] = useState<Shop[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ name: "", slug: "", logo_url: "", base_url: "", is_active: true })
  const [editing, setEditing] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("shops").select("*").order("name")
    if (data) setShops(data)
    setLoading(false)
  }

  function slugify(text: string) { return text.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "") }

  async function save() {
    if (!form.name) return
    setSaving(true)
    const fn = editing ? "admin_update_shop" : "admin_insert_shop"
    const args: any = editing
      ? { p_id: editing, p_name: form.name, p_slug: form.slug, p_logo_url: form.logo_url, p_base_url: form.base_url, p_is_active: form.is_active }
      : { p_name: form.name, p_slug: form.slug, p_logo_url: form.logo_url, p_base_url: form.base_url }
    const { error } = await supabase.rpc(fn, args)
    if (error) alert("Hata: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Silinsin mi?")) return
    const { error } = await supabase.rpc("admin_delete_shop", { p_id: id })
    if (error) alert(error.message)
    else fetch()
  }

  function edit(s: Shop) {
    setEditing(s.id)
    setForm({ name: s.name, slug: s.slug, logo_url: s.logo_url || "", base_url: s.base_url, is_active: s.is_active })
  }

  function reset() { setEditing(null); setForm({ name: "", slug: "", logo_url: "", base_url: "", is_active: true }) }

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Mağazalar</h1>

      <div className="bg-white rounded-xl border p-4 mb-6 max-w-md">
        <h2 className="font-medium mb-3">{editing ? "Mağaza Düzenle" : "Yeni Mağaza"}</h2>
        <div className="space-y-3">
          <div>
            <label className="text-xs font-medium block mb-1">Mağaza Adı</label>
            <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value, slug: slugify(e.target.value) })} className="w-full rounded-lg border px-3 py-2 text-sm" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Slug</label>
            <input type="text" value={form.slug} onChange={(e) => setForm({ ...form, slug: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm font-mono" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Base URL</label>
            <input type="text" value={form.base_url} onChange={(e) => setForm({ ...form, base_url: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm" placeholder="https://www.example.ch" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Logo URL</label>
            <input type="text" value={form.logo_url} onChange={(e) => setForm({ ...form, logo_url: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm" />
          </div>
          {editing && (
            <label className="flex items-center gap-2 text-sm">
              <input type="checkbox" checked={form.is_active} onChange={(e) => setForm({ ...form, is_active: e.target.checked })} />
              Aktif
            </label>
          )}
          <div className="flex gap-2 pt-2">
            <button onClick={save} disabled={saving} className="rounded-lg bg-blue-600 px-4 py-2 text-xs text-white hover:bg-blue-700 disabled:opacity-50">
              {saving ? "..." : editing ? "Güncelle" : "Ekle"}
            </button>
            {editing && <button onClick={reset} className="rounded-lg border px-4 py-2 text-xs text-zinc-600">İptal</button>}
          </div>
        </div>
      </div>

      {loading ? <p className="text-zinc-500">Yükleniyor...</p> : (
        <div className="bg-white rounded-xl border overflow-hidden max-w-xl">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b">
              <tr className="text-left text-zinc-500">
                <th className="px-4 py-3 font-medium">Mağaza</th>
                <th className="px-4 py-3 font-medium">Slug</th>
                <th className="px-4 py-3 font-medium">Durum</th>
                <th className="px-4 py-3 font-medium w-24"></th>
              </tr>
            </thead>
            <tbody>
              {shops.map((s) => (
                <tr key={s.id} className="border-b hover:bg-zinc-50">
                  <td className="px-4 py-3 font-medium">{s.name}</td>
                  <td className="px-4 py-3 text-zinc-400 font-mono text-xs">{s.slug}</td>
                  <td className="px-4 py-3">{s.is_active ? <span className="text-green-600 text-xs">Aktif</span> : <span className="text-red-400 text-xs">Pasif</span>}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(s)} className="text-blue-600 text-xs">Düzenle</button>
                    <button onClick={() => remove(s.id)} className="text-red-500 text-xs">Sil</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
