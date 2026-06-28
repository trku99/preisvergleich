import { supabase } from "@/lib/supabase"
import { products as mockProducts, getProductsByCategory, categories } from "@/lib/data"
import { ProductCard } from "@/components/ProductCard"
import Link from "next/link"
import type { Product } from "@/lib/types"

export const dynamic = "force-dynamic"

export async function generateStaticParams() {
  return categories.map((cat) => ({ slug: cat.slug }))
}

export default async function CategoryPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const category = categories.find((c) => c.slug === slug)

  let products: Product[] = []

  try {
    const { data } = await supabase
      .from("products")
      .select(`id, name, slug, brand, description, image_url, ean, category:categories(name, slug)`)
      .eq("category.slug", slug)

    if (data && data.length > 0) {
      const enriched = await Promise.all(
        data.map(async (p: any) => {
          const { data: productShops } = await supabase
            .from("product_shops")
            .select("id, prices:price_history(price)")
            .eq("product_id", p.id)

          const priceValues = (productShops || []).map((ps: any) => ps.prices?.[0]?.price).filter(Boolean)
          return {
            id: p.id, name: p.name, slug: p.slug, brand: p.brand, description: p.description,
            image: p.image_url || `https://placehold.co/400x400/6366f1/ffffff?text=${encodeURIComponent((p.brand || p.name).slice(0, 2).toUpperCase())}`,
            category: p.category?.name || "", categorySlug: p.category?.slug || "",
            ean: p.ean || "", currency: "CHF" as const,
            lowestPrice: Math.min(...priceValues, Infinity), highestPrice: Math.max(...priceValues, 0),
            shopCount: productShops?.length || 0, prices: [], priceHistory: [],
          } as Product
        })
      )
      products = enriched
    }
  } catch {}

  if (products.length === 0 && slug) {
    products = getProductsByCategory(slug)
  }

  if (!category && products.length === 0) {
    return (
      <div className="mx-auto max-w-7xl px-4 py-20 text-center">
        <div className="text-4xl mb-4">🔍</div>
        <h1 className="text-2xl font-bold text-zinc-900 mb-2">Kategorie nicht gefunden</h1>
        <p className="text-zinc-500 mb-6">Die angeforderte Kategorie existiert nicht.</p>
        <Link href="/products" className="text-indigo-600 hover:text-indigo-500">Alle Produkte anzeigen →</Link>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div className="mb-8">
        <Link href="/products" className="text-sm text-zinc-400 hover:text-zinc-600 transition-colors mb-2 inline-block">
          ← Alle Produkte
        </Link>
        <div className="flex items-center gap-3">
          {category?.icon && <span className="text-3xl">{category.icon}</span>}
          <div>
            <h1 className="text-2xl sm:text-3xl font-bold text-zinc-900">{category?.name || slug}</h1>
            <p className="text-sm text-zinc-400 mt-1">{products.length} Produkte</p>
          </div>
        </div>
      </div>

      <div className="flex gap-4 mb-6 overflow-x-auto pb-2">
        {categories.map((cat) => (
          <Link
            key={cat.slug}
            href={`/category/${cat.slug}`}
            className={`shrink-0 px-4 py-2 rounded-xl text-sm font-medium transition-all ${
              cat.slug === slug
                ? "bg-indigo-600 text-white shadow-md"
                : "bg-white border border-zinc-200 text-zinc-600 hover:bg-zinc-50"
            }`}
          >
            {cat.icon} {cat.name}
          </Link>
        ))}
      </div>

      {products.length === 0 ? (
        <div className="text-center py-20">
          <div className="text-4xl mb-4">📦</div>
          <p className="text-zinc-400">Keine Produkte in dieser Kategorie.</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {products.map((product, i) => (
            <div key={product.id} style={{ animation: `fade-in-up 0.4s ease-out ${i * 0.03}s both` }}>
              <ProductCard product={product} />
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
