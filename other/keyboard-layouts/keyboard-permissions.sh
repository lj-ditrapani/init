# using via with keychron V4
# got to usevia.app (disable vimium)
# check chrome://device-log and examine errors
# to get hid device /dev/hidraw<n>
sudo chmod a+rw /dev/hidraw<n>
# reload
sudo chmod go-rw /dev/hidraw<n>
