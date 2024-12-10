https://sensible-side-buttons.archagon.net/
https://fireball.studio/oneswitch
https://adguard.com/en/adguard-mac/overview.html
https://arc.net/download
https://bitwarden.com/
https://iterm2.com/
https://www.libreoffice.org/donate/dl/mac-aarch64/24.8.3/en-US/LibreOffice_24.8.3_MacOS_aarch64.dmg
https://mullvad.net/en
https://proton.me/drive/download
https://proton.me/mail/download
https://termius.com/
https://crystalidea.com/macs-fan-control/download

screen brush - App Store
paste - App Store

remote for mac - google

lazy git config.yaml missing add it

cd $HOME
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"
git clone "https://github.com/Aloxaf/fzf-tab" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"
git clone "https://github.com/MichaelAquilina/zsh-you-should-use.git" "$ZSH_CUSTOM/plugins/you-should-use"
git clone "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
