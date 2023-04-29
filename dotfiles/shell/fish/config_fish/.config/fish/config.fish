set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

if test -x /usr/bin/dircolors
    alias ls='ls --color=auto -F'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
end

alias ll='ls -alF'
alias la='ls -AF'
alias l='ls -CF'

# fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths
# set -x PATH $HOME/.local/bin:$PATH
set -g fish_user_paths $HOME/.local/bin:$fish_user_paths

# local setting
if test -f $HOME/.config/fish/config_local.fish
    source $HOME/.config/fish/config_local.fish
end

# PATH重複除去
# set -U fish_user_paths (echo $fish_user_paths | tr ' ' '\n' | sort -u)
# set -U PATH (echo $PATH | tr ' ' '\n' | sort -u)


