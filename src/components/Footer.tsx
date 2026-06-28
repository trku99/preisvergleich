export function Footer() {
  return (
    <footer className="border-t border-zinc-200/60 bg-white/50 backdrop-blur-sm mt-auto">
      <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
        <div className="grid grid-cols-2 gap-8 sm:grid-cols-4">
          <div className="col-span-2 sm:col-span-1">
            <div className="flex items-center gap-2 mb-3">
              <span className="flex h-7 w-7 items-center justify-center rounded-lg bg-gradient-to-br from-indigo-500 to-purple-600 text-white text-xs font-bold">P</span>
              <span className="text-sm font-semibold">PreisVergleich</span>
            </div>
            <p className="text-sm text-zinc-400 leading-relaxed max-w-xs">
              Der einfachste Weg, die besten Preise in der Schweiz zu finden.
            </p>
          </div>
          <div>
            <h3 className="text-xs font-semibold text-zinc-800 uppercase tracking-wider mb-3">Kategorien</h3>
            <ul className="space-y-2">
              {["Smartphones", "Kopfhörer", "Gaming", "TV & Audio"].map((c) => (
                <li key={c}><a href="#" className="text-sm text-zinc-400 hover:text-zinc-800 transition-colors">{c}</a></li>
              ))}
            </ul>
          </div>
          <div>
            <h3 className="text-xs font-semibold text-zinc-800 uppercase tracking-wider mb-3">Shops</h3>
            <ul className="space-y-2">
              {["Galaxus", "Digitec", "Microspot", "Interdiscount"].map((s) => (
                <li key={s}><a href="#" className="text-sm text-zinc-400 hover:text-zinc-800 transition-colors">{s}</a></li>
              ))}
            </ul>
          </div>
          <div>
            <h3 className="text-xs font-semibold text-zinc-800 uppercase tracking-wider mb-3">Rechtliches</h3>
            <ul className="space-y-2">
              {["Datenschutz", "Impressum", "AGB"].map((r) => (
                <li key={r}><a href="#" className="text-sm text-zinc-400 hover:text-zinc-800 transition-colors">{r}</a></li>
              ))}
            </ul>
          </div>
        </div>
        <div className="mt-10 pt-6 border-t border-zinc-200/50 text-center text-xs text-zinc-300">
          PreisVergleich.ch – Alle Preise inkl. MwSt. zzgl. Versandkosten. Alle Angaben ohne Gewähr.
        </div>
      </div>
    </footer>
  )
}
