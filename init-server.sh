# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | \
    sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

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

# Seems to fail when run from install-server.sh
sudo apt-get -y install sbt

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
