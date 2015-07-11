# TODO: uncomment update, install and nodesource
# sudo apt-get update
cd ~
# sudo apt-get -y install puppet git curl
# curl -sL https://deb.nodesource.com/setup_0.12 | sudo /bin/bash -
rm -fr ~/puppet
git clone https://github.com/lj-ditrapani/puppet.git ~/puppet
sudo /usr/bin/puppet apply ~/puppet/puppet.pp
rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git
~/dotfiles/link.rb
sudo systemctl stop sshd.service
sudo systemctl disable sshd.service
mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
sudo npm install -g coffee-script jslint jshint coffeelint gulp
sudo /usr/share/doc/libdvdread4/install-css.sh
git config --global user.name "Lyall Jonathan Di Trapani"
git config --global user.email lj.ditrapani@gmail.com
git config --global core.editor vim
git config --global push.default simple
