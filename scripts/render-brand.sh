#!/usr/bin/env sh
# Renders the brand pages to PNG with headless Chromium via Playwright.
# Run from anywhere: scripts/render-brand.sh
set -e
cd "$(dirname "$0")/.."
NODE_PATH="$(npm root -g)" node - <<'JS'
const { chromium } = require('playwright');
const path = require('path');
(async () => {
  const browser = await chromium.launch();
  const shots = [
    ['brand/og.html', 'og.png', 1200, 630, 1],
    ['brand/icon.html', 'favicon.png', 512, 512, 1],
    ['brand/icon.html', 'apple-touch-icon.png', 180, 180, 180 / 512],
  ];
  for (const [src, out, w, h, scale] of shots) {
    const page = await browser.newPage({ viewport: { width: Math.round(w / scale), height: Math.round(h / scale) }, deviceScaleFactor: scale });
    await page.goto('file://' + path.resolve(src));
    await page.evaluate(() => document.fonts.ready);
    await page.screenshot({ path: out, type: 'png' });
    await page.close();
    console.log('rendered', out);
  }
  await browser.close();
})();
JS
