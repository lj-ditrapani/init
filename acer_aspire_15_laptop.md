F12 set boot order

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