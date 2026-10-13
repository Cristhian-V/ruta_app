#!/usr/bin/env bash
# Regenera las capturas PNG a partir de los mockups HTML/CSS.
# Uso:  ./render.sh
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
CHROME="${CHROME:-chromium}"
OUT="$DIR/capturas"
mkdir -p "$OUT"

# Resolución por defecto (marco de teléfono). El admin usa una más ancha.
PHONE_SIZE="416,836"
ADMIN_SIZE="1228,768"

for html in "$DIR"/mockups/*.html; do
  name="$(basename "$html" .html)"
  size="$PHONE_SIZE"
  [[ "$name" == *admin* ]] && size="$ADMIN_SIZE"

  "$CHROME" --headless --no-sandbox --disable-gpu --hide-scrollbars \
    --force-device-scale-factor=2 \
    --default-background-color=00000000 \
    --screenshot="$OUT/$name.png" \
    --window-size="$size" \
    "file://$html" >/dev/null 2>&1

  echo "✓ $name.png ($size)"
done

echo "Listo. Capturas en: $OUT"
