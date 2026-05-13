#!/bin/bash

# iOS Screenshot Automation Script

IPHONE_ID="A6715548-2D67-4C04-9159-7992A70C7674"    # iPhone 17 Pro Max
IPHONE_SE_ID="D178596E-8A69-4A00-95C5-6D4A7426899F" # iPhone SE (3rd generation)
IPAD_ID="CB4C0D58-BE3B-4E90-8BE3-B8F49CC7ABB4"      # iPad Pro 13-inch (M5)

echo "🍏 Starting iOS Screenshot Automation..."

capture_for_ios() {
    local device_id=$1
    local name=$2
    local target_dir="fastlane/screenshots/ios/no-NO"
    
    echo "🎬 Launching Simulator: $name ($device_id)..."
    xcrun simctl boot "$device_id" || true
    open -a Simulator # Ensure the simulator app is open
    
    echo "⏳ Waiting for simulator to boot..."
    xcrun simctl bootstatus "$device_id"
    
    # Give it a few extra seconds to settle
    sleep 10

    # Cleanup old screenshots from temp folder
    rm -rf screenshots/*.png

    echo "📸 Running Screenshot Robot on $name..."
    flutter drive \
      --device-id "$device_id" \
      --driver=test_driver/screenshots_test.dart \
      --target=integration_test/screenshot_test.dart
    
    echo "📂 Moving screenshots to $target_dir..."
    mkdir -p "$target_dir"
    for file in screenshots/*.png; do
        filename=$(basename "$file")
        mv "$file" "$target_dir/${name}-${filename}"
    done
    
    echo "🛑 Shutting down $name..."
    xcrun simctl shutdown "$device_id"
}

# Run the captures
capture_for_ios "$IPHONE_ID" "iPhone-17-Pro-Max"
capture_for_ios "$IPHONE_SE_ID" "iPhone-SE"
capture_for_ios "$IPAD_ID" "iPad-Pro-13-inch"

echo "✅ All iOS screenshots captured and organized!"
