# openvpn --config server.openvpn
sudo ufw default deny incoming
sudo ufw default reject outgoing
sudo ufw allow out 53/udp
sudo ufw allow out on tun0
# sudo ufw allow out from ip_address_of_vpn_server
sudo ufw allow out from 172.111.207.4
sudo ufw enable
sudo ufw status verbose
# sudo ufw disable
# sudo ufw delete [rule]
# sudo ufw delete allow from ip_address_of_vpn_server
# sudo ufw --force reset
