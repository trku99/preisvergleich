"use client"

import { useRouter } from "next/navigation"
import { useState, useEffect, useRef } from "react"
import { Input } from "@/components/ui/input"
import { useT } from "@/lib/i18n/LocaleProvider"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"

export function SearchBar() {
  const [query, setQuery] = useState("")
  const [results, setResults] = useState<{ id: string; name: string; slug: string; brand: string; image_url: string; lowestPrice: number }[]>([])
  const [open, setOpen] = useState(false)
  const router = useRouter()
  const { t } = useT()
  const ref = useRef<HTMLDivElement>(null)
  const supabase = createClient()

  useEffect(() => {
    const timer = setTimeout(async () => {
      const q = query.trim()
      if (q.length < 2) { setResults([]); setOpen(false); return }
      const { data } = await supabase
        .from("products")
        .select(`id, name, slug, brand, image_url`)
        .or(`name.ilike.%${q}%,brand.ilike.%${q}%`)
        .limit(6)
      if (data) {
        const enriched = await Promise.all(
          data.map(async (p: any) => {
            const { data: shops } = await supabase
              .from("product_shops")
              .select("prices:price_history(price)")
              .eq("product_id", p.id)
            const prices = (shops || []).map((s: any) => s.prices?.[0]?.price).filter(Boolean)
            return { ...p, lowestPrice: prices.length ? Math.min(...prices) : 0 }
          })
        )
        setResults(enriched)
        setOpen(true)
      }
    }, 300)
    return () => clearTimeout(timer)
  }, [query])

  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false)
    }
    document.addEventListener("mousedown", handleClick)
    return () => document.removeEventListener("mousedown", handleClick)
  }, [])

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setOpen(false)
    if (query.trim()) router.push(`/products?q=${encodeURIComponent(query.trim())}`)
  }

  return (
    <div ref={ref} className="relative w-full">
      <form onSubmit={handleSubmit} className="relative">
        <svg
          className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-400"
          xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"
        >
          <circle cx="11" cy="11" r="8" />
          <path d="m21 21-4.3-4.3" />
        </svg>
        <Input
          type="search"
          placeholder={t("search.placeholder")}
          className="h-10 w-full rounded-xl border-zinc-200 bg-zinc-50 pl-10 text-sm focus:bg-white"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onFocus={() => { if (results.length) setOpen(true) }}
        />
      </form>
      {open && results.length > 0 && (
        <div className="absolute top-full mt-1 w-full bg-white rounded-xl border border-zinc-200 shadow-xl z-50 overflow-hidden">
          {results.map((p) => (
            <Link
              key={p.id}
              href={`/products/${p.slug}`}
              onClick={() => { setOpen(false); setQuery("") }}
              className="flex items-center gap-3 px-4 py-2.5 hover:bg-zinc-50 transition-colors border-b border-zinc-100 last:border-0"
            >
              <div className="w-8 h-8 rounded-lg bg-zinc-100 flex items-center justify-center overflow-hidden shrink-0">
                <img src={p.image_url || `https://placehold.co/32x32/6366f1/ffffff?text=${(p.brand || p.name).slice(0,1)}`} alt="" className="w-full h-full object-contain" />
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-zinc-800 truncate">{p.name}</p>
                <p className="text-xs text-zinc-400">{p.brand || p.name}</p>
              </div>
              {p.lowestPrice > 0 && (
                <span className="text-sm font-semibold text-indigo-600 shrink-0">CHF {p.lowestPrice}</span>
              )}
            </Link>
          ))}
          <Link
            href={`/products?q=${encodeURIComponent(query)}`}
            onClick={() => setOpen(false)}
            className="block px-4 py-2.5 text-center text-xs font-medium text-indigo-600 hover:bg-indigo-50 transition-colors border-t border-zinc-100"
          >
            {t("search.all_results", { n: results.length })}
          </Link>
        </div>
      )}
    </div>
  )
}
