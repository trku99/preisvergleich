"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function AdminLogs() {
  const [logs, setLogs] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const supabase = createClient()

  useEffect(() => {
    supabase.from("activity_logs").select("*").order("created_at", { ascending: false }).limit(100).then(({ data }) => {
      if (data) setLogs(data)
      setLoading(false)
    })
  }, [])

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Loglar</h1>

      {loading ? <p className="text-zinc-500">Yükleniyor...</p> : logs.length === 0 ? (
        <div className="bg-white rounded-xl border p-8 text-center">
          <p className="text-zinc-400">Henüz log kaydı yok.</p>
          <p className="text-xs text-zinc-300 mt-2">Sistem otomatik olarak aktiviteleri kaydedecek.</p>
        </div>
      ) : (
        <div className="bg-white rounded-xl border overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b">
              <tr className="text-left text-zinc-500">
                <th className="px-4 py-3 font-medium">Zaman</th>
                <th className="px-4 py-3 font-medium">İşlem</th>
                <th className="px-4 py-3 font-medium">Tip</th>
                <th className="px-4 py-3 font-medium">Detay</th>
              </tr>
            </thead>
            <tbody>
              {logs.map((l) => (
                <tr key={l.id} className="border-b hover:bg-zinc-50 text-xs">
                  <td className="px-4 py-2 text-zinc-400">{new Date(l.created_at).toLocaleString("de-CH")}</td>
                  <td className="px-4 py-2 font-medium">{l.action}</td>
                  <td className="px-4 py-2 text-zinc-500">{l.entity_type || "-"}</td>
                  <td className="px-4 py-2 text-zinc-400 max-w-xs truncate">{l.details ? JSON.stringify(l.details) : "-"}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
