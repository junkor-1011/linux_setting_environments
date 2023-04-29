### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

# load plugins

zinit load mafredri/zsh-async
zinit load zdharma-continuum/history-search-multi-word
zinit load zdharma-continuum/fast-syntax-highlighting
zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-autosuggestions
zinit load chrissicool/zsh-256color
zinit load Tarrasch/zsh-bd
# zinit load rupa/z, use:z.sh
# zinit load rupa/z
# ^^^ use zoxide ^^^
zinit load mollifier/cd-gitroot
zinit load liangguohuan/zsh-dircolors-solarized
zinit load woefe/git-prompt.zsh
if [ -f $HOME/.zsh_local/plugin_custom/git-prompt/multiline_custom.zsh ]; then
    # using custom-prompt
    source $HOME/.zsh_local/plugin_custom/git-prompt/multiline_custom.zsh
else
    source $HOME/.zinit/plugins/woefe---git-prompt.zsh/examples/multiline.zsh
fi
