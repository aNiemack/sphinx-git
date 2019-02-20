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

git svn clone https://svn-dares-dart.cgd.ucar.edu/DART --no-metadata --revision $REVISION
cd DART

git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch branches/nancy_new/models/bgrid_solo/work/obs_seq.in' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch branches/location_utils/models/cice/work/cice.r.nc' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch branches/radiance/observations/obs_converters/AIRS/readers/V6_FORTRAN_C_READERS.tar.gz' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch branches/rma_pop_static_data/models/POP/work/inputdata/ts_PHC2_jan_ic_gx1v6_20090205.ieeer8' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch branches/recam/models/cam-fv/work/caminput.nc' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch branches/rma_pop_static_data/models/POP/work/pop.r.nc' --prune-empty --tag-name-filter cat -- --all

git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now

for element in "$@"; do

        cd $element
        git init
        git add --all
        git commit -m "initilize git"
        git checkout -b $element
        git add --all
        git commit -m "from svn to github"
        git push --set-upstream  $REMOTE $element

done
