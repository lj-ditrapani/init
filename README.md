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
- Download and install Ubuntu 18.04 server
    - `sudo dd bs=4M if=ubuntu-18.04-live-server-amd64.iso of=/dev/sd<?> conv=fdatasync status=progress`
    - Select openssh-server only
- Then run:
    ```
    wget -O - https://goo.gl/PG2Ht7 | bash
    ```
    <https://goo.gl/PG2Ht7> redirects to
    <https://raw.githubusercontent.com/lj-ditrapani/init/master/init-workstation.sh>
- Reboot to apply x11 keyboard layout
- Log out and log back in for group assignments & user settings to take effect
- Un-mute and set alsamixer volume
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


pass
----

    sudo update-alternatives --config editor
    pick vim.gtk

    # generate random bytes
    sudo apt-get install rng-tools
    sudo rngd -r /dev/urandom


If hanging during boot due to "waiting for network configuration"
-----------------------------------------------------------------

    sudo vim /etc/network/interfaces

Comment out all interfaces but lo
