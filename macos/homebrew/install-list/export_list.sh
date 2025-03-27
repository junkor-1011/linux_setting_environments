#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR" || exit 1

EXPORT_BASE="${SCRIPT_DIR}/latest"
if [ ! -d "${EXPORT_BASE}" ]; then
    mkdir -p "${EXPORT_BASE}"
fi

brew leaves -r > "${EXPORT_BASE}/brew-leaves.txt"
# brew list --formulae -1 &> "${EXPORT_BASE}/brew-formulae-list.txt"
brew list --cask -1 > "${EXPORT_BASE}/brew-cask-list.txt"

ARCHIVE_BASE="$(date -u +"%Y%m%d%H%M%SZ")"
cp -r "${EXPORT_BASE}" "${ARCHIVE_BASE}"
brew list --versions > "${ARCHIVE_BASE}/brew-list-versions.txt"
