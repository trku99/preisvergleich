"use client"

import { createClient } from "@/lib/supabase-client"

export default function AdminCampaigns() {
  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">Kampanyalar</h1>
      <div className="bg-white rounded-xl border p-5">
        <p className="text-sm text-zinc-500 mb-4">İndirim kampanyaları, kuponlar ve banner yönetimi.</p>
        <div className="grid md:grid-cols-3 gap-4">
          <div className="border rounded-lg p-4 text-center">
            <div className="text-2xl mb-1">🏷️</div>
            <div className="font-medium text-sm">Kampanyalar</div>
            <div className="text-xs text-zinc-400 mt-1">Yakında</div>
          </div>
          <div className="border rounded-lg p-4 text-center">
            <div className="text-2xl mb-1">🎫</div>
            <div className="font-medium text-sm">Kuponlar</div>
            <div className="text-xs text-zinc-400 mt-1">Yakında</div>
          </div>
          <div className="border rounded-lg p-4 text-center">
            <div className="text-2xl mb-1">🖼️</div>
            <div className="font-medium text-sm">Banner</div>
            <div className="text-xs text-zinc-400 mt-1">Yakında</div>
          </div>
        </div>
      </div>
    </div>
  )
}
