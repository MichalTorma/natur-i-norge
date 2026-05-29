#!/bin/bash
set -euo pipefail

SCREENSHOT_NAME="${1:-all}"

# iOS Screenshot Automation Script
#
# Usage:
#   ./scripts/automate_ios_screenshots.sh          # all 4 screenshots, 3 devices
#   ./scripts/automate_ios_screenshots.sh matrix   # matrix only
#
# Devices (App Store sizes):
#   iPhone 17 Pro Max, iPhone SE (3rd gen), iPad Pro 13-inch (M5)

IPHONE_ID="A6715548-2D67-4C04-9159-7992A70C7674"    # iPhone 17 Pro Max
IPHONE_SE_ID="D178596E-8A69-4A00-95C5-6D4A7426899F" # iPhone SE (3rd generation)
IPAD_ID="CB4C0D58-BE3B-4E90-8BE3-B8F49CC7ABB4"      # iPad Pro 13-inch (M5)

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET_DIR="$ROOT/fastlane/screenshots/ios/no"

echo "🍏 Starting iOS Screenshot Automation..."
if [ "$SCREENSHOT_NAME" != "all" ]; then
  echo "📸 Capturing only: $SCREENSHOT_NAME"
fi

screenshot_output_files() {
    case "$SCREENSHOT_NAME" in
        all)
            echo "1_home_screen.png 2_search_results.png 3_natb01_detail.png 4_natb01_matrix.png"
            ;;
        1|home|1_home_screen)
            echo "1_home_screen.png"
            ;;
        2|search|2_search_results)
            echo "2_search_results.png"
            ;;
        3|detail|3_natb01_detail)
            echo "3_natb01_detail.png"
            ;;
        4|matrix|4_natb01_matrix)
            echo "4_natb01_matrix.png"
            ;;
        *)
            echo "$SCREENSHOT_NAME.png"
            ;;
    esac
}

clean_target_screenshots() {
    local device_name=$1
    mkdir -p "$TARGET_DIR"
    echo "🧹 Clearing old $device_name screenshots in $TARGET_DIR ..."
    for file in $(screenshot_output_files); do
        rm -f "$TARGET_DIR/${device_name}-${file}"
    done
}

wait_for_simulator_ready() {
    local device_id=$1
    local name=$2

    # bootstatus -b already blocks until SpringBoard is up; confirm with simctl.
    for _ in $(seq 1 15); do
        if xcrun simctl list devices booted 2>/dev/null | /usr/bin/grep -F "$device_id" >/dev/null; then
            echo "✅ $name is booted and ready"
            return 0
        fi
        sleep 1
    done

    echo "❌ $name ($device_id) did not reach Booted state"
    return 1
}

boot_simulator() {
    local device_id=$1
    local name=$2

    echo "🧹 Shutting down other simulators..."
    xcrun simctl shutdown all >/dev/null 2>&1 || true

    echo "🎬 Booting $name ($device_id)..."
    xcrun simctl boot "$device_id" 2>/dev/null || true
    xcrun simctl bootstatus "$device_id" -b
    open -a Simulator
    xcrun simctl ui "$device_id" appearance light >/dev/null 2>&1 || true

    wait_for_simulator_ready "$device_id" "$name"
    sleep 3
}

capture_for_ios() {
    local device_id=$1
    local name=$2

    boot_simulator "$device_id" "$name"
    clean_target_screenshots "$name"
    rm -rf "$ROOT/screenshots"/*.png

    echo "📸 Running Screenshot Robot on $name..."
    DRIVE_ARGS=(
      --device-id "$device_id"
      --driver=test_driver/screenshots_test.dart
      --target=integration_test/screenshot_test.dart
    )
    if [ "$SCREENSHOT_NAME" != "all" ]; then
      DRIVE_ARGS+=(--dart-define=SCREENSHOTS="$SCREENSHOT_NAME")
    fi

    drive_ok=true
    if ! (cd "$ROOT" && flutter drive "${DRIVE_ARGS[@]}"); then
        drive_ok=false
        echo "⚠️  flutter drive reported failure on $name"
    fi

    echo "📂 Moving screenshots to $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
    shopt -s nullglob
    local files=("$ROOT/screenshots"/*.png)
    if [ ${#files[@]} -eq 0 ]; then
        echo "❌ No screenshots produced for $name"
        xcrun simctl shutdown "$device_id" || true
        exit 1
    fi
    for file in "${files[@]}"; do
        filename=$(basename "$file")
        mv "$file" "$TARGET_DIR/${name}-${filename}"
    done

    if [ "$drive_ok" = false ]; then
        local missing=0
        for file in $(screenshot_output_files); do
            if [ ! -f "$TARGET_DIR/${name}-${file}" ]; then
                missing=$((missing + 1))
            fi
        done
        if [ "$missing" -ne 0 ]; then
            echo "❌ Screenshot test failed on $name ($missing expected file(s) missing)"
            xcrun simctl shutdown "$device_id" || true
            exit 1
        fi
        echo "⚠️  flutter drive reported errors after capture, but all expected screenshots exist — continuing"
    fi

    echo "🧹 Removing alpha channels for App Store compatibility..."
    python3 -c "import os; from PIL import Image; directory = '$TARGET_DIR'; prefix = '$name'; [ (img := Image.open(os.path.join(directory, f)), img.convert('RGB').save(os.path.join(directory, f), 'PNG')) for f in os.listdir(directory) if f.startswith(prefix) and f.endswith('.png') ]" || true

    echo "🛑 Shutting down $name..."
    xcrun simctl shutdown "$device_id" || true
}

capture_for_ios "$IPHONE_ID" "iPhone-17-Pro-Max"
capture_for_ios "$IPHONE_SE_ID" "iPhone-SE"
capture_for_ios "$IPAD_ID" "iPad-Pro-13-inch"

echo "✅ All iOS screenshots captured and organized!"
