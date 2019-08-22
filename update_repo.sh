#!/usr/bin/env bash

# You need to adapt these variables
REPO_ROOT="./"

# You should first put desired deb files in the deb folder

# Clean old files
rm ${REPO_ROOT}Packages
rm ${REPO_ROOT}Packages.gz
rm ${REPO_ROOT}Packages.bz2
rm ${REPO_ROOT}Packages.xz

# Generate Packages file
dpkg-scanpackages -m ${REPO_ROOT}deb /dev/null > ${REPO_ROOT}Packages

# Generate Packages.* comppressed files
gzip -c9 ${REPO_ROOT}Packages > ${REPO_ROOT}Packages.gz
bzip2 -c9 ${REPO_ROOT}Packages > ${REPO_ROOT}Packages.bz2
xz -c9 ${REPO_ROOT}Packages > ${REPO_ROOT}Packages.xz
