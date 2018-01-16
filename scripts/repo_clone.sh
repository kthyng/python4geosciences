#!/bin/bash
# This creates the initial clone of the class repo in the home
# directories of each user in the input users file
#
# how to run:
# roster=grads.csv
# name=${roster%.*}  # remove suffix and use for file names
# sudo ./repo_clone.sh users_$name.txt

users=$1

for id in `cat $users` ; do
    git clone https://github.com/kthyng/python4geosciences.git /home/$id/python4geosciences
    chown -R $id:$id /home/$id/python4geosciences

    echo cloned repo for $id
done
