# TODO: uncomment update
# sudo apt-get update
sudo apt-get -y install puppet git
mkdir ~/fun
git clone https://github.com/lj-ditrapani/puppet.git ~/fun/puppet
/usr/bin/puppet apply ~/fun/puppet/puppet.pp
