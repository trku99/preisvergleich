"use client"

import { useEffect } from "react"
import { useRouter } from "next/navigation"
import { createClient } from "@/lib/supabase-client"

export default function AuthCallbackPage() {
  const router = useRouter()

  useEffect(() => {
    const supabase = createClient()

    supabase.auth.onAuthStateChange((event) => {
      if (event === "SIGNED_IN") {
        router.push("/")
      }
    })

    const code = new URLSearchParams(window.location.search).get("code")
    if (code) {
      supabase.auth.exchangeCodeForSession(code).then(({ error }) => {
        if (error) router.push("/?error=auth")
      })
    } else {
      router.push("/?error=no-code")
    }
  }, [router])

  return (
    <div className="flex min-h-screen items-center justify-center">
      <div className="text-center">
        <div className="mx-auto h-8 w-8 animate-spin rounded-full border-4 border-blue-600 border-t-transparent" />
        <p className="mt-4 text-sm text-zinc-500">Anmeldung wird verarbeitet...</p>
      </div>
    </div>
  )
}
