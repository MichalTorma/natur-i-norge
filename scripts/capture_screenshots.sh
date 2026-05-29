#!/bin/bash
set -e

# Capture one or all store screenshots on every configured device.
#
# Usage:
#   ./scripts/capture_screenshots.sh                         # all screenshots, all platforms
#   ./scripts/capture_screenshots.sh 4_natb01_matrix         # one shot, Android + iOS
#   ./scripts/capture_screenshots.sh matrix android          # one shot, Android only
#   ./scripts/capture_screenshots.sh 4 ios                   # alias, iOS only
#
# Debug Android on a visible emulator (single phone):
#   HEADED=1 AVD=fastlane-phone ./scripts/capture_screenshots.sh matrix android
#
# iOS runs 3 simulators (iPhone 17 Pro Max, iPhone SE, iPad Pro 13").
# Xcode only sees a simulator after it is fully booted — the script handles that.
#
# Aliases: 1/home, 2/search, 3/detail, 4/matrix

SCREENSHOT="${1:-all}"
PLATFORM="${2:-all}"

case "$PLATFORM" in
  all|android|ios) ;;
  *)
    echo "Usage: $0 [screenshot] [all|android|ios]"
    echo ""
    echo "Screenshots:"
    echo "  1_home_screen, 2_search_results, 3_natb01_detail, 4_natb01_matrix"
    echo "  Aliases: 1/home, 2/search, 3/detail, 4/matrix"
    exit 1
    ;;
esac

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

run_android=false
run_ios=false
case "$PLATFORM" in
  all)
    run_android=true
    run_ios=true
    ;;
  android) run_android=true ;;
  ios) run_ios=true ;;
esac

if [ "$run_android" = true ]; then
  ./scripts/automate_screenshots.sh "$SCREENSHOT"
fi

if [ "$run_ios" = true ]; then
  ./scripts/automate_ios_screenshots.sh "$SCREENSHOT"
fi

echo "✅ Done."
