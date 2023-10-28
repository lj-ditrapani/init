# First, ensure Virtualization technology is enabled in the bios (Intel-Vi-D Intel-Vi AMD-V)

# on host machine:
sudo apt-get install virtualbox
# Extension pack
sudo apt install virtualbox-ext-pack
sudo apt-get install virtualbox-guest-additions-iso
# downloads the iso here on host machine
/usr/share/virtualbox/VBoxGuestAdditions.iso
# load the iso into the vm optical drive

# in virtual machine guest:
run the script on the iso disk
