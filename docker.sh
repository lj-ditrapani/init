sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add official docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository to APT sources
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

sudo apt-get update
sudo apt-get install docker-ce

sudo groupadd docker
sudo usermod -aG docker ljd

sudo systemctl enable docker
sudo systemctl restart docker.service

# Now log out!

# To setup ubuntu to test with:
docker pull ubuntu:16.04
docker build -t init_ubuntu - < Dockerfile
docker run -it init_ubuntu /bin/bash

adduser ljd
usermod -aG sudo ljd
su ljd
cd
