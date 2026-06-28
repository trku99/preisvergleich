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
    if (error) alert("Fehler: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Wirklich löschen?")) return
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
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Kategorien</h1>

      <div className="bg-white rounded-2xl border border-zinc-200 p-5 mb-6 max-w-md shadow-sm">
        <h2 className="font-medium text-zinc-800 mb-3 text-sm">{editing ? "Kategorie bearbeiten" : "Neue Kategorie"}</h2>
        <div className="space-y-3">
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Name</label>
            <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value, slug: slugify(e.target.value) })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 placeholder-zinc-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Slug</label>
            <input type="text" value={form.slug} onChange={(e) => setForm({ ...form, slug: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 font-mono focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Icon</label>
              <input type="text" value={form.icon} onChange={(e) => setForm({ ...form, icon: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Übergeordnete Kategorie</label>
              <select value={form.parent_id} onChange={(e) => setForm({ ...form, parent_id: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
                <option value="">Keine</option>
                {categories.filter((c) => c.id !== editing).map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
              </select>
            </div>
          </div>
          <div className="flex gap-2 pt-2">
            <button onClick={save} disabled={saving} className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-4 py-2 text-xs text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all duration-200 shadow-lg shadow-indigo-600/20">
              {saving ? "..." : editing ? "Aktualisieren" : "Hinzufügen"}
            </button>
            {editing && <button onClick={reset} className="rounded-lg border border-zinc-300 px-4 py-2 text-xs text-zinc-500 hover:text-zinc-700">Abbrechen</button>}
          </div>
        </div>
      </div>

      {loading ? <p className="text-zinc-400">Wird geladen...</p> : (
        <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden max-w-md shadow-sm">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-left text-zinc-400">
                <th className="px-4 py-3 font-medium">Kategorie</th>
                <th className="px-4 py-3 font-medium">Slug</th>
                <th className="px-4 py-3 font-medium w-24"></th>
              </tr>
            </thead>
            <tbody>
              {categories.map((c) => (
                <tr key={c.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 text-zinc-800">{c.icon} {c.name}</td>
                  <td className="px-4 py-3 text-zinc-400 font-mono text-xs">{c.slug}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(c)} className="text-indigo-600 hover:text-zinc-700 text-xs">Bearbeiten</button>
                    <button onClick={() => remove(c.id)} className="text-red-500 hover:text-red-400 text-xs">Löschen</button>
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
