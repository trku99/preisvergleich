"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type AdminAccount = { id: string; user_id: string; role: string; is_active: boolean; created_at: string }

export default function AdminAccounts() {
  const [accounts, setAccounts] = useState<AdminAccount[]>([])
  const [users, setUsers] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [form, setForm] = useState({ user_id: "", role: "admin" })
  const [editing, setEditing] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("admin_accounts").select("*").order("created_at", { ascending: false })
    if (data) setAccounts(data)
    const { data: profiles } = await supabase.from("user_profiles").select("*")
    if (profiles) setUsers(profiles)
    setLoading(false)
  }

  async function save() {
    if (!form.user_id) return
    setSaving(true)
    const fn = editing ? "admin_update_admin_account" : "admin_insert_admin_account"
    const args: any = editing
      ? { p_id: editing, p_role: form.role, p_is_active: true }
      : { p_user_id: form.user_id, p_role: form.role }
    const { error } = await supabase.rpc(fn, args)
    if (error) alert("Fehler: " + error.message)
    else { reset(); fetch() }
    setSaving(false)
  }

  async function remove(id: string) {
    if (!confirm("Wirklich löschen?")) return
    await supabase.rpc("admin_delete_admin_account", { p_id: id })
    fetch()
  }

  function edit(a: AdminAccount) {
    setEditing(a.id); setForm({ user_id: a.user_id, role: a.role })
  }

  function reset() { setEditing(null); setForm({ user_id: "", role: "admin" }) }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Administratoren</h1>

      <div className="bg-white rounded-2xl border border-zinc-200 p-5 mb-6 max-w-lg shadow-sm">
        <h2 className="font-medium text-zinc-800 mb-3 text-sm">{editing ? "Administrator bearbeiten" : "Neuer Administrator"}</h2>
        <div className="space-y-3">
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Benutzer</label>
            <select value={form.user_id} onChange={(e) => setForm({ ...form, user_id: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" disabled={!!editing}>
              <option value="">Auswählen...</option>
              {users.map((u) => <option key={u.id} value={u.id}>{u.name || u.id.slice(0, 12)}</option>)}
            </select>
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Rolle</label>
            <select value={form.role} onChange={(e) => setForm({ ...form, role: e.target.value })} className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-700 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
              <option value="admin">Admin</option>
              <option value="superadmin">Super-Admin</option>
            </select>
          </div>
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
                <th className="px-4 py-3 font-medium">Benutzer-ID</th>
                <th className="px-4 py-3 font-medium">Rolle</th>
                <th className="px-4 py-3 font-medium">Status</th>
                <th className="px-4 py-3 font-medium">Erstellt</th>
                <th className="px-4 py-3 w-24"></th>
              </tr>
            </thead>
            <tbody>
              {accounts.map((a) => (
                <tr key={a.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 font-mono text-xs text-zinc-600">{a.user_id.slice(0, 12)}...</td>
                  <td className="px-4 py-3 text-zinc-800 capitalize">{a.role}</td>
                  <td className="px-4 py-3">{a.is_active ? <span className="text-emerald-600 text-xs">Aktiv</span> : <span className="text-zinc-400 text-xs">Inaktiv</span>}</td>
                  <td className="px-4 py-3 text-xs text-zinc-400">{new Date(a.created_at).toLocaleDateString("de-CH")}</td>
                  <td className="px-4 py-3 space-x-2">
                    <button onClick={() => edit(a)} className="text-indigo-600 hover:text-indigo-700 text-xs">Bearbeiten</button>
                    <button onClick={() => remove(a.id)} className="text-red-500 hover:text-red-600 text-xs">Löschen</button>
                  </td>
                </tr>
              ))}
              {accounts.length === 0 && <tr><td colSpan={5} className="px-4 py-8 text-center text-zinc-400">Noch keine Administratoren vorhanden.</td></tr>}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
