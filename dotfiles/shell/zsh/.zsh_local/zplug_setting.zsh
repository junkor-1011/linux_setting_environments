
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async"
# zplug "sindresorhus/pure"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma/history-search-multi-word"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "chrissicool/zsh-256color"
# zplug "woefe/git-prompt.zsh"
zplug "Tarrasch/zsh-bd"
zplug "rupa/z", use:z.sh
zplug "mollifier/cd-gitroot"
zplug "liangguohuan/zsh-dircolors-solarized"

# zplug "woefe/git-prompt.zsh", use:examples/multiline.zsh
zplug "woefe/git-prompt.zsh"
# source $HOME/.zplug/repos/woefe/git-prompt.zsh/examples/rprompt.zsh
# source $HOME/.zplug/repos/woefe/git-prompt.zsh/examples/multiline.zsh
# source $HOME/.zplug/repos/woefe/git-prompt.zsh/examples/pure.zsh
# ZSH_GIT_PROMPT_ENABLE_SECONDARY=1
if [ -f $HOME/.zsh_local/plugin_custom/git-prompt/multiline_custom.zsh ]; then
    # using custom-prompt
    source $HOME/.zsh_local/plugin_custom/git-prompt/multiline_custom.zsh
else
    source $HOME/.zplug/repos/woefe/git-prompt.zsh/examples/multiline.zsh
fi

# Load theme file
# zplug 'dracula/zsh', as:theme
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# zplug "sorin-ionescu/prezto"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

