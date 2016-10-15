sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install ubuntu-drivers-common
# Run this to get the recommended binary version
ubuntu-drivers devices
# Replace 370 with the cerommended binary version
sudo apt-get install --no-install-recommends nvidia-370 nvidia-settings libcuda1-370 nvidia-opencl-icd-370 bumblebee-nvidia
sudo shutdown -h now

# don't do this, installs the world
# sudo ubuntu-drivers autoinstall
