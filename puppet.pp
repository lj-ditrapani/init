$packages = [
    'zip',
    'unzip',
    'software-properties-common',
    'zsh',
    'zsh-doc',
    'zsh-lovers',
    'vim-doc',
    'vim-nox',
]

package { $packages:
    ensure => 'installed'
}
