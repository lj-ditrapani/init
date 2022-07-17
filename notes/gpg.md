Extract private gpg key

Passwords

    gpg --output gpg-main.pgp --armor --export-secret-key main

Private encryption

    gpg --output gpg-encrypt.pgp --armor --export-secret-key encrypt
    gpg --output gpg-core.pgp --armor --export-secret-key core
