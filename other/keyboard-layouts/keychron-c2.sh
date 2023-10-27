# How to get function keys working with keychron C2

echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
# test f keys; do they work?
# If not:
# Hold FN + X + L for 4 seconds to change function mode

# to make premanant
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
