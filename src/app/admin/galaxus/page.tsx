"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export default function GalaxusPage() {
  const [products, setProducts] = useState<any[]>([])
  const [search, setSearch] = useState("")
  const [filtered, setFiltered] = useState<any[]>([])
  const [saving, setSaving] = useState<string | null>(null)
  const supabase = createClient()

  useEffect(() => {
    supabase.from("products").select("id, name, brand, ean, galaxus_id, galaxus_price, galaxus_currency, galaxus_updated_at").order("name").then(({ data }) => {
      if (data) setProducts(data)
    })
  }, [])

  useEffect(() => {
    if (!search.trim()) { setFiltered(products); return }
    const q = search.toLowerCase()
    setFiltered(products.filter(p => p.name.toLowerCase().includes(q) || p.brand?.toLowerCase().includes(q) || p.ean?.includes(q)))
  }, [search, products])

  async function saveRealPrice(productId: string, price: string, url: string) {
    const p = parseFloat(price)
    if (isNaN(p) || p <= 0) return
    setSaving(productId)
    await supabase.from("products").update({
      galaxus_id: url || null,
      galaxus_price: p,
      galaxus_currency: "CHF",
      galaxus_in_stock: true,
      galaxus_updated_at: new Date().toISOString(),
    }).eq("id", productId)
    setSaving(null)
    const { data } = await supabase.from("products").select("id, name, brand, ean, galaxus_id, galaxus_price, galaxus_currency, galaxus_updated_at").order("name")
    if (data) setProducts(data)
  }

  async function removePrice(productId: string) {
    setSaving(productId)
    await supabase.from("products").update({
      galaxus_id: null,
      galaxus_price: null,
      galaxus_currency: null,
      galaxus_in_stock: false,
      galaxus_updated_at: null,
    }).eq("id", productId)
    setSaving(null)
    const { data } = await supabase.from("products").select("id, name, brand, ean, galaxus_id, galaxus_price, galaxus_currency, galaxus_updated_at").order("name")
    if (data) setProducts(data)
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-2">Gerçek Fiyat Yönetimi</h1>
      <p className="text-sm text-zinc-500 mb-6">
        Toppreise.ch'de ürünü ara, fiyatı ve URL'i kopyala, aşağıya yapıştır.
      </p>

      <div className="mb-4">
        <input type="text" value={search} onChange={(e) => setSearch(e.target.value)}
          placeholder="Ürün ara..."
          className="w-full max-w-md rounded-lg border border-zinc-300 px-4 py-2 text-sm" />
      </div>

      <div className="bg-white rounded-2xl border border-zinc-200 shadow-sm overflow-hidden">
        <div className="divide-y divide-zinc-100">
          {filtered.map((p) => (
            <div key={p.id} className="p-4 flex items-center gap-4 hover:bg-zinc-50 transition-colors">
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-zinc-800 truncate">{p.name}</p>
                <p className="text-xs text-zinc-400">{p.brand} {p.ean && `· EAN: ${p.ean}`}</p>
              </div>

              {p.galaxus_price ? (
                <div className="flex items-center gap-3 shrink-0">
                  <div className="text-right">
                    <p className="text-sm font-bold text-green-600">CHF {p.galaxus_price}</p>
                    {p.galaxus_id && <a href={p.galaxus_id} target="_blank" className="text-xs text-indigo-500 hover:text-indigo-600 block">🔗 Toppreise</a>}
                  </div>
                  <button onClick={() => removePrice(p.id)} disabled={saving === p.id}
                    className="text-xs text-red-500 hover:text-red-700 px-2 py-1 rounded border border-red-200 hover:border-red-300">
                    Kaldır
                  </button>
                </div>
              ) : (
                <RealPriceForm productId={p.id} onSave={saveRealPrice} saving={saving === p.id} />
              )}
            </div>
          ))}
          {filtered.length === 0 && (
            <p className="text-sm text-zinc-400 text-center py-8">Ürün bulunamadı</p>
          )}
        </div>
      </div>
    </div>
  )
}

function RealPriceForm({ productId, onSave, saving }: { productId: string; onSave: (id: string, price: string, url: string) => void; saving: boolean }) {
  const [price, setPrice] = useState("")
  const [url, setUrl] = useState("")

  return (
    <div className="flex items-center gap-2 shrink-0">
      <input type="number" step="0.05" value={price} onChange={(e) => setPrice(e.target.value)}
        placeholder="CHF"
        className="w-20 rounded-lg border border-zinc-300 px-2 py-1.5 text-sm text-right" />
      <input type="text" value={url} onChange={(e) => setUrl(e.target.value)}
        placeholder="Toppreise URL"
        className="w-48 rounded-lg border border-zinc-300 px-2 py-1.5 text-xs" />
      <button onClick={() => onSave(productId, price, url)} disabled={saving || !price}
        className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs text-white hover:bg-indigo-500 disabled:opacity-50 shrink-0">
        {saving ? "..." : "Kaydet"}
      </button>
    </div>
  )
}
