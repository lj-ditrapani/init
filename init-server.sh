# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | \
    sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

# Does apt-get update
wget -O - https://deb.nodesource.com/setup_6.x | sudo /bin/bash -

# install packages
wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/master/install-server.sh | sudo bash

# setup user
sudo chsh -s /usr/bin/zsh ljd
sudo usermod -a -G netdev ljd

# dotfiles
sudo rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.rb

mkdir -p ~/local
mkdir -p ~/fun
mkdir -p ~/Downloads
mkdir -p ~/tmp
sudo npm install -g coffee-script

# git setup
git config --global user.name "Lyall Jonathan Di Trapani"
git config --global user.email lj.ditrapani@gmail.com
git config --global core.editor vim
git config --global push.default simple
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

# Seems to fail when run from install-server.sh
sudo apt-get -y install sbt

sudo rm -fr /var/lib/tomcat8/webapps/ROOT

# setup website
sudo rm -rf ~/fun/ditrapani.info
git clone https://github.com/lj-ditrapani/ditrapani.info.git ~/fun/ditrapani.info
cd ~/fun/ditrapani.info
sbt package

# Vim setup (seems to kill the init.sh script, so do it last)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
