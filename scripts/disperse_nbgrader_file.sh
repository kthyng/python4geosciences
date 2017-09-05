#!/bin/bash
# how to run:
# roster=grads.csv
# name=${roster%.*}  # remove suffix and use for file names
# sudo ./disperse_nbgrader_file.sh users_$name.txt nbgrader_config.py
# ** need to rename each nbgrader_config_*.py file to be nbgrader_config.py when copying it into student directories

users=$1
file=$2

for id in `cat $users` ; do
    cp -rf $file /home/$id ;
    # removes path up to the file itself
    chown $id:$id /home/$id/${file##*/} ;
    echo copied $file for $id
done
