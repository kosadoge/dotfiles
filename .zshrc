# Theme Powerlevel10k Load & Setting
# Enable instant prompt. (Should stay close to the top of ~/.zshrc)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh          # Load Powerlevel10k prompt config
source ~/.dotfiles/theme/p10k/powerlevel10k.zsh-theme # Load Powerlevel10k

# Zsh Basic Setting
export HISFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

setopt AUTO_MENU
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

autoload -Uz compinit
zstyle ':completion:*' menu select

# Autosuggestions
source ~/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History Substring Search
source ~/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=red,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
export HISTORY_SUBSTRING_SEARCH_PREFIXED=true
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Completions
fpath=(~/.dotfiles/plugins/zsh-completions/src $fpath)
rm -f ~/.zcompdump; compinit
