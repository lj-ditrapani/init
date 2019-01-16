# install packages
sudo apt-get update
sudo apt-get -y upgrade
wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/master/install-server.sh | sudo bash

# setup user
sudo chsh -s /usr/bin/zsh ljd
sudo usermod -a -G netdev ljd

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
sdk install java
sdk install gradle
sdk install sbt
sdk install scala
sdk install kotlin
sdk install kscript

wget -O - https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install --lts

sudo npm install -g coffee-script

curl -L https://sh.rustup.rs | sh

# Setup tomcat
echo "info.ditrapani.environment=production" | \
    sudo tee -a /var/lib/tomcat8/conf/catalina.properties
sudo systemctl restart tomcat8.service

# Vim setup (seems to kill the init.sh script, so do it last)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
