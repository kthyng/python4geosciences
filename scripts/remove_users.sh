#!/bin/bash

# Oops, need to remove the user accounts I made
# usage: ./remove_users.sh users_undergrads.txt users_grads.txt
# also good for end of class

users1=$1
users2=$2

for id in `cat $users1 $users2` ; do
    sudo userdel -r $id
done
