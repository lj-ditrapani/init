curl https://github.com/sezanzeb/input-remapper/releases/download/2.0.0/input-remapper-2.0.0.deb > ~/Downloads/input-remapper.deb
sudo dpkg -i ~/Downloads/input-remapper.deb
sudo apt-get install -f
# run with:
sudo -E input-remapper-gtk
