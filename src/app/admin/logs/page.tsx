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
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Logs</h1>

      {loading ? <p className="text-zinc-400">Wird geladen...</p> : logs.length === 0 ? (
        <div className="bg-white rounded-2xl border border-zinc-200 p-8 text-center shadow-sm">
          <p className="text-zinc-400">Noch keine Logeinträge vorhanden.</p>
          <p className="text-xs text-zinc-300 mt-2">Das System zeichnet Aktivitäten automatisch auf.</p>
        </div>
      ) : (
        <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden shadow-sm">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-left text-zinc-400">
                <th className="px-4 py-3 font-medium">Zeit</th>
                <th className="px-4 py-3 font-medium">Aktion</th>
                <th className="px-4 py-3 font-medium">Typ</th>
                <th className="px-4 py-3 font-medium">Details</th>
              </tr>
            </thead>
            <tbody>
              {logs.map((l) => (
                <tr key={l.id} className="border-b border-zinc-100 hover:bg-zinc-50 text-xs transition-colors">
                  <td className="px-4 py-2 text-zinc-400">{new Date(l.created_at).toLocaleString("de-CH")}</td>
                  <td className="px-4 py-2 font-medium text-zinc-800">{l.action}</td>
                  <td className="px-4 py-2 text-zinc-400">{l.entity_type || "-"}</td>
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
