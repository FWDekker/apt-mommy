# apt-mommy 📦
github-based apt repository for [mommy](https://github.com/FWDekker/mommy)~

see [mommy](https://github.com/FWDekker/mommy) for installation instructions~


## development ⚗️
this is a [flat apt repository](https://wiki.debian.org/DebianRepository/Format#Flat_Repository_Format) for
debian-based systems such as debian and ubuntu~

to release a new version of mommy, simply add the new `.deb` file to the `deb/` directory and run `update.sh` to update
the `Packages` and `Release` files, and to compress and sign them.
signing requires that the pgp private key is loaded.
this is all done automatically in
[mommy's cd action](https://github.com/FWDekker/mommy/blob/main/.github/workflows/cd.yml)~

the pgp key was generated using gnupg 2.2.40, libgcrypt 1.10.2, using `gpg --full-gen-key` with options
`RSA (sign only)`, key size `4096`, no expiration, my name and email address, no comment, and no passphrase.
the resulting public key has id `5875C679DA5EE60E` and is stored in
[deb/Release.key](https://github.com/FWDekker/apt-mommy/blob/main/deb/Release.key)~
