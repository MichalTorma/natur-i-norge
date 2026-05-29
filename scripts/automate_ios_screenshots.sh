#!/bin/bash
set -euo pipefail

SCREENSHOT_NAME="${1:-all}"

# iOS Screenshot Automation Script

IPHONE_ID="A6715548-2D67-4C04-9159-7992A70C7674"    # iPhone 17 Pro Max
IPHONE_SE_ID="D178596E-8A69-4A00-95C5-6D4A7426899F" # iPhone SE (3rd generation)
IPAD_ID="CB4C0D58-BE3B-4E90-8BE3-B8F49CC7ABB4"      # iPad Pro 13-inch (M5)

echo "🍏 Starting iOS Screenshot Automation..."
if [ "$SCREENSHOT_NAME" != "all" ]; then
  echo "📸 Capturing only: $SCREENSHOT_NAME"
fi

capture_for_ios() {
    local device_id=$1
    local name=$2
    local target_dir="fastlane/screenshots/ios/no"

    echo "🎬 Launching Simulator: $name ($device_id)..."
    xcrun simctl boot "$device_id" || true
    open -a Simulator

    echo "⏳ Waiting for simulator to boot..."
    xcrun simctl bootstatus "$device_id"
    sleep 10

    rm -rf screenshots/*.png

    echo "📸 Running Screenshot Robot on $name..."
    DRIVE_ARGS=(
      --device-id "$device_id"
      --driver=test_driver/screenshots_test.dart
      --target=integration_test/screenshot_test.dart
    )
    if [ "$SCREENSHOT_NAME" != "all" ]; then
      DRIVE_ARGS+=(--dart-define=SCREENSHOTS="$SCREENSHOT_NAME")
    fi

    if ! flutter drive "${DRIVE_ARGS[@]}"; then
        echo "❌ Screenshot test failed on $name"
        xcrun simctl shutdown "$device_id" || true
        exit 1
    fi

    echo "📂 Moving screenshots to $target_dir..."
    mkdir -p "$target_dir"
    shopt -s nullglob
    local files=(screenshots/*.png)
    if [ ${#files[@]} -eq 0 ]; then
        echo "❌ No screenshots produced for $name"
        xcrun simctl shutdown "$device_id" || true
        exit 1
    fi
    for file in "${files[@]}"; do
        filename=$(basename "$file")
        mv "$file" "$target_dir/${name}-${filename}"
    done

    echo "🧹 Removing alpha channels for App Store compatibility..."
    python3 -c "import os; from PIL import Image; directory = '$target_dir'; [ (img := Image.open(os.path.join(directory, f)), img.convert('RGB').save(os.path.join(directory, f), 'PNG')) for f in os.listdir(directory) if f.startswith('$name') and f.endswith('.png') ]"

    echo "🛑 Shutting down $name..."
    xcrun simctl shutdown "$device_id"
}

capture_for_ios "$IPHONE_ID" "iPhone-17-Pro-Max"
capture_for_ios "$IPHONE_SE_ID" "iPhone-SE"
capture_for_ios "$IPAD_ID" "iPad-Pro-13-inch"

echo "✅ All iOS screenshots captured and organized!"
