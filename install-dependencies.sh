dependencies=(
  ansible
  aws-cdk
  awscli
  bat
  direnv
  dockutil
  dust
  fd
  fzf
  gh
  git
  git-filter-repo
  gitleaks
  go
  graphviz
  htop
  iperf3
  iproute2mac
  jq
  lazygit
  libimobiledevice
  lua
  luarocks
  mole
  mpv
  neovim
  nmap
  pipx
  poetry
  python@3.13
  ripgrep
  ruby
  stripe-cli
  tailscale
  television
  terraform
  trash
  tree-sitter
  trufflehog
  uv
  zellij
)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask docker-desktop ghostty karabiner-elements rectangle

brew install "${dependencies[@]}"

dockutil --remove Music
dockutil --remove Safari
dockutil --remove Launchpad
dockutil --remove TV
dockutil --remove Calendar
dockutil --remove Contacts
dockutil --remove Messages
dockutil --remove Mail
dockutil --remove Maps
dockutil --remove Photos
dockutil --remove FaceTime
dockutil --remove Reminders
dockutil --remove Freeform
dockutil --remove News
dockutil --remove "App Store"
dockutil --remove "System Settings"
dockutil --remove "iPhone Mirroring"
