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
