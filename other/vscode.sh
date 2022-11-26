curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" > ~/Downloads/vscode.deb
sudo dpkg -i ~/Downloads/vscode.deb

vscode
# which is aliased in .zshrc to:
code --enable-features=UseOzonePlatform --ozone-platform=wayland --log debug
# install extensions
# - vim
# - prettier (set prettier as default)
# - Scala (metals)
# - Scala Syntax
# - Language Support for Java by Red Hat
# - Debugger for Java
# - Test Runner for Java

# In case caps lock stops working as esc:
{
    "keyboard.dispatch": "keyCode"
}
