"use client"

export default function AdminIntegrations() {
  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Entegrasyonlar</h1>
      <div className="grid md:grid-cols-2 gap-4">
        {[
          { icon: "📊", title: "Google Analytics", status: "Ayarlanmadı" },
          { icon: "🏷️", title: "Google Tag Manager", status: "Ayarlanmadı" },
          { icon: "🔍", title: "Google Search Console", status: "Ayarlanmadı" },
          { icon: "📧", title: "SMTP", status: "Ayarlanmadı" },
          { icon: "💬", title: "SMS Servisleri", status: "Ayarlanmadı" },
          { icon: "🔗", title: "Affiliate Ağları", status: "Ayarlanmadı" },
        ].map((item) => (
          <div key={item.title} className="bg-white rounded-xl border p-5 flex items-center justify-between">
            <div className="flex items-center gap-3">
              <span className="text-2xl">{item.icon}</span>
              <div>
                <div className="font-medium text-sm">{item.title}</div>
                <div className="text-xs text-zinc-400">{item.status}</div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
