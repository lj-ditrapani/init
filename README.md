LJD Ubuntu Init Script
===============================================================================

Installs my favorite packages and configures everything the way I like it.
This is for a graphical workstation.
See the [README-server.md](README-server.md) for a non-graphical server version.


Steps
-----

- Backup data you want to keep
- Backup gpg key/ssh key/pass repo
- Hard-wire machine to network
- Download and install Ubuntu 20.04.2 server
  <https://releases.ubuntu.com/20.04.2/ubuntu-20.04.2-live-server-amd64.iso>
    - `sudo dd bs=4M if=ubuntu-20.04.2-live-server-amd64.iso of=/dev/sd<?> conv=fdatasync status=progress`
    - Select openssh-server only
- Then run:
    ```
    curl -L https://goo.gl/PG2Ht7 | bash
    ```
    <https://goo.gl/PG2Ht7> redirects to
    <https://raw.githubusercontent.com/lj-ditrapani/init/master/init-workstation.sh>
- Reboot to apply x11 keyboard layout
- Log out and log back in for group assignments & user settings to take effect
- Manually add core gnupg key
    - gpg --import main-sec.asc
    - gpg --edit-key main
    - trust
    - 5
    - quit
- Manually add ssh keys to .ssh
- Manually add passwords
    - git clone url .password-store
- Log into firefox sync in firefox
- Log into google account in google chrome
- `sudo dpkg-reconfigure tzdata` select America -> Toronto


pass
----

    sudo update-alternatives --config editor
    pick /usr/bin/nvim

    # generate random bytes
    sudo apt-get install rng-tools
    sudo rngd -r /dev/urandom


If hanging during boot due to "waiting for network configuration"
-----------------------------------------------------------------

    sudo vim /etc/network/interfaces

Comment out all interfaces but lo


Setting timezone
----------------

    timedatectl                         # see current
    timedatectl list-timezones          # list options
    sudo timedatectl set-timezone Europe/Bratislava
