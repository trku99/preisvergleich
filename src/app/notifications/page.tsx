"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"
import { useT } from "@/lib/i18n/LocaleProvider"

export default function NotificationsPage() {
  const { t, locale } = useT()
  const [notifications, setNotifications] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [user, setUser] = useState<any>(null)
  const supabase = createClient()

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      setUser(data.user)
    })
  }, [])

  useEffect(() => {
    if (!user) { setLoading(false); return }
    supabase.from("notifications").select("*").eq("user_id", user.id).order("created_at", { ascending: false }).then(({ data }) => {
      if (data) setNotifications(data)
      setLoading(false)
    })
  }, [user])

  async function markAllRead() {
    if (!user) return
    await supabase.from("notifications").update({ is_read: true }).eq("user_id", user.id).eq("is_read", false)
    setNotifications(prev => prev.map(n => ({ ...n, is_read: true })))
  }

  async function markRead(id: string) {
    await supabase.from("notifications").update({ is_read: true }).eq("id", id)
    setNotifications(prev => prev.map(n => n.id === id ? { ...n, is_read: true } : n))
  }

  if (!user) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center">
          <div className="text-4xl mb-3">🔔</div>
          <h1 className="text-xl font-bold text-zinc-800 mb-2">{t("notifications.title")}</h1>
          <p className="text-sm text-zinc-500 mb-4">{t("notifications.login")}</p>
          <button onClick={() => supabase.auth.signInWithOAuth({ provider: "google", options: { redirectTo: `${location.origin}/notifications` } })}
            className="rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-2 text-sm text-white hover:from-indigo-500 hover:to-purple-500 transition-all shadow-md">
            {t("notifications.login_google")}
          </button>
        </div>
      </div>
    )
  }

  const unreadCount = notifications.filter(n => !n.is_read).length

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-zinc-800">{t("notifications.title")}</h1>
          <p className="text-sm text-zinc-400 mt-1">{t("notifications.unread", { n: unreadCount })}</p>
        </div>
        {unreadCount > 0 && (
          <button onClick={markAllRead} className="text-sm text-indigo-600 hover:text-indigo-500 transition-colors">
            {t("notifications.mark_all_read")}
          </button>
        )}
      </div>

      {loading ? (
        <p className="text-zinc-400">{t("notifications.loading")}</p>
      ) : notifications.length === 0 ? (
        <div className="text-center py-16">
          <div className="text-5xl mb-4">🔔</div>
          <p className="text-zinc-500">{t("notifications.empty")}</p>
          <Link href="/products" className="text-sm text-indigo-600 hover:text-indigo-500 mt-2 inline-block">{t("notifications.browse")}</Link>
        </div>
      ) : (
        <div className="space-y-2">
          {notifications.map((n) => (
            <div key={n.id} className={`rounded-2xl border p-4 transition-colors ${n.is_read ? "bg-white border-zinc-200" : "bg-indigo-50 border-indigo-200"}`}>
              <div className="flex items-start justify-between gap-3">
                <div className="flex-1">
                  <div className="flex items-center gap-2">
                    <span className={`w-2 h-2 rounded-full ${n.is_read ? "bg-zinc-300" : "bg-indigo-500"}`} />
                    <span className="text-sm font-medium text-zinc-800">{n.title}</span>
                  </div>
                  {n.message && <p className="text-sm text-zinc-500 mt-1 ml-4">{n.message}</p>}
                  <p className="text-xs text-zinc-400 mt-2 ml-4">{new Date(n.created_at).toLocaleString(locale === "de" ? "de-CH" : locale)}</p>
                </div>
                {!n.is_read && (
                  <button onClick={() => markRead(n.id)} className="text-xs text-indigo-600 hover:text-indigo-500 shrink-0">{t("notifications.mark_read")}</button>
                )}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
