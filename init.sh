sudo apt-get update
sudo apt-get install ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod 644 /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install packages
sudo apt-get update
sudo apt-get -y upgrade
sudo sed -i '/cdrom/d' /etc/apt/sources.list
wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/main/install.sh | sudo bash

# setup user
sudo chsh -s /usr/bin/zsh $USER
sudo usermod -aG audio,video,netdev $USER
sudo usermod -aG docker $USER

sudo systemctl stop ssh.service
sudo systemctl disable ssh.service
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# dotfiles
sudo rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.rb
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s $HOME/.local/kitty.app/bin/kitty /usr/bin/kitty

mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
mkdir -p ~/Downloads
mkdir -p ~/tmp

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.1-tem
sdk install gradle
sdk install sbt
sdk install scala
sdk install kotlin
sdk install kscript

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

curl https://pyenv.run | bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

chmod 700 ~/.gnupg
sudo apt purge cloud-init -y
sudo rm -fr /etc/cloud && sudo rm -rf /var/lib/cloud/

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" > ~/Downloads/vscode.deb
sudo dpkg -i ~/Downloads/vscode.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo update-alternatives --set pinentry /usr/bin/pinentry-gtk-2
sudo update-alternatives --set editor /usr/bin/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
