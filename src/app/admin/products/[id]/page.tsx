"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import { useParams, useRouter } from "next/navigation"

export default function EditProduct() {
  const params = useParams()
  const router = useRouter()
  const [form, setForm] = useState({ name: "", slug: "", description: "", image_url: "", category_id: "", ean: "", mpn: "", brand: "" })
  const [categories, setCategories] = useState<{ id: string; name: string }[]>([])
  const [products, setProducts] = useState<{ id: string; name: string }[]>([])
  const [variantOf, setVariantOf] = useState("")
  const [saving, setSaving] = useState(false)
  const [loading, setLoading] = useState(true)
  const supabase = createClient()

  useEffect(() => {
    Promise.all([
      supabase.from("categories").select("id, name").order("name"),
      supabase.from("products").select("*").eq("id", params.id).single(),
      supabase.from("products").select("id, name").neq("id", params.id).order("name"),
    ]).then(([catRes, prodRes, allRes]) => {
      if (catRes.data) setCategories(catRes.data)
      if (prodRes.data) {
        setForm({ name: prodRes.data.name, slug: prodRes.data.slug, description: prodRes.data.description || "", image_url: prodRes.data.image_url || "", category_id: prodRes.data.category_id || "", ean: prodRes.data.ean || "", mpn: prodRes.data.mpn || "", brand: prodRes.data.brand || "" })
        setVariantOf(prodRes.data.variant_of || "")
      }
      if (allRes.data) setProducts(allRes.data)
      setLoading(false)
    })
  }, [])

  async function save() {
    if (!form.name) return
    setSaving(true)
    const { error } = await supabase.rpc("admin_update_product", {
      p_id: params.id, p_name: form.name, p_slug: form.slug, p_description: form.description,
      p_image_url: form.image_url, p_category_id: form.category_id || null, p_ean: form.ean || null, p_mpn: form.mpn || null, p_brand: form.brand || null,
    })
    if (error) alert("Fehler: " + error.message)
    if (variantOf) await supabase.rpc("admin_set_variant", { p_product_id: params.id, p_variant_of: variantOf })
    else await supabase.rpc("admin_remove_variant", { p_product_id: params.id })
    if (!error) router.push("/admin/products")
    setSaving(false)
  }

  if (loading) return <p className="text-zinc-400">Wird geladen...</p>

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Produkt bearbeiten</h1>
      <div className="bg-white rounded-2xl border border-zinc-200 p-5 max-w-xl shadow-sm">
        <div className="space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Produktname</label>
              <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })}
                className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Marke</label>
              <input type="text" value={form.brand} onChange={(e) => setForm({ ...form, brand: e.target.value })}
                className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Kategorie</label>
              <select value={form.category_id} onChange={(e) => setForm({ ...form, category_id: e.target.value })}
                className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
                <option value="">Auswählen</option>
                {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
              </select>
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">Slug</label>
              <input type="text" value={form.slug} onChange={(e) => setForm({ ...form, slug: e.target.value })}
                className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 font-mono focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">EAN</label>
              <input type="text" value={form.ean} onChange={(e) => setForm({ ...form, ean: e.target.value })}
                className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
            <div>
              <label className="text-xs font-medium text-zinc-600 block mb-1">MPN</label>
              <input type="text" value={form.mpn} onChange={(e) => setForm({ ...form, mpn: e.target.value })}
                className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
            </div>
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Bild-URL</label>
            <input type="text" value={form.image_url} onChange={(e) => setForm({ ...form, image_url: e.target.value })}
              className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>
          <div>
            <label className="text-xs font-medium text-zinc-600 block mb-1">Beschreibung</label>
            <textarea value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} rows={3}
              className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300" />
          </div>

          <div className="border-t border-zinc-200 pt-4">
            <label className="text-xs font-medium text-zinc-600 block mb-1">Variant von (Hauptprodukt)</label>
            <select value={variantOf} onChange={(e) => setVariantOf(e.target.value)}
              className="w-full rounded-lg border border-zinc-300 bg-white px-3 py-2 text-sm text-zinc-800 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300">
              <option value="">Keine (Hauptprodukt)</option>
              {products.map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}
            </select>
            <p className="text-xs text-zinc-400 mt-1">Z.B. Xiaomi 15 Ultra {">"} Xiaomi 15 (Hauptprodukt)</p>
          </div>

          <div className="flex gap-3 pt-2">
            <button onClick={save} disabled={saving}
              className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-2 text-sm text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all shadow-md">
              {saving ? "..." : "Aktualisieren"}
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
