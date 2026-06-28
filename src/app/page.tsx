import Link from "next/link"
import { supabase } from "@/lib/supabase"
import { ProductCard } from "@/components/ProductCard"
import { Badge } from "@/components/ui/badge"
import type { Product } from "@/lib/types"
import { products as mockProducts, categories as mockCats } from "@/lib/data"

export const dynamic = "force-dynamic"

async function getProducts() {
  const { data: products } = await supabase.from("products").select(`
    id, name, slug, brand, description, image_url, ean,
    category:categories(name, slug)
  `)
  if (!products || products.length === 0) return mockProducts as Product[]

  return products.map((p: any) => ({
    id: p.id,
    name: p.name,
    slug: p.slug,
    brand: p.brand,
    description: p.description,
    image: p.image_url || `https://placehold.co/400x400/3b82f6/ffffff?text=${encodeURIComponent((p.brand || p.name).slice(0, 2).toUpperCase())}`,
    category: p.category?.name || "",
    categorySlug: p.category?.slug || "",
    ean: p.ean || "",
    currency: "CHF" as const,
    lowestPrice: 0,
    highestPrice: 0,
    shopCount: 0,
    prices: [],
    priceHistory: [],
  }))
}

export default async function Home() {
  const products = await getProducts()
  const categories = mockCats

  // Fetch prices for each product
  const enrichedProducts = await Promise.all(
    products.map(async (product) => {
      const { data: productShops } = await supabase
        .from("product_shops")
        .select(`
          id, in_stock,
          shop:shops(id, name, slug),
          prices:price_history(price, currency, is_promotion, scraped_at)
        `)
        .eq("product_id", product.id)

      if (!productShops || productShops.length === 0) return product

      const prices = productShops
        .map((ps: any) => ({
          shopId: ps.shop?.slug || "",
          price: ps.prices?.[0]?.price || 0,
          currency: "CHF",
          isPromotion: ps.prices?.[0]?.is_promotion || false,
          inStock: ps.in_stock,
          url: "#",
          updatedAt: ps.prices?.[0]?.scraped_at || "",
        }))
        .filter((p) => p.price > 0)
        .sort((a, b) => a.price - b.price)

      return {
        ...product,
        currency: "CHF" as const,
        lowestPrice: prices[0]?.price || 0,
        highestPrice: prices[prices.length - 1]?.price || 0,
        shopCount: prices.length,
        prices,
        priceHistory: [],
      } as Product
    })
  )

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <section className="py-16 sm:py-24 text-center">
        <Badge variant="secondary" className="mb-4 text-sm px-4 py-1.5 rounded-full">
          🇨🇭 Schweizer Preisvergleich
        </Badge>
        <h1 className="text-4xl font-bold tracking-tight text-zinc-900 sm:text-5xl lg:text-6xl">
          Finde den besten Preis
          <br /><span className="text-blue-600">in der Schweiz</span>
        </h1>
        <p className="mt-4 text-lg text-zinc-500 max-w-xl mx-auto">
          Vergleiche Preise von über 6 Schweizer Online-Shops.
        </p>
      </section>

      <section className="pb-12">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-semibold">Kategorien</h2>
          <Link href="/products" className="text-sm text-blue-600 hover:text-blue-700 font-medium">Alle anzeigen →</Link>
        </div>
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
          {categories.map((cat) => (
            <Link key={cat.slug} href={`/products?category=${cat.slug}`}
              className="flex flex-col items-center gap-2 rounded-xl border bg-white p-4 transition-all hover:shadow-md hover:border-zinc-300">
              <span className="text-2xl">{cat.icon}</span>
              <span className="text-sm font-medium text-zinc-700">{cat.name}</span>
              <span className="text-xs text-zinc-400">{cat.productCount} Produkte</span>
            </Link>
          ))}
        </div>
      </section>

      <section className="pb-16">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-semibold">Aktuelle Produkte</h2>
          <Link href="/products" className="text-sm text-blue-600 hover:text-blue-700 font-medium">Alle Produkte →</Link>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {enrichedProducts.map((product) => (<ProductCard key={product.id} product={product} />))}
        </div>
      </section>
    </div>
  )
}
