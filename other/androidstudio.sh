# download tar from https://developer.android.com/studio
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils cpu-checker
tar -zxvf $HOME/local/android-studio-ide-191.5977832-linux.tar.gz
sudo adduser $USER kvm
