#!/bin/bash
set -e

# Copy the frozen v2.3 web build into docs/v2.3/ for GitHub Pages.
# Patches HTML/manifest so assets resolve under /natur-i-norge/v2.3/

ARCHIVE_WEB="$(cd "$(dirname "$0")/.." && pwd)/archive/v2.3-web/web"
DOCS_LEGACY="$(cd "$(dirname "$0")/.." && pwd)/docs/v2.3"
REPO_NAME="${GITHUB_PAGES_REPO:-natur-i-norge}"
BASE_HREF="/${REPO_NAME}/v2.3/"

if [ ! -f "${ARCHIVE_WEB}/index.html" ]; then
  echo "❌ No legacy web build in archive/v2.3-web/web/"
  echo "   Copy production files there first (see archive/v2.3-web/README.md)"
  exit 1
fi

echo "📦 Syncing legacy web → docs/v2.3/ (base-href: ${BASE_HREF})..."
rm -rf "${DOCS_LEGACY}"
mkdir -p "${DOCS_LEGACY}"
rsync -a "${ARCHIVE_WEB}/" "${DOCS_LEGACY}/"

python3 "$(dirname "$0")/patch_legacy_web_for_pages.py" "${BASE_HREF}" "${DOCS_LEGACY}"

SIZE=$(du -sh "${DOCS_LEGACY}" | cut -f1)
echo "✅ Legacy web ready in docs/v2.3/ (${SIZE})"
echo "   GitHub Pages: https://geco-nhm.github.io/${REPO_NAME}/v2.3/"
echo "   Preview:      ./scripts/preview_web.sh"
