sudo apt-get update
sudo apt-get -y install git curl
curl -L https://deb.nodesource.com/setup_4.x | sudo /bin/bash -

# install packages
curl https://raw.githubusercontent.com/lj-ditrapani/init/master/install.sh | sudo bash

# setup user
sudo chsh -s /usr/bin/zsh ljd
sudo usermod -a -G audio,video,netdev,docker ljd

# dotfiles
rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.rb

sudo systemctl stop sshd.service
sudo systemctl disable sshd.service
sudo systemctl enable docker
sudo systemctl restart docker.service
mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
sudo npm install -g coffee-script jslint jshint coffeelint gulp

# git setup
git config --global user.name "Lyall Jonathan Di Trapani"
git config --global user.email lj.ditrapani@gmail.com
git config --global core.editor vim
git config --global push.default simple
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

# Vim setup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# This has a curses pop-up if ljd is not already in the netdev group
sudo apt-get -y install wicd-curses
