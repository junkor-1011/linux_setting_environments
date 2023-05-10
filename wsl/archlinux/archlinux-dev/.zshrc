# Set up the prompt

# PATH
export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# PS1
setopt PROMPT_SUBST
# export PS1='[%n@%m %~$(__git_ps1 " (%s)")]
# \$ '
# show current dir path short:
export PS1='[%n@%m %c$(__git_ps1 " (%s)")]
\$ '

# --- using theme ---
# autoload -Uz promptinit
# promptinit
# prompt adam1

# moving directory
setopt auto_cd
setopt auto_pushd
setopt extended_glob

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# history
setopt histignorealldups sharehistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt share_history

# Keep 50000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# execute command
setopt correct
setopt list_packed

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ------------------------------------------------
# belows are custom settings

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# zoxide
if type zoxide > /dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# git
if [ -f "$HOME"/.git-prompt.sh ]; then
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWSTASHSTATE=true
    export GIT_PS1_SHOWUPSTREAM=auto
    export GIT_PS1_STATESEPARATOR=" "
    export GIT_PS1_SHOWCOLORHINTS=true
    export GIT_PS1_SHOWCONFLICTSTATE="yes"
    export GIT_PS1_COMPRESSSPARSESTATE=true
    export GIT_PS1_DESCRIBE_STYLE="branch"
    source "$HOME"/.git-prompt.sh
fi
if [ -f "$HOME"/.zsh/_git ] && [ -f "$HOME"/.git-completion.bash ]; then
    fpath=(~/.zsh $fpath)
    zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
    autoload -Uz compinit && compinit
fi

## pipx
if type pipx > /dev/null 2>&1; then
    eval "$(register-python-argcomplete pipx)"
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# remove PATH duplication
typeset -U path PATH
