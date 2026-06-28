"use client"

import { useState, useRef } from "react"
import { createClient } from "@/lib/supabase-client"

export default function ImportProducts() {
  const [file, setFile] = useState<File | null>(null)
  const [importing, setImporting] = useState(false)
  const [result, setResult] = useState<any>(null)
  const [error, setError] = useState("")
  const [preview, setPreview] = useState<string[][]>([])
  const inputRef = useRef<HTMLInputElement>(null)
  const supabase = createClient()

  function onFileChange(e: React.ChangeEvent<HTMLInputElement>) {
    const f = e.target.files?.[0]
    if (!f) return
    setFile(f)
    setResult(null)
    setError("")

    const reader = new FileReader()
    reader.onload = (ev) => {
      const text = ev.target?.result as string
      const lines = text.split("\n").filter(l => l.trim()).slice(0, 6)
      setPreview(lines.map(l => l.split(",").map(v => v.trim())))
    }
    reader.readAsText(f)
  }

  async function doImport() {
    if (!file) return
    setImporting(true)
    setError("")
    setResult(null)

    const formData = new FormData()
    formData.append("file", file)

    try {
      const res = await fetch("/api/admin/import-csv", {
        method: "POST",
        body: formData,
      })
      const data = await res.json()
      if (!res.ok) {
        setError(data.error + (data.errors?.length ? "\n" + data.errors.slice(0, 5).join("\n") : ""))
      } else {
        setResult(data)
      }
    } catch (err: any) {
      setError(err.message)
    }
    setImporting(false)
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-zinc-800">CSV Import</h1>
        <a href="/sample-products.csv" download className="text-sm text-indigo-600 hover:text-indigo-500">Vorlage herunterladen ↓</a>
      </div>

      <div className="bg-white rounded-2xl border border-zinc-200 p-6 shadow-sm max-w-2xl mb-6">
        <div
          className="border-2 border-dashed border-zinc-300 rounded-xl p-8 text-center cursor-pointer hover:border-indigo-400 transition-colors"
          onClick={() => inputRef.current?.click()}
        >
          <div className="text-4xl mb-2">📄</div>
          <p className="text-sm text-zinc-500 mb-1">
            {file ? file.name : "CSV-Datei hier klicken oder ziehen"}
          </p>
          <p className="text-xs text-zinc-400">Spalten: name, brand, category, ean, mpn, description, image_url</p>
          <input ref={inputRef} type="file" accept=".csv" onChange={onFileChange} className="hidden" />
        </div>

        {preview.length > 0 && (
          <div className="mt-4">
            <p className="text-xs text-zinc-400 mb-2">Vorschau ({preview.length - 1} Zeilen):</p>
            <div className="overflow-x-auto">
              <table className="w-full text-xs">
                <thead>
                  <tr className="bg-zinc-50">
                    {preview[0]?.map((h, i) => <th key={i} className="px-2 py-1 text-left font-medium text-zinc-600">{h}</th>)}
                  </tr>
                </thead>
                <tbody>
                  {preview.slice(1).map((row, i) => (
                    <tr key={i} className="border-t border-zinc-100">
                      {row.map((v, j) => <td key={j} className="px-2 py-1 text-zinc-500 truncate max-w-32">{v}</td>)}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {file && (
          <button onClick={doImport} disabled={importing}
            className="mt-4 rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-2 text-sm text-white hover:from-indigo-500 hover:to-purple-500 disabled:opacity-50 transition-all shadow-md">
            {importing ? "Importiere..." : `${result ? "Erneut importieren" : "Import starten"}`}
          </button>
        )}
      </div>

      {error && (
        <div className="bg-red-50 border border-red-200 rounded-2xl p-4 max-w-2xl mb-6">
          <p className="text-sm text-red-700 whitespace-pre-line">{error}</p>
        </div>
      )}

      {result && (
        <div className="bg-white rounded-2xl border border-zinc-200 p-6 shadow-sm max-w-2xl">
          <h2 className="text-sm font-semibold text-zinc-700 mb-3">Import-Ergebnis</h2>
          <div className="grid grid-cols-3 gap-4 text-center">
            <div className="p-4 rounded-xl bg-green-50 border border-green-200">
              <div className="text-2xl font-bold text-green-600">{result.result?.inserted || 0}</div>
              <div className="text-xs text-green-700 mt-1">Neu hinzugefügt</div>
            </div>
            <div className="p-4 rounded-xl bg-blue-50 border border-blue-200">
              <div className="text-2xl font-bold text-blue-600">{result.result?.updated || 0}</div>
              <div className="text-xs text-blue-700 mt-1">Aktualisiert</div>
            </div>
            <div className="p-4 rounded-xl bg-zinc-50 border border-zinc-200">
              <div className="text-2xl font-bold text-zinc-600">{result.result?.skipped || 0}</div>
              <div className="text-xs text-zinc-600 mt-1">Übersprungen</div>
            </div>
          </div>
          <p className="text-xs text-zinc-400 mt-3">Total verarbeitet: {result.total} Zeilen</p>
          {result.errors?.length > 0 && (
            <div className="mt-3 p-3 bg-amber-50 rounded-xl border border-amber-200">
              <p className="text-xs text-amber-700 font-medium mb-1">Warnungen ({result.errors.length}):</p>
              {result.errors.slice(0, 5).map((e: string, i: number) => (
                <p key={i} className="text-xs text-amber-600">{e}</p>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}
