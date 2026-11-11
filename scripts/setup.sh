#!/usr/bin/env bash
# One-time setup for macOS / Linux.
set -euo pipefail
cd "$(dirname "$0")/.."

if ! command -v rokit >/dev/null 2>&1; then
  echo "Installing Rokit..."
  curl -sSf https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.sh | bash
  echo
  echo "Rokit installed. Open a NEW terminal, then run this script again."
  exit 0
fi

rokit install
[ -d .git ] || git init
echo "Done. Next: lune run check"
