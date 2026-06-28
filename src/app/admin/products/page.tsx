"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"

type Product = { id: string; name: string; slug: string; brand: string; category: { name: string } | null; created_at: string }

export default function AdminProducts() {
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState("")
  const supabase = createClient()

  useEffect(() => { fetchProducts() }, [])

  async function fetchProducts() {
    setLoading(true)
    const { data } = await supabase.from("products").select("id, name, slug, brand, created_at, category:categories(name)").order("created_at", { ascending: false })
    if (data) setProducts(data as any)
    setLoading(false)
  }

  async function deleteProduct(id: string, name: string) {
    if (!confirm(`"${name}" wirklich löschen?`)) return
    const { error } = await supabase.rpc("admin_delete_product", { p_id: id })
    if (error) alert("Fehler: " + error.message)
    else fetchProducts()
  }

  const filtered = products.filter(p => p.name.toLowerCase().includes(search.toLowerCase()))

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-zinc-800">Produkte</h1>
        <div className="flex gap-2">
          <Link href="/admin/products/import" className="rounded-lg border border-zinc-300 px-4 py-2 text-sm text-zinc-600 hover:bg-zinc-50 transition-all">
            📥 CSV Import
          </Link>
          <Link href="/admin/products/new" className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-4 py-2 text-sm text-white hover:from-indigo-500 hover:to-purple-500 transition-all shadow-md">
            + Neues Produkt
          </Link>
        </div>
      </div>

      <input type="text" placeholder="Produkte suchen..." value={search} onChange={(e) => setSearch(e.target.value)}
        className="w-full max-w-md rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 placeholder-zinc-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300 mb-4" />

      {loading ? (
        <p className="text-zinc-400">Wird geladen...</p>
      ) : (
        <div className="bg-white rounded-2xl border border-zinc-200 overflow-hidden shadow-sm">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-left text-zinc-400">
                <th className="px-4 py-3 font-medium">Produkt</th>
                <th className="px-4 py-3 font-medium">Marke</th>
                <th className="px-4 py-3 font-medium">Kategorie</th>
                <th className="px-4 py-3 font-medium">Hinzugefügt</th>
                <th className="px-4 py-3 font-medium w-32"></th>
              </tr>
            </thead>
            <tbody>
              {filtered.map((p) => (
                <tr key={p.id} className="border-b border-zinc-100 hover:bg-zinc-50 transition-colors">
                  <td className="px-4 py-3 font-medium text-zinc-800">{p.name}</td>
                  <td className="px-4 py-3 text-zinc-500">{p.brand}</td>
                  <td className="px-4 py-3 text-zinc-500">{p.category?.name || "-"}</td>
                  <td className="px-4 py-3 text-zinc-400 text-xs">{new Date(p.created_at).toLocaleDateString("de-CH")}</td>
                  <td className="px-4 py-3 flex gap-2">
                    <Link href={`/admin/products/${p.id}`} className="text-indigo-600 hover:text-zinc-700 text-xs">Bearbeiten</Link>
                    <button onClick={() => deleteProduct(p.id, p.name)} className="text-red-500 hover:text-red-400 text-xs">Löschen</button>
                  </td>
                </tr>
              ))}
              {filtered.length === 0 && <tr><td colSpan={5} className="px-4 py-8 text-center text-zinc-400">Keine Produkte gefunden.</td></tr>}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
