"use client"

import { useEffect, useState } from "react"
import { createClient } from "@/lib/supabase-client"
import Link from "next/link"
import { usePathname } from "next/navigation"

const navItems = [
  { href: "/admin", label: "Dashboard", icon: "📊" },
  { href: "/admin/products", label: "Ürünler", icon: "📦" },
  { href: "/admin/categories", label: "Kategoriler", icon: "📂" },
  { href: "/admin/brands", label: "Markalar", icon: "🏷️" },
  { href: "/admin/shops", label: "Mağazalar", icon: "🏪" },
  { href: "/admin/prices", label: "Fiyatlar", icon: "💰" },
  { href: "/admin/crawler", label: "Veri Çekme", icon: "🕷️" },
  { href: "/admin/campaigns", label: "Kampanyalar", icon: "🏆" },
  { href: "/admin/users", label: "Kullanıcılar", icon: "👥" },
  { href: "/admin/reports", label: "Raporlar", icon: "📈" },
  { href: "/admin/seo", label: "SEO", icon: "🔍" },
  { href: "/admin/cms", label: "İçerik", icon: "📝" },
  { href: "/admin/logs", label: "Loglar", icon: "📋" },
  { href: "/admin/integrations", label: "Entegrasyonlar", icon: "🔗" },
  { href: "/admin/backups", label: "Yedekleme", icon: "💾" },
  { href: "/admin/settings", label: "Ayarlar", icon: "⚙️" },
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
    return <div className="flex h-screen items-center justify-center text-zinc-500">Yükleniyor...</div>
  }

  if (!user) {
    return (
      <div className="flex h-screen items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Admin Paneli</h1>
          <p className="text-zinc-500 mb-6">Devam etmek için giriş yapın.</p>
          <button
            onClick={() => supabase.auth.signInWithOAuth({
              provider: "google",
              options: { redirectTo: `${location.origin}/admin` },
            })}
            className="rounded-lg bg-blue-600 px-6 py-2 text-white text-sm font-medium hover:bg-blue-700"
          >
            Google ile Giriş Yap
          </button>
        </div>
      </div>
    )
  }

  return (
    <div className="flex h-screen bg-zinc-100">
      <aside className={`${sidebarOpen ? "w-56" : "w-0"} transition-all duration-200 bg-white border-r overflow-hidden`}>
        <div className="p-4 border-b">
          <Link href="/admin" className="font-bold text-lg">PreisVergleich</Link>
          <p className="text-xs text-zinc-500 mt-1">Yönetim Paneli</p>
        </div>
        <nav className="p-2 space-y-1">
          {navItems.map((item) => {
            const active = pathname === item.href || (item.href !== "/admin" && pathname.startsWith(item.href))
            return (
              <Link
                key={item.href}
                href={item.href}
                className={`flex items-center gap-2 px-3 py-2 rounded-lg text-sm transition-colors ${
                  active ? "bg-blue-50 text-blue-700 font-medium" : "text-zinc-600 hover:bg-zinc-50"
                }`}
              >
                <span>{item.icon}</span>
                {item.label}
              </Link>
            )
          })}
        </nav>
        <div className="absolute bottom-4 left-4 right-4">
          <Link href="/" className="text-xs text-zinc-400 hover:text-zinc-600">← Siteye dön</Link>
        </div>
      </aside>

      <div className="flex-1 flex flex-col overflow-hidden">
        <header className="bg-white border-b px-6 py-3 flex items-center justify-between">
          <button onClick={() => setSidebarOpen(!sidebarOpen)} className="text-zinc-500 hover:text-zinc-700">
            {sidebarOpen ? "☰" : "☰"}
          </button>
          <div className="flex items-center gap-3 text-sm text-zinc-500">
            <span>{user.email}</span>
            <button onClick={() => supabase.auth.signOut()} className="text-red-500 hover:text-red-700">Çıkış</button>
          </div>
        </header>
        <main className="flex-1 overflow-y-auto p-6">
          {children}
        </main>
      </div>
    </div>
  )
}
