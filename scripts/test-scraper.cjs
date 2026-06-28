// Test if Playwright can access shop pages
const { chromium } = require("playwright")

const shops = [
  { name: "Galaxus", url: "https://www.galaxus.ch/en/search?q=Sony+WH-1000XM5" },
  { name: "Digitec", url: "https://www.digitec.ch/en/search?q=Sony+WH-1000XM5" },
  { name: "Brack", url: "https://www.brack.ch/s?q=Sony+WH-1000XM5" },
  { name: "Microspot", url: "https://www.microspot.ch/search?q=Sony+WH-1000XM5" },
]

async function test() {
  const browser = await chromium.launch({ headless: true })
  const context = await browser.newContext({
    userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
  })

  for (const shop of shops) {
    try {
      const page = await context.newPage()
      console.log(`Testing ${shop.name}...`)
      await page.goto(shop.url, { timeout: 30000, waitUntil: "domcontentloaded" })
      const title = await page.title()
      console.log(`  Title: ${title.substring(0, 80)}`)
      console.log(`  URL: ${page.url().substring(0, 100)}`)
      const links = await page.evaluate(() => {
        const anchors = document.querySelectorAll("a[href*='/product']")
        return Array.from(anchors).slice(0, 3).map(a => ({ href: a.href.substring(0, 120), text: a.textContent?.trim().substring(0, 50) || "" }))
      })
      console.log(`  Product links: ${JSON.stringify(links)}`)
      await page.close()
    } catch (e) {
      console.log(`  Error: ${e.message}`)
    }
  }

  await browser.close()
  console.log("Done")
}

test().catch(console.error)
