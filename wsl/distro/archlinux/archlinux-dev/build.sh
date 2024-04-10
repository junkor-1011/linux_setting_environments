#!/usr/bin/env bash
set -eux

TAG="archlinux-dev"

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

# git-prompt & git-completion
if [ ! -f ./git-completion/git-prompt.sh ]; then
    curl -o ./git-completion/git-prompt.sh -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
if [ ! -f ./git-completion/git-completion.bash ]; then
    curl -o ./git-completion/git-completion.bash -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi
if [ ! -f ./git-completion/git-completion.zsh ]; then
    curl -o ./git-completion/git-completion.zsh -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi

# tmux
cp ../../../../dotfiles/tmux/.tmux.conf .

if [ "$1" = "podman" ]; then
    podman build -t "$TAG" .
else
    docker build -t "$TAG" .
fi
