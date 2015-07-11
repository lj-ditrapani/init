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
    'nodejs-dev',
    'npm',

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
]

package { $packages:
    ensure => 'installed'
}
