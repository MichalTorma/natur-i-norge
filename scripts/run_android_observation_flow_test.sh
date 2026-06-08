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
