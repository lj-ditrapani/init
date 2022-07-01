# Update distro (hirsute) to whatever (jammy)
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian hirsute contrib" \
    | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
# sudo apt-get update
# sudo apt-get install virtualbox-6.1

# Extension pack
# Download virtualbox extention from https://www.virtualbox.org/wiki/Downloads
# https://download.virtualbox.org/virtualbox/6.1.34/Oracle_VM_VirtualBox_Extension_Pack-6.1.34.vbox-extpack
# sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.34.vbox-extpack
