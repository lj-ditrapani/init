LJD Ubuntu Init Script
===============================================================================

Installs my favorite packages and configures everything the way I like it.
This is for a graphical workstation.
See the [README-server.md](README-server.md) for a non-graphical server version.


Steps
-----

1.  Backup data you want to keep
2.  Backup gpg key/ssh key/pass repo
3.  Download and install Ubuntu 18.04 server.
4.  Then run:
    ```
    wget -O - https://goo.gl/PG2Ht7 | bash
    ```
    <https://goo.gl/PG2Ht7> redirects to
    <https://raw.githubusercontent.com/lj-ditrapani/init/master/init-workstation.sh>
5. Either reboot or run `sudo dpkg-reconfigure keyboard-configuration`
   and then reboot to get keyboard layout working
6. Log out and log back in for group assignments & user settings to take effect
7. Un-mute and set alsamixer volume
8. Manually add core gnupg key
    - gpg --allow-secret-key-import --import main-sec.asc
    - gpg --edit-key main
    - trust
    - 5
    - quit
9. Manually add ssh keys to .ssh
10. Manually add passwords
    - git clone url .password-store
11. Log into firefox sync in firefox
12. Log into google account in google chrome


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
