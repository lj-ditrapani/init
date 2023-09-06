Ubuntu setup
===============================================================================

Steps:

- Follow instructions here: <https://github.com/lj-ditrapani/init>
- ssh:
    - Enable and start ssh.
    - Enable ssh password login.
    - From remote client, run `ssh-copy-id user@<ip>`
    - Disable ssh password login.
- Then run:
    ```
    sh v-init.sh
    ```
- Log out and log back in for group assignments & user settings to take effect
- Manually create new ssh keys to .ssh (`ssh-keygen -t ed25519 -C "your_email@example.com"`)
- Add new public ssh key to github
- Manually add keepass database & key file
- Setup firefox adblock
