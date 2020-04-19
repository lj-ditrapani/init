# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | \
    sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | \
    sudo tee -a /etc/apt/sources.list.d/google.list

# install packages
sudo apt-get update
sudo apt-get -y upgrade
sudo sed -i '/cdrom/d' /etc/apt/sources.list
wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/master/install-workstation.sh | sudo bash

# Because google chrome deb will create its own file
sudo rm -f /etc/apt/sources.list.d/google.list

# setup user
sudo chsh -s /usr/bin/zsh $USER
sudo usermod -aG audio,video,netdev $USER
sudo usermod -aG docker $USER

sudo systemctl stop ssh.service
sudo systemctl disable ssh.service

# dotfiles
sudo rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.rb
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

# Map caps lock to escape
sudo sed -i 's/XKBOPTIONS=".*"/XKBOPTIONS="caps:escape"/' /etc/default/keyboard

mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
mkdir -p ~/Downloads
mkdir -p ~/tmp

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.202-zulufx
sdk install java 11.0.2-zulufx
sdk install gradle
sdk install sbt
sdk install scala
sdk install kotlin
sdk install kscript

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

npm install -g coffee-script

curl -L https://sh.rustup.rs | sh -s -- -y

# This has a curses pop-up if ljd is not already in the netdev group
sudo apt-get -y install wicd-curses

# Redirect to /dev/null 2 minute "waiting for network to be configured" on startup
sudo systemctl mask systemd-networkd-wait-online.service

# Vim setup (seems to kill the init.sh script, so do it last)
curl https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage > ~/local/
chmod u+x ~/local/nvim.appimage

cd ~/Downloads
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ~/Downloads/ripgrep_11.0.2_amd64.deb
cd ~

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
