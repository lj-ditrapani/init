wget -q -O - https://www.virtualbox.org/download/oracle_vbox_2016.asc | \
    sudo apt-key add -
echo "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" | \
    sudo tee -a /etc/apt/sources.list.d/virtualbox.list
# sudo apt-get install virtualbox-6.0
