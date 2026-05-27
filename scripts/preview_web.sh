#!/bin/bash
set -e

# Serve docs/ with the same URL layout as GitHub Pages project sites.
# The Flutter build uses base-href /natur-i-norge/app/, so assets must be
# loaded from that path — not from /app/ when serving locally.

REPO_NAME="${GITHUB_PAGES_REPO:-natur-i-norge}"
PORT="${PORT:-8080}"

if [ ! -f docs/app/index.html ]; then
  echo "❌ No web build found in docs/app/"
  echo "   Run: ./publish.sh web"
  exit 1
fi

PREVIEW_ROOT=$(mktemp -d)
cleanup() { rm -rf "$PREVIEW_ROOT"; }
trap cleanup EXIT INT TERM

mkdir -p "$PREVIEW_ROOT/${REPO_NAME}"
rsync -a docs/ "$PREVIEW_ROOT/${REPO_NAME}/"

LANDING_URL="http://localhost:${PORT}/${REPO_NAME}/"
APP_URL="http://localhost:${PORT}/${REPO_NAME}/app/"
LEGACY_URL="http://localhost:${PORT}/${REPO_NAME}/v2.3/"

echo "🌐 Preview server (GitHub Pages layout)"
echo "   Landing page:  ${LANDING_URL}"
echo "   Web app:       ${APP_URL}"
if [ -f docs/v2.3/index.html ]; then
  echo "   Legacy v2.3:   ${LEGACY_URL}"
else
  echo "   Legacy v2.3:   (not synced — run ./scripts/sync_legacy_web_to_docs.sh)"
fi
echo "   Press Ctrl+C to stop."
echo ""

exec python3 -m http.server "$PORT" --directory "$PREVIEW_ROOT"
