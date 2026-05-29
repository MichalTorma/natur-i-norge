#!/bin/bash
set -euo pipefail

SCREENSHOT_NAME="${1:-all}"

# Optional debugging:
#   HEADED=1                         show the emulator window (default is headless)
#   AVD=fastlane-phone               run a single AVD instead of all three
#   PAUSE_BEFORE_DRIVE=1             wait for Enter before starting flutter drive
#
# Examples:
#   HEADED=1 AVD=fastlane-phone ./scripts/automate_screenshots.sh matrix
#   HEADED=1 PAUSE_BEFORE_DRIVE=1 ./scripts/automate_screenshots.sh matrix

# 1. Setup Environment
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"

SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"
AVDMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/avdmanager"
IMAGE="system-images;android-34;google_apis;arm64-v8a"

echo "🚀 Starting Screenshot Automation..."
if [ "$SCREENSHOT_NAME" != "all" ]; then
  echo "📸 Capturing only: $SCREENSHOT_NAME"
fi
if [ "${HEADED:-0}" = "1" ]; then
  echo "🖥️  Headed mode: emulator window will be visible"
fi

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

# Keep AVDs lightweight on Apple Silicon (GPU off + high core count freezes macOS).
configure_avd() {
    local avd_name=$1
    local config="$HOME/.android/avd/${avd_name}.avd/config.ini"
    [ -f "$config" ] || return 0

    for key_value in \
        "hw.gpu.enabled=yes" \
        "hw.gpu.mode=host" \
        "hw.cpu.ncore=2" \
        "showDeviceFrame=no"; do
        local key="${key_value%%=*}"
        local value="${key_value#*=}"
        if grep -q "^${key}=" "$config"; then
            sed -i '' "s|^${key}=.*|${key}=${value}|" "$config"
        else
            echo "${key}=${value}" >> "$config"
        fi
    done
}

for avd_name in fastlane-phone fastlane-tablet-7 fastlane-tablet-10; do
    configure_avd "$avd_name"
done

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APK="$ROOT/build/app/outputs/flutter-apk/app-debug.apk"

echo "🔨 Building debug APK once for all devices..."
(cd "$ROOT" && flutter build apk --debug)

# qcow2 userdata images can balloon to 100GB+ on disk and freeze the host.
repair_bloated_avd_disk() {
    local avd_name=$1
    local userdata="$HOME/.android/avd/${avd_name}.avd/userdata-qemu.img.qcow2"
    [ -f "$userdata" ] || return 0

    local disk_usage_kb
    disk_usage_kb=$(du -k "$userdata" | awk '{print $1}')
    if [ "$disk_usage_kb" -gt 5242880 ]; then
        echo "⚠️  $avd_name userdata uses $((disk_usage_kb / 1024 / 1024))GB on disk; wiping..."
        rm -f "$userdata"
    fi
}

cleanup_avd_locks() {
    local avd_name=$1
    local avd_dir="$HOME/.android/avd/${avd_name}.avd"
    if [ -d "$avd_dir" ]; then
        rm -f \
            "$avd_dir/hardware-qemu.ini.lock" \
            "$avd_dir/snapshot.lock.lock" \
            "$avd_dir/multiinstance.lock" \
            "$avd_dir/read-snapshot.txt"
    fi
}

# 4. Capture Function
capture_for() {
    local avd_name=$1
    local target_dir="fastlane/metadata/android/no-NO/images/$2"
    local SERIAL="emulator-5554"

    shutdown_emulator() {
        adb -s "$SERIAL" emu kill > /dev/null 2>&1 || true
        while adb devices | grep -q "$SERIAL"; do
            sleep 2
        done
    }

    # 1. Ensure no other emulators are running
    echo "🧹 Cleaning up old emulators..."
    adb devices | grep emulator | cut -f1 | xargs -I {} adb -s {} emu kill > /dev/null 2>&1 || true
    pkill -f "emulator.*-avd $avd_name" > /dev/null 2>&1 || true
    cleanup_avd_locks "$avd_name"
    repair_bloated_avd_disk "$avd_name"
    sleep 5

    # 2. Cleanup old screenshots from temp folder
    rm -rf screenshots/*.png

    echo "🎬 Launching $avd_name..."
    EMULATOR_FLAGS=(
      -avd "$avd_name"
      -gpu host
      -cores 2
      -no-audio
      -no-boot-anim
      -no-snapshot-load
      -no-snapshot-save
      -port 5554
    )
    if [ "${HEADED:-0}" != "1" ]; then
      EMULATOR_FLAGS=(-no-window "${EMULATOR_FLAGS[@]}")
    fi
    emulator "${EMULATOR_FLAGS[@]}" &

    echo "⏳ Waiting for $avd_name ($SERIAL) to appear..."
    while ! adb devices | grep -q "$SERIAL"; do
        sleep 2
    done

    echo "⏳ Waiting for $avd_name to boot..."
    adb -s "$SERIAL" wait-for-device
    while [ "$(adb -s "$SERIAL" shell getprop sys.boot_completed)" != "1" ]; do
        sleep 5
    done

    if [ "${PAUSE_BEFORE_DRIVE:-0}" = "1" ]; then
      echo "⏸️  Emulator is ready. Press Enter to start flutter drive..."
      read -r _
    fi

    echo "📸 Running Screenshot Robot on $SERIAL..."
    DRIVE_ARGS=(
      --device-id "$SERIAL"
      --driver=test_driver/screenshots_test.dart
      --target=integration_test/screenshot_test.dart
      --use-application-binary="$APK"
      --no-pub
    )
    if [ "$SCREENSHOT_NAME" != "all" ]; then
      DRIVE_ARGS+=(--dart-define=SCREENSHOTS="$SCREENSHOT_NAME")
    fi

    drive_ok=true
    if ! (cd "$ROOT" && flutter drive "${DRIVE_ARGS[@]}"); then
        drive_ok=false
        echo "⚠️  flutter drive reported failure on $avd_name"
    fi

    echo "📂 Moving screenshots to $target_dir..."
    mkdir -p "$target_dir"
    shopt -s nullglob
    local files=(screenshots/*.png)
    if [ ${#files[@]} -eq 0 ]; then
        echo "❌ No screenshots produced for $avd_name"
        shutdown_emulator
        exit 1
    fi
    mv "${files[@]}" "$target_dir/"

    if [ "$drive_ok" = false ]; then
        echo "❌ Screenshot test failed on $avd_name (screenshots were saved anyway)"
        shutdown_emulator
        exit 1
    fi

    echo "🧹 Removing alpha channels for compatibility..."
    python3 -c "import os; from PIL import Image; directory = '$target_dir'; [ (img := Image.open(os.path.join(directory, f)), img.convert('RGB').save(os.path.join(directory, f), 'PNG')) for f in os.listdir(directory) if f.endswith('.png') ]"

    echo "🛑 Shutting down $avd_name ($SERIAL)..."
    shutdown_emulator
    sleep 2
}

# 5. Run the Loop
declare -a CAPTURE_JOBS=(
  "fastlane-phone:phoneScreenshots"
  "fastlane-tablet-7:sevenInchScreenshots"
  "fastlane-tablet-10:tenInchScreenshots"
)

for job in "${CAPTURE_JOBS[@]}"; do
  avd_name="${job%%:*}"
  target="${job##*:}"
  if [ -n "${AVD:-}" ] && [ "$AVD" != "$avd_name" ]; then
    continue
  fi
  capture_for "$avd_name" "$target"
done

echo "✅ All screenshots captured and organized!"
