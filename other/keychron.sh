# How to get function keys working with keychron

# Hold FN + X + L for 4 seconds to change function mode
# It flips between the two?  May need to do it twice...
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
# should work now, otherwise do FN+X+L again

# to make premanant
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
