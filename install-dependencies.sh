dependencies=(
  neovim
  python@3.12
  docker
  awscli
  bat
  fzf
  lazygit
  tmux
  node
  dockutil
  ca-certificates
  cffi
  cryptography
  ripgrep
  dust
  fd
  gettext
  libevent
  libgit2
  libimobiledevice
  libimobiledevice-glue
  libomp
  libplist
  libssh2
  libtasn1
  libunistring
  libusbmuxd
  libuv
  libvterm
  lpeg
  lua
  luajit
  luarocks
  luv
  mpdecimal
  msgpack
  ncurses
  oniguruma
  openssl@3
  pcre2
  pycparser
  readline
  sqlite
  tree-sitter
  unibilium
  utf8proc
  xz)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask alt-tab
brew install --cask rectangle

for f in "${dependencies[@]}"; do
  brew install "$f"
done

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
