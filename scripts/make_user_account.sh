#!/bin/bash


for id in `cat /root/pgs2017_g /root/pgs2017_ug` ; do
    adduser $id -p $password;
done
