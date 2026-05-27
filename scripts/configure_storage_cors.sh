#!/bin/bash
set -e

# Apply CORS rules to the Firebase Storage bucket (Google Cloud Storage).
# Required for the web app to load and upload observation photos cross-origin.
#
# Prerequisites:
#   1. Google Cloud SDK installed (gcloud + gsutil)
#   2. Logged in: gcloud auth login
#   3. Project set: gcloud config set project natur-i-norge-guide
#
# Usage: ./scripts/configure_storage_cors.sh

BUCKET="${FIREBASE_STORAGE_BUCKET:-natur-i-norge-guide.firebasestorage.app}"
CORS_FILE="$(cd "$(dirname "$0")/.." && pwd)/firebase/storage-cors.json"

if ! command -v gsutil >/dev/null 2>&1; then
  echo "❌ gsutil not found. Install the Google Cloud SDK first."
  exit 1
fi

if [ ! -f "$CORS_FILE" ]; then
  echo "❌ CORS config not found: $CORS_FILE"
  exit 1
fi

echo "🪣 Applying CORS to gs://${BUCKET}..."
gsutil cors set "$CORS_FILE" "gs://${BUCKET}"

echo "✅ CORS updated. Current config:"
gsutil cors get "gs://${BUCKET}"

echo ""
echo "Allowed origins:"
echo "  - https://geco-nhm.github.io  (GitHub Pages)"
echo "  - http://localhost:8080       (local preview)"
echo ""
echo "If you use flutter run -d chrome on another port, add it to firebase/storage-cors.json and re-run this script."
