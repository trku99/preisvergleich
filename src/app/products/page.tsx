import { supabase } from "@/lib/supabase"
import { products as mockProducts, searchProducts, getProductsByCategory, categories } from "@/lib/data"
import { ProductCard } from "@/components/ProductCard"
import type { Product } from "@/lib/types"

export const dynamic = "force-dynamic"

export default async function ProductsPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; category?: string }>
}) {
  const { q, category } = await searchParams
  const query = q || ""
  const cat = category || ""

  let products: Product[] = []

  try {
    let dbQuery = supabase.from("products").select(`
      id, name, slug, brand, description, image_url, ean,
      category:categories(name, slug)
    `)

    if (query) {
      dbQuery = dbQuery.or(`name.ilike.%${query}%,brand.ilike.%${query}%,description.ilike.%${query}%`)
    }
    if (cat) {
      dbQuery = dbQuery.eq("category.slug", cat)
    }

    const { data } = await dbQuery

    if (data && data.length > 0) {
      const enriched = await Promise.all(
        data.map(async (p: any) => {
          const { data: productShops } = await supabase
            .from("product_shops")
            .select("id, prices:price_history(price)")
            .eq("product_id", p.id)

          const priceValues = (productShops || [])
            .map((ps: any) => ps.prices?.[0]?.price)
            .filter(Boolean)

          return {
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
            lowestPrice: Math.min(...priceValues, Infinity),
            highestPrice: Math.max(...priceValues, 0),
            shopCount: productShops?.length || 0,
            prices: [],
            priceHistory: [],
          } as Product
        })
      )
      products = enriched
    }
  } catch {}

  if (products.length === 0) {
    let filtered = [...mockProducts]
    if (query) filtered = searchProducts(query)
    if (cat) filtered = getProductsByCategory(cat)
    products = filtered
  }

  const activeCategory = categories.find((c) => c.slug === cat)

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div className="mb-8">
        {query && <p className="text-sm text-zinc-500 mb-1">Suchergebnisse für</p>}
        <h1 className="text-3xl font-bold">
          {query
            ? `"${query}"`
            : activeCategory
              ? activeCategory.name
              : "Alle Produkte"}
        </h1>
        <p className="text-sm text-zinc-500 mt-1">{products.length} Produkte gefunden</p>
      </div>

      {products.length === 0 ? (
        <div className="text-center py-16">
          <p className="text-zinc-500">Keine Produkte gefunden.</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {products.map((product) => (
            <ProductCard key={product.id} product={product} />
          ))}
        </div>
      )}
    </div>
  )
}
