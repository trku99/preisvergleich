"use client"

export default function AdminSeo() {
  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">SEO Yönetimi</h1>
      <div className="grid md:grid-cols-2 gap-4 mb-6">
        <div className="bg-white rounded-xl border p-5">
          <h2 className="font-semibold mb-2">Sitemap</h2>
          <p className="text-sm text-zinc-500 mb-2">XML sitemap otomatik oluşturulacak.</p>
          <a href="/sitemap.xml" target="_blank" className="text-blue-600 text-sm hover:underline">/sitemap.xml</a>
        </div>
        <div className="bg-white rounded-xl border p-5">
          <h2 className="font-semibold mb-2">Robots.txt</h2>
          <p className="text-sm text-zinc-500 mb-2">Arama motoru ayarları.</p>
          <a href="/robots.txt" target="_blank" className="text-blue-600 text-sm hover:underline">/robots.txt</a>
        </div>
      </div>
      <div className="bg-white rounded-xl border p-5">
        <h2 className="font-semibold mb-3">Meta Bilgileri</h2>
        <p className="text-sm text-zinc-500">Sayfa başlıkları ve açıklamaları layout.tsx üzerinden yönetiliyor. Yakında sayfa bazında düzenleme eklenecek.</p>
      </div>
    </div>
  )
}
