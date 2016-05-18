# Download steam_latest.deb from steam website
curl media.steampowered.com/client/installer/steam.deb > ~/steam_latest.db
python-apt xterm

sudo apt-get install -f
sudo dpkg -i steam.deb
