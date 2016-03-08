LJD Ubuntu Init Script
===============================================================================

Updated for Ubuntu 15.10.

Installs my favorite packages and configures everything the way I like it.

    wget -O - https://raw.githubusercontent.com/lj-ditrapani/init/master/init.sh | bash


Additional steps

- Un-mute and set alsamixer volume
- Log out and log back in for group assignments & user settings to take effect
- Manually add core gnupg key
- Manually add ssh keys to .ssh
- Manually add passwords
- Log into firefox sync


TODO
----

- Move docker install to separate file?

Setting up wireless
-------------------

Add the following lines to /etc/network/interfaces

    sudo vi /etc/network/interfaces
    # to connect on boot up
    auto wlan0
    iface wlan0 inet dhcp
    wpa-ssid <my_ssid>
    wpa-psk <my_ssid_password>

Then bring the interface up

    sudo ifup -v wlan0

or

    sudo ip link set wlan0 up

If blocked by rfkill

    rfkill list all
    sudo rfkill unblock all

Scan without wicd-curses

    sudo iwlist scan

To restart networking

sudo service networking restart

pass
----

    sudo update-alternatives --config editor
    pick vim

    # generate random bytes
    sudo apt-get install rng-tools
    sudo rngd -r /dev/urandom
