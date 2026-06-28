"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Notification = { id: string; user_id: string | null; type: string; title: string; message: string; link: string; is_read: boolean; created_at: string }

export default function AdminNotifications() {
  const [notifications, setNotifications] = useState<Notification[]>([])
  const [users, setUsers] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ user_id: "", type: "system", title: "", message: "", link: "" })
  const [saving, setSaving] = useState(false)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("notifications").select("*").order("created_at", { ascending: false })
    if (data) setNotifications(data)
    const { data: profiles } = await supabase.from("user_profiles").select("*")
    if (profiles) setUsers(profiles)
    setLoading(false)
  }

  async function save() {
    if (!form.title) return
    setSaving(true)
    const args = { p_user_id: form.user_id || null, p_type: form.type, p_title: form.title, p_message: form.message || null, p_link: form.link || null }
    const { error } = await supabase.rpc("admin_insert_notification", args)
    if (error) alert("Fehler: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Benachrichtigung löschen?")) return
    await supabase.rpc("admin_delete_notification", { p_id: id })
    fetch()
  }

  function reset() { setForm({ user_id: "", type: "system", title: "", message: "", link: "" }) }

  const types = ["system", "price_alert", "campaign", "promotion", "info"]

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Benachrichtigungen</h1>

      <div className="bg-white rounded-2xl border border-zinc-200 p-5 mb-6 max-w-lg shadow-sm">
        <h2 className="font-medium text-zinc-800 mb-3 text-sm">Neue Benachrichtigung</h2>
        <div className="space-y-3">
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Benutzer (leer = alle)</label>
            <select value={form.user_id} onChange={(e) => setForm({ ...form, user_id: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
              <option value="">Alle Benutzer</option>
              {users.map((u) => <option key={u.id} value={u.id}>{u.name || u.id.slice(0, 12)}</option>)}
            </select>
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Typ</label>
              <select value={form.type} onChange={(e) => setForm({ ...form, type: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
                {types.map((t) => <option key={t} value={t}>{t}</option>)}
              </select>
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Link</label>
              <input type="text" value={form.link} onChange={(e) => setForm({ ...form, link: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Titel</label>
            <input type="text" value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Nachricht</label>
            <textarea value={form.message} onChange={(e) => setForm({ ...form, message: e.target.value })} rows={3} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div className="flex gap-2 pt-2">
            <button onClick={save} disabled={saving} className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-4 py-2 text-xs text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all shadow-lg shadow-indigo-600/20">
              {saving ? "..." : "Senden"}
            </button>
          </div>
        </div>
      </div>

      {loading ? <p className="text-zinc-400">Wird geladen...</p> : (
        <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden shadow-sm">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-left text-zinc-400">
                <th className="px-4 py-3 font-medium">Titel</th>
                <th className="px-4 py-3 font-medium">Typ</th>
                <th className="px-4 py-3 font-medium">Benutzer</th>
                <th className="px-4 py-3 font-medium">Status</th>
                <th className="px-4 py-3 font-medium">Datum</th>
                <th className="px-4 py-3 w-20"></th>
              </tr>
            </thead>
            <tbody>
              {notifications.map((n) => (
                <tr key={n.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 font-medium text-zinc-800">{n.title}</td>
                  <td className="px-4 py-3 text-xs text-zinc-600">{n.type}</td>
                  <td className="px-4 py-3 text-xs font-mono text-zinc-400">{n.user_id ? n.user_id.slice(0, 12) + "..." : "Alle"}</td>
                  <td className="px-4 py-3">{n.is_read ? <span className="text-zinc-400 text-xs">Gelesen</span> : <span className="text-indigo-600 text-xs">Ungelesen</span>}</td>
                  <td className="px-4 py-3 text-xs text-zinc-400">{new Date(n.created_at).toLocaleDateString("de-CH")}</td>
                  <td className="px-4 py-3">
                    <button onClick={() => remove(n.id)} className="text-red-500 hover:text-red-600 text-xs">Löschen</button>
                  </td>
                </tr>
              ))}
              {notifications.length === 0 && <tr><td colSpan={6} className="px-4 py-8 text-center text-zinc-400">Noch keine Benachrichtigungen vorhanden.</td></tr>}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
