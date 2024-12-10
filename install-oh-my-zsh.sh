cd $HOME
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv"
git clone "https://github.com/Aloxaf/fzf-tab" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"
git clone "https://github.com/MichaelAquilina/zsh-you-should-use.git" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use"
git clone "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k"
