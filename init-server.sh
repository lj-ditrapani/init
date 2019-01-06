# node 10
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

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
sudo npm install -g coffee-script

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install gradle
sdk install sbt
sdk install scala
sdk install kotlin
sdk install kscript

# Setup tomcat
echo "info.ditrapani.environment=production" | \
    sudo tee -a /var/lib/tomcat8/conf/catalina.properties
sudo systemctl restart tomcat8.service

# setup website
sudo rm -rf ~/fun/ditrapani.info
git clone https://github.com/lj-ditrapani/ditrapani.info.git ~/fun/ditrapani.info
cd ~/fun/ditrapani.info
sbt package

# Vim setup (seems to kill the init.sh script, so do it last)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
