"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

type Review = { id: string; product_id: string; user_id: string; rating: number; title: string; comment: string; is_approved: boolean; created_at: string; products?: { name: string } }

export default function AdminReviews() {
  const [reviews, setReviews] = useState<Review[]>([])
  const [loading, setLoading] = useState(true)
  const supabase = createClient()

  useEffect(() => { fetch() }, [])

  async function fetch() {
    const { data } = await supabase.from("product_reviews").select("*, products(name)").order("created_at", { ascending: false })
    if (data) setReviews(data)
    setLoading(false)
  }

  async function toggleApproval(id: string, approved: boolean) {
    const { error } = await supabase.rpc("admin_update_review", { p_id: id, p_is_approved: approved })
    if (error) alert("Fehler: " + error.message)
    else fetch()
  }

  async function remove(id: string) {
    if (!confirm("Bewertung löschen?")) return
    await supabase.rpc("admin_delete_review", { p_id: id })
    fetch()
  }

  function Stars({ n }: { n: number }) {
    return <span className="text-amber-600">{Array(n).fill("★").join("")}{Array(5 - n).fill("☆").join("")}</span>
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Bewertungen</h1>

      {loading ? <p className="text-zinc-400">Wird geladen...</p> : (
        <div className="space-y-4">
          {reviews.map((r) => (
            <div key={r.id} className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm transition-all duration-300 hover:border-zinc-300">
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <div className="flex items-center gap-2 mb-1">
                    <Stars n={r.rating} />
                    <span className="text-xs text-zinc-400">{new Date(r.created_at).toLocaleDateString("de-CH")}</span>
                  </div>
                  <p className="font-medium text-sm text-zinc-800">{r.title || "Ohne Titel"}</p>
                  <p className="text-xs text-zinc-400 mb-1">{(r as any).products?.name || "—"}</p>
                  {r.comment && <p className="text-sm text-zinc-600 mt-1">{r.comment}</p>}
                  <p className="text-xs text-zinc-300 mt-2">Benutzer: {r.user_id.slice(0, 12)}...</p>
                </div>
                <div className="flex items-center gap-2 shrink-0 ml-4">
                  <span className={`text-xs px-2 py-1 rounded-full ${r.is_approved ? "bg-emerald-50 text-emerald-600" : "bg-amber-50 text-amber-600"}`}>
                    {r.is_approved ? "Genehmigt" : "Ausstehend"}
                  </span>
                  {!r.is_approved && (
                    <button onClick={() => toggleApproval(r.id, true)} className="text-xs text-emerald-600 hover:text-emerald-700">Genehmigen</button>
                  )}
                  {r.is_approved && (
                    <button onClick={() => toggleApproval(r.id, false)} className="text-xs text-amber-600 hover:text-amber-700">Ablehnen</button>
                  )}
                  <button onClick={() => remove(r.id)} className="text-xs text-red-500 hover:text-red-600">Löschen</button>
                </div>
              </div>
            </div>
          ))}
          {reviews.length === 0 && <p className="text-zinc-400 text-center py-8">Noch keine Bewertungen vorhanden.</p>}
        </div>
      )}
    </div>
  )
}
