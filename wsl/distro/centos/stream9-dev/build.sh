#!/usr/bin/env bash
set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

docker build -t centos-stream9-dev .
