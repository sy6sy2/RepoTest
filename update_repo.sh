#!/usr/bin/env bash


# You should first put desired deb files in the deb folder

# Clean old files
rm ${REPO_ROOT}Packages
rm ${REPO_ROOT}Packages.gz
rm ${REPO_ROOT}Packages.bz2
rm ${REPO_ROOT}Packages.xz

# Generate Packages file
dpkg-scanpackages -m . /dev/null > Packages

# Generate Packages.* comppressed files
gzip -c9 Packages > Packages.gz
bzip2 -c9 Packages > Packages.bz2
xz -c9 Packages > Packages.xz
