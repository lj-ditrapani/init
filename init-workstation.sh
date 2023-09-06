# google chrome
wget -O- https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | sudo gpg --dearmor --yes --output /usr/share/keyrings/google.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
    | sudo tee -a /etc/apt/sources.list.d/google.list

# instructions: https://i3wm.org/docs/repositories.html
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
rm ./keyring.deb

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

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

# Map caps lock to escape for xorg
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

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

curl https://pyenv.run | bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

chmod 700 ~/.gnupg
sudo apt purge cloud-init -y
sudo rm -fr /etc/cloud && sudo rm -rf /var/lib/cloud/

sudo timedatectl set-timezone US/Eastern
sudo update-alternatives --set editor /usr/bin/nvim
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" > ~/Downloads/vscode.deb
sudo dpkg -i ~/Downloads/vscode.deb

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
