sudo apt-get update
sudo apt-get install ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod 644 /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub \
  | sudo gpg  --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' \
  | sudo tee /etc/apt/sources.list.d/dart_stable.list

sudo add-apt-repository ppa:fish-shell/release-4

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
sudo ln -s $HOME/.local/kitty.app/bin/kitty /usr/bin/kitty

mkdir -p ~/local
mkdir -p ~/usb
mkdir -p ~/media
mkdir -p ~/fun
mkdir -p ~/Downloads
mkdir -p ~/tmp
mkdir -p ~/.local/bin

curl -OL "https://github.com/helix-editor/helix/releases/download/25.07.1/helix_25.7.1-1_amd64.deb" --output-dir ~/Downloads
sudo dpkg -i ~/Downloads/helix_25.7.1-1_amd64.deb

curl -fsSL https://fnm.vercel.app/install | bash
fnm env --use-on-cd --shell fish | source
fnm install --lts
npm install -g typescript-language-server

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 23.0.2-tem
sdk install gradle
sdk install sbt
sdk install scala
sdk install kotlin

curl -fsSL https://pyenv.run | bash
curl -LsSf https://astral.sh/uv/install.sh | sh
uv tool install ruff@latest ty@latest
# uv tool install "python-lsp-server[all]"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# ziglang can be crazy slow
# "https://ziglang.org/download/0.14.0/zig-linux-x86_64-0.14.0.tar.xz"
# Using mirror instead
curl -L "https://zigmirror.nesovic.dev/zig/zig-linux-x86_64-0.15.0-dev.10+214750fcf.tar.xz" -o ~/.local/zig-0.15.0.tar.xz
cd ~/.local
tar -xf zig-0.15.0.tar.xz
rm -f $HOME/.local/bin/zig
ln -s $HOME/.local/zig-linux-x86_64-0.15.0-dev.10+214750fcf/zig $HOME/.local/bin
cd

chmod 700 ~/.gnupg
sudo apt purge cloud-init -y
sudo rm -fr /etc/cloud && sudo rm -rf /var/lib/cloud/

ln -s /usr/bin/batcat ~/.local/bin/bat
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install nushell typst rust-analyzer

sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
# for fish:
# sh (curl -L https://nixos.org/nix/install | psub) --daemon

# don't run as root
opam init -y
eval $(opam env --switch=default)
opam install ocaml-lsp-server odoc ocamlformat utop merlin

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" > ~/Downloads/vscode.deb
sudo dpkg -i ~/Downloads/vscode.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

curl -fsS https://dl.brave.com/install.sh | sh

sudo update-alternatives --set pinentry /usr/bin/pinentry-gtk-2
sudo update-alternatives --set editor /usr/bin/nvim
sudo snap install intellij-idea-community --classic
sudo snap install ghostty --classic
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
