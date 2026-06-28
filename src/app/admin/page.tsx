"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import { useT } from "@/lib/i18n/LocaleProvider"

type ProductShopRow = {
  id: string
  product_id: string
  shop_id: string
  product_url: string
  product_slug: string
  product_name: string
  shop_name: string
}

export default function AdminPage() {
  const [user, setUser] = useState<any>(null)
  const [loading, setLoading] = useState(true)
  const [rows, setRows] = useState<ProductShopRow[]>([])
  const [saving, setSaving] = useState<Record<string, boolean>>({})
  const [message, setMessage] = useState("")
  const supabase = createClient()
  const { t } = useT()

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      setUser(data.user)
      if (data.user) fetchRows()
      else setLoading(false)
    })
  }, [])

  async function fetchRows() {
    setLoading(true)
    const { data } = await supabase
      .from("product_shops")
      .select(`id, product_id, shop_id, product_url, product:products!inner(slug, name), shop:shops!inner(name)`)
      .order("product_id")

    if (data) {
      const mapped: ProductShopRow[] = data.map((r: any) => ({
        id: r.id,
        product_id: r.product_id,
        shop_id: r.shop_id,
        product_url: r.product_url || "",
        product_slug: r.product?.slug || "",
        product_name: r.product?.name || "",
        shop_name: r.shop?.name || "",
      }))
      setRows(mapped.sort((a, b) => a.product_name.localeCompare(b.product_name)))
    }
    setLoading(false)
  }

  async function saveRow(id: string) {
    setSaving((prev) => ({ ...prev, [id]: true }))
    const row = rows.find((r) => r.id === id)
    if (!row) return

    const { error } = await supabase
      .from("product_shops")
      .update({ product_url: row.product_url })
      .eq("id", id)

    if (error) setMessage(`Fehler: ${error.message}`)
    else setMessage("Gespeichert!")
    setSaving((prev) => ({ ...prev, [id]: false }))
    setTimeout(() => setMessage(""), 3000)
  }

  function updateUrl(id: string, url: string) {
    setRows((prev) => prev.map((r) => (r.id === id ? { ...r, product_url: url } : r)))
  }

  if (!user) {
    return (
      <div className="mx-auto max-w-7xl px-4 py-20 text-center">
        <h1 className="text-2xl font-bold mb-4">Admin</h1>
        <p className="text-zinc-500 mb-6">Bitte anmelden, um URLs zu verwalten.</p>
        <button
          onClick={() => supabase.auth.signInWithOAuth({ provider: "google", options: { redirectTo: `${location.origin}/auth/callback` } })}
          className="rounded-lg bg-blue-600 px-6 py-2 text-white text-sm font-medium hover:bg-blue-700"
        >
          {t("nav.anmelden")}
        </button>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-8">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold">Admin – Produkt-URLs</h1>
        {message && <span className="text-sm text-green-600">{message}</span>}
      </div>

      {loading ? (
        <p className="text-zinc-500">Lade...</p>
      ) : (
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b text-left text-zinc-500">
                <th className="pb-2 pr-4">Produkt</th>
                <th className="pb-2 pr-4">Shop</th>
                <th className="pb-2 pr-4">URL</th>
                <th className="pb-2 w-20"></th>
              </tr>
            </thead>
            <tbody>
              {rows.map((row) => (
                <tr key={row.id} className="border-b hover:bg-zinc-50">
                  <td className="py-2 pr-4 text-zinc-900">{row.product_name}</td>
                  <td className="py-2 pr-4 text-zinc-600">{row.shop_name}</td>
                  <td className="py-2 pr-4">
                    <input
                      type="text"
                      value={row.product_url}
                      onChange={(e) => updateUrl(row.id, e.target.value)}
                      className="w-full rounded border px-2 py-1 text-xs font-mono"
                    />
                  </td>
                  <td className="py-2">
                    <button
                      onClick={() => saveRow(row.id)}
                      disabled={saving[row.id]}
                      className="rounded bg-blue-600 px-3 py-1 text-xs text-white hover:bg-blue-700 disabled:opacity-50"
                    >
                      {saving[row.id] ? "..." : "Save"}
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
