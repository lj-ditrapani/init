sudo apt-get -y install \
    mednafen \
    stella \
    vice \
    fceux \
    visualboyadvance-gtk \
    higan \
#    mednafen           snes, playstation, gba, genesis, sms, nes
#    stella             atari 2600
#    mess               atari 2600, commodore 64
#    vice               commodore 64
#    fceux              nes
#    visualboyadvance-gtk    # gba
#    higan                   # snes

# Copy over built-in ROMs for vice
sudo cp ~/media/media/videoGames/emulation/c64/built-in-ROMs{basic,chargen,kernal} /usr/lib/vice/C64
# Get vice sound working
