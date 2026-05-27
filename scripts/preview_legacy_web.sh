#!/bin/bash
set -e

# Serve the frozen v2.3 production web build from archive/v2.3-web/web/
#
# Usage:
#   ./scripts/preview_legacy_web.sh
#   PORT=9090 ./scripts/preview_legacy_web.sh

# shellcheck source=legacy_web_root.sh
source "$(dirname "$0")/legacy_web_root.sh"
WEB_ROOT="$(_legacy_web_root)" || {
  echo "❌ No legacy web build found."
  echo "   Copy prod web/ to archive/v2.3-web/ or archive/v2.3-web/web/"
  exit 1
}
PORT="${PORT:-8081}"

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
