#!/bin/bash
# how to run:
# disperse_python4geosciences_file.sh [filename]

users1=$1
users2=$2
file=$3

for id in `cat $users1 $users2` ; do
    cp -rf $file /home/$id/python4geosciences/materials ;
    # removes path up to the file itself
    chown $id:$id /home/$id/python4geosciences/materials/${file##*/} ;
    echo copied $file for $id
done
