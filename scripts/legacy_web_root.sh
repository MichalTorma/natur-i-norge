#!/bin/bash
# Resolve the v2.3 legacy web build directory (source tree for sync/preview).
# Supports either layout:
#   archive/v2.3-web/web/   (recommended)
#   archive/v2.3-web/       (prod dump directly into the folder)

_legacy_web_root() {
  local base
  base="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/archive/v2.3-web"
  if [ -f "${base}/web/index.html" ]; then
    echo "${base}/web"
  elif [ -f "${base}/index.html" ]; then
    echo "${base}"
  else
    return 1
  fi
}

if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  _legacy_web_root || exit 1
fi
