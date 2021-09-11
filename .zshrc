# Basic Setting
export HISFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

setopt AUTO_MENU
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

bindkey "^[[A" up-line-or-search   # Use current words as prefix to search history, Up
bindkey "^[[B" down-line-or-search # Use current words as prefix to search history, Down

autoload -Uz compinit
zstyle ':completion:*' menu select

# Autosuggestions
source ~/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Completions
fpath=(~/.dotfiles/plugins/zsh-completions/src $fpath)
rm -f ~/.zcompdump; compinit
