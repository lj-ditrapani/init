$packages = [
    'zip',
    'unzip',
    'software-properties-common',
    'zsh',
    'zsh-doc',
    'zsh-lovers',
    'vim-doc',
    'vim-nox',
    'wicd-curses',
    'alsa-utils',

    # X
    'xorg',
    'xterm',
    'i3',
    'synaptic',
    'firefox',
    'evince',
    'xchm',
    'build-essential',

    # node
    'nodejs',

    # python
    'python3-doc',
    'idle3',
    'python3-examples',
    'python3-pil',
    'python3-pil.imagetk',

    # ruby
    'ruby-full',
    'ri',
    'ruby2.1-doc',

    # essential dev tools
    'curl',
    'git',
    'silversearcher-ag',
    'xsel',
    'docker',
    'tmux',
    # for ssh sftp and scp access on sofi's pc
    'openssh-server',

    # media
    'flashplugin-installer',
    'vlc',
    # bit-torrent
    'transmission-gtk',

    # rvm requirements
    'gawk',
    'libssl-dev',
    'libyaml-dev',
    'libyaml-dev',
    'libsqlite3-dev',
    'autoconf',
    'libgdbm-dev',
    'libncurses5-dev',
    'automake',
    'libtool',
    'bison',
    'pkg-config',

    # Graphics
    'gtypist',
    'inkscape',
    'mesa-utils',
    'feh',
    'eog',
    'imagemagick',
    'imagemagick-doc',

    # More dev tools
    'bvi',
    'tidy',
    'tidy-doc',
    'dos2unix',
    'sqlite3',
    'sqlite3-doc',

    # extract .rar, non-free
    'unrar',
    'p7zip-full',
    'libreoffice-calc',

    # Android
    'android-tools-adb',
    'android-tools-fastboot',
    'mtpfs',

    # Graphical dev
    'gedit',
    'lxterminal',

    # More media
    'mplayer2',
    # to play SNES SPC files
    'audacious',
    # For firefox itunes streaming
    'gstreamer1.0-libav',
    'gstreamer1.0-plugins-bad',
    # for TBN streaming
    'gstreamer1.0-plugins-ugly',
]

package { $packages:
    ensure => 'installed',
}
