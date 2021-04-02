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
