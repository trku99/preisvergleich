"use client"

import { useState } from "react"
import { createClient } from "@/lib/supabase-client"
import { useT } from "@/lib/i18n/LocaleProvider"

export function PriceAlertForm({ productShopId, productName }: { productShopId: string; productName: string }) {
  const { t } = useT()
  const [price, setPrice] = useState("")
  const [saved, setSaved] = useState(false)
  const [user, setUser] = useState<any>(null)
  const supabase = createClient()

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()

    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      await supabase.auth.signInWithOAuth({
        provider: "google",
        options: { redirectTo: `${location.origin}/auth/callback` },
      })
      return
    }

    const targetPrice = parseFloat(price)
    if (isNaN(targetPrice)) return

    await supabase.from("price_alerts").insert({
      user_id: user.id,
      product_shop_id: productShopId,
      target_price: targetPrice,
    })

    setSaved(true)
  }

  if (saved) {
    return (
      <div className="rounded-xl border border-green-200 bg-green-50 p-4 text-sm text-green-700">
        {t("product.pricealert.done", { price })}
      </div>
    )
  }

  return (
    <form onSubmit={handleSubmit} className="flex items-center gap-2">
      <input
        type="number"
        step="0.01"
        placeholder={t("product.pricealert.placeholder")}
        value={price}
        onChange={(e) => setPrice(e.target.value)}
        className="h-10 rounded-xl border border-zinc-200 px-3 text-sm w-32"
      />
      <button
        type="submit"
        className="h-10 rounded-xl bg-blue-600 px-4 text-sm font-medium text-white hover:bg-blue-700 transition-colors"
      >
        {t("product.pricealert.set")}
      </button>
    </form>
  )
}
