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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"
git clone "https://github.com/Aloxaf/fzf-tab" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"
git clone "https://github.com/MichaelAquilina/zsh-you-should-use.git" "$ZSH_CUSTOM/plugins/you-should-use"
git clone "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
