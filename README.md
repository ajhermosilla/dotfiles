# Dotfiles

My personal dotfiles managed with the **bare git repo** method.

## What's included

| File | Description |
|------|-------------|
| `.zshrc` | Zsh configuration with aliases, history, and modern CLI tools |
| `.gitconfig` | Git configuration with aliases and defaults |
| `.gitignore_global` | Global gitignore patterns |
| `.config/starship.toml` | Starship prompt configuration |
| `Brewfile` | Homebrew packages for CLI tools |

## Installation on a new machine

    # 1. Clone the bare repo
    git clone --bare https://github.com/ajhermosilla/dotfiles.git $HOME/.dotfiles

    # 2. Define the alias temporarily
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    # 3. Checkout the files
    dotfiles checkout

    # 4. Hide untracked files
    dotfiles config --local status.showUntrackedFiles no

    # 5. Reload shell
    source ~/.zshrc

## Daily usage

    dotfiles status              # Check status
    dotfiles add ~/.zshrc        # Track a file
    dotfiles commit -m "msg"     # Commit changes
    dotfiles push                # Push to GitHub

## Tools I use

- **Terminal**: iTerm2
- **Shell**: Zsh
- **Prompt**: Starship
- **CLI tools**: eza, bat, fd, fzf, ripgrep, zoxide

## Author

**Augusto Hermosilla** - augusto@cronova.dev

