curl -L https://github.com/neovim/neovim/releases/download/v0.3.4/nvim.appimage > ~/local/nvim.appimage
cd ~/local
chmod u+x nvim.appimage
# ./nvim.appimage

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
