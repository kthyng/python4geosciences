#!/bin/bash

users1=$1
users2=$2

for id in `cat $users1 $users2` ; do
    cp -rf ../../python4geosciences /home/$id ;
    rm -rf /home/$id/python4geosciences/.git
    chown -R $id:$id /home/$id ;
done
