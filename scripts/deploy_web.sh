#!/bin/bash
set -e

# Build (and optionally deploy) the Flutter web app to GitHub Pages.
#
# The site is already configured to serve from docs/ on main, so the web app
# is published under docs/app/ and available at:
#   https://geco-nhm.github.io/natur-i-norge/app/

DEPLOY=false
for arg in "$@"; do
  case $arg in
    --deploy|-d)
      DEPLOY=true
      ;;
  esac
done

REPO_NAME="${GITHUB_PAGES_REPO:-natur-i-norge}"
WEB_BASE_HREF="/${REPO_NAME}/app/"
WEB_OUTPUT_DIR="docs/app"
BUILD_DIR="build/web"

echo "🌐 Building Flutter web app (base-href: ${WEB_BASE_HREF})..."
flutter build web --release --base-href="${WEB_BASE_HREF}"

echo "📁 Syncing build output to ${WEB_OUTPUT_DIR}/..."
rm -rf "${WEB_OUTPUT_DIR}"
mkdir -p "${WEB_OUTPUT_DIR}"
rsync -a --delete "${BUILD_DIR}/" "${WEB_OUTPUT_DIR}/"

# Prevent GitHub Pages from running Jekyll (Flutter uses paths Jekyll ignores).
touch docs/.nojekyll

if [ -f archive/v2.3-web/web/index.html ]; then
  ./scripts/sync_legacy_web_to_docs.sh
else
  echo "ℹ️  Skipping docs/v2.3/ (no archive at archive/v2.3-web/web/)"
fi

BUILD_SIZE=$(du -sh "${WEB_OUTPUT_DIR}" | cut -f1)
echo "✅ Web build ready in ${WEB_OUTPUT_DIR}/ (${BUILD_SIZE})"
echo "   Preview locally:  ./scripts/preview_web.sh"
echo "   Then open:        http://localhost:8080/${REPO_NAME}/app/"

if [ "$DEPLOY" = false ]; then
  echo ""
  echo "ℹ️  To publish to GitHub Pages, run:"
  echo "   ./publish.sh web --deploy"
  exit 0
fi

if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "❌ Error: not inside a git repository"
  exit 1
fi

VERSION=$(grep '^version:' pubspec.yaml | awk '{print $2}')
git add docs/.nojekyll
git add -f docs/app
if [ -d docs/v2.3 ] && [ -f docs/v2.3/index.html ]; then
  git add -f docs/v2.3
fi

if git diff --cached --quiet; then
  echo "ℹ️  No changes to deploy (build output is unchanged)."
else
  git commit -m "$(cat <<EOF
Deploy web app v${VERSION}

Built with base-href ${WEB_BASE_HREF} for GitHub Pages.
EOF
)"
  echo "📤 Pushing to origin..."
  git push origin HEAD
  echo "✅ Deployed! Live at: https://geco-nhm.github.io/${REPO_NAME}/app/"
  if [ -f docs/v2.3/index.html ]; then
    echo "   Legacy v2.3: https://geco-nhm.github.io/${REPO_NAME}/v2.3/"
  fi
fi
