LJD Ubuntu Init Script
===============================================================================

Installs my favorite packages and configures everything the way I like it.


Steps
-----

- Backup data you want to keep
- Backup gpg key/pass repo
- Hard-wire machine to network
- Download and install Ubuntu Desktop 24.10
  <https://releases.ubuntu.com/24.10/ubuntu-24.10-desktop-amd64.iso>
    - `sudo dd bs=4M if=ubuntu-24.10-desktop-amd64.iso of=/dev/sd<?> conv=fdatasync status=progress`
- Then run:
    ```
    wget -O - https://t.ly/30gNP | bash
    ```
    <https://t.ly/30gNP> redirects to
    <https://raw.githubusercontent.com/lj-ditrapani/init/main/init.sh>
- Log out and log back in for group assignments & user settings to take effect
- Manually add core gnupg key
    - gpg --output gpg-pass-sec.asc --armor --export-secret-key pass
    - gpg --import gpg-pass-sec.asc
    - gpg --edit-key pass
    - trust
    - 5
    - quit
- Manually create new ssh keys to .ssh (`ssh-keygen -t ed25519 -C "your_email@example.com"`)
- Add new public ssh key to git repos
- Manually add passwords
    - git clone url .password-store
- Log into firefox sync in firefox
    - config ABP
- install vscode extensions
    - vim
    - prettier (set prettier as default)
    - OCaml Platform
    - python (intelliSense pylance)
    - isort (python sort imports)
    - Language Support for Java by Red Hat
    - Debugger for Java
    - Test Runner for Java
    - Scala (metals)
    - Scala Syntax
- make sure password is encrypted using yescrypt with 11 rounds
    ```
    sudo vim /etc/pam.d/common-password
    password	[success=2 default=ignore]	pam_unix.so ... yescrypt rounds=11
    # just make sure the line ends with yescrypt rounds=11
    sudo cat /etc/shadow
    # make sure it uses $y instead of $6.  If $6, then continue:
    passwd  # change to temp password
    passwd  # change back to desired password
    cat /etc/shadow
    # now it should have $y
    ```
- copy monitor config to gdm to get mirrored display at login screen as-well.
  `sudo cp .config/monitors.xml /var/lib/gdm3/.config`
- disable laptop suspend on lid switch, set to ignore.
    ```
    sudo vim /etc/systemd/logind.conf
    HandleLidSwitch=ignore
    ```
- for nvidia, ensure proprietary gpu drivers 535 non-open.
