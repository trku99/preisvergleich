"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function GalaxusPage() {
  const [products, setProducts] = useState<any[]>([])
  const [search, setSearch] = useState("")
  const [results, setResults] = useState<any[]>([])
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [syncing, setSyncing] = useState(false)
  const supabase = createClient()

  useEffect(() => {
    supabase.from("products").select("id, name, brand, ean, galaxus_id, galaxus_price, galaxus_updated_at").order("name").then(({ data }) => {
      if (data) setProducts(data)
      setLoading(false)
    })
  }, [])

  async function searchGalaxus() {
    if (!search.trim()) return
    setResults([])
    setSelectedId(null)
    const res = await fetch(`/api/galaxus-search?q=${encodeURIComponent(search)}`)
    const json = await res.json()
    setResults(json.results || [])
  }

  async function linkProduct(productId: string, galaxusItem: any) {
    setSyncing(true)
    await fetch("/api/galaxus-sync", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        productId,
        galaxusId: galaxusItem.id,
        price: galaxusItem.price,
        currency: galaxusItem.currency,
        inStock: galaxusItem.inStock,
      }),
    })
    setSyncing(false)
    setResults([])
    setSearch("")
    const { data } = await supabase.from("products").select("id, name, brand, ean, galaxus_id, galaxus_price, galaxus_updated_at").order("name")
    if (data) setProducts(data)
  }

  if (loading) return <p className="text-zinc-400">Wird geladen...</p>

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Galaxus / Digitec Preis-Sync</h1>
      <p className="text-sm text-zinc-500 mb-6">Produkte mit echten Preisen von Galaxus.ch und Digitec.ch verknüpfen.</p>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Product List */}
        <div className="lg:col-span-2 bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-zinc-700 mb-3">Produkte ({products.length})</h2>
          <div className="space-y-2 max-h-[70vh] overflow-y-auto">
            {products.map((p) => (
              <div key={p.id} className="flex items-center justify-between p-3 rounded-xl hover:bg-zinc-50 transition-colors border border-transparent hover:border-zinc-200">
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-zinc-800 truncate">{p.name}</p>
                  <p className="text-xs text-zinc-400">{p.brand} {p.ean && `· EAN: ${p.ean}`}</p>
                </div>
                <div className="flex items-center gap-3 shrink-0">
                  {p.galaxus_price ? (
                    <span className="text-sm font-semibold text-green-600">CHF {p.galaxus_price}</span>
                  ) : (
                    <span className="text-xs text-zinc-300">—</span>
                  )}
                  {p.galaxus_id ? (
                    <a href={`https://www.galaxus.ch/product/${p.galaxus_id}`} target="_blank" className="text-xs text-indigo-500 hover:text-indigo-600">🔗</a>
                  ) : (
                    <button onClick={() => { setSelectedId(p.id); setSearch(p.name) }} className="text-xs text-indigo-600 hover:text-indigo-500">Verknüpfen</button>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Search Panel */}
        <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="text-sm font-semibold text-zinc-700 mb-3">Galaxus/Digitec Ara</h2>
          <div className="flex gap-2 mb-4">
            <input type="text" value={search} onChange={(e) => setSearch(e.target.value)}
              onKeyDown={(e) => e.key === "Enter" && searchGalaxus()}
              placeholder="Ürün adı veya EAN..."
              className="flex-1 rounded-lg border border-zinc-300 px-3 py-2 text-sm" />
            <button onClick={searchGalaxus} className="rounded-lg bg-indigo-600 px-4 py-2 text-sm text-white hover:bg-indigo-500">Ara</button>
          </div>
          <div className="space-y-2 max-h-[60vh] overflow-y-auto">
            {results.map((r: any) => (
              <div key={r.id} className="p-3 rounded-xl border border-zinc-200 hover:border-indigo-300 transition-colors">
                <div className="flex gap-3">
                  {r.image && <img src={r.image} alt="" className="w-12 h-12 rounded-lg object-contain bg-zinc-50" />}
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-zinc-800 truncate">{r.name}</p>
                    <p className="text-xs text-zinc-400">{r.brand}</p>
                    <p className="text-sm font-bold text-indigo-600 mt-1">CHF {r.price}</p>
                    {r.priceBefore && <p className="text-xs text-zinc-400 line-through">CHF {r.priceBefore}</p>}
                  </div>
                </div>
                {selectedId && (
                  <button onClick={() => linkProduct(selectedId, r)} disabled={syncing}
                    className="w-full mt-2 rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 py-1.5 text-xs text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50">
                    {syncing ? "..." : "Bu ürünü bağla"}
                  </button>
                )}
              </div>
            ))}
            {results.length === 0 && search && (
              <p className="text-sm text-zinc-400 text-center py-8">Sonuç bulunamadı</p>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
