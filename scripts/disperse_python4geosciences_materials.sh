#!/bin/bash

users=$1

for id in `cat $users` ; do
    cp -rf ../../python4geosciences /home/$id ;
    rm -rf /home/$id/python4geosciences/.git
    chown -R $id:$id /home/$id ;
done
