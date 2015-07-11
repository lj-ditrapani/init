# TODO: uncomment update
# sudo apt-get update
cd ~
sudo apt-get -y install puppet git curl
curl -sL https://deb.nodesource.com/setup_0.12 | sudo /bin/bash -
rm -fr ~/puppet
git clone https://github.com/lj-ditrapani/puppet.git ~/puppet
sudo /usr/bin/puppet apply ~/puppet/puppet.pp
rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git
~/dotfiles/link.rb
