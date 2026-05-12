#!/bin/bash

# 1. Setup Environment
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"

SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"
AVDMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/avdmanager"
IMAGE="system-images;android-34;google_apis;arm64-v8a"

echo "🚀 Starting Screenshot Automation..."

# 2. Ensure System Image is installed
if ! $SDKMANAGER --list_installed | grep -q "$IMAGE"; then
    echo "📦 Downloading system image (this might take a few minutes)..."
    yes | $SDKMANAGER --install "$IMAGE"
fi

# 3. Create Emulators Function
create_avd() {
    local name=$1
    local device=$2
    if ! $AVDMANAGER list avd | grep -q "$name"; then
        echo "📱 Creating emulator: $name..."
        echo "no" | $AVDMANAGER create avd -n "$name" -k "$IMAGE" -d "$device" --force
    fi
}

create_avd "fastlane-phone" "pixel_9"
create_avd "fastlane-tablet-7" "7in WSVGA (Tablet)"
create_avd "fastlane-tablet-10" "10.1in WXGA (Tablet)"

# 4. Capture Function
capture_for() {
    local avd_name=$1
    local target_dir="android/fastlane/metadata/android/no-NO/images/$2"
    
    # 1. Ensure no other emulators are running
    echo "🧹 Cleaning up old emulators..."
    adb devices | grep emulator | cut -f1 | xargs -I {} adb -s {} emu kill > /dev/null 2>&1 || true
    sleep 5

    # 2. Cleanup old screenshots from temp folder
    rm -rf screenshots/*.png

    echo "🎬 Launching $avd_name..."
    emulator -avd "$avd_name" -no-audio -no-window -no-boot-anim -port 5554 &
    EMU_PID=$!
    SERIAL="emulator-5554"
    
    echo "⏳ Waiting for $avd_name ($SERIAL) to appear..."
    while ! adb devices | grep -q "$SERIAL"; do
        sleep 2
    done

    echo "⏳ Waiting for $avd_name to boot..."
    adb -s "$SERIAL" wait-for-device
    while [ "$(adb -s "$SERIAL" shell getprop sys.boot_completed)" != "1" ]; do
        sleep 5
    done
    
    echo "📸 Running Screenshot Robot on $SERIAL..."
    flutter drive \
      --device-id "$SERIAL" \
      --driver=test_driver/screenshots_test.dart \
      --target=integration_test/screenshot_test.dart
    
    echo "📂 Moving screenshots to $target_dir..."
    mkdir -p "$target_dir"
    mv screenshots/*.png "$target_dir/"
    
    echo "🛑 Shutting down $avd_name ($SERIAL)..."
    adb -s "$SERIAL" emu kill
    
    # Wait for it to actually disappear
    while adb devices | grep -q "$SERIAL"; do
        echo "⏳ Waiting for $SERIAL to exit..."
        sleep 2
    done
    sleep 2
}

# 5. Run the Loop
# Note: For now, I'll just do the phone to test. Un-comment the others for the full run!
capture_for "fastlane-phone" "phoneScreenshots"
capture_for "fastlane-tablet-7" "sevenInchScreenshots"
capture_for "fastlane-tablet-10" "tenInchScreenshots"

echo "✅ All screenshots captured and organized!"
