#!/usr/bin/env sh
set -eu

# ToDo: Arguments
EXECTIVE_PATH=${HOME}/bin

# clone or update
if [ ! -d $HOME/.fzf/.git ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
else
    cd $HOME/.fzf
    git pull
fi

# install
# $HOME/.fzf/install

expect -c "
    spawn ${HOME}/.fzf/install
    expect \"Do you want to enable fuzzy auto-completion?\"
    send \x0a
    expect \"Do you want to enable key bindings?\"
    send \x0a
    expect \"Do you want to update your shell configuration files?\"
    send \"n\"
"
echo "Done."

# make link
ln -fsv ${HOME}/.fzf/bin/fzf ${EXECTIVE_PATH}/fzf
ln -fsv ${HOME}/.fzf/bin/fzf-tmux ${EXECTIVE_PATH}/fzf-tmux
