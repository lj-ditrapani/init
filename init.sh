# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | \
    sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | \
    sudo tee -a /etc/apt/sources.list.d/google.list

# Does apt-get update
wget -O - https://deb.nodesource.com/setup_6.x | sudo /bin/bash -

# install packages
wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/master/install.sh | sudo bash

# setup user
sudo chsh -s /usr/bin/zsh ljd
sudo usermod -a -G audio,video,netdev ljd

# dotfiles
sudo rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.rb
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

sudo systemctl stop sshd.service
sudo systemctl disable sshd.service
mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
mkdir -p ~/Downloads
mkdir -p ~/tmp
sudo npm install -g coffee-script

# Map caps lock to escape
sudo sed -i 's/XKBOPTIONS=".*"/XKBOPTIONS="caps:escape"/' /etc/default/keyboard

# This has a curses pop-up if ljd is not already in the netdev group
sudo apt-get -y install wicd-curses

# Vim setup (seems to kill the init.sh script, so do it last)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
