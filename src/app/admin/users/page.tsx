"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminUsers() {
  const [users, setUsers] = useState<any[]>([])
  const supabase = createClient()

  useEffect(() => {
    supabase.from("user_profiles").select("*").then(({ data }) => {
      if (data) setUsers(data)
    })
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Benutzer</h1>
      <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
        <p className="text-sm text-zinc-400 mb-4">Benutzerliste wird über Supabase Auth verwaltet.</p>
        <a href="https://supabase.com/dashboard/project/nlsmkveoqnjvdfngbjla/auth/users" target="_blank" className="text-indigo-600 text-sm hover:text-indigo-700 transition-colors">
          Supabase Auth Users →
        </a>
      </div>
      {users.length > 0 && (
        <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden mt-4 shadow-sm">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-left text-zinc-400">
                <th className="px-4 py-3 font-medium">Benutzer</th>
                <th className="px-4 py-3 font-medium">Erstellt</th>
              </tr>
            </thead>
            <tbody>
              {users.map((u) => (
                <tr key={u.id} className="border-b border-zinc-100 hover:bg-zinc-50">
                  <td className="px-4 py-3 text-zinc-800">{u.name || u.id.slice(0, 8)}</td>
                  <td className="px-4 py-3 text-xs text-zinc-400">{new Date(u.created_at).toLocaleDateString("de-CH")}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
