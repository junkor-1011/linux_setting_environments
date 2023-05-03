#!/usr/bin/env bash
set -eu

TAG="fedora38-dev"

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

# tmux
cp ../../../dotfiles/tmux/.tmux.conf .

if [ "$1" = "podman" ]; then
    podman build -t "$TAG" .
else
    docker build -t "$TAG" .
fi
