"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"

type Product = {
  id: string
  name: string
  slug: string
  brand: string
  category: { name: string } | null
  created_at: string
}

export default function AdminProducts() {
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState("")
  const supabase = createClient()

  useEffect(() => { fetchProducts() }, [])

  async function fetchProducts() {
    setLoading(true)
    const { data } = await supabase
      .from("products")
      .select("id, name, slug, brand, created_at, category:categories(name)")
      .order("created_at", { ascending: false })
    if (data) setProducts(data as any)
    setLoading(false)
  }

  async function deleteProduct(id: string, name: string) {
    if (!confirm(`"${name}" silinsin mi?`)) return
    const { error } = await supabase.rpc("admin_delete_product", { p_id: id })
    if (error) alert("Hata: " + error.message)
    else fetchProducts()
  }

  const filtered = products.filter(p =>
    p.name.toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold">Ürünler</h1>
        <Link href="/admin/products/new" className="rounded-lg bg-blue-600 px-4 py-2 text-sm text-white hover:bg-blue-700">
          + Yeni Ürün
        </Link>
      </div>

      <input
        type="text"
        placeholder="Ürün ara..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="w-full max-w-md rounded-lg border px-3 py-2 text-sm mb-4"
      />

      {loading ? (
        <p className="text-zinc-500">Yükleniyor...</p>
      ) : (
        <div className="bg-white rounded-xl border overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-zinc-50 border-b">
              <tr className="text-left text-zinc-500">
                <th className="px-4 py-3 font-medium">Ürün</th>
                <th className="px-4 py-3 font-medium">Marka</th>
                <th className="px-4 py-3 font-medium">Kategori</th>
                <th className="px-4 py-3 font-medium">Eklenme</th>
                <th className="px-4 py-3 font-medium w-32"></th>
              </tr>
            </thead>
            <tbody>
              {filtered.map((p) => (
                <tr key={p.id} className="border-b hover:bg-zinc-50">
                  <td className="px-4 py-3 font-medium">{p.name}</td>
                  <td className="px-4 py-3 text-zinc-500">{p.brand}</td>
                  <td className="px-4 py-3 text-zinc-500">{p.category?.name || "-"}</td>
                  <td className="px-4 py-3 text-zinc-400 text-xs">{new Date(p.created_at).toLocaleDateString("de-CH")}</td>
                  <td className="px-4 py-3 flex gap-2">
                    <Link href={`/admin/products/${p.id}`} className="text-blue-600 hover:text-blue-800 text-xs">
                      Düzenle
                    </Link>
                    <button onClick={() => deleteProduct(p.id, p.name)} className="text-red-500 hover:text-red-700 text-xs">
                      Sil
                    </button>
                  </td>
                </tr>
              ))}
              {filtered.length === 0 && (
                <tr><td colSpan={5} className="px-4 py-8 text-center text-zinc-400">Ürün bulunamadı.</td></tr>
              )}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
