"use client"

import { useRouter } from "next/navigation"
import { useState } from "react"
import { Input } from "@/components/ui/input"
import { useT } from "@/lib/i18n/LocaleProvider"

export function SearchBar() {
  const [query, setQuery] = useState("")
  const router = useRouter()
  const { t } = useT()

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (query.trim()) {
      router.push(`/products?q=${encodeURIComponent(query.trim())}`)
    }
  }

  return (
    <form onSubmit={handleSubmit} className="relative w-full">
      <svg
        className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-400"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
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
      />
    </form>
  )
}
