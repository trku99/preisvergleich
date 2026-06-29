"use client"

import { createContext, useContext, useState, useEffect, type ReactNode } from "react"
import { translations, type Locale } from "./translations"

type LocaleContextType = {
  locale: Locale
  setLocale: (l: Locale) => void
  t: (key: string, vars?: Record<string, string | number>) => string
}

const LocaleContext = createContext<LocaleContextType | null>(null)

export function LocaleProvider({ children }: { children: ReactNode }) {
  const [locale, setLocaleState] = useState<Locale>("de")

  useEffect(() => {
    const stored = localStorage.getItem("locale") as Locale | null
    if (stored && stored in translations) setLocaleState(stored)
  }, [])

  function setLocale(l: Locale) {
    setLocaleState(l)
    localStorage.setItem("locale", l)
    document.cookie = `locale=${l};path=/;max-age=31536000`
  }

  function t(key: string, vars?: Record<string, string | number>): string {
    let text = (translations as any)[locale]?.[key] || (translations as any).de[key] || key
    if (vars) {
      for (const [k, v] of Object.entries(vars)) {
        text = text.replace(`{${k}}`, String(v))
      }
    }
    return text
  }

  return (
    <LocaleContext.Provider value={{ locale, setLocale, t }}>
      {children}
    </LocaleContext.Provider>
  )
}

export function useT() {
  const ctx = useContext(LocaleContext)
  if (!ctx) throw new Error("useT must be inside LocaleProvider")
  return ctx
}
