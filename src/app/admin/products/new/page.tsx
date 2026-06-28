"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import { useRouter } from "next/navigation"

export default function NewProduct() {
  const [form, setForm] = useState({ name: "", slug: "", description: "", image_url: "", brand: "", ean: "", mpn: "", category_id: "" })
  const [categories, setCategories] = useState<{ id: string; name: string }[]>([])
  const [saving, setSaving] = useState(false)
  const supabase = createClient()
  const router = useRouter()

  useEffect(() => {
    supabase.from("categories").select("id, name").then(({ data }) => {
      if (data) setCategories(data)
    })
  }, [])

  function slugify(text: string) {
    return text.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "")
  }

  function updateName(name: string) {
    setForm({ ...form, name, slug: slugify(name) })
  }

  async function save() {
    if (!form.name || !form.slug) return alert("İsim gerekli.")
    setSaving(true)
    const { error } = await supabase.rpc("admin_insert_product", {
      p_name: form.name, p_slug: form.slug, p_description: form.description,
      p_image_url: form.image_url, p_category_id: form.category_id || null,
      p_ean: form.ean, p_mpn: form.mpn, p_brand: form.brand,
    })
    if (error) alert("Hata: " + error.message)
    else router.push("/admin/products")
    setSaving(false)
  }

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Yeni Ürün</h1>
      <div className="max-w-xl space-y-4">
        <div>
          <label className="text-sm font-medium block mb-1">Ürün Adı</label>
          <input type="text" value={form.name} onChange={(e) => updateName(e.target.value)} className="w-full rounded-lg border px-3 py-2 text-sm" />
        </div>
        <div>
          <label className="text-sm font-medium block mb-1">Slug</label>
          <input type="text" value={form.slug} onChange={(e) => setForm({ ...form, slug: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm font-mono" />
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="text-sm font-medium block mb-1">Marka</label>
            <input type="text" value={form.brand} onChange={(e) => setForm({ ...form, brand: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm" />
          </div>
          <div>
            <label className="text-sm font-medium block mb-1">Kategori</label>
            <select value={form.category_id} onChange={(e) => setForm({ ...form, category_id: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm">
              <option value="">Seçiniz</option>
              {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select>
          </div>
        </div>
        <div>
          <label className="text-sm font-medium block mb-1">Açıklama</label>
          <textarea value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} rows={3} className="w-full rounded-lg border px-3 py-2 text-sm" />
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="text-sm font-medium block mb-1">EAN</label>
            <input type="text" value={form.ean} onChange={(e) => setForm({ ...form, ean: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm" />
          </div>
          <div>
            <label className="text-sm font-medium block mb-1">MPN</label>
            <input type="text" value={form.mpn} onChange={(e) => setForm({ ...form, mpn: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm" />
          </div>
        </div>
        <div>
          <label className="text-sm font-medium block mb-1">Görsel URL</label>
          <input type="text" value={form.image_url} onChange={(e) => setForm({ ...form, image_url: e.target.value })} className="w-full rounded-lg border px-3 py-2 text-sm" />
        </div>
        <div className="flex gap-3 pt-4">
          <button onClick={save} disabled={saving} className="rounded-lg bg-blue-600 px-6 py-2 text-sm text-white hover:bg-blue-700 disabled:opacity-50">
            {saving ? "Kaydediliyor..." : "Kaydet"}
          </button>
          <button onClick={() => router.back()} className="rounded-lg border px-6 py-2 text-sm text-zinc-600 hover:bg-zinc-50">
            İptal
          </button>
        </div>
      </div>
    </div>
  )
}
