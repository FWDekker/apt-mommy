#!/bin/sh
set -e

# Create and compress 'Packages'
cd deb/
apt-ftparchive packages -c=../aptftp.conf ./ > ./Packages
< ./Packages gzip -9c > ./Packages.gz
< ./Packages xz -z - > ./Packages.xz
cd ../

# Create and sign 'Release', but remove old files first to prevent self-inclusion
rm -f deb/Release deb/Release.gpg deb/InRelease
apt-ftparchive release -c=./aptftp.conf deb/ > ./Release
< ./Release gpg --default-key 5875C679DA5EE60E -abs > ./Release.gpg
< ./Release gpg --default-key 5875C679DA5EE60E -abs --clearsign > ./InRelease
mv ./Release ./Release.gpg ./InRelease -t deb/
