Ubuntu setup
===============================================================================

Steps:

- Follow instructions here: <https://github.com/lj-ditrapani/init>
- ssh:
    - Enable and start ssh.
    - Enable ssh password login.
    - From remote client, run `ssh-copy-id user@<ip>`
- Then run:
    ```
    sh init.sh
    ```
- Log out and log back in for group assignments & user settings to take effect
- Manually create new ssh keys to .ssh (`ssh-keygen -t ed25519 -C "your_email@example.com"`)
- Add new public ssh key to github
- Manually add keepass database & key file
- `sudo update-alternatives --set editor /usr/bin/nvim`
- `git checkout vbranch`
- Setup firefox adblock
