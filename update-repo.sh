#!/bin/bash

#Variables:
#PNAME is Package Name
#TSECT is Tweak Section
#MNAME is Maintainer Name
#VVAL is Version Value
#FNAME is File Name
#FSIZE is File Size
#TDESC is Tweak Description
#TNAME is Tweak Name
#ANAME is Author Name

rm Packages.bzip2

#use grep and if to figure out whether a package is already on the list
#grep can be used to get some of the variables, but not all
#may have to use grep reading a temporary file with the output of a command for something like FSIZE
echo ""
echo "Package: $PNAME" >> Package
echo "Section: $TSECT" >> Packages
echo "Maintainer: $MNAME" >> Packages
echo "Architecture: iphoneos-arm" >> Packages
echo "Version: $VVAL" >> Packages
echo "Filename: debs//$FNAME" >> Packages
echo "Size: $FSIZE" >> Packages
echo "MD5sum: $(md5sum $FNAME)" >> Packages
echo "SHA1: $(shasum $FNAME)" >> Packages
echo "SHA256: $(shasum -a 256 $FNAME)" >> Packages
echo "Description: $TDESC" >> Packages
echo "Name: $TNAME" >> Packages
echo "Author: $ANAME" >> Packages

cp Packages Packages-copy
bzip2 Packages-copy
mv Packages-copy.bz2 Packages.bz2
#If there is a temp file, delete it here
echo "Done, push the update in GitHub Desktop"
