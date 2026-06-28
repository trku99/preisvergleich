"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Category = { id: string; name: string; slug: string; icon: string; parent_id: string | null }

export default function AdminCategories() {
  const [categories, setCategories] = useState<Category[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ name: "", slug: "", icon: "", parent_id: "" })
  const [editing, setEditing] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("categories").select("*").order("name")
    if (data) setCategories(data)
    setLoading(false)
  }

  function slugify(text: string) { return text.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "") }

  async function save() {
    if (!form.name) return
    setSaving(true)
    const fn = editing ? "admin_update_category" : "admin_insert_category"
    const args: any = editing
      ? { p_id: editing, p_name: form.name, p_slug: form.slug, p_icon: form.icon, p_parent_id: form.parent_id || null }
      : { p_name: form.name, p_slug: form.slug, p_icon: form.icon, p_parent_id: form.parent_id || null }
    const { error } = await supabase.rpc(fn, args)
    if (error) alert("Hata: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Silinsin mi?")) return
    const { error } = await supabase.rpc("admin_delete_category", { p_id: id })
    if (error) alert(error.message)
    else fetch()
  }

  function edit(c: Category) {
    setEditing(c.id)
    setForm({ name: c.name, slug: c.slug, icon: c.icon || "", parent_id: c.parent_id || "" })
  }

  function reset() { setEditing(null); setForm({ name: "", slug: "", icon: "", parent_id: "" }) }

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Kategoriler</h1>

      <div className="bg-white rounded-xl border p-4 mb-6 max-w-md">
        <h2 className="font-medium mb-3">{editing ? "Kategori Düzenle" : "Yeni Kategori"}</h2>
        <div className="space-y-3">
          <div>
            <label className="text-xs font-medium block mb-1">Ad</label>
            <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value, slug: slugify(e.target.value) })} className="w-full rounded-lg border px-3 py-2 text-sm" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Slug</label>
            <input type="text" value={form.slug} onChange={(e) => setForm({ ...form, slug: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm font-mono" />
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Icon</label>
              <input type="text" value={form.icon} onChange={(e) => setForm({ ...form, icon: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm" />
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">Üst Kategori</label>
              <select value={form.parent_id} onChange={(e) => setForm({ ...form, parent_id: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm">
                <option value="">Yok</option>
                {categories.filter((c) => c.id !== editing).map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
              </select>
            </div>
          </div>
          <div className="flex gap-2 pt-2">
            <button onClick={save} disabled={saving} className="rounded-lg bg-blue-600 px-4 py-2 text-xs text-white hover:bg-blue-700 disabled:opacity-50">
              {saving ? "..." : editing ? "Güncelle" : "Ekle"}
            </button>
            {editing && <button onClick={reset} className="rounded-lg border px-4 py-2 text-xs text-zinc-600">İptal</button>}
          </div>
        </div>
      </div>

      {loading ? <p className="text-zinc-500">Yükleniyor...</p> : (
        <div className="bg-white rounded-xl border overflow-hidden max-w-md">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b">
              <tr className="text-left text-zinc-500">
                <th className="px-4 py-3 font-medium">Kategori</th>
                <th className="px-4 py-3 font-medium">Slug</th>
                <th className="px-4 py-3 font-medium w-24"></th>
              </tr>
            </thead>
            <tbody>
              {categories.map((c) => (
                <tr key={c.id} className="border-b hover:bg-zinc-50">
                  <td className="px-4 py-3">{c.icon} {c.name}</td>
                  <td className="px-4 py-3 text-zinc-400 font-mono text-xs">{c.slug}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(c)} className="text-blue-600 text-xs">Düzenle</button>
                    <button onClick={() => remove(c.id)} className="text-red-500 text-xs">Sil</button>
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
