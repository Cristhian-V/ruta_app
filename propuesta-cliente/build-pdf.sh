#!/usr/bin/env bash
# Genera el PDF de la propuesta a partir del borrador en Markdown.
# Uso:  ./build-pdf.sh
# Requiere: npx (node) y chromium.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
CHROME="${CHROME:-chromium}"
MD="$DIR/borrador-propuesta.md"
BODY="$DIR/_body.html"
HTML="$DIR/_build.html"
PDF="$DIR/borrador-propuesta.pdf"

# 1) Markdown -> HTML (GFM, con tablas)
npx --yes marked -i "$MD" -o "$BODY" --gfm

# 2) Envolver con el CSS de impresión
{
  printf '%s' '<!doctype html><html lang="es"><head><meta charset="utf-8">'
  printf '%s' '<title>Propuesta — App Ruta</title><style>'
  cat "$DIR/pdf-style.css"
  printf '%s' '</style></head><body>'
  cat "$BODY"
  printf '%s' '</body></html>'
} > "$HTML"

# 3) HTML -> PDF
"$CHROME" --headless --no-sandbox --disable-gpu \
  --no-pdf-header-footer \
  --print-to-pdf="$PDF" \
  "file://$HTML" >/dev/null 2>&1

echo "PDF generado: $PDF"
