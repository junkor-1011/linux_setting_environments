#!/bin/bash
set -euxo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

ssh-keygen -t ed25519 -f ./al2023_key_ed25519 -N ""

echo "Done!"
