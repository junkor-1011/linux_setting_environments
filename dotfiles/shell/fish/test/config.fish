#
# for pyenv
# ref: https://medium.com/@o_hayato/fish-%E4%B8%8A%E3%81%A7-pyenv-%E3%82%92%E4%BD%BF%E3%81%86-6af81e469758
set -x PATH $HOME/.pyenv/bin $PATH
source (pyenv init - | psub)
source (pyenv virtualenv-init - | psub)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#eval /home/tomoyuki/.pyenv/versions/anaconda3-2019.03/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

