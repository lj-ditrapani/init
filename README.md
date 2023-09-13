LJD Ubuntu Init Script
===============================================================================

Installs my favorite packages and configures everything the way I like it.
This is for a graphical workstation.
See the [README-server.md](README-server.md) for a non-graphical server version.


Steps
-----

- Backup data you want to keep
- Backup gpg key/pass repo
- Hard-wire machine to network
- Download and install Ubuntu 22.04.2 server
  <https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso>
    - `sudo dd bs=4M if=ubuntu-22.04-live-server-amd64.iso of=/dev/sd<?> conv=fdatasync status=progress`
    - Select openssh-server only
- Then run:
    ```
    curl -L https://goo.gl/PG2Ht7 | bash
    ```
    <https://goo.gl/PG2Ht7> redirects to
    <https://raw.githubusercontent.com/lj-ditrapani/init/master/init-workstation.sh>
- Log out and log back in for group assignments & user settings to take effect
- Manually add core gnupg key
    - gpg --import main-sec.asc
    - gpg --edit-key main
    - trust
    - 5
    - quit
- Manually create new ssh keys to .ssh (`ssh-keygen -t ed25519 -C "your_email@example.com"`)
- Add new public ssh key to github
- Manually add passwords
    - git clone url .password-store
- Log into firefox sync in firefox
    - config ABP
- install vscode extensions
    - vim
    - prettier (set prettier as default)
    - python (intelliSense pylance)
    - isort (python sort imports)
    - Language Support for Java by Red Hat
    - Debugger for Java
    - Test Runner for Java
    - Scala (metals)
    - Scala Syntax

