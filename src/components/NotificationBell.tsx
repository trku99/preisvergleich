"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"
import { useT } from "@/lib/i18n/LocaleProvider"

export function NotificationBell() {
  const { t, locale } = useT()
  const [user, setUser] = useState<any>(null)
  const [count, setCount] = useState(0)
  const [open, setOpen] = useState(false)
  const [notifications, setNotifications] = useState<any[]>([])
  const supabase = createClient()

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      setUser(data.user)
    })
  }, [])

  useEffect(() => {
    if (!user) return
    supabase.from("notifications").select("*").eq("user_id", user.id).eq("is_read", false).order("created_at", { ascending: false }).limit(5).then(({ data }) => {
      if (data) { setNotifications(data); setCount(data.length) }
    })
  }, [user])

  async function markRead(id: string) {
    await supabase.from("notifications").update({ is_read: true }).eq("id", id)
    setNotifications(prev => prev.filter(n => n.id !== id))
    setCount(c => Math.max(0, c - 1))
  }

  if (!user) return null

  return (
    <div className="relative">
      <button onClick={() => setOpen(!open)} className="relative p-2 rounded-lg hover:bg-zinc-100 transition-colors">
        <svg className="w-5 h-5 text-zinc-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
        </svg>
        {count > 0 && (
          <span className="absolute -top-0.5 -right-0.5 w-5 h-5 rounded-full bg-red-500 text-white text-xs flex items-center justify-center font-bold">{count > 9 ? "9+" : count}</span>
        )}
      </button>

      {open && (
        <>
          <div className="fixed inset-0 z-40" onClick={() => setOpen(false)} />
          <div className="absolute right-0 top-full mt-2 w-80 bg-white rounded-2xl border border-zinc-200 shadow-xl z-50 overflow-hidden">
            <div className="p-3 border-b border-zinc-100 flex items-center justify-between">
              <span className="text-sm font-medium text-zinc-700">{t("notification_bell.title")}</span>
              <Link href="/notifications" className="text-xs text-indigo-600 hover:text-indigo-500" onClick={() => setOpen(false)}>{t("notification_bell.view_all")}</Link>
            </div>
            {notifications.length === 0 ? (
              <div className="p-6 text-center text-sm text-zinc-400">{t("notification_bell.empty")}</div>
            ) : (
              <div className="max-h-64 overflow-y-auto">
                {notifications.map((n) => (
                  <div key={n.id} className="p-3 border-b border-zinc-50 hover:bg-zinc-50 transition-colors">
                    <div className="flex items-start justify-between gap-2">
                      <div>
                        <p className="text-sm font-medium text-zinc-700">{n.title}</p>
                        {n.message && <p className="text-xs text-zinc-500 mt-0.5">{n.message}</p>}
                      </div>
                      <button onClick={() => markRead(n.id)} className="text-xs text-indigo-500 hover:text-indigo-400 shrink-0 mt-0.5">✓</button>
                    </div>
                    <p className="text-xs text-zinc-400 mt-1">{new Date(n.created_at).toLocaleDateString(locale === "de" ? "de-CH" : locale)}</p>
                  </div>
                ))}
              </div>
            )}
          </div>
        </>
      )}
    </div>
  )
}
