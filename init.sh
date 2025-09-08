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
wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/main/install.sh | sudo bash

# setup user
sudo chsh -s /usr/bin/fish $USER
sudo usermod -aG audio,video,netdev,docker $USER

sudo systemctl stop ssh.service
sudo systemctl disable ssh.service
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# dotfiles
sudo rm -rf ~/dotfiles
git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
~/dotfiles/link.py
cd ~/dotfiles
git remote set-url origin git@github.com:lj-ditrapani/dotfiles.git
cd ~

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
mkdir -p ~/Downloads
mkdir -p ~/tmp
mkdir -p ~/.local/bin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

chmod 700 ~/.gnupg
sudo apt purge cloud-init -y
sudo rm -fr /etc/cloud && sudo rm -rf /var/lib/cloud/

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install \
  neovim \
  fish \
  nushell \
  ripgrep \
  fd \
  fzf \
  bat \
  fnm \
  uv \
  opam \
  rust \
  zig \
  dart-sdk \
  typst \
  rust-analyzer \
  harper \

fnm env --use-on-cd --shell fish | source
fnm install --lts
npm install -g typescript-language-server

uv tool install ruff@latest ty@latest
# uv tool install "python-lsp-server[all]"

sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
# for fish:
# sh (curl -L https://nixos.org/nix/install | psub) --daemon

sudo update-alternatives --set pinentry /usr/bin/pinentry-gtk-2
sudo update-alternatives --install /usr/bin/editor editor /home/linuxbrew/.linuxbrew/bin/nvim 60
sudo update-alternatives --set editor /home/linuxbrew/.linuxbrew/bin/nvim

sudo update-alternatives --set pinentry /usr/bin/pinentry-gtk-2
sudo update-alternatives --set editor /usr/bin/nvim
sudo snap install ghostty --classic

curl -fsS https://dl.brave.com/install.sh | sh
curl https://cursor.com/install -fsS | bash
