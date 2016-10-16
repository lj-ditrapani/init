# Download steam_latest.deb from steam website
curl media.steampowered.com/client/installer/steam.deb > ~/steam.db
sudo apt-get install python-apt xterm

sudo dpkg -i steam.deb
sudo apt-get install -f
sudo dpkg -i steam.deb
