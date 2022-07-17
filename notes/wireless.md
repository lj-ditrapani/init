Forcing connection to specific BSSID
------------------------------------

List BSSIDs

    nmcli device wifi

Connect to specific BSSID

    nmcli d wifi connect XX:XX:XX:XX:XX:XX

<https://askubuntu.com/questions/833905/how-can-i-connect-to-a-specific-bssid>

Setting up wireless without nmtui
---------------------------------

    sudo vim /etc/netplan/01-netcfg.yaml

```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp2s0:
      dhcp4: yes
      dhcp6: yes
  wifis:
    wlp3s0:
      dhcp4: yes
      dhcp6: yes
      access-points:
        "peace":
          password: "**********"
```

    sudo netplan try
    sudo netplan apply
