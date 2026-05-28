#!/bin/bash
set -euo pipefail

# Ensures issue labels referenced by NiN Guide templates exist on GitHub.
# Safe to re-run (gh label create is idempotent when label already exists).

REPO="${GITHUB_REPOSITORY:-geco-nhm/natur-i-norge}"

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"
  if gh label list --repo "$REPO" --json name --jq ".[] | select(.name==\"$name\") | .name" | grep -qx "$name"; then
    echo "✓ label exists: $name"
  else
    gh label create "$name" --repo "$REPO" --color "$color" --description "$description"
    echo "✓ created label: $name"
  fi
}

create_label bug d73a4a "Something is broken"
create_label comment 1D76DB "Feedback or comment from NiN Guide"
create_label from-app 5319E7 "Reported via NiN Guide app"

echo "Done."
