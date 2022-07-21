- Start chrome with

    google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-gpu-rasterization

  Then set the chrome flag <chrome://flags> for ozone to wayland.

  These flags:
  - ozone-platform-hint=wayland
  For screen sharing:
  - enable-webrtc-pipewire-capturer
  - enable-gpu-rasterization

  <https://www.reddit.com/r/Fedora/comments/rkzp78/make_chrome_run_on_wayland_permanently/>

- Log into google account in google chrome

Screen sharing
--------------

<https://www.reddit.com/r/swaywm/comments/l4e55v/guide_how_to_screenshare_from_chromiumfirefox/>

    sudo apt-get install xdg-desktop-portal-wlr

firefox needs MOZ_ENABLE_WAYLAND=1

If you're running Chrome, enable in chrome://flags.
  These flags:
  - enable-webrtc-pipewire-capturer
  - enable-gpu-rasterization

Add to .zshrc XDG_CURRENT_DESKTOP=sway

Run this first in shell.
/usr/libexec/xdg-desktop-portal -r & /usr/libexec/xdg-desktop-portal-wlr
