#!/bin/bash

echo "Github Username: "
read USER
echo "Email: "
read EMAIL
echo "Enter Subversion revision number: "
read REVISION
echo "Enter URL of GitHub Repository: "
read REMOTE

git config --global credential.helper cache
git config --global user.email "$EMAIL"
git config --global user.name "$USER"

BRANCHES="$(cat branches.txt)"
git svn clone https://svn-dares-dart.cgd.ucar.edu/DART --include-paths="^(?:$BRANCHES) --ignore-paths="FEOM/mizzi" --no-metadata --revision "$REVISION:HEAD"
cd DART

while IFS='|' read -r line < branches.txt || [[ -n "$line" ]]; do
        
        IFS='/' read -ra array <<< "$line"
        cd $line
        git init
        git add --all
        git commit -m "initilize git"
        git checkout -b "${array[-1]}"
        ls -lRt | grep -E " [1-9].{8,}" > large.txt
        while IFS=' ' read -ra large < large.txt || [[ -n "$large" ]]; do
                path = "$(find -name ${large[6]}
                git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch $path' --prune-empty --tag-name-filter cat -- --all
        git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
        git reflog expire --expire=now --all
        git gc --prune=now      
        git add --all
        git commit -m "from svn to github"
        git push --set-upstream  $REMOTE "${array[-1]}"
        cd /work/DART

done
