// Deep scrape Brack for real product URLs
const { chromium } = require("playwright")

const products = [
  "Sony WH-1000XM5",
  "Dyson V15 Detect Staubsauger",
  "Apple iPhone 16",
  "Samsung Galaxy S25",
  "AirPods Pro 3",
  "Nintendo Switch OLED",
]

async function getRealUrls() {
  const browser = await chromium.launch({ headless: true })
  const context = await browser.newContext({
    userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
  })

  for (const p of products.slice(0, 2)) {
    const page = await context.newPage()
    try {
      const searchUrl = `https://www.brack.ch/s?q=${encodeURIComponent(p)}`
      console.log(`\nSearching Brack for: ${p}`)
      console.log(`URL: ${searchUrl}`)
      await page.goto(searchUrl, { timeout: 15000, waitUntil: "networkidle" })
      await page.waitForTimeout(2000)

      const html = await page.content()
      console.log(`HTML length: ${html.length}`)
      
      // Extract all links
      const links = await page.evaluate(() => {
        const allLinks = Array.from(document.querySelectorAll("a"))
        return allLinks.slice(0, 50).map(a => ({ href: a.href.substring(0, 150), text: a.textContent?.trim().substring(0, 50) }))
      })
      console.log(`Found ${links.length} links`)
      for (const l of links) {
        if (l.href.includes("/product/") || l.href.includes("/p/") || l.href.includes("/artikel/")) {
          console.log(`  PRODUCT LINK: ${l.href} | ${l.text}`)
        }
      }
    } catch (e) {
      console.log(`  Error: ${e.message.substring(0, 100)}`)
    }
    await page.close()
  }

  await browser.close()
}

getRealUrls().catch(console.error)
