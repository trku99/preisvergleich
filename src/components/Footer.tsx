export function Footer() {
  return (
    <footer className="border-t bg-zinc-50 mt-auto">
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-4">
          <div>
            <h3 className="text-sm font-semibold text-zinc-900">PreisVergleich.ch</h3>
            <p className="mt-2 text-sm text-zinc-500">
              Der einfachste Weg, die besten Preise in der Schweiz zu finden.
            </p>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-zinc-900">Kategorien</h3>
            <ul className="mt-2 space-y-2">
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Smartphones</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Kopfhörer</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Gaming</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">TV & Audio</a></li>
            </ul>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-zinc-900">Shops</h3>
            <ul className="mt-2 space-y-2">
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Galaxus</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Digitec</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Microspot</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Brack</a></li>
            </ul>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-zinc-900">Rechtliches</h3>
            <ul className="mt-2 space-y-2">
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Datenschutz</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">Impressum</a></li>
              <li><a href="#" className="text-sm text-zinc-500 hover:text-zinc-900">AGB</a></li>
            </ul>
          </div>
        </div>
        <div className="mt-8 border-t pt-6 text-center text-xs text-zinc-400">
          PreisVergleich.ch - Alle Preise inkl. MwSt. zzgl. Versandkosten. Alle Angaben ohne Gewähr.
        </div>
      </div>
    </footer>
  )
}
