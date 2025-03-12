#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR" || exit 1

orb create ubuntu:24.10 ubuntu-amd64 -c "${SCRIPT_DIR}/ubuntu_user-data.yaml" -a amd64
