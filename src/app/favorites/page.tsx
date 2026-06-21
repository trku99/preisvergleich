"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"
import { useT } from "@/lib/i18n/LocaleProvider"

export default function FavoritesPage() {
  const [products, setProducts] = useState<any[]>([])
  const [user, setUser] = useState<any>(null)
  const supabase = createClient()
  const { t } = useT()

  useEffect(() => {
    supabase.auth.getUser().then(async ({ data: { user } }) => {
      setUser(user)
      if (!user) return

      const { data: favorites } = await supabase
        .from("favorites")
        .select("product_id")
        .eq("user_id", user.id)

      if (!favorites) return

      const ids = favorites.map((f: any) => f.product_id)
      const { data: products } = await supabase
        .from("products")
        .select("id, name, slug, brand, image_url")
        .in("id", ids)

      setProducts(products || [])
    })
  }, [])

  if (!user) {
    return (
      <div className="mx-auto max-w-7xl px-4 py-16 text-center">
        <h1 className="text-2xl font-bold mb-4">{t("favorites.title")}</h1>
        <p className="text-zinc-500 mb-4">{t("favorites.login")}</p>
        <button
          onClick={() => supabase.auth.signInWithOAuth({ provider: "google", options: { redirectTo: `${location.origin}/auth/callback` } })}
          className="rounded-xl bg-blue-600 px-6 py-2 text-white font-medium hover:bg-blue-700"
        >
          {t("auth.login")}
        </button>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-8">
      <h1 className="text-2xl font-bold mb-6">{t("favorites.title")}</h1>
      {products.length === 0 ? (
        <p className="text-zinc-500">{t("favorites.empty")}</p>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {products.map((p) => (
            <Link
              key={p.id}
              href={`/products/${p.slug}`}
              className="rounded-xl border bg-white p-4 hover:shadow-md transition-all"
            >
              <img src={p.image_url || ""} alt={p.name} className="h-40 w-full object-contain mb-4" />
              <p className="text-xs text-blue-600 font-medium">{p.brand}</p>
              <p className="text-sm font-semibold text-zinc-900">{p.name}</p>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
