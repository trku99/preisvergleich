"use client"

export default function AdminBackups() {
  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-800 mb-6">Backup</h1>
      <div className="grid md:grid-cols-3 gap-4">
        {[
          { icon: "🗄️", title: "Datenbank-Backup", desc: "Supabase erstellt automatische Backups", link: "https://supabase.com/dashboard/project/nlsmkveoqnjvdfngbjla/database/backups", label: "Supabase Backups →" },
          { icon: "📁", title: "Datei-Backup", desc: "Versionskontrolle auf GitHub", link: "https://github.com/trku99/preisvergleich", label: "GitHub Repo →" },
          { icon: "⏱️", title: "Automatisches Backup", desc: "Supabase tägliches Backup aktiv", link: null, label: null },
        ].map((item) => (
          <div key={item.title} className="bg-white rounded-2xl border border-zinc-200 p-5 text-center shadow-sm transition-all duration-300 hover:border-zinc-300">
            <div className="text-3xl mb-3">{item.icon}</div>
            <div className="font-medium text-sm text-zinc-800">{item.title}</div>
            <div className="text-xs text-zinc-400 mt-1 mb-3">{item.desc}</div>
            {item.link && <a href={item.link} target="_blank" className="text-indigo-600 text-xs hover:text-indigo-700 transition-colors">{item.label}</a>}
          </div>
        ))}
      </div>
    </div>
  )
}
