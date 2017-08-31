#!/bin/bash

# Oops, need to remove the user accounts I made
# usage: ./remove_users.sh users_undergrads.txt users_grads.txt
# also good for end of class

name=$1
users=users_$name.txt

for id in `cat $users` ; do
    sudo userdel -r $id
    # echo $id
done
