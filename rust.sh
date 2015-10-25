# rust setup
############

# Install rustc
curl -f -L https://static.rust-lang.org/rustup.sh | sh

# Install racer
git clone https://github.com/phildawes/racer.git ~/fun/racer
# Takes 6+ minutes to compile (esp sytex_syntax)
cd ~/fun/racer; cargo build --release
cd
# get rust source
curl -L https://static.rust-lang.org/dist/rustc-1.3.0-src.tar.gz -o ~/local/rustc-1.3.0-src.tar.gz
tar -zxvf ~/local/rustc-1.3.0-src.tar.gz -C ~/local/

# Uncomment rust racer vundle plugin in .vimrc
# and rust racer config in .vimrc

# Then run this
vim +PluginInstall +qall
