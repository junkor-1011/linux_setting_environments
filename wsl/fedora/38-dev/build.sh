#!/usr/bin/env bash
set -eu

TAG="fedora38-dev"

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

# git-prompt & git-completion
curl -o ./git-completion/git-prompt.sh -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o ./git-completion/git-completion.bash -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o ./git-completion/git-completion.zsh -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# tmux
cp ../../../dotfiles/tmux/.tmux.conf .

if [ "$1" = "podman" ]; then
    podman build -t "$TAG" .
else
    docker build -t "$TAG" .
fi
