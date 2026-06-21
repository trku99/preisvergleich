"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"

export function FavoriteButton({ productId }: { productId: string }) {
  const [isFavorite, setIsFavorite] = useState(false)
  const [user, setUser] = useState<any>(null)
  const supabase = createClient()

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      setUser(data.user)
      if (data.user) {
        supabase
          .from("favorites")
          .select("id")
          .eq("product_id", productId)
          .eq("user_id", data.user.id)
          .maybeSingle()
          .then(({ data: fav }) => setIsFavorite(!!fav))
      }
    })
  }, [productId])

  async function toggle() {
    if (!user) {
      await supabase.auth.signInWithOAuth({
        provider: "google",
        options: { redirectTo: `${location.origin}/auth/callback` },
      })
      return
    }

    if (isFavorite) {
      await supabase.from("favorites").delete().eq("product_id", productId).eq("user_id", user.id)
      setIsFavorite(false)
    } else {
      await supabase.from("favorites").insert({ product_id: productId, user_id: user.id })
      setIsFavorite(true)
    }
  }

  return (
    <button
      onClick={toggle}
      className={`flex items-center gap-2 rounded-xl border px-4 py-2 text-sm font-medium transition-all ${
        isFavorite
          ? "border-red-200 bg-red-50 text-red-600"
          : "border-zinc-200 bg-white text-zinc-600 hover:border-zinc-300"
      }`}
    >
      <svg className="h-4 w-4" fill={isFavorite ? "currentColor" : "none"} viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
        <path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z" />
      </svg>
      {isFavorite ? "Gespeichert" : "Merken"}
    </button>
  )
}
