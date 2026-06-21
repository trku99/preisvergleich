import { notFound } from "next/navigation"
import { getProductBySlug, getShopById } from "@/lib/data"
import { Badge } from "@/components/ui/badge"
import Link from "next/link"

function PriceChart({ history }: { history: { date: string; price: number }[] }) {
  if (!history || history.length === 0) return null

  const minPrice = Math.min(...history.map((h) => h.price))
  const maxPrice = Math.max(...history.map((h) => h.price))
  const range = maxPrice - minPrice || 1

  return (
    <div className="rounded-xl border bg-white p-6">
      <h3 className="text-sm font-semibold text-zinc-900 mb-4">Preisentwicklung (30 Tage)</h3>
      <div className="relative h-48">
        <div className="absolute inset-0 flex items-end">
          {history.map((point, i) => {
            const height = ((point.price - minPrice) / range) * 100
            const isLowest = point.price === minPrice
            const isHighest = point.price === maxPrice
            return (
              <div
                key={i}
                className="flex-1 flex flex-col items-center justify-end group relative"
              >
                <div
                  className={`w-full mx-0.5 rounded-t transition-all hover:opacity-80 ${
                    isLowest ? "bg-green-500" : isHighest ? "bg-red-400" : "bg-blue-500"
                  }`}
                  style={{ height: `${Math.max(height, 2)}%` }}
                />
                <div className="absolute bottom-full mb-1 hidden group-hover:block bg-zinc-900 text-white text-xs rounded px-2 py-1 whitespace-nowrap z-10">
                  CHF {point.price} ({point.date})
                </div>
              </div>
            )
          })}
        </div>
      </div>
      <div className="flex justify-between mt-2 text-xs text-zinc-400">
        <span>{history[0]?.date}</span>
        <span>{history[history.length - 1]?.date}</span>
      </div>
    </div>
  )
}

export default function ProductPage({ params }: { params: { slug: string } }) {
  const product = getProductBySlug(params.slug)

  if (!product) {
    notFound()
  }

  const sortedPrices = [...product.prices].sort((a, b) => a.price - b.price)
  const bestPrice = sortedPrices[0]
  const bestShop = getShopById(bestPrice.shopId)
  const priceDiff = product.highestPrice - product.lowestPrice
  const savingsPercent = Math.round((priceDiff / product.highestPrice) * 100)

  return (
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      {/* Breadcrumb */}
      <nav className="flex items-center gap-2 text-sm text-zinc-500 mb-6">
        <Link href="/" className="hover:text-zinc-900">Home</Link>
        <span>/</span>
        <Link href="/products" className="hover:text-zinc-900">Produkte</Link>
        <span>/</span>
        <span className="text-zinc-900">{product.name}</span>
      </nav>

      {/* Product Info */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
        <div className="rounded-xl border bg-white p-8 flex items-center justify-center">
          <img
            src={product.image}
            alt={product.name}
            className="max-h-80 object-contain"
          />
        </div>
        <div className="space-y-4">
          <p className="text-sm font-medium text-blue-600 uppercase tracking-wide">{product.brand}</p>
          <h1 className="text-2xl font-bold text-zinc-900">{product.name}</h1>
          <p className="text-sm text-zinc-500">{product.description}</p>
          <div className="flex items-center gap-2">
            <Badge variant="secondary">{product.category}</Badge>
            <Badge variant="outline">EAN: {product.ean}</Badge>
          </div>
          <div className="flex items-baseline gap-3">
            <span className="text-4xl font-bold text-zinc-900">CHF {product.lowestPrice}</span>
            <span className="text-xl text-zinc-400 line-through">CHF {product.highestPrice}</span>
            <Badge className="bg-green-500 hover:bg-green-600 text-white">
              -{savingsPercent}%
            </Badge>
          </div>
          {bestShop && (
            <p className="text-sm text-zinc-500">
              Tiefster Preis bei <span className="font-medium text-zinc-700">{bestShop.name}</span>
            </p>
          )}

          {/* Price Cards */}
          <div className="space-y-2 pt-2">
            {sortedPrices.map((price) => {
              const shop = getShopById(price.shopId)
              if (!shop) return null
              return (
                <div
                  key={price.shopId}
                  className={`flex items-center justify-between rounded-xl border p-4 transition-all hover:shadow-md ${
                    price.price === product.lowestPrice
                      ? "border-green-200 bg-green-50"
                      : "bg-white"
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <div className="flex h-10 w-10 items-center justify-center rounded-full bg-zinc-100 font-bold text-sm text-zinc-600">
                      {shop.logo}
                    </div>
                    <div>
                      <p className="text-sm font-semibold text-zinc-900">{shop.name}</p>
                      <p className="text-xs text-zinc-400">
                        {shop.deliveryCost === 0 ? "Kostenloser Versand" : `CHF ${shop.deliveryCost} Versand`}
                        {" · "}{shop.deliveryTime}
                      </p>
                    </div>
                  </div>
                  <div className="text-right">
                    <p className={`text-lg font-bold ${price.price === product.lowestPrice ? "text-green-600" : "text-zinc-900"}`}>
                      CHF {price.price}
                    </p>
                    <div className="flex items-center gap-1 justify-end">
                      {price.isPromotion && (
                        <Badge className="bg-red-500 text-white text-xs px-1.5 py-0">%</Badge>
                      )}
                      {price.inStock ? (
                        <span className="text-xs text-green-600">Lagernd</span>
                      ) : (
                        <span className="text-xs text-red-500">Nicht lagernd</span>
                      )}
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        </div>
      </div>

      {/* Price Chart */}
      <PriceChart history={product.priceHistory} />

      {/* Similar Products */}
      <div className="mt-12">
        <h2 className="text-xl font-semibold mb-4">Ähnliche Produkte</h2>
        <div className="text-sm text-zinc-500">
          Weitere Produkte aus der Kategorie <Link href={`/products?category=${product.categorySlug}`} className="text-blue-600 hover:underline">{product.category}</Link>
        </div>
      </div>
    </div>
  )
}
