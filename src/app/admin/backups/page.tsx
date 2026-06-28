"use client"

export default function AdminBackups() {
  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Yedekleme</h1>
      <div className="grid md:grid-cols-3 gap-4">
        <div className="bg-white rounded-xl border p-5 text-center">
          <div className="text-3xl mb-2">🗄️</div>
          <div className="font-medium text-sm">Veritabanı Yedeği</div>
          <div className="text-xs text-zinc-400 mt-1">Supabase otomatik yedekleme yapar</div>
          <a href="https://supabase.com/dashboard/project/nlsmkveoqnjvdfngbjla/database/backups" target="_blank" className="text-blue-600 text-xs mt-2 inline-block hover:underline">
            Supabase Backups →
          </a>
        </div>
        <div className="bg-white rounded-xl border p-5 text-center">
          <div className="text-3xl mb-2">📁</div>
          <div className="font-medium text-sm">Dosya Yedeği</div>
          <div className="text-xs text-zinc-400 mt-1">GitHub üzerinde version control</div>
          <a href="https://github.com/trku99/preisvergleich" target="_blank" className="text-blue-600 text-xs mt-2 inline-block hover:underline">
            GitHub Repo →
          </a>
        </div>
        <div className="bg-white rounded-xl border p-5 text-center">
          <div className="text-3xl mb-2">⏱️</div>
          <div className="font-medium text-sm">Otomatik Yedekleme</div>
          <div className="text-xs text-zinc-400 mt-1">Supabase Daily Backup aktif</div>
        </div>
      </div>
    </div>
  )
}
