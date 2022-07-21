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


Full network-manager applet
---------------------------

If you need the full network-manager gui (e.g. to connect over vpn or use some other nm plugin not supported in nmtui),
you can install it with

    sudo apt-get install network-manager-gnome

Then use it with nm-connection-editor.  nm-applet does not work properly on sway yet.

This will pull in a lot of gnome libraries, including gdm3

    sudo apt-get remove gdm3
