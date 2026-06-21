import Link from "next/link"
import type { Product } from "@/lib/types"
import { getShopById } from "@/lib/data"
import { Badge } from "@/components/ui/badge"

interface ProductCardProps {
  product: Product
}

export function ProductCard({ product }: ProductCardProps) {
  const cheapestShop = getShopById(product.prices.sort((a, b) => a.price - b.price)[0]?.shopId)

  return (
    <Link
      href={`/products/${product.slug}`}
      className="group rounded-xl border bg-white p-4 transition-all hover:shadow-lg hover:border-zinc-300"
    >
      <div className="aspect-square w-full overflow-hidden rounded-lg bg-zinc-50 mb-4">
        <img
          src={product.image}
          alt={product.name}
          className="h-full w-full object-contain p-4 transition-transform group-hover:scale-105"
        />
      </div>
      <div className="space-y-2">
        <p className="text-xs font-medium text-blue-600 uppercase tracking-wide">{product.brand}</p>
        <h3 className="text-sm font-semibold text-zinc-900 leading-tight line-clamp-2 group-hover:text-blue-600 transition-colors">
          {product.name}
        </h3>
        <div className="flex items-center justify-between">
          <div>
            <span className="text-lg font-bold text-zinc-900">CHF {product.lowestPrice}</span>
            <span className="text-xs text-zinc-400 ml-1">–</span>
            <span className="text-lg font-bold text-zinc-400">CHF {product.highestPrice}</span>
          </div>
        </div>
        <div className="flex items-center justify-between gap-2">
          <span className="text-xs text-zinc-500">
            ab {cheapestShop?.name}
          </span>
          <Badge variant="secondary" className="text-xs">
            {product.shopCount} Shops
          </Badge>
        </div>
      </div>
    </Link>
  )
}
