sudo apt-get update
sudo apt-get upgrade
# To update kernel (check packages selected are ok)
# sudo apt-get dist-upgrade
vim +PluginUpdate +qall
rustup update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
nvm install --lts
# nvm alias default <version#>
pyenv update
sdk update
sdk selfupdate
sdk upgrade
