# Add official docker repo
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# BRITTLE:  Only works with Ubuntu 16.04; must update ubuntu-xenial to correct version for later Ubuntu releases
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' >> /etc/apt/sources.list.d/docker.list"

sudo apt-get install docker-engine
sudo usermod -a -G docker ljd

sudo systemctl enable docker
sudo systemctl restart docker.service
