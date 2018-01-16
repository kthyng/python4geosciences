#!/bin/bash
# This updates a pre-existing clone of the class repo in the home
# directories of each user in the input users file
#
# how to run:
# roster=grads.csv
# name=${roster%.*}  # remove suffix and use for file names
# sudo ./repo_update.sh users_$name.txt

users=$1

for id in `cat $users` ; do
    git --git-dir=/home/$id/python4geosciences/.git --work-tree=/home/$id/python4geosciences pull

    echo updated repo for $id
done
