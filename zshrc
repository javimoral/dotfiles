zstyle :compinstall filename '/home/javi/.zshrc'

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

#bindkey -v

# zinit plugins
# Plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search

# zsh-history-substring-search
bindkey $terminfo[kcuu1] history-substring-search-up
bindkey $terminfo[kcud1] history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zsh-completions
#fpath=(${ZINIT_HOME}/plugins/zsh-users--zsh-completions $fpath)

# https://stackoverflow.com/a/30840986
autoload -Uz compinit
compinit
