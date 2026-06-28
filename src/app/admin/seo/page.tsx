"use client"

export default function AdminSeo() {
  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">SEO</h1>
      <div className="grid md:grid-cols-2 gap-4 mb-6">
        <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="font-semibold text-zinc-800 mb-2 text-sm">Sitemap</h2>
          <p className="text-sm text-zinc-400 mb-2">XML-Sitemap wird automatisch erstellt.</p>
          <a href="/sitemap.xml" target="_blank" className="text-indigo-600 text-sm hover:text-indigo-700 transition-colors">/sitemap.xml</a>
        </div>
        <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
          <h2 className="font-semibold text-zinc-800 mb-2 text-sm">Robots.txt</h2>
          <p className="text-sm text-zinc-400 mb-2">Suchmaschinen-Einstellungen.</p>
          <a href="/robots.txt" target="_blank" className="text-indigo-600 text-sm hover:text-indigo-700 transition-colors">/robots.txt</a>
        </div>
      </div>
      <div className="bg-white rounded-2xl border border-zinc-200 p-5 shadow-sm">
        <h2 className="font-semibold text-zinc-800 mb-3 text-sm">Meta-Informationen</h2>
        <p className="text-sm text-zinc-400">Seitentitel und -beschreibungen werden über layout.tsx verwaltet. Bearbeitung pro Seite folgt bald.</p>
      </div>
    </div>
  )
}
