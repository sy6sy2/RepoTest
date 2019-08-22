#!/usr/bin/env bash

# This script will scan all *.deb files in the deb folder add generate Packages.* files

# YOU NEED TO ADJUST THE ROOT_FOLDER VAR TO THE PATH OF THE "ios" FOLDER (the one displayed at http://mirrors.kodi.tv/apt/ios/)
ROOT_FOLDER="."

# Move at the repo root
cd ${ROOT_FOLDER}

# Clean old files
rm Packages
rm Packages.*

# Generate Packages file
dpkg-scanpackages -m ./deb /dev/null > Packages

# Generate Packages.* comppressed files
gzip -c9 Packages > Packages.gz
bzip2 -c9 Packages > Packages.bz2
xz -c9 Packages > Packages.xz
