import Link from "next/link"
import { SearchBar } from "./SearchBar"
import { AuthButton } from "./AuthButton"
import { LanguageSwitcher } from "./LanguageSwitcher"
import { NotificationBell } from "./NotificationBell"

export function Header() {
  return (
    <header className="sticky top-0 z-50 w-full glass-dark border-b border-zinc-200/50">
      <div className="mx-auto flex h-16 max-w-7xl items-center gap-4 px-4 sm:px-6 lg:px-8">
        <Link href="/" className="flex items-center gap-2.5 shrink-0 group">
          <span className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-indigo-500 to-purple-600 text-white text-sm font-bold glow-sm group-hover:glow-md transition-all duration-300">
            P
          </span>
          <span className="hidden sm:inline text-lg font-semibold tracking-tight">PreisVergleich</span>
          <span className="text-sm font-medium gradient-text">.ch</span>
        </Link>
        <div className="flex-1 max-w-xl mx-auto">
          <SearchBar />
        </div>
        <nav className="flex items-center gap-1 shrink-0">
          <LanguageSwitcher />
          <NotificationBell />
          <Link href="/products" className="hidden md:inline text-sm font-medium text-zinc-500 hover:text-zinc-900 transition-colors px-3 py-1.5 rounded-lg hover:bg-zinc-100">
            Produkte
          </Link>
          <Link href="/favorites" className="hidden md:inline text-sm font-medium text-zinc-500 hover:text-zinc-900 transition-colors px-3 py-1.5 rounded-lg hover:bg-zinc-100">
            Favoriten
          </Link>
          <Link href="/categories" className="hidden md:inline text-sm font-medium text-zinc-500 hover:text-zinc-900 transition-colors px-3 py-1.5 rounded-lg hover:bg-zinc-100">
            Kategorien
          </Link>
          <Link href="/admin" className="hidden lg:inline text-sm font-medium text-zinc-500 hover:text-zinc-900 transition-colors px-3 py-1.5 rounded-lg hover:bg-zinc-100">
            Admin
          </Link>
          <AuthButton />
        </nav>
      </div>
    </header>
  )
}
