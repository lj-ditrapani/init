sudo apt-get update
sudo apt-get -y install git curl
curl -sL https://deb.nodesource.com/setup_0.12 | sudo /bin/bash -

# install packages
rm -fr ~/init
git clone https://github.com/lj-ditrapani/init.git ~/init
sudo ~/init/install.sh

# setup user
sudo chsh -s /usr/bin/zsh ljd
sudo usermod -a -G audio,video,netdev ljd

# dotfiles
rm -rf ~/dotfiles
cd ~
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.rb

sudo systemctl stop sshd.service
sudo systemctl disable sshd.service
mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
sudo npm install -g coffee-script jslint jshint coffeelint gulp
sudo /usr/share/doc/libdvdread4/install-css.sh

# git setup
git config --global user.name "Lyall Jonathan Di Trapani"
git config --global user.email lj.ditrapani@gmail.com
git config --global core.editor vim
git config --global push.default simple
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

# Vim setup
rm -fr ~/.vim/bundle/vim-coffee-script
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/kchmck/vim-coffee-script.git ~/.vim/bundle/vim-coffee-script/
