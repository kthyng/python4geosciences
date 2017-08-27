#!/bin/bash

for id in `cat /root/pgs2017_g /root/pgs2017_ug` ; do 
    mkdir /d2/home/$id/notebooks ; 
    cp -rf python4geosciences /d2/home/$id/notebooks ; 
    rm -rf /d2/home/$id/notebooks/python4geosciences/.git
    chown -R $id:pythonspring2017 /d2/home/$id/notebooks ; 
done



