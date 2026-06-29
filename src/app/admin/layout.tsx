"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"
import { usePathname } from "next/navigation"

const navItems = [
  { href: "/admin", label: "Dashboard", icon: "📊" },
  { href: "/admin/products", label: "Produkte", icon: "📦" },
  { href: "/admin/categories", label: "Kategorien", icon: "📂" },
  { href: "/admin/brands", label: "Marken", icon: "🏷️" },
  { href: "/admin/shops", label: "Geschäfte", icon: "🏪" },
  { href: "/admin/prices", label: "Preise", icon: "💰" },
  { href: "/admin/crawler", label: "Datenabruf", icon: "🕷️" },
  { href: "/admin/galaxus", label: "Galaxus Sync", icon: "🔄" },
  { href: "/admin/campaigns", label: "Aktionen", icon: "🏆" },
  { href: "/admin/admin-accounts", label: "Administratoren", icon: "🔐" },
  { href: "/admin/reviews", label: "Bewertungen", icon: "⭐" },
  { href: "/admin/notifications", label: "Benachrichtigungen", icon: "🔔" },
  { href: "/admin/ads", label: "Werbung", icon: "📢" },
  { href: "/admin/users", label: "Benutzer", icon: "👥" },
  { href: "/admin/reports", label: "Berichte", icon: "📈" },
  { href: "/admin/seo", label: "SEO", icon: "🔍" },
  { href: "/admin/cms", label: "Inhalte", icon: "📝" },
  { href: "/admin/logs", label: "Logs", icon: "📋" },
  { href: "/admin/integrations", label: "Integrationen", icon: "🔗" },
  { href: "/admin/backups", label: "Backup", icon: "💾" },
  { href: "/admin/settings", label: "Einstellungen", icon: "⚙️" },
]

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<any>(null)
  const [loading, setLoading] = useState(true)
  const [sidebarOpen, setSidebarOpen] = useState(true)
  const pathname = usePathname()
  const supabase = createClient()

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      setUser(data.user)
      setLoading(false)
    })
  }, [])

  if (loading) {
    return <div className="flex h-screen items-center justify-center bg-zinc-50"><div className="text-indigo-400 text-sm animate-pulse">Wird geladen...</div></div>
  }

  if (!user) {
    return (
      <div className="flex h-screen items-center justify-center bg-zinc-50">
        <div className="text-center max-w-md mx-auto p-8 rounded-2xl border border-zinc-200 bg-white shadow-sm">
          <div className="text-5xl mb-4">🔐</div>
          <h1 className="text-2xl font-bold text-zinc-800 mb-2">Verwaltungspanel</h1>
          <p className="text-zinc-500 mb-8 text-sm">Bitte anmelden um fortzufahren.</p>
          <button
            onClick={() => supabase.auth.signInWithOAuth({
              provider: "google",
              options: { redirectTo: `${location.origin}/admin` },
            })}
            className="rounded-xl bg-gradient-to-r from-indigo-600 to-purple-600 px-8 py-3 text-white text-sm font-medium hover:from-indigo-500 hover:to-purple-500 transition-all shadow-lg shadow-indigo-600/25"
          >
            Mit Google anmelden
          </button>
        </div>
      </div>
    )
  }

  return (
    <div className="flex h-screen bg-zinc-50">
      <aside className={`${sidebarOpen ? "w-60" : "w-0"} transition-all duration-300 bg-white border-r border-zinc-200 overflow-hidden flex flex-col`}>
        <div className="p-5 border-b border-zinc-100 shrink-0">
          <Link href="/admin" className="text-xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent">PreisVergleich</Link>
          <p className="text-xs text-zinc-400 mt-1">Verwaltungspanel</p>
        </div>
        <nav className="flex-1 p-3 space-y-0.5 overflow-y-auto scrollbar-none">
          {navItems.map((item, i) => {
            const active = pathname === item.href || (item.href !== "/admin" && pathname.startsWith(item.href))
            return (
              <Link
                key={item.href}
                href={item.href}
                className={`flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm transition-all duration-200 ${
                  active
                    ? "bg-indigo-50 text-indigo-700 font-medium border border-indigo-100"
                    : "text-zinc-500 hover:text-zinc-700 hover:bg-zinc-50"
                }`}
              >
                <span className="text-lg">{item.icon}</span>
                {item.label}
              </Link>
            )
          })}
        </nav>
        <div className="p-4 border-t border-zinc-100 shrink-0">
          <Link href="/" className="text-xs text-zinc-400 hover:text-zinc-600 transition-colors">← Zurück zur Website</Link>
        </div>
      </aside>

      <div className="flex-1 flex flex-col overflow-hidden">
        <header className="bg-white border-b border-zinc-200 px-6 py-3 flex items-center justify-between shrink-0">
          <button onClick={() => setSidebarOpen(!sidebarOpen)} className="text-zinc-500 hover:text-zinc-700 transition-colors p-2 rounded-lg hover:bg-zinc-100">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" /></svg>
          </button>
          <div className="flex items-center gap-4 text-sm">
            <span className="text-zinc-500">{user.email}</span>
            <button
              onClick={() => supabase.auth.signOut()}
              className="text-xs text-red-500 hover:text-red-700 transition-colors px-3 py-1.5 rounded-lg border border-red-200 hover:border-red-300"
            >
              Abmelden
            </button>
          </div>
        </header>
        <main className="flex-1 overflow-y-auto p-6">
          {children}
        </main>
      </div>
    </div>
  )
}
