#!/bin/bash
  
echo "Enter Revision number: "
read REVISION
echo "Enter URL of GitHub Repository: "
read REMOTE

for element in "$@"; do

        git svn clone https://svn-dares-dart.cgd.ucar.edu/DART/$element --no-metadata --no-minimize-url --revision $REVISION
        git checkout -b $element
        git add --all
        git commit -m "from svn to github"
        git push -u $REMOTE

done
