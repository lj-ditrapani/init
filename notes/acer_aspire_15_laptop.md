F2 on boot to enter bios
- Set boot to Legacy (instead of UFIE)
- Enable F2 boot menue
- save and exit

F12 set boot order


Don't sleep when lid shuts
--------------------------

To stop external monitor for disconnecting when laptop sleeps when lid is shut

    sudo vim /etc/systemd/logind.conf

Add a line HandleLidSwitch=ignore (make sure it's not commented out!)

    sudo systemctl restart systemd-logind.service


Audio
-----

If audio won't play because it is using HDMI and default sound card instead of PCH:

sudo vim /etc/asound.conf

    pcm.!default {
        type hw
        card 1
    }
    ctl.!default {
        type hw
        card 1
    }

or maybe

    pcm.!default {
      type plug
      slave {
        pcm "hw:1,0"
      }
    }
    ctl.!default {
      type hw
      card 1
    }
