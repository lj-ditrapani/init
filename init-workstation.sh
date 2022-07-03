# google chrome
wget -O- https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | sudo gpg --dearmor --yes --output /usr/share/keyrings/google.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
    | sudo tee -a /etc/apt/sources.list.d/google.list

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

# TODO: modify for wayland?
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
sdk install java 17.0.3-tem
sdk install gradle
sdk install sbt
sdk install scala
sdk install kotlin
sdk install kscript

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

chmod 700 ~/.gnupg
sudo apt purge cloud-init -y
sudo rm -fr /etc/cloud && sudo rm -rf /var/lib/cloud/

# Redirect to /dev/null 2 minute "waiting for network to be configured" on startup
# sudo systemctl mask systemd-networkd-wait-online.service

sudo timedatectl set-timezone US/Eastern
sudo update-alternatives --set editor /usr/bin/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
