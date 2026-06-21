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
      .select(`id, name, slug, brand, description, image_url, ean, category:categories(name, slug)`)
      .eq("slug", slug)
      .single()

    if (data) {
      const { data: productShops } = await supabase
        .from("product_shops")
        .select(`id, in_stock, product_url, shop_id, shop:shops(id, name, slug), prices:price_history(price, currency, is_promotion, scraped_at)`)
        .eq("product_id", data.id)

      const prices = (productShops || [])
        .map((ps: any) => ({
          productShopId: ps.id,
          shopId: (ps.shop as any)?.slug || "",
          price: ps.prices?.[0]?.price || 0,
          currency: "CHF" as const,
          isPromotion: ps.prices?.[0]?.is_promotion || false,
          inStock: ps.in_stock,
          url: ps.product_url || "#",
          updatedAt: ps.prices?.[0]?.scraped_at || "",
        }))
        .filter((p) => p.price > 0)
        .sort((a, b) => a.price - b.price)

      const { data: history } = await supabase
        .from("price_history")
        .select("price, scraped_at")
        .in("product_shop_id", (productShops || []).map((ps: any) => ps.id))
        .order("scraped_at", { ascending: true })
        .limit(60)

      return {
        id: data.id,
        name: data.name,
        slug: data.slug,
        brand: data.brand || "",
        description: data.description || "",
        image: data.image_url || "",
        category: (data.category as any)?.name || "",
        categorySlug: (data.category as any)?.slug || "",
        ean: data.ean || "",
        currency: "CHF" as const,
        lowestPrice: prices[0]?.price || 0,
        highestPrice: prices[prices.length - 1]?.price || 0,
        shopCount: prices.length,
        prices,
        priceHistory: (history || []).map((h: any) => ({
          date: new Date(h.scraped_at).toISOString().split("T")[0],
          price: h.price,
          shopId: h.product_shop_id,
        })),
      } as Product
    }
  } catch {}

  return mockProducts.find((p) => p.slug === slug) || null
}

export default async function ProductPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const product = await getProduct(slug)
  if (!product) notFound()

  const sortedPrices = [...product.prices].sort((a, b) => a.price - b.price)
  const bestPrice = sortedPrices[0]
  const bestShop = bestPrice ? getShopById(bestPrice.shopId) : null
  const savingsPercent = product.highestPrice > 0 ? Math.round(((product.highestPrice - product.lowestPrice) / product.highestPrice) * 100) : 0

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <nav className="flex items-center gap-2 text-sm text-zinc-500 mb-6">
        <Link href="/" className="hover:text-zinc-900">Home</Link>
        <span>/</span>
        <Link href="/products" className="hover:text-zinc-900">Produkte</Link>
        <span>/</span>
        <span className="text-zinc-900">{product.name}</span>
      </nav>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
        <div className="rounded-xl border bg-white p-8 flex items-center justify-center">
          <img src={product.image} alt={product.name} className="max-h-80 object-contain" />
        </div>
        <div className="space-y-4">
          <p className="text-sm font-medium text-blue-600 uppercase tracking-wide">{product.brand}</p>
          <h1 className="text-2xl font-bold text-zinc-900">{product.name}</h1>
          <p className="text-sm text-zinc-500">{product.description}</p>
          <div className="flex items-center gap-2">
            <Badge variant="secondary">{product.category}</Badge>
            <Badge variant="outline">EAN: {product.ean}</Badge>
          </div>

          <div className="flex items-center gap-2">
            <FavoriteButton productId={product.id} />
          </div>

          {sortedPrices.length > 0 && (
            <>
              <div className="flex items-baseline gap-3">
                <span className="text-4xl font-bold text-zinc-900">CHF {product.lowestPrice}</span>
                {product.highestPrice > product.lowestPrice && (
                  <span className="text-xl text-zinc-400 line-through">CHF {product.highestPrice}</span>
                )}
                {savingsPercent > 0 && <Badge className="bg-green-500 text-white">-{savingsPercent}%</Badge>}
              </div>
              {bestShop && <p className="text-sm text-zinc-500">Tiefster Preis bei <span className="font-medium text-zinc-700">{bestShop.name}</span></p>}

              <div className="space-y-2 pt-2">
                {sortedPrices.map((price) => {
                  const shop = getShopById(price.shopId)
                  if (!shop) return null
                  return (
                    <a
                      key={price.shopId}
                      href={price.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className={`flex items-center justify-between rounded-xl border p-4 transition-all hover:shadow-md ${price.price === product.lowestPrice ? "border-green-200 bg-green-50" : "bg-white"}`}
                    >
                      <div className="flex items-center gap-3">
                        <div className="flex h-10 w-10 items-center justify-center rounded-full bg-zinc-100 font-bold text-sm text-zinc-600">{shop.logo}</div>
                        <div>
                          <p className="text-sm font-semibold text-zinc-900">{shop.name}</p>
                          <p className="text-xs text-zinc-400">{shop.deliveryCost === 0 ? "Kostenloser Versand" : `CHF ${shop.deliveryCost} Versand`} · {shop.deliveryTime}</p>
                        </div>
                      </div>
                      <div className="text-right">
                        <p className={`text-lg font-bold ${price.price === product.lowestPrice ? "text-green-600" : "text-zinc-900"}`}>CHF {price.price}</p>
                        <div className="flex items-center gap-1 justify-end">
                          {price.isPromotion && <Badge className="bg-red-500 text-white text-xs">%</Badge>}
                          <span className={`text-xs ${price.inStock ? "text-green-600" : "text-red-500"}`}>{price.inStock ? "Lagernd" : "Nicht lagernd"}</span>
                        </div>
                      </div>
                    </a>
                  )
                })}
              </div>

              <div className="pt-4 border-t border-zinc-100">
                <p className="text-sm font-medium text-zinc-700 mb-2">Preisalarm einrichten</p>
                {bestPrice.productShopId && <PriceAlertForm productShopId={bestPrice.productShopId} productName={product.name} />}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  )
}
