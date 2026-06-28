import Link from "next/link"
import { supabase } from "@/lib/supabase"
import { categories as mockCategories } from "@/lib/data"

export const dynamic = "force-dynamic"

export default async function CategoriesPage() {
  let dbCategories: { name: string; slug: string; icon: string; count: number }[] = []

  try {
      const { data } = await supabase.from("categories").select("id, name, slug, icon")
    if (data) {
      for (const cat of data) {
        const { count } = await supabase.from("products").select("*", { count: "exact", head: true }).eq("category_id", cat.id)
        dbCategories.push({ ...cat, count: count || 0 })
      }
    }
  } catch {}

  const displayCats = dbCategories.length > 0 ? dbCategories : mockCategories.map(c => ({ ...c, count: c.productCount }))

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div className="mb-8">
        <h1 className="text-2xl sm:text-3xl font-bold text-zinc-900">Kategorien</h1>
        <p className="text-sm text-zinc-400 mt-1">{displayCats.length} Kategorien</p>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {displayCats.map((cat, i) => (
          <Link
            key={cat.slug}
            href={`/category/${cat.slug}`}
            className="group rounded-2xl border border-zinc-200 bg-white p-6 card-hover hover:glow-sm hover:border-indigo-200/50 transition-all"
            style={{ animation: `fade-in-up 0.5s ease-out ${i * 0.05}s both` }}
          >
            <div className="flex items-center gap-4">
              <span className="text-4xl transition-transform duration-300 group-hover:scale-110">{cat.icon}</span>
              <div>
                <h2 className="text-lg font-semibold text-zinc-900 group-hover:text-indigo-600 transition-colors">{cat.name}</h2>
                <p className="text-sm text-zinc-400">{cat.count} Produkte</p>
              </div>
            </div>
          </Link>
        ))}
      </div>
    </div>
  )
}
