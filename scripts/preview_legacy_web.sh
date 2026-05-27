#!/bin/bash
set -e

# Serve the frozen v2.3 production web build from archive/v2.3-web/web/
#
# Usage:
#   ./scripts/preview_legacy_web.sh
#   PORT=9090 ./scripts/preview_legacy_web.sh

ARCHIVE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WEB_ROOT="${ARCHIVE_ROOT}/archive/v2.3-web/web"
PORT="${PORT:-8081}"

if [ ! -f "${WEB_ROOT}/index.html" ]; then
  echo "❌ No legacy web build in archive/v2.3-web/web/"
  echo ""
  echo "   Copy the production web/ folder there, e.g.:"
  echo "   rsync -a --delete /path/to/prod/web/ archive/v2.3-web/web/"
  echo ""
  echo "   See archive/v2.3-web/README.md"
  exit 1
fi

if [ ! -f "${WEB_ROOT}/main.dart.js" ]; then
  echo "⚠️  Warning: main.dart.js not found — build may be incomplete."
fi

URL="http://localhost:${PORT}/"

echo "🕰️  Legacy v2.3 web preview"
echo "   Root: ${WEB_ROOT}"
echo "   URL:  ${URL}"
echo "   Press Ctrl+C to stop."
echo ""

exec python3 -m http.server "$PORT" --directory "$WEB_ROOT"
