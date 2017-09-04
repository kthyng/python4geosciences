#!/bin/bash
# how to run:
# roster=grads.csv
# name=${roster%.*}  # remove suffix and use for file names
# sudo ./disperse_python4geosciences_file.sh users_$name.txt ../materials/1_core.ipynb

users=$1
file=$2

for id in `cat $users` ; do
    cp -rf $file /home/$id/python4geosciences/materials ;
    # removes path up to the file itself
    chown $id:$id /home/$id/python4geosciences/materials/${file##*/} ;
    echo copied $file for $id
done
