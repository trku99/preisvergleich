"use client"

export default function AdminLogs() {
  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Loglar</h1>
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
        {[
          { icon: "⚠️", title: "Hata Kayıtları", desc: "Sistem hataları" },
          { icon: "🔌", title: "API Logları", desc: "API istekleri" },
          { icon: "👤", title: "Kullanıcı Hareketleri", desc: "Kullanıcı aktiviteleri" },
          { icon: "🛡️", title: "Admin İşlemleri", desc: "Yönetici hareketleri" },
          { icon: "🔐", title: "Güvenlik Logları", desc: "Güvenlik olayları" },
        ].map((item) => (
          <div key={item.title} className="bg-white rounded-xl border p-5 text-center">
            <div className="text-3xl mb-2">{item.icon}</div>
            <div className="font-medium text-sm">{item.title}</div>
            <div className="text-xs text-zinc-400 mt-1">{item.desc}</div>
            <div className="text-xs text-zinc-300 mt-2">Yakında</div>
          </div>
        ))}
      </div>
    </div>
  )
}
