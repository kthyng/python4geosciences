#!/bin/bash
# how to run:
# disperse_python4geosciences_file.sh [filename]

file=$1
echo copyng $file

for id in `cat /root/pgs2017_g /root/pgs2017_ug` ; do
    cp -rf $file /d2/home/$id/notebooks/python4geosciences/materials ;
    chown $id:pythonspring2017 /d2/home/$id/notebooks/python4geosciences/materials/${file##*/} ;
    echo copied $file for $id
done
