"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import { useT } from "@/lib/i18n/LocaleProvider"

export function AuthButton() {
  const [user, setUser] = useState<any>(null)
  const supabase = createClient()
  const { t } = useT()

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => setUser(data.user))

    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null)
    })

    return () => subscription.unsubscribe()
  }, [])

  async function handleLogin() {
    await supabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: `${location.origin}/auth/callback` },
    })
  }

  async function handleLogout() {
    await supabase.auth.signOut()
    setUser(null)
  }

  if (user) {
    return (
      <button
        onClick={handleLogout}
        className="text-sm font-medium text-zinc-600 hover:text-zinc-900 transition-colors"
      >
        {t("nav.abmelden")}
      </button>
    )
  }

  return (
    <button
      onClick={handleLogin}
      className="text-sm font-medium text-blue-600 hover:text-blue-700 transition-colors"
    >
      {t("nav.anmelden")}
    </button>
  )
}
