"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminUsers() {
  const [users, setUsers] = useState<any[]>([])
  const supabase = createClient()

  useEffect(() => {
    // Supabase Admin API requires service_role - show placeholder
    supabase.from("user_profiles").select("*").then(({ data }) => {
      if (data) setUsers(data)
    })
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Kullanıcılar</h1>
      <div className="bg-white rounded-xl border p-5">
        <p className="text-sm text-zinc-500 mb-4">Kullanıcı listesi Supabase Auth üzerinden yönetiliyor.</p>
        <a href="https://supabase.com/dashboard/project/nlsmkveoqnjvdfngbjla/auth/users" target="_blank" className="text-blue-600 text-sm hover:underline">
          Supabase Auth Users →
        </a>
      </div>
      {users.length > 0 && (
        <div className="bg-white rounded-xl border overflow-hidden mt-4">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b">
              <tr className="text-left text-zinc-500">
                <th className="px-4 py-3 font-medium">Kullanıcı</th>
                <th className="px-4 py-3 font-medium">Kayıt</th>
              </tr>
            </thead>
            <tbody>
              {users.map((u) => (
                <tr key={u.id} className="border-b">
                  <td className="px-4 py-3">{u.name || u.id.slice(0, 8)}</td>
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
