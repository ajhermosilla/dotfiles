# Dotfiles

My personal dotfiles managed with the **bare git repo** method.

## What's included

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config with aliases, history, completion caching, fzf preview |
| `.gitconfig` | Git config with delta pager, aliases, histogram diff, rerere |
| `.gitignore_global` | Global gitignore patterns |
| `.tmux.conf` | Tmux config with vim-style navigation, C-a prefix |
| `.vimrc` | Vim config with sensible defaults, persistent undo |
| `.ssh/config` | SSH config with secure defaults |
| `.config/starship.toml` | Starship prompt configuration |
| `.config/bat/config` | Bat theme and style settings |
| `.config/ripgrep/config` | Ripgrep defaults (smart-case, hidden files) |
| `.config/vscode/settings.json` | VS Code editor settings |
| `.config/vscode/extensions.txt` | VS Code extensions list |
| `.config/htop/htoprc` | htop process viewer configuration |
| `Brewfile` | Homebrew packages and casks |

## Installation on a new machine

```bash
# 1. Clone the bare repo
git clone --bare https://github.com/ajhermosilla/dotfiles.git $HOME/.dotfiles

# 2. Define the alias temporarily
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# 3. Checkout the files
dotfiles checkout

# 4. Hide untracked files
dotfiles config --local status.showUntrackedFiles no

# 5. Install CLI tools
brew bundle --file=~/Brewfile

# 6. Set up VS Code symlink
ln -s ~/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# 7. Install VS Code extensions
cat ~/.config/vscode/extensions.txt | xargs -L 1 code --install-extension

# 8. Reload shell
source ~/.zshrc
```

## Daily usage

```bash
dotfiles status              # Check status
dotfiles add ~/.zshrc        # Track a file
dotfiles commit -m "msg"     # Commit changes
dotfiles push                # Push to GitHub
```

## Key bindings

### Zsh aliases

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gcm` | `git commit -m` |
| `gp` | `git push` |
| `gpl` | `git pull` |
| `gd` | `git diff` |
| `lg` | `lazygit` |
| `ls` | `eza --icons` |
| `cat` | `bat` |

### Tmux (prefix: C-a)

| Key | Action |
|-----|--------|
| `C-a \|` | Split vertical |
| `C-a -` | Split horizontal |
| `C-a h/j/k/l` | Navigate panes |
| `C-a c` | New window |
| `C-a r` | Reload config |

### Vim (leader: Space)

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>y` | Yank to clipboard |
| `Ctrl+h/j/k/l` | Navigate splits |

## Tools

| Tool | Replaces | Description |
|------|----------|-------------|
| eza | ls | Modern ls with icons |
| bat | cat | Syntax highlighting |
| fd | find | Fast file finder |
| ripgrep | grep | Fast search |
| zoxide | cd | Smart directory jumper |
| fzf | - | Fuzzy finder |
| delta | - | Better git diffs |
| lazygit | - | Git TUI |
| gh | - | GitHub CLI |

## Author

**Augusto Hermosilla** - augusto@cronova.dev
