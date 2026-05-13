#!/bin/bash

# publish.sh - Non-interactive publication script for iOS and Android

# 1. Load environment variables from .env file
if [ -f .env ]; then
  echo "🔑 Loading environment variables from .env..."
  export $(grep -v '^#' .env | xargs)
else
  echo "⚠️  No .env file found. Please create one from .env.template"
  exit 1
fi

# 2. Parse arguments
PLATFORM=""
RUN_SCREENSHOTS=false

for arg in "$@"; do
  case $arg in
    ios|android|both)
      PLATFORM=$arg
      ;;
    --screenshots|-s)
      RUN_SCREENSHOTS=true
      ;;
    *)
      # Ignore unknown arguments for now
      ;;
  esac
done

if [ -z "$PLATFORM" ]; then
  echo "Usage: ./publish.sh [ios|android|both] [--screenshots|-s]"
  exit 1
fi

# 3. Basic validation
if [ -z "$FASTLANE_USER" ]; then
  echo "❌ Error: FASTLANE_USER is not set in .env"
  exit 1
fi

# 4. Optional: Run Screenshots
if [ "$RUN_SCREENSHOTS" = true ]; then
  echo "📸 Starting automated screenshot generation..."
  
  # Run Android screenshots if platform is android or both
  if [[ "$PLATFORM" == "android" || "$PLATFORM" == "both" ]]; then
    echo "🤖 Generating Android screenshots..."
    ./scripts/automate_screenshots.sh
    if [ $? -ne 0 ]; then
      echo "❌ Android screenshot automation failed. Aborting publication."
      exit 1
    fi
  fi

  # Run iOS screenshots if platform is ios or both
  if [[ "$PLATFORM" == "ios" || "$PLATFORM" == "both" ]]; then
    echo "🍏 Generating iOS screenshots..."
    ./scripts/automate_ios_screenshots.sh
    if [ $? -ne 0 ]; then
      echo "❌ iOS screenshot automation failed. Aborting publication."
      exit 1
    fi
  fi
  
  echo "✅ All requested screenshots generated successfully."
fi

# 5. Execute Publication
case $PLATFORM in
  ios)
    echo "🍏 Starting iOS Publication..."
    echo "📦 Ensuring CocoaPods are up to date..."
    (cd ios && pod install)
    bundle exec fastlane ios deploy
    ;;
  android)
    echo "🤖 Starting Android Publication..."
    bundle exec fastlane android deploy
    ;;
  both)
    echo "🚀 Starting Full Publication (iOS + Android)..."
    echo "📦 Ensuring iOS CocoaPods are up to date..."
    (cd ios && pod install)
    bundle exec fastlane ios deploy
    bundle exec fastlane android deploy
    ;;
esac

echo "✅ Publication process completed!"
