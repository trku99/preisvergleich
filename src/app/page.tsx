import Link from "next/link"
import { products, categories } from "@/lib/data"
import { ProductCard } from "@/components/ProductCard"
import { Badge } from "@/components/ui/badge"

const features = [
  { icon: "M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z", title: "Echtzeit-Preise", desc: "Preise werden alle 6 Stunden aktualisiert" },
  { icon: "M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z", title: "Preisvergleich", desc: "Alle Shops auf einen Blick" },
  { icon: "M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9", title: "Preisalarm", desc: "Benachrichtigung bei Preisänderungen" },
]

export default function Home() {
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
          Galaxus, Digitec, Microspot, Brack, MediaMarkt und mehr.
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
          {products.map((product) => (<ProductCard key={product.id} product={product} />))}
        </div>
      </section>

      <section className="pb-16">
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-6">
          {features.map((f) => (
            <div key={f.title} className="rounded-xl border bg-white p-6 text-center">
              <div className="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-blue-50 mb-4">
                <svg className="h-6 w-6 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
                  <path d={f.icon} />
                </svg>
              </div>
              <h3 className="font-semibold text-zinc-900">{f.title}</h3>
              <p className="mt-2 text-sm text-zinc-500">{f.desc}</p>
            </div>
          ))}
        </div>
      </section>
    </div>
  )
}
