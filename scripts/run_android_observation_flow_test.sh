#!/bin/bash
set -euo pipefail

# Android integration test: gallery -> capture -> type pick -> save -> gallery.
#
# Uses a fake in-app camera so the flow runs on emulators without a real camera.
# iOS device support can be added later with a separate script/flag.
#
# Usage:
#   ./scripts/run_android_observation_flow_test.sh
#   HEADED=1 ./scripts/run_android_observation_flow_test.sh
#   DEVICE_ID=emulator-5554 ./scripts/run_android_observation_flow_test.sh
#
# Optional env:
#   HEADED=1          Show the emulator window (default: headless)
#   DEVICE_ID=...     Use an already-running device/emulator
#   AVD=fastlane-phone  AVD name when booting a fresh emulator
#   SKIP_BOOT=1       Skip emulator boot (requires DEVICE_ID)

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PACKAGE="no.naturinorge.naturinorge_guide"
AVD="${AVD:-fastlane-phone}"
SERIAL="${DEVICE_ID:-emulator-5554}"

export JAVA_HOME="${JAVA_HOME:-/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home}"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export ANDROID_SDK_ROOT="${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"

shutdown_emulator() {
  adb -s "$SERIAL" emu kill > /dev/null 2>&1 || true
  while adb devices | grep -Fq "$SERIAL"; do
    sleep 2
  done
}

boot_emulator() {
  echo "🧹 Cleaning up old emulators..."
  adb devices | grep emulator | cut -f1 | xargs -I {} adb -s {} emu kill > /dev/null 2>&1 || true
  pkill -f "emulator.*-avd $AVD" > /dev/null 2>&1 || true
  sleep 3

  # Ensure the AVD exists and is configured
  SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"
  AVDMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/avdmanager"
  IMAGE="system-images;android-34;google_apis;arm64-v8a"

  if ! "$SDKMANAGER" --list_installed | grep -q "$IMAGE"; then
      echo "📦 Downloading system image (this might take a few minutes)..."
      set +o pipefail
      yes | "$SDKMANAGER" --install "$IMAGE"
      set -o pipefail
  fi

  if ! "$AVDMANAGER" list avd | grep -q "$AVD"; then
      echo "📱 Creating emulator: $AVD..."
      echo "no" | "$AVDMANAGER" create avd -n "$AVD" -k "$IMAGE" -d "pixel_7" --force
  fi

  # Configure the AVD (GPU host and cores)
  local config="$HOME/.android/avd/${AVD}.avd/config.ini"
  if [ -f "$config" ]; then
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
  fi

  echo "🎬 Launching $AVD on $SERIAL..."
  EMULATOR_FLAGS=(
    -avd "$AVD"
    -gpu host
    -cores 2
    -no-audio
    -no-boot-anim
    -no-snapshot-load
    -no-snapshot-save
    -port "${SERIAL#emulator-}"
  )
  if [ "${HEADED:-0}" != "1" ]; then
    EMULATOR_FLAGS=(-no-window "${EMULATOR_FLAGS[@]}")
  fi
  emulator "${EMULATOR_FLAGS[@]}" &

  echo "⏳ Waiting for $SERIAL..."
  while ! adb devices | grep -Fq "$SERIAL"; do
    sleep 2
  done

  adb -s "$SERIAL" wait-for-device
  while [ "$(adb -s "$SERIAL" shell getprop sys.boot_completed | tr -d '\r')" != "1" ]; do
    sleep 5
  done
  echo "✅ Emulator ready"
}

prepare_device() {
  echo "📍 Setting mock GPS (Oslo)..."
  adb -s "$SERIAL" emu geo fix 10.7522 59.9139

  echo "🔐 Granting runtime permissions..."
  adb -s "$SERIAL" shell pm grant "$PACKAGE" android.permission.CAMERA || true
  adb -s "$SERIAL" shell pm grant "$PACKAGE" android.permission.ACCESS_FINE_LOCATION || true
  adb -s "$SERIAL" shell pm grant "$PACKAGE" android.permission.ACCESS_COARSE_LOCATION || true
}

run_test() {
  echo "🧪 Running observation flow integration test on $SERIAL..."
  cd "$ROOT"
  flutter test integration_test/observation_flow_test.dart --device-id "$SERIAL"
}

if [ "${SKIP_BOOT:-0}" != "1" ]; then
  if adb devices | grep -Fq "$SERIAL"; then
    echo "ℹ️  Using already-running device $SERIAL"
  else
    boot_emulator
  fi
else
  if ! adb devices | grep -Fq "$SERIAL"; then
    echo "❌ DEVICE_ID $SERIAL is not connected. Boot an emulator or unset SKIP_BOOT."
    exit 1
  fi
fi

prepare_device
run_test

if [ "${SKIP_BOOT:-0}" != "1" ] && [ "${KEEP_EMULATOR:-0}" != "1" ]; then
  shutdown_emulator
fi

echo "✅ Observation flow integration test passed"
