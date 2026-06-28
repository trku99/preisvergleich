import { notFound } from "next/navigation"
import { supabase } from "@/lib/supabase"
import { products as mockProducts, getShopById } from "@/lib/data"
import { Badge } from "@/components/ui/badge"
import { FavoriteButton } from "@/components/FavoriteButton"
import { PriceAlertForm } from "@/components/PriceAlertForm"
import Link from "next/link"
import type { Product } from "@/lib/types"

async function getProduct(slug: string) {
  try {
    const { data } = await supabase
      .from("products")
      .select(`id, name, slug, brand, description, image_url, ean, variant_of, category:categories(name, slug)`)
      .eq("slug", slug)
      .single()

    if (data) {
      const { data: productShops } = await supabase
        .from("product_shops")
        .select(`id, in_stock, product_url, shop_id, shop:shops(id, name, slug), prices:price_history(price, currency, is_promotion, scraped_at)`)
        .eq("product_id", data.id)

      const prices = (productShops || [])
        .map((ps: any) => ({
          productShopId: ps.id, shopId: (ps.shop as any)?.slug || "",
          price: ps.prices?.[0]?.price || 0, currency: "CHF" as const,
          isPromotion: ps.prices?.[0]?.is_promotion || false,
          inStock: ps.in_stock, url: ps.product_url || "#",
          updatedAt: ps.prices?.[0]?.scraped_at || "",
        }))
        .filter((p) => p.price > 0)
        .sort((a, b) => a.price - b.price)

      const { data: history } = await supabase
        .from("price_history")
        .select("price, scraped_at")
        .in("product_shop_id", (productShops || []).map((ps: any) => ps.id))
        .order("scraped_at", { ascending: true })

      const priceHistory = (history || []).map((h: any) => ({
        date: h.scraped_at?.split("T")[0] || "", price: h.price,
      }))

      const uniqueDates = [...new Set(priceHistory.map((h: any) => h.date))]
      const avgHistory = uniqueDates.map((date) => {
        const dayPrices = priceHistory.filter((h: any) => h.date === date)
        return { date, price: Math.round((dayPrices.reduce((s: number, h: any) => s + h.price, 0) / dayPrices.length) * 100) / 100 }
      })

      let variants: { name: string; slug: string }[] = []
      if (data.variant_of) {
        const { data: parent } = await supabase.from("products").select("id").eq("id", data.variant_of).single()
        if (parent) {
          const { data: siblings } = await supabase.from("products").select("name, slug").eq("variant_of", data.variant_of).order("name")
          const { data: parentName } = await supabase.from("products").select("name, slug").eq("id", data.variant_of).single()
          variants = [parentName!, ...(siblings || [])]
        }
      } else {
        const { data: children } = await supabase.from("products").select("name, slug").eq("variant_of", data.id).order("name")
        if (children) variants = [{ name: data.name, slug: data.slug }, ...children]
      }

      return {
        id: data.id, name: data.name, slug: data.slug, brand: data.brand || "",
        description: data.description || "",
        image: data.image_url || `https://placehold.co/600x600/6366f1/ffffff?text=${encodeURIComponent((data.brand || data.name).slice(0, 2).toUpperCase())}`,
        category: (data.category as any)?.name || "", categorySlug: (data.category as any)?.slug || "",
        ean: data.ean || "", currency: "CHF" as const,
        lowestPrice: prices[0]?.price || 0, highestPrice: prices[prices.length - 1]?.price || 0,
        shopCount: prices.length, prices, priceHistory: avgHistory,
        variants,
      } as any
    }
  } catch {}
  return null
}

export default async function ProductPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  let product = await getProduct(slug)
  if (!product) product = mockProducts.find((p) => p.slug === slug) || null
  if (!product) notFound()

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <Link href="/products" className="inline-flex items-center gap-1 text-sm text-zinc-400 hover:text-zinc-600 transition-colors mb-6">
        <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" /></svg>
        Zurück
      </Link>

      <div className="grid md:grid-cols-2 gap-8 lg:gap-12">
        {/* Image */}
        <div className="relative">
          <div className="sticky top-24 aspect-square rounded-2xl bg-gradient-to-br from-zinc-50 to-indigo-50/30 border border-zinc-200/60 p-8 flex items-center justify-center">
            <img src={product.image} alt={product.name} className="max-h-full max-w-full object-contain" />
          </div>
        </div>

        {/* Details */}
        <div className="space-y-6">
          <div>
            <p className="text-sm font-semibold text-indigo-500 uppercase tracking-wider mb-2">{product.brand}</p>
            <h1 className="text-2xl lg:text-3xl font-bold text-zinc-900 leading-tight">{product.name}</h1>
            <p className="text-sm text-zinc-400 mt-2 leading-relaxed">{product.description}</p>

            {/* Variants */}
            {(product as any).variants?.length > 1 && (
              <div className="flex flex-wrap gap-2 mt-4">
                {(product as any).variants.map((v: any) => (
                  <Link
                    key={v.slug}
                    href={`/products/${v.slug}`}
                    className={`px-3 py-1.5 rounded-lg text-xs font-medium transition-all ${
                      v.slug === slug
                        ? "bg-indigo-600 text-white shadow-sm"
                        : "bg-zinc-100 text-zinc-600 hover:bg-zinc-200"
                    }`}
                  >
                    {v.name}
                  </Link>
                ))}
              </div>
            )}
          </div>

          {/* Price */}
          {product.prices.length > 0 && (
            <div className="rounded-2xl bg-gradient-to-br from-indigo-500 to-purple-600 p-6 text-white glow-md">
              <p className="text-sm text-white/70 mb-1">Tiefster Preis</p>
              <div className="flex items-baseline gap-2">
                <span className="text-4xl font-bold">CHF {product.lowestPrice}</span>
                {product.highestPrice > product.lowestPrice && (
                  <span className="text-lg text-white/50 line-through">CHF {product.highestPrice}</span>
                )}
              </div>
              <p className="text-xs text-white/50 mt-1">ab {product.prices[0]?.shopId}</p>
            </div>
          )}

          {product.ean && <p className="text-xs text-zinc-300">EAN: {product.ean}</p>}

          {/* Shop List */}
          <div>
            <h2 className="font-semibold text-zinc-900 mb-3">Preise vergleichen</h2>
            <div className="space-y-2">
              {product.prices.map((price: any) => {
                const shop = getShopById(price.shopId)
                return (
                  <a
                    key={price.shopId}
                    href={price.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-between rounded-xl border border-zinc-200/60 bg-white/70 p-4 card-hover hover:glow-sm hover:border-indigo-200/50"
                  >
                    <div className="flex items-center gap-3">
                      <span className="w-8 h-8 rounded-lg bg-gradient-to-br from-zinc-100 to-zinc-200 flex items-center justify-center text-xs font-bold text-zinc-500">
                        {shop?.logo || price.shopId[0].toUpperCase()}
                      </span>
                      <div>
                        <p className="text-sm font-medium text-zinc-900">{shop?.name || price.shopId}</p>
                        <p className="text-xs text-zinc-400">
                          {price.inStock ? "Lagernd" : "Nicht lagernd"} · {price.updatedAt}
                        </p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="text-base font-bold text-zinc-900">CHF {price.price}</p>
                      {price.isPromotion && (
                        <Badge variant="secondary" className="text-[10px] bg-green-50 text-green-600 border-green-200">
                          −%
                        </Badge>
                      )}
                    </div>
                  </a>
                )
              })}
            </div>
          </div>

          {/* Actions */}
          <div className="flex items-center gap-3 pt-2">
            <FavoriteButton productId={product.id} />
            {product.prices[0] && (
              <PriceAlertForm productShopId={product.prices[0].productShopId || ""} productName={product.name} />
            )}
          </div>

          {/* Price History Chart */}
          {product.priceHistory.length > 1 && (
            <div className="rounded-2xl border border-zinc-200/60 bg-white/70 p-5">
              <h3 className="font-semibold text-zinc-900 text-sm mb-4">Preisverlauf</h3>
              <div className="h-40 flex items-end gap-1">
                {product.priceHistory.map((h: any, i: number) => {
                  const maxPrice = Math.max(...product.priceHistory.map((ph: any) => ph.price))
                  const height = maxPrice > 0 ? (h.price / maxPrice) * 100 : 0
                  return (
                    <div key={i} className="flex-1 flex flex-col items-center gap-1">
                      <div
                        className="w-full rounded-t-md bg-gradient-to-t from-indigo-400 to-indigo-300 transition-all duration-500 min-h-[4px]"
                        style={{ height: `${height}%` }}
                        title={`CHF ${h.price}`}
                      />
                      {product.priceHistory.length <= 10 && (
                        <span className="text-[9px] text-zinc-400 -rotate-45 origin-left">{h.date?.slice(5)}</span>
                      )}
                    </div>
                  )
                })}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
