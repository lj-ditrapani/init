# TODO: uncomment update
# sudo apt-get update
sudo apt-get -y install puppet git
rm -fr ~/puppet
git clone https://github.com/lj-ditrapani/puppet.git ~/puppet
sudo /usr/bin/puppet apply ~/puppet/puppet.pp
