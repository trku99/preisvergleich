import Link from "next/link"
import { SearchBar } from "./SearchBar"
import { AuthButton } from "./AuthButton"
import { LanguageSwitcher } from "./LanguageSwitcher"

export function Header() {
  return (
    <header className="sticky top-0 z-50 w-full border-b bg-white/95 backdrop-blur supports-[backdrop-filter]:bg-white/60">
      <div className="mx-auto flex h-16 max-w-7xl items-center gap-4 px-4 sm:px-6 lg:px-8">
        <Link href="/" className="flex items-center gap-2 font-bold text-xl shrink-0">
          <span className="flex h-8 w-8 items-center justify-center rounded-lg bg-blue-600 text-white text-sm font-bold">P</span>
          <span className="hidden sm:inline">PreisVergleich</span>
          <span className="text-sm text-blue-600 font-medium">.ch</span>
        </Link>
        <div className="flex-1 max-w-xl mx-auto">
          <SearchBar />
        </div>
        <nav className="flex items-center gap-4 shrink-0">
          <LanguageSwitcher />
          <Link href="/products" className="text-sm font-medium text-zinc-600 hover:text-zinc-900 transition-colors">Produkte</Link>
          <Link href="/favorites" className="text-sm font-medium text-zinc-600 hover:text-zinc-900 transition-colors">Favoriten</Link>
          <Link href="/admin" className="text-sm font-medium text-zinc-600 hover:text-zinc-900 transition-colors">Admin</Link>
          <AuthButton />
        </nav>
      </div>
    </header>
  )
}
