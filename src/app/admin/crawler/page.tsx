"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type FeedSource = { id: string; shop_id: string; name: string; feed_url: string; feed_type: string; last_fetched_at: string | null; last_status: string | null; last_error: string | null; is_active: boolean; shops: { name: string; slug: string } | null }
type ImportLog = { id: string; status: string; products_found: number; products_imported: number; products_updated: number; error_message: string | null; started_at: string; finished_at: string }

export default function AdminCrawler() {
  const [feeds, setFeeds] = useState<FeedSource[]>([])
  const [shops, setShops] = useState<{ id: string; name: string }[]>([])
  const [logs, setLogs] = useState<ImportLog[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ shop_id: "", name: "", feed_url: "", feed_type: "xml", is_active: true })
  const [editing, setEditing] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [importing, setImporting] = useState<string | null>(null)
  const [logFeedId, setLogFeedId] = useState<string | null>(null)
  const supabase = createClient()

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    const [feedRes, shopRes] = await Promise.all([
      supabase.from("feed_sources").select("*, shops(name, slug)").order("created_at", { ascending: false }),
      supabase.from("shops").select("id, name").order("name"),
    ])
    if (feedRes.data) setFeeds(feedRes.data)
    if (shopRes.data) setShops(shopRes.data)
    setLoading(false)
  }

  async function fetchLogs(feedId: string) {
    setLogFeedId(logFeedId === feedId ? null : feedId)
    if (logFeedId === feedId) return
    const { data } = await supabase.from("feed_import_logs").select("*").eq("feed_source_id", feedId).order("started_at", { ascending: false }).limit(20)
    if (data) setLogs(data)
  }

  async function save() {
    if (!form.name || !form.feed_url) return
    setSaving(true)
    const fn = editing ? "admin_update_feed_source" : "admin_insert_feed_source"
    const args: any = editing
      ? { p_id: editing, p_shop_id: form.shop_id, p_name: form.name, p_feed_url: form.feed_url, p_feed_type: form.feed_type, p_is_active: form.is_active }
      : { p_shop_id: form.shop_id, p_name: form.name, p_feed_url: form.feed_url, p_feed_type: form.feed_type }
    const { error } = await supabase.rpc(fn, args)
    if (error) alert("Hata: " + error.message)
    else { reset(); fetchAll() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Feed-Quelle löschen?")) return
    await supabase.rpc("admin_delete_feed_source", { p_id: id })
    fetchAll()
  }

  async function triggerImport(feedId: string) {
    setImporting(feedId)
    try {
      const res = await fetch("/api/admin/import-feed", {
        method: "POST", headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ feed_id: feedId }),
      })
      const data = await res.json()
      if (!res.ok) alert("Hata: " + (data.error || "Bilinmeyen hata"))
    } catch (err: any) {
      alert("İstek başarısız: " + err.message)
    }
    setImporting(null)
    fetchAll()
  }

  function edit(f: FeedSource) {
    setEditing(f.id)
    setForm({ shop_id: f.shop_id, name: f.name, feed_url: f.feed_url, feed_type: f.feed_type, is_active: f.is_active })
  }

  function reset() { setEditing(null); setForm({ shop_id: "", name: "", feed_url: "", feed_type: "xml", is_active: true }) }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Datenabruf</h1>

      <div className="bg-white rounded-2xl border border-zinc-200 p-5 mb-6 max-w-2xl shadow-sm">
        <h2 className="font-medium text-zinc-800 mb-3 text-sm">{editing ? "Feed-Quelle bearbeiten" : "Neue Feed-Quelle"}</h2>
        <div className="space-y-3">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Geschäft</label>
              <select value={form.shop_id} onChange={(e) => setForm({ ...form, shop_id: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
                <option value="">Auswählen</option>
                {shops.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
              </select>
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Feed-Typ</label>
              <select value={form.feed_type} onChange={(e) => setForm({ ...form, feed_type: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
                <option value="xml">XML (Google Shopping)</option>
                <option value="csv">CSV</option>
              </select>
            </div>
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Quellname</label>
            <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" placeholder="Interdiscount XML Feed" />
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Feed-URL</label>
            <input type="text" value={form.feed_url} onChange={(e) => setForm({ ...form, feed_url: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 font-mono focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" placeholder="https://www.example.ch/feed.xml" />
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
        <div className="space-y-4">
          {feeds.length === 0 && (
            <div className="bg-white rounded-2xl border border-zinc-200 p-8 text-center text-zinc-400">
              Noch keine Feed-Quellen vorhanden.
            </div>
          )}

          {feeds.map((feed) => (
            <div key={feed.id} className="bg-white rounded-2xl border border-zinc-200 overflow-hidden shadow-sm">
              <div className="p-4 flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <span className={`w-2 h-2 rounded-full ${feed.is_active ? "bg-emerald-500" : "bg-zinc-300"}`} />
                  <div>
                    <div className="font-medium text-sm text-zinc-800">{feed.name}</div>
                    <div className="text-xs text-zinc-400">{feed.shops?.name || "?"} · {feed.feed_type.toUpperCase()}</div>
                  </div>
                </div>
                <div className="flex items-center gap-2">
                  <span className={`text-xs px-2 py-0.5 rounded-full ${
                    feed.last_status === "success" ? "bg-emerald-50 text-emerald-600" :
                    feed.last_status === "error" ? "bg-red-50 text-red-500" :
                    feed.last_status === "running" ? "bg-blue-500/10 text-blue-400" :
                    "bg-zinc-100 text-zinc-400"
                  }`}>
                    {feed.last_status || "Ausstehend"}
                  </span>
                  <button onClick={() => triggerImport(feed.id)} disabled={importing === feed.id}
                    className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-3 py-1.5 text-xs text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all shadow-md">
                    {importing === feed.id ? "..." : "Abrufen"}
                  </button>
                  <button onClick={() => edit(feed)} className="text-indigo-600 hover:text-indigo-700 text-xs">Bearbeiten</button>
                  <button onClick={() => remove(feed.id)} className="text-red-500 hover:text-red-600 text-xs">Löschen</button>
                  <button onClick={() => fetchLogs(feed.id)} className="text-zinc-400 hover:text-zinc-700 text-xs">
                    {logFeedId === feed.id ? "Ausblenden" : "Logs"}
                  </button>
                </div>
              </div>

              {logFeedId === feed.id && (
                <div className="border-t border-zinc-200 p-3 bg-zinc-50">
                  {logs.length === 0 ? (
                    <p className="text-xs text-zinc-400">Noch keine Import-Logs vorhanden.</p>
                  ) : (
                    <div className="space-y-1 max-h-48 overflow-y-auto">
                      {logs.map((l) => (
                        <div key={l.id} className="flex items-center justify-between text-xs rounded-lg px-2 py-1.5 border border-zinc-200 bg-zinc-50">
                          <div className="flex items-center gap-2 text-zinc-600">
                            <span className={`w-1.5 h-1.5 rounded-full ${l.status === "success" ? "bg-emerald-500" : "bg-red-500"}`} />
                            <span>{new Date(l.started_at).toLocaleString("de-CH")}</span>
                          </div>
                          <div className="text-zinc-400">
                            {l.products_found} found · {l.products_imported} new · {l.products_updated} updated
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              )}
            </div>
          ))}
        </div>
      )}

      <div className="rounded-2xl border border-amber-200 p-4 mt-6 bg-amber-50">
        <p className="text-sm text-amber-700">
          ⚡ Für den Feed-Import wird ein API-Route benötigt. Für automatische Abrufe können GitHub Actions oder Cron-Jobs verwendet werden.
        </p>
      </div>
    </div>
  )
}
