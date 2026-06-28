import Link from "next/link"
import type { Product } from "@/lib/types"
import { getShopById } from "@/lib/data"
import { Badge } from "@/components/ui/badge"

interface ProductCardProps {
  product: Product
}

export function ProductCard({ product }: ProductCardProps) {
  const bestPrice = product.prices?.[0]
  const cheapestShop = bestPrice ? getShopById(bestPrice.shopId) : null

  return (
    <Link
      href={`/products/${product.slug}`}
      className="group relative flex flex-col rounded-2xl border border-zinc-200/60 bg-white/70 p-4 card-hover hover:glow-sm hover:border-indigo-200/50"
    >
      <div className="aspect-square w-full overflow-hidden rounded-xl bg-gradient-to-br from-zinc-50 to-indigo-50/30 mb-4">
        <img
          src={product.image}
          alt={product.name}
          className="h-full w-full object-contain p-4 transition-all duration-500 group-hover:scale-110"
        />
      </div>
      <div className="space-y-2 flex-1 flex flex-col">
        <div className="flex items-center justify-between">
          <span className="text-[11px] font-semibold text-indigo-500 uppercase tracking-wider">{product.brand}</span>
          {product.shopCount > 0 && (
            <span className="text-[11px] text-zinc-400 bg-zinc-100 px-2 py-0.5 rounded-full">
              {product.shopCount}×
            </span>
          )}
        </div>
        <h3 className="text-sm font-medium text-zinc-900 leading-snug line-clamp-2 group-hover:text-indigo-600 transition-colors">
          {product.name}
        </h3>
        <div className="mt-auto pt-2 flex items-baseline gap-1.5">
          {product.lowestPrice > 0 ? (
            <>
              <span className="text-lg font-bold text-zinc-900">CHF {product.lowestPrice}</span>
              {product.highestPrice > product.lowestPrice && (
                <span className="text-sm text-zinc-400 line-through">CHF {product.highestPrice}</span>
              )}
            </>
          ) : (
            <span className="text-sm text-zinc-300">Preise laden...</span>
          )}
        </div>
        {cheapestShop && (
          <p className="text-xs text-zinc-400">
            ab {cheapestShop.name}
          </p>
        )}
      </div>
    </Link>
  )
}
