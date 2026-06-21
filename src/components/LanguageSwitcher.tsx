"use client"

import { useT } from "@/lib/i18n/LocaleProvider"
import type { Locale } from "@/lib/i18n/translations"

const locales: { value: Locale; label: string }[] = [
  { value: "de", label: "DE" },
  { value: "fr", label: "FR" },
  { value: "it", label: "IT" },
]

export function LanguageSwitcher() {
  const { locale, setLocale, t } = useT()

  return (
    <div className="flex items-center gap-0.5">
      {locales.map((l) => (
        <button
          key={l.value}
          onClick={() => setLocale(l.value)}
          className={`px-2 py-1 text-xs font-medium rounded-md transition-colors ${
            locale === l.value
              ? "bg-blue-100 text-blue-600"
              : "text-zinc-400 hover:text-zinc-600"
          }`}
        >
          {l.label}
        </button>
      ))}
    </div>
  )
}
