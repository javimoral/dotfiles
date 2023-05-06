zstyle :compinstall filename '/home/javi/.zshrc'

# zinit
source ~/.zinit/bin/zinit.zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# zinit plugins
# Plugins
export NVM_LAZY_LOAD=true
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light lukechilds/zsh-nvm

# zsh-history-substring-search
bindkey $terminfo[kcuu1] history-substring-search-up
bindkey $terminfo[kcud1] history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zsh-completions
fpath=(/home/javi/.zinit/plugins/zsh-users---zsh-completions/src $fpath)

#autoload -Uz compinit
#compinit
