#!/bin/bash

users1=$1
users2=$2
pass1=$3
pass2=$4

# put users into an array
users=()
for id in `cat $users1 $users2` ; do
    users+=("$id")
done
# echo "${users[@]}"

# put passwords into an array
pass=()
for pass in `cat $pass1 $pass2` ; do
    pass+=("$pass")
done

for ((i=0;i<${#users[@]};i++)); do
    echo $i
    echo ${users[$i]}
    echo ${pass[$i]}
    # sudo adduser ${users[$i]} -p ${pass[$i]};
done
