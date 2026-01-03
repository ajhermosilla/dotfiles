# =============================================================================
#  DOTFILES - Augusto Hermosilla
# =============================================================================
# Repo: https://github.com/ajhermosilla/dotfiles
# Managed with bare git repo method
# =============================================================================

# -----------------------------------------------------------------------------
# DOTFILES MANAGEMENT
# -----------------------------------------------------------------------------
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# -----------------------------------------------------------------------------
# PATH
# -----------------------------------------------------------------------------
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# -----------------------------------------------------------------------------
# ENVIRONMENT
# -----------------------------------------------------------------------------
export EDITOR="vim"
export LANG="en_US.UTF-8"

# -----------------------------------------------------------------------------
# HISTORY
# -----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_REDUCE_BLANKS     # Remove unnecessary blanks
setopt INC_APPEND_HISTORY     # Add commands immediately
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming
setopt HIST_FIND_NO_DUPS      # Don't show duplicates in search

# -----------------------------------------------------------------------------
# ZSH OPTIONS
# -----------------------------------------------------------------------------
setopt AUTO_CD                # cd by typing directory name
setopt CORRECT                # Command correction
setopt INTERACTIVE_COMMENTS   # Allow comments in interactive shell

# -----------------------------------------------------------------------------
# COMPLETION (with daily cache for faster startup)
# -----------------------------------------------------------------------------
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case insensitive

# -----------------------------------------------------------------------------
# KEY BINDINGS
# -----------------------------------------------------------------------------
bindkey -e                           # Emacs key bindings
bindkey '^[[A' history-search-backward   # Up arrow
bindkey '^[[B' history-search-forward    # Down arrow

# -----------------------------------------------------------------------------
# ALIASES - Navigation
# -----------------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# -----------------------------------------------------------------------------
# ALIASES - Git
# -----------------------------------------------------------------------------
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline -15"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"
alias gst="git stash"
alias gstp="git stash pop"
alias lg="lazygit"

# -----------------------------------------------------------------------------
# ALIASES - Safety
# -----------------------------------------------------------------------------
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# -----------------------------------------------------------------------------
# ALIASES - Shortcuts
# -----------------------------------------------------------------------------
alias c="clear"
alias h="history"
alias reload="source ~/.zshrc"

# -----------------------------------------------------------------------------
# LOCAL OVERRIDES (machine-specific, not tracked)
# -----------------------------------------------------------------------------
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# -----------------------------------------------------------------------------
# MODERN CLI TOOLS (enabled)
# -----------------------------------------------------------------------------
# eza - better ls
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias tree="eza --tree --icons"

# bat - better cat
alias cat="bat"

# fd - better find
alias find="fd"

# ripgrep - better grep
alias grep="rg"

# zoxide - smarter cd
eval "$(zoxide init zsh)"

# fzf - fuzzy finder
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# starship - modern prompt
eval "$(starship init zsh)"
