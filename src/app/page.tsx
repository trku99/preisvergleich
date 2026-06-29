import Link from "next/link"
import { supabase } from "@/lib/supabase"
import { ProductCard } from "@/components/ProductCard"
import type { Product } from "@/lib/types"
import { products as mockProducts, categories as mockCats } from "@/lib/data"
import { getT } from "@/lib/i18n/server"

export const dynamic = "force-dynamic"

async function getProducts() {
  const { data: products } = await supabase.from("products").select(`
    id, name, slug, brand, description, image_url, ean,
    category:categories(name, slug)
  `)
  if (!products || products.length === 0) return mockProducts as Product[]

  return products.map((p: any) => ({
    id: p.id, name: p.name, slug: p.slug, brand: p.brand,
    description: p.description,
    image: p.image_url || `https://placehold.co/400x400/6366f1/ffffff?text=${encodeURIComponent((p.brand || p.name).slice(0, 2).toUpperCase())}`,
    category: p.category?.name || "", categorySlug: p.category?.slug || "",
    ean: p.ean || "", currency: "CHF" as const,
    lowestPrice: 0, highestPrice: 0, shopCount: 0, prices: [], priceHistory: [],
  }))
}

export default async function Home() {
  const { t } = await getT()
  const products = await getProducts()
  const categories = mockCats

  const enrichedProducts = await Promise.all(
    products.slice(0, 8).map(async (product) => {
      const { data: productShops } = await supabase
        .from("product_shops")
        .select(`id, in_stock, shop:shops(id, name, slug), prices:price_history(price, currency, is_promotion, scraped_at)`)
        .eq("product_id", product.id)

      if (!productShops || productShops.length === 0) return product

      const prices = productShops.map((ps: any) => ({
        shopId: ps.shop?.slug || "", price: ps.prices?.[0]?.price || 0,
        currency: "CHF", isPromotion: ps.prices?.[0]?.is_promotion || false,
        inStock: ps.in_stock, url: "#", updatedAt: ps.prices?.[0]?.scraped_at || "",
      })).filter((p) => p.price > 0).sort((a, b) => a.price - b.price)

      return { ...product, currency: "CHF" as const,
        lowestPrice: prices[0]?.price || 0, highestPrice: prices[prices.length - 1]?.price || 0,
        shopCount: prices.length, prices, priceHistory: [],
      } as Product
    })
  )

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      {/* Hero Section */}
      <section className="relative py-20 sm:py-28 text-center overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top,rgba(99,102,241,0.06),transparent_70%)] pointer-events-none" />
        <div className="relative z-10">
          <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-indigo-50/80 border border-indigo-200/50 text-indigo-600 text-xs font-medium mb-6">
            <span className="w-1.5 h-1.5 rounded-full bg-indigo-500 animate-pulse" />
            {t("home.badge")}
          </div>
          <h1 className="text-4xl sm:text-5xl lg:text-7xl font-bold tracking-tight text-zinc-900 leading-[1.1]">
            {t("hero.title")}
          </h1>
          <p className="mt-5 text-lg sm:text-xl text-zinc-400 max-w-2xl mx-auto leading-relaxed">
            {t("hero.subtitle")}
          </p>
          <div className="mt-8 flex items-center justify-center gap-4">
            <Link
              href="/products"
              className="inline-flex items-center gap-2 px-6 py-3 rounded-xl bg-gradient-to-br from-indigo-500 to-purple-600 text-white text-sm font-medium glow-sm hover:glow-md transition-all duration-300 card-hover"
            >
              {t("hero.cta")}
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 8l4 4m0 0l-4 4m4-4H3" /></svg>
            </Link>
            <Link
              href="/category/smartphones"
              className="inline-flex items-center px-6 py-3 rounded-xl border border-zinc-200 text-zinc-600 text-sm font-medium hover:bg-zinc-50 transition-all"
            >
              {t("home.smartphones")}
            </Link>
          </div>
        </div>
      </section>

      {/* Categories */}
      <section className="pb-16">
        <div className="flex items-center justify-between mb-8">
          <h2 className="text-lg font-semibold text-zinc-900">{t("home.categories")}</h2>
          <Link href="/categories" className="text-sm text-indigo-500 hover:text-indigo-600 font-medium transition-colors">
            {t("home.categories_all")}
          </Link>
        </div>
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
          {categories.map((cat, i) => (
            <Link
              key={cat.slug}
              href={`/category/${cat.slug}`}
              className="group relative flex flex-col items-center gap-3 rounded-2xl border border-zinc-200/60 bg-white/70 p-5 card-hover hover:glow-sm hover:border-indigo-200/50"
              style={{ animation: `fade-in-up 0.5s ease-out ${i * 0.05}s both` }}
            >
              <span className="text-3xl transition-transform duration-300 group-hover:scale-110">{cat.icon}</span>
              <div className="text-center">
                  <span className="text-sm font-medium text-zinc-700">{t(`cat.${cat.slug}`)}</span>
                <p className="text-xs text-zinc-400 mt-0.5">{t("categories.product_count", { n: cat.productCount })}</p>
              </div>
            </Link>
          ))}
        </div>
      </section>

      {/* Featured Products */}
      <section className="pb-20">
        <div className="flex items-center justify-between mb-8">
          <h2 className="text-lg font-semibold text-zinc-900">{t("home.featured_products")}</h2>
          <Link href="/products" className="text-sm text-indigo-500 hover:text-indigo-600 font-medium transition-colors">
            {t("home.all_products")}
          </Link>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {enrichedProducts.map((product, i) => (
            <div key={product.id} style={{ animation: `fade-in-up 0.5s ease-out ${i * 0.05}s both` }}>
              <ProductCard product={product} />
            </div>
          ))}
        </div>
      </section>

      {/* Features */}
      <section className="pb-20">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {[
            { icon: "🇨🇭", title: t("home.features.all"), desc: t("home.features.all.desc") },
            { icon: "⚡", title: t("home.features.fresh_title"), desc: t("home.features.fresh_desc") },
            { icon: "🔒", title: t("home.features.free"), desc: t("home.features.free.desc") },
          ].map((f, i) => (
            <div key={f.title} className="group rounded-2xl border border-zinc-200/60 bg-white/70 p-6 card-hover" style={{ animation: `fade-in-up 0.5s ease-out ${i * 0.1}s both` }}>
              <div className="flex items-center gap-4">
                <span className="text-2xl">{f.icon}</span>
                <div>
                  <h3 className="font-medium text-zinc-900 text-sm">{f.title}</h3>
                  <p className="text-xs text-zinc-400 mt-0.5">{f.desc}</p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  )
}
