#!/bin/bash

#Part 1:
"/Applications/The Unarchiver.app/Contents/MacOS/The Unarchiver" "${1}"
FP=$(echo "${1%%.deb}")
rm "${FP}/debian-binary"
cFile=$(ls "${FP}" | grep "control.tar")
dFile=$(ls "${FP}" | grep "data.tar")
"/Applications/The Unarchiver.app/Contents/MacOS/The Unarchiver" "${FP}/${cFile}"
"/Applications/The Unarchiver.app/Contents/MacOS/The Unarchiver" "${FP}/${dFile}"
rm "${FP}/${cFile}" "${FP}/${dFile}"
mv "${FP}/control" "${FP}/DEBIAN"
mv "${FP}/data/"* "${FP}/"
rm -rf "${FP}/data"

#Part 2:
nano "${FP}/DEBIAN/control"

#Part 3:
rm "${FP}/.DS_Store" "${FP}/*/.DS_Store" "${FP}/*/*/.DS_Store"
dpkg-deb -b "${FP}" "${1}"
SIZE=$(wc -c <"${1}" | tr -d ' ')
MD5=$(md5sum "${1}")
SHA1=$(sha1sum "${1}")
SHA256=$(sha256sum "${1}")
echo ""
echo "Filename: ${1%%_iphoneos-arm.deb}"
echo "Size: ${SIZE}"
echo "MD5sum: ${MD5%% *}"
echo "SHA1: ${SHA1%% *}"
echo "SHA256: ${SHA256%% *}"
echo ""
rm -rf "${FP}"