"use client"

import { useSearchParams } from "next/navigation"
import { products, searchProducts, getProductsByCategory, categories } from "@/lib/data"
import { ProductCard } from "@/components/ProductCard"
import { Suspense } from "react"

function ProductsContent() {
  const searchParams = useSearchParams()
  const query = searchParams.get("q") || ""
  const category = searchParams.get("category") || ""

  let filtered = products
  if (query) {
    filtered = searchProducts(query)
  }
  if (category) {
    filtered = getProductsByCategory(category)
  }

  const activeCategory = categories.find((c) => c.slug === category)

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div className="mb-8">
        {query && (
          <p className="text-sm text-zinc-500 mb-1">Suchergebnisse für</p>
        )}
        <h1 className="text-3xl font-bold">
          {query
            ? `"${query}"`
            : activeCategory
              ? activeCategory.name
              : "Alle Produkte"}
        </h1>
        <p className="text-sm text-zinc-500 mt-1">{filtered.length} Produkte gefunden</p>
      </div>

      {filtered.length === 0 ? (
        <div className="text-center py-16">
          <p className="text-zinc-500">Keine Produkte gefunden.</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {filtered.map((product) => (
            <ProductCard key={product.id} product={product} />
          ))}
        </div>
      )}
    </div>
  )
}

export default function ProductsPage() {
  return (
    <Suspense>
      <ProductsContent />
    </Suspense>
  )
}
