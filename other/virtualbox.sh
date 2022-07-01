# Update distro (hirsute) to whatever (jammy)
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian hirsute contrib" \
    | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
# sudo apt-get update
# sudo apt-get install virtualbox-6.1
