# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.dotfiles/theme/p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# Zsh Basic Settings
zstyle ':completion:*' menu select
export HISFILE=$ZDOTDIR/.zsh_history # Where history file store
export HISTSIZE=10000                # How many commands zsh will load to memory
export SAVEHIST=10000                # How many commands history zsh will save on file
bindkey "\e[1;3D" backward-word      # Make Alt + Left move backward word
bindkey "\e[1;3C" forward-word       # Make Alt + Right move forward word
setopt HIST_IGNORE_ALL_DUPS          # History won't save duplicates
setopt HIST_FIND_NO_DUPS             # History won't show duplicates on search
setopt HIST_VERIFY                   # Use history expansion (!!, !-2, ^foo...) will not excute directly
setopt INC_APPEND_HISTORY            # When enters command then append it to history file
setopt EXTENDEDGLOB                  # Use more glob features
setopt INTERACTIVE_COMMENTS          # Allow comments in interactive shell
setopt NO_FLOW_CONTROL               # Disable flow control for unmapping Ctrl+S, Ctrl+Q
setopt AUTO_MENU


# Auto Suggestions
source $HOME/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# History Substring Search
source $HOME/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
zstyle ':completion:*' menu select
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=red,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
export HISTORY_SUBSTRING_SEARCH_PREFIXED=true
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Completions
autoload -Uz compinit
fpath=($HOME/.dotfiles/plugins/zsh-completions/src $fpath)

if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# if-else need open extend glob:
# - `#q`: makes globbing work within zsh's [[ ]] construct
# - `N`: makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - `.`: matches "regular files"
# - 'mh+24': matches files (or directories or whatever) that are older than 24 hours
if [[ -n $ZDOTDIR/.zcompdump(#qN.mh+24) ]]; then
    compinit -i # Ignore all insecure files and directories and rebuild
else
    compinit -C # Ignore security check and no rebuild
fi


# Env
export BAT_THEME='gruvbox-dark'


# Aliases
alias k8s='kubectl'; compdef k8s=kubectl
alias ls='eza'
alias ll='eza -l'
alias tree='eza -T'
alias cat='bat -p --paging=never'
