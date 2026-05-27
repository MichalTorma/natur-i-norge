#!/bin/bash
set -e

# Copy the frozen v2.3 web build into docs/v2.3/ for GitHub Pages.
# Patches HTML/manifest so assets resolve under /natur-i-norge/v2.3/

# shellcheck source=legacy_web_root.sh
source "$(dirname "$0")/legacy_web_root.sh"
ARCHIVE_WEB="$(_legacy_web_root)" || {
  echo "❌ No legacy web build found."
  echo "   Copy prod web/ to archive/v2.3-web/ or archive/v2.3-web/web/"
  echo "   (need index.html + main.dart.js — see archive/v2.3-web/README.md)"
  exit 1
}
DOCS_LEGACY="$(cd "$(dirname "$0")/.." && pwd)/docs/v2.3"
REPO_NAME="${GITHUB_PAGES_REPO:-natur-i-norge}"
BASE_HREF="/${REPO_NAME}/v2.3/"

echo "   Source: ${ARCHIVE_WEB}"

echo "📦 Syncing legacy web → docs/v2.3/ (base-href: ${BASE_HREF})..."
rm -rf "${DOCS_LEGACY}"
mkdir -p "${DOCS_LEGACY}"
rsync -a "${ARCHIVE_WEB}/" "${DOCS_LEGACY}/"

python3 "$(dirname "$0")/patch_legacy_web_for_pages.py" "${BASE_HREF}" "${DOCS_LEGACY}"

SIZE=$(du -sh "${DOCS_LEGACY}" | cut -f1)
echo "✅ Legacy web ready in docs/v2.3/ (${SIZE})"
echo "   GitHub Pages: https://geco-nhm.github.io/${REPO_NAME}/v2.3/"
echo "   Preview:      ./scripts/preview_web.sh"
