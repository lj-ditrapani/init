# Download steam_latest.deb from steam website
curl http://repo.steampowered.com/steam/archive/precise/steam_latest.deb > ~/Downloads/steam.deb
sudo apt-get install python-apt xterm

sudo dpkg -i ~/Downloads/steam.deb
sudo apt-get install -f
sudo dpkg -i ~/Downloads/steam.deb
