#!/usr/bin/env bash

# Install all files to ~ by symlinking them,
# this way, updating them is as simple as git pull

# makes "defaults" command print to screen
defaults() {
  echo defaults "$@"
  command defaults "$@"
}

refused=0

# verbose ln, because `ln -v` is not portable
symlink() {
  if [[ -e "$2" && ! -L "$2" ]]; then
    printf 'refusing to replace existing %s\n' "$2" >&2
    refused=$((refused + 1))
    return 1
  fi
  mkdir -p "$(dirname "$2")"
  printf '%55s -> %s\n' "${1/#$HOME/\~}" "${2/#$HOME/\~}"
  ln -sfn "$1" "$2"
}

# Link dotfiles
dotfiles=(
  p10k.zsh
  zshrc
  zprofile
)

for f in "${dotfiles[@]}"; do
  symlink "$PWD/$f" ~/."$f"
done

mkdir -p "$HOME/.config"
configs=(
  nvim
  karabiner
  zellij
)

for f in "${configs[@]}"; do
  symlink "$PWD/config/$f" "$HOME/.config/$f"
done

for f in explore gh-reader runbook executor; do
  symlink "$PWD/config/claude/agents/$f.md" "$HOME/.claude/agents/$f.md"
  symlink "$PWD/config/codex/agents/$f.toml" "$HOME/.codex/agents/$f.toml"
done

# Remove dangling links to files this repo no longer tracks
for stale in ~/.tmux.conf ~/.tmux; do
  [[ -L "$stale" && ! -e "$stale" ]] && rm -- "$stale"
done

symlink "$PWD/config/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
symlink "$PWD/config/claude/settings.json" "$HOME/.claude/settings.json"
symlink "$PWD/config/codex/AGENTS.md" "$HOME/.codex/AGENTS.md"
symlink "$PWD/bin/claude-notify" "$HOME/.local/bin/claude-notify"

# Mac OS X NSUserDefaults modifications
# Some based on https://github.com/mathiasbynens/dotfiles/blob/master/.osx
if defaults read com.apple.finder &>/dev/null; then
  echo 'modifying NSUserDefaults'

  # Keyboard: Disable autocorrect
  defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

  # Keyboard: Disable auto-capitalization
  defaults write -g NSAutomaticCapitalizationEnabled -bool false

  # Keyboard: Set a shorter Delay until key repeat
  defaults write -g InitialKeyRepeat -int 15

  # Keyboard: Set a fast keyboard repeat rate
  defaults write -g KeyRepeat -int 2

  # Keyboard: Reenable key repeat for pressing and holding keys
  defaults write -g ApplePressAndHoldEnabled -bool false

  # Finder: Show all extenions
  defaults write -g AppleShowAllExtensions -bool true

  # Finder: Show ~/Library in finder
  chflags nohidden ~/Library

  # Trackpad: enable tap to click for this user and for the login screen
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
  defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
  defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
  defaults write -g com.apple.mouse.tapBehavior -int 1

  # Finder: Show Status bar in Finder
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: Show icons for hard drives, servers, and removable media on the desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  # Finder: new windows start at home directory
  defaults write com.apple.finder NewWindowTarget -string PfHm
  defaults write com.apple.finder NewWindowTargetPath -string "file:///$HOME"

  # Finder: only search the current direcotry
  defaults write com.apple.finder FXDefaultSearchScope -string SCcf

  # Mission Control: Don't automatically rearrange Spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false

  # Dock: Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  # Dock: Disable recents
  defaults write com.apple.dock show-recents -bool false

  # Screenshot: Save screenshots with date in filename
  defaults write com.apple.screencapture include-date -bool true

  # Spotlight: don't send stuff to apple
  defaults write com.apple.lookup lookupEnabled -dict-add suggestionsEnabled -bool no

  # Spotlight: Don't index mounted volumes
  echo 'sudo needed to update spotlight settings'
  sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array /Volumes

  echo 'done: killing Dock and Finder'
fi

# For lazygit
cat <<EOF >~/Library/Application\ Support/lazygit/config.yml
gui:
  theme:
    primaryColor: "purple"
    secondaryColor: "lightgray"
    lightTheme: false
EOF

if (( refused )); then
  printf '\n%d file(s) not linked; move them aside and re-run\n' "$refused" >&2
  exit 1
fi

exit 0
