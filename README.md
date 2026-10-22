# yoomee.com

A single static page saying the domain yoomee.com is for sale.

- `index.html`, `styles.css` and the self-hosted font in `fonts/` are the whole site.
- `404.html` sends unknown addresses to the home page.
- Brand images are rendered from `brand/og.html` (to `og.png`) and `brand/icon.html` (to `favicon.png` and `apple-touch-icon.png`) with `scripts/render-brand.sh`. Change the page, then re-render. Never edit the PNGs by hand.
- Hosted on GitHub Pages from the `main` branch, root folder. `.nojekyll` stops Pages running Jekyll. `CNAME` holds the custom domain.
- Google Analytics 4 is wired in `index.html` with the placeholder ID `G-XXXXXXXXXX`. Replace it with the real measurement ID.
