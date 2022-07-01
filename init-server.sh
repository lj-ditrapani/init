# install packages
sudo apt-get update
sudo apt-get -y upgrade
wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/master/install-server.sh | sudo bash

# setup user
sudo chsh -s /usr/bin/zsh $USER
sudo usermod -aG netdev $USER
sudo usermod -aG docker $USER

# dotfiles
sudo rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.rb
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

mkdir -p ~/local
mkdir -p ~/fun
mkdir -p ~/Downloads
mkdir -p ~/tmp

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 17.0.3-tem
sdk install gradle
sdk install sbt
sdk install scala
sdk install kotlin
sdk install kscript

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Vim setup (seems to kill the init.sh script, so do it last)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
