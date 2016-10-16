# This does not work!  Wasted 2 hours of my life...
# just using intel graphics
# have also tried just installing bumblebee and primus and use nouvea

sudo apt-get purge xserver-xorg-video-nouveau
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install ubuntu-drivers-common
# Run this to get the recommended binary version
ubuntu-drivers devices
# Replace 370 with the cerommended binary version
sudo apt-get install --no-install-recommends nvidia-370 nvidia-settings libcuda1-370 nvidia-opencl-icd-370 bumblebee-nvidia primus

sudo shutdown -h now

# don't do this, installs the world
# sudo ubuntu-drivers autoinstall
