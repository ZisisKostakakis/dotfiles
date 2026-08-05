# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS dotfiles repository using symlink-based installation. Configurations are symlinked from the repository to `~/.config/` and `~/`, making updates as simple as `git pull`.

## Installation Flow

Execute in order:
```bash
./install-dependencies.sh    # Install Homebrew and dependencies
./install-oh-my-zsh.sh        # Install Oh My Zsh and plugins
./install-dot.sh              # Symlink dotfiles and configure macOS defaults
```

**Note**: `install-dot.sh` requires sudo for Spotlight configuration.

## Architecture

### Symlink System

The `install-dot.sh` script creates symlinks from this repo to home directory:
- `config/` → `~/.config/`
- `zshrc` → `~/.zshrc`
- `vimrc` → `~/.vimrc`
- `tmux.conf` → `~/.tmux.conf`
- `p10k.zsh` → `~/.p10k.zsh`

Files tracked in this repo are the source of truth. Changes made to `~/.zshrc` will modify the repository file.

### Zsh Configuration

**Shell**: zsh with Oh My Zsh framework
**Theme**: Powerlevel10k
**Key plugins** (installed via `install-oh-my-zsh.sh`):
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
- `fzf-tab` (fuzzy finder for tab completion)
- `autoswitch_virtualenv` (auto-activate Python venvs)
- `you-should-use` (suggests aliases)

**History**: 5000 lines with deduplication (`hist_ignore_all_dups`, `hist_save_no_dups`)

**Notable aliases** (in `zshrc:163-171`):
- `python` → `python3`
- `gprom` → `git pull --rebase origin main`
- `cfast` → `claude --model haiku`
- `cdeep` → `claude --model sonnet`

**Integrations**:
- `atuin` (shell history sync)
- `direnv` (per-directory env management)
- `fzf` (fuzzy finder)

### Neovim Configuration

**Framework**: LazyVim (lazy.nvim plugin manager)
**Location**: `config/nvim/`

**Key settings** (`config/nvim/lua/config/options.lua`):
```lua
vim.g.autoformat = false      -- Disable autoformat on save
vim.g.snacks_animate = false  -- Disable animations
```

**Notable plugins** (`config/nvim/lua/plugins/`):
- `harpoon.lua` - Quick file navigation
- `toggleterm.lua` - Terminal integration
- `venv-selector.lua` - Python virtual environment selector
- `neogen.lua` - Docstring generation
- `surround.lua` - Surround text objects
- `no_neck_pain.lua` - Center buffer
- `which-key.lua` - Keybinding hints

Disabled plugins (`.disable` extension): `neoscroll.lua`, `scrollbar.lua`

### Karabiner Configuration

**Location**: `config/karabiner/karabiner.json`
Custom keyboard remappings for macOS using Karabiner-Elements.

**Example rule**: Hyper key (cmd+ctrl+opt+shift) + N/M for tmux pane cycling in Ghostty terminal (currently disabled).

### macOS System Defaults

`install-dot.sh` configures macOS via `defaults` command (lines 39-187):

**Keyboard**:
- Disables autocorrect and auto-capitalization
- Fast key repeat (InitialKeyRepeat=15, KeyRepeat=2)
- Disables press-and-hold for accents

**Finder**:
- Shows all file extensions
- Shows status bar
- Shows external drives/servers on desktop
- New windows open at home directory
- Search limited to current directory

**Dock**:
- Auto-hide enabled
- Recents disabled
- Mission Control doesn't auto-rearrange spaces

**Trackpad**:
- Tap to click enabled

**Other**:
- Screenshots include date in filename
- Spotlight suggestions disabled (privacy)
- Multiple default apps removed from Dock via `dockutil`

### Brew Dependencies

Core tools (from `install-dependencies.sh:1-48`):
- `neovim`, `tmux`, `vim`
- `fzf`, `ripgrep`, `fd`, `bat`, `dust` (modern CLI tools)
- `lazygit` (git TUI)
- `docker`, `awscli`, `node`
- `python@3.12`
- Cask apps: `alt-tab`, `rectangle`

### Lazygit

Custom config written by `install-dot.sh` to `~/Library/Application Support/lazygit/config.yml`:
- Purple primary color
- Dark theme

## Testing Changes

No automated tests. Manual verification:
1. Edit dotfiles in repo
2. Changes immediately reflected in `~/.*` symlinked files
3. For zsh: `source ~/.zshrc`
4. For nvim: Restart or `:source $MYVIMRC`
5. For tmux: `tmux source ~/.tmux.conf`

## Manual Installations

`manual-installs.md` lists apps not installed via brew (browser extensions, Mac App Store apps, third-party downloads).
