sudo apt-get update
sudo apt-get upgrade
# To update kernel (check packages selected are ok)
# sudo do-release-upgrade
# sudo apt install update-manager-core # povides do-release-upgrade
vim +PluginUpdate +qall
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
rustup update
pyenv update
uv self update
sdk update
sdk selfupdate
sdk upgrade
opam update
