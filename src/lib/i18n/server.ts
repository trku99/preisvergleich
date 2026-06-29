import { cookies } from "next/headers"
import { translations, type Locale, type TranslationKey } from "./translations"

export async function getT() {
  const cookieStore = await cookies()
  const locale = (cookieStore.get("locale")?.value || "de") as Locale

  function t(key: TranslationKey, vars?: Record<string, string | number>): string {
    let text = translations[locale]?.[key] || translations.de[key] || key
    if (vars) {
      for (const [k, v] of Object.entries(vars)) {
        text = text.replace(`{${k}}`, String(v))
      }
    }
    return text
  }

  return { t, locale }
}
