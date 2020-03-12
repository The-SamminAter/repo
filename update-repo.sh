#!/bin/bash
rm Packages.bzip2
# use grep to figure out whether a package is already on the list

# use grep to get the package name

# use grep to get LITERALLY EVERYTHING ELSE

cp Packages Packages-copy
bzip2 Packages-copy
mv Packages-copy.bz2 Packages.bz2
echo "Done, push the update in GitHub Desktop"
