
# ToDo: 最初に行うべき設定と最後に行うべき設定とに区別・整理 (可能ならファイル毎分離)

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# alias

if [ "$(uname -s)" = "Linux" ]; then
    # alias ls="ls -FG --color=auto"
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto -F'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'

    fi

    alias ll='ls -alF'
    alias la='ls -AF'
    alias l='ls -CF'
elif [ "$(uname -s)" = "Darwin" ]; then
    alias ls='ls -GF'
    alias ll='ls -alF'
    alias la='ls -AF'
    alias l='ls -CF'

    if command -v gdircolors >/dev/null 2>&1; then
        alias dircolors="$(command -v gdircolors)"
    fi
    if command -v gdir >/dev/null 2>&1; then
        alias dir='gdir --color=auto'
    fi
    if command -v gvdir >/dev/null 2>&1; then
        alias dir='gvdir --color=auto'
    fi
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# moving directory
setopt auto_cd
setopt auto_pushd
setopt extended_glob

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt share_history

# execute command
setopt correct
setopt list_packed

# keybind
bindkey -e  # Emacs
# bindkey -v  # Vi

# completions
if [ -d $HOME/.zsh_local/completions ]; then
    fpath=(~/.zsh_local/completions $fpath)
    autoload -Uz compinit && compinit -u
fi
autoload -Uz bashcompinit && bashcompinit

# ---------------------------------- #
# Plugins
if ([ -d $HOME/.local/share/zinit/zinit.git ] && [ -f $HOME/.zsh_local/zinit_setting.zsh ]); then
    # using zinit
    source $HOME/.zsh_local/zinit_setting.zsh
    # unalias zi=zinit because of conflict with zoxide
    type zi > /dev/null 2>&1 && unalias zi
elif ([ -d $HOME/.zplug ] && [ -f $HOME/.zsh_local/zplug_setting.zsh ]); then
    # using zplug
    source $HOME/.zsh_local/zplug_setting.zsh
fi
# ---------------------------------- #



# local setting -------------------- #
# ToDo: 順序や位置づけなど

export PATH=$HOME/.local/bin:$PATH

# user define functions
if [ -f $HOME/.zsh_local/udf.zsh ]; then
    source $HOME/.zsh_local/udf.zsh
    # autoload $HOME/.zsh_udf
fi


# ファイル名は適当
# zsh
if [ -f $HOME/.zsh_local/local_rc.zsh ]; then
    source $HOME/.zsh_local/local_rc.zsh
fi

# symbolic linkを張って`bash`と`zsh`で共有するなど
if [ -f $HOME/.zsh_local/local_rc.sh ]; then
   source $HOME/.zsh_local/local_rc.sh
fi

# PATHの重複削除 (zsh)
typeset -U path PATH

