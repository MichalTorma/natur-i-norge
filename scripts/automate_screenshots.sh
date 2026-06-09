#!/bin/bash
set -euo pipefail

SCREENSHOT_NAME="${1:-all}"

# Optional debugging:
#   HEADED=1                         show the emulator window (default is headless)
#   AVD=fastlane-phone               run a single AVD instead of all three
#   PAUSE_BEFORE_DRIVE=1             wait for Enter before starting flutter drive
#   REBUILD_APK=1                    force a full flutter drive rebuild (ignore cached test APK)
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

# Set up a local Python virtual environment to avoid modifying global python
VENV_DIR="$ROOT/.venv"
if [ ! -d "$VENV_DIR" ]; then
    echo "📦 Creating python virtual environment in $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
fi
# Activate venv
source "$VENV_DIR/bin/activate"

# Ensure Pillow is installed in the venv
if ! python3 -c "import PIL" >/dev/null 2>&1; then
    echo "📦 Installing Pillow in virtual environment..."
    python3 -m pip install --upgrade pip
    python3 -m pip install Pillow
fi

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
    set +o pipefail
    yes | $SDKMANAGER --install "$IMAGE"
    set -o pipefail
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

create_avd "fastlane-phone" "pixel_7"
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

    # Play Console API: each side >= 1080px, max aspect ratio 2.3 (see supply upload errors).
    case "$avd_name" in
      fastlane-tablet-7)
        # LCD height must exceed 1080: status/nav bars shrink the captured Flutter surface
        # (1080 LCD → ~990px screenshots). Target 1200 LCD → ~1100px capture.
        configure_avd_key "$config" hw.lcd.width 1920
        configure_avd_key "$config" hw.lcd.height 1200
        configure_avd_key "$config" hw.lcd.density 240
        configure_avd_key "$config" hw.device.name "7in WSVGA (Tablet)"
        configure_avd_key "$config" hw.initialOrientation landscape
        ;;
      fastlane-tablet-10)
        configure_avd_key "$config" hw.lcd.width 2560
        configure_avd_key "$config" hw.lcd.height 1600
        configure_avd_key "$config" hw.lcd.density 320
        configure_avd_key "$config" hw.device.name "10.1in WXGA (Tablet)"
        configure_avd_key "$config" hw.initialOrientation landscape
        ;;
    esac
}

configure_avd_key() {
    local config=$1 key=$2 value=$3
    if grep -q "^${key}=" "$config"; then
        sed -i '' "s|^${key}=.*|${key}=${value}|" "$config"
    else
        echo "${key}=${value}" >> "$config"
    fi
}

for avd_name in fastlane-phone fastlane-tablet-7 fastlane-tablet-10; do
    configure_avd "$avd_name"
done

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# Only reuse an APK produced by flutter drive in this run (integration_test entry point).
# A plain `flutter build apk` binary will hang waiting for the driver extension.
TEST_APK=""
if [ "${REBUILD_APK:-0}" = "1" ]; then
    rm -f "$ROOT/build/app/outputs/flutter-apk/app-debug.apk" 2>/dev/null || true
fi

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
    local target_dir=$1
    mkdir -p "$target_dir"
    echo "🧹 Clearing old screenshots in $target_dir ..."
    for file in $(screenshot_output_files); do
        rm -f "$target_dir/$file"
    done
}

# Google Play listing API: min 1080px per side, max aspect ratio 2.3.
validate_play_store_screenshots() {
    local dir=$1
    python3 - "$dir" <<'PY'
import sys
from pathlib import Path

try:
    from PIL import Image
except ImportError:
    print("⚠️  Pillow not installed; skipping Play Store dimension check", file=sys.stderr)
    sys.exit(0)

directory = Path(sys.argv[1])
min_side = 1080
max_aspect = 2.3
failed = False

for path in sorted(directory.glob("*.png")):
    with Image.open(path) as img:
        w, h = img.size
    short = min(w, h)
    long = max(w, h)
    aspect = long / short if short else 999.0
    if short < min_side or aspect > max_aspect:
        failed = True
        reasons = []
        if short < min_side:
            reasons.append(f"short side {short} < {min_side}")
        if aspect > max_aspect:
            reasons.append(f"aspect {aspect:.2f} > {max_aspect}")
        print(f"❌ {path.name}: {w}x{h} ({', '.join(reasons)})", file=sys.stderr)

if failed:
    sys.exit(1)
PY
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

    # 2. Cleanup old screenshots from temp and destination folders
    rm -rf screenshots/*.png
    clean_target_screenshots "$ROOT/$target_dir"

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

    if [[ "$avd_name" == fastlane-tablet-* ]]; then
        echo "📱 Hiding system bars for full-height Play Store screenshots..."
        adb -s "$SERIAL" shell settings put global policy_control immersive.full=*
        sleep 2
    fi

    if [ "${PAUSE_BEFORE_DRIVE:-0}" = "1" ]; then
      echo "⏸️  Emulator is ready. Press Enter to start flutter drive..."
      read -r _
    fi

    echo "📸 Running Screenshot Robot on $SERIAL..."
    DRIVE_ARGS=(
      --device-id "$SERIAL"
      --driver=test_driver/screenshots_test.dart
      --target=integration_test/screenshot_test.dart
    )
    if [ -n "$TEST_APK" ] && [ -f "$TEST_APK" ]; then
      echo "📦 Reusing test APK from first device ($TEST_APK)"
      DRIVE_ARGS+=(--use-application-binary="$TEST_APK" --no-pub)
    else
      echo "🔨 Building test APK (integration_test entry point)..."
      TEST_APK=""
    fi
    if [ "$SCREENSHOT_NAME" != "all" ]; then
      DRIVE_ARGS+=(--dart-define=SCREENSHOTS="$SCREENSHOT_NAME")
    fi

    drive_ok=true
    for attempt in 1 2 3; do
        if (cd "$ROOT" && flutter drive "${DRIVE_ARGS[@]}"); then
            drive_ok=true
            if [ -f "$ROOT/build/app/outputs/flutter-apk/app-debug.apk" ]; then
                TEST_APK="$ROOT/build/app/outputs/flutter-apk/app-debug.apk"
            fi
            break
        fi
        drive_ok=false
        if [ "$attempt" -lt 3 ]; then
            echo "⚠️  flutter drive failed (attempt $attempt/3); retrying in 10s..."
            echo "    (Gradle needs dl.google.com — transient DNS/Wi‑Fi drops cause this)"
            sleep 10
        fi
    done
    if [ "$drive_ok" = false ]; then
        echo "⚠️  flutter drive reported failure on $avd_name after 3 attempts"
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
        local missing=0
        for file in $(screenshot_output_files); do
            if [ ! -f "$target_dir/$file" ]; then
                missing=$((missing + 1))
            fi
        done
        if [ "$missing" -eq 0 ]; then
            echo "⚠️  flutter drive reported errors after capture, but all expected screenshots exist — continuing"
            drive_ok=true
        else
            echo "❌ Screenshot test failed on $avd_name ($missing expected file(s) missing)"
            shutdown_emulator
            exit 1
        fi
    fi

    echo "🧹 Removing alpha channels for compatibility..."
    python3 -c "import os; from PIL import Image; directory = '$target_dir'; [ (img := Image.open(os.path.join(directory, f)), img.convert('RGB').save(os.path.join(directory, f), 'PNG')) for f in os.listdir(directory) if f.endswith('.png') ]"

    echo "📐 Validating Play Store screenshot dimensions..."
    if ! validate_play_store_screenshots "$target_dir"; then
        echo "❌ Screenshots in $target_dir do not meet Google Play size rules (min 1080px per side, aspect ≤ 2.3)."
        shutdown_emulator
        exit 1
    fi

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
