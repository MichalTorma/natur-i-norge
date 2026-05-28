#!/bin/bash
set -euo pipefail

# Create (or update) a GitHub release for the current pubspec version and attach
# the signed Android APK for sideloading. Triggers Zenodo when integration is enabled.
#
# Prerequisites:
#   - gh CLI authenticated (gh auth login)
#   - Signed release APK at build/app/outputs/flutter-apk/app-release.apk
#     (built automatically by fastlane android deploy)
#
# Usage:
#   ./scripts/create_github_release.sh
#   ./scripts/create_github_release.sh --draft

DRAFT=false
for arg in "$@"; do
  case $arg in
    --draft)
      DRAFT=true
      ;;
  esac
done

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v gh >/dev/null 2>&1; then
  echo "❌ GitHub CLI (gh) is required. Install: https://cli.github.com/"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "❌ gh is not authenticated. Run: gh auth login"
  exit 1
fi

PUBSPEC_VERSION="$(grep '^version:' pubspec.yaml | awk '{print $2}')"
VERSION_NAME="${PUBSPEC_VERSION%%+*}"
BUILD_NUMBER="${PUBSPEC_VERSION#*+}"
TAG="${VERSION_NAME}"
APK_SRC="build/app/outputs/flutter-apk/app-release.apk"
APK_ASSET="natur-i-norge-guide-${VERSION_NAME}-android.apk"
CHANGELOG="fastlane/metadata/android/no-NO/changelogs/${BUILD_NUMBER}.txt"

if [ ! -f "$APK_SRC" ]; then
  echo "❌ Release APK not found at ${APK_SRC}"
  echo "   Run: flutter build apk --release"
  echo "   Or publish Android via: ./publish.sh android"
  exit 1
fi

NOTES_FILE="$(mktemp)"
{
  echo "NiN Guide ${VERSION_NAME} (build ${BUILD_NUMBER})"
  echo ""
  if [ -f "$CHANGELOG" ]; then
    cat "$CHANGELOG"
    echo ""
  else
    echo "See the GitHub compare view for changes in this release."
    echo ""
  fi
  echo "### Downloads"
  echo ""
  echo "- **Android (APK)** — sideload install without Google Play"
  echo "- **Web app** — https://geco-nhm.github.io/natur-i-norge/app/"
  echo ""
  echo "iOS builds are distributed via the App Store."
} > "$NOTES_FILE"
trap 'rm -f "$NOTES_FILE"' EXIT

echo "📦 Preparing GitHub release ${TAG}..."
cp "$APK_SRC" "/tmp/${APK_ASSET}"

if gh release view "$TAG" >/dev/null 2>&1; then
  echo "ℹ️  Release ${TAG} already exists — uploading/replacing APK asset..."
  gh release upload "$TAG" "/tmp/${APK_ASSET}" --clobber
  echo "✅ Updated asset on existing release: https://github.com/$(gh repo view --json nameWithOwner -q .nameWithOwner)/releases/tag/${TAG}"
else
  RELEASE_ARGS=(release create "$TAG" "/tmp/${APK_ASSET}" --title "NiN Guide ${VERSION_NAME}" --notes-file "$NOTES_FILE")
  if [ "$DRAFT" = true ]; then
    RELEASE_ARGS+=(--draft)
  fi
  gh "${RELEASE_ARGS[@]}"
  echo "✅ Created release: https://github.com/$(gh repo view --json nameWithOwner -q .nameWithOwner)/releases/tag/${TAG}"
  echo "   Zenodo will archive this release if GitHub integration is enabled."
fi

rm -f "/tmp/${APK_ASSET}"
