"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Page = { id: string; title: string; slug: string; content: string; meta_title: string; meta_description: string; is_published: boolean }

export default function AdminCms() {
  const [pages, setPages] = useState<Page[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ title: "", slug: "", content: "", meta_title: "", meta_description: "", is_published: false })
  const [editing, setEditing] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("cms_pages").select("*").order("created_at", { ascending: false })
    if (data) setPages(data)
    setLoading(false)
  }

  function slugify(t: string) { return t.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "") }

  async function save() {
    if (!form.title) return
    setSaving(true)
    const fn = editing ? "admin_update_cms_page" : "admin_insert_cms_page"
    const args: any = editing
      ? { p_id: editing, p_title: form.title, p_slug: form.slug, p_content: form.content, p_meta_title: form.meta_title, p_meta_description: form.meta_description, p_is_published: form.is_published }
      : { p_title: form.title, p_slug: form.slug, p_content: form.content, p_meta_title: form.meta_title, p_meta_description: form.meta_description }
    const { error } = await supabase.rpc(fn, args)
    if (error) alert("Hata: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Wirklich löschen?")) return
    await supabase.rpc("admin_delete_cms_page", { p_id: id })
    fetch()
  }

  function edit(p: Page) {
    setEditing(p.id); setForm({ title: p.title, slug: p.slug, content: p.content || "", meta_title: p.meta_title || "", meta_description: p.meta_description || "", is_published: p.is_published })
  }

  function reset() { setEditing(null); setForm({ title: "", slug: "", content: "", meta_title: "", meta_description: "", is_published: false }) }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Inhalte</h1>
      <div className="bg-white rounded-2xl border border-zinc-200 p-5 mb-6 max-w-lg shadow-sm">
        <h2 className="font-medium text-zinc-800 mb-3 text-sm">{editing ? "Seite bearbeiten" : "Neue Seite"}</h2>
        <div className="space-y-3">
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Seitentitel</label>
            <input type="text" value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value, slug: slugify(e.target.value) })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Inhalt (HTML)</label>
            <textarea value={form.content} onChange={(e) => setForm({ ...form, content: e.target.value })} rows={6} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 font-mono focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Meta-Titel</label>
              <input type="text" value={form.meta_title} onChange={(e) => setForm({ ...form, meta_title: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Meta-Beschreibung</label>
              <input type="text" value={form.meta_description} onChange={(e) => setForm({ ...form, meta_description: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
          </div>
          {editing && (
            <label className="flex items-center gap-2 text-sm text-zinc-600">
              <input type="checkbox" checked={form.is_published} onChange={(e) => setForm({ ...form, is_published: e.target.checked })} className="accent-indigo-600" />
              Veröffentlicht
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
                <th className="px-4 py-3 font-medium">Seite</th>
                <th className="px-4 py-3 font-medium">Slug</th>
                <th className="px-4 py-3 font-medium">Status</th>
                <th className="px-4 py-3 w-24"></th>
              </tr>
            </thead>
            <tbody>
              {pages.map((p) => (
                <tr key={p.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 font-medium text-zinc-800">{p.title}</td>
                  <td className="px-4 py-3 text-xs font-mono text-zinc-400">{p.slug}</td>
                  <td className="px-4 py-3">{p.is_published ? <span className="text-emerald-600 text-xs">Veröffentlicht</span> : <span className="text-zinc-400 text-xs">Entwurf</span>}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(p)} className="text-indigo-600 hover:text-indigo-700 text-xs">Bearbeiten</button>
                    <button onClick={() => remove(p.id)} className="text-red-500 hover:text-red-600 text-xs">Löschen</button>
                  </td>
                </tr>
              ))}
              {pages.length === 0 && <tr><td colSpan={4} className="px-4 py-8 text-center text-zinc-400">Noch keine Seiten vorhanden.</td></tr>}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
