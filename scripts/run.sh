#!/bin/bash

# call your roster files undergrads.csv, grads-600.csv, and grads-650.csv.
ugroster=undergrads.csv
groster1=grads-600.csv
groster2=grads-650.csv

# Save usernames
python3 parse_username.py $ugroster > users_undergrads.txt
python3 parse_username.py $groster1 > users_grads.txt
python3 parse_username.py $groster2 >> users_grads.txt

# Save passwords
num="$(wc -l < users_undergrads.txt)"  # count number of users
python3 make_passwd.py --passwords $num > passwds_undergrads.txt
num="$(wc -l < users_grads.txt)"  # count number of users
python3 make_passwd.py --passwords $num > passwds_grads.txt

# Make user accounts
 ./make_user_account.sh users_undergrads.txt users_grads.txt passwds_undergrads.txt passwds_grads.txt

# If you mess it up and have to start over, remove user accounts:
# ./remove_users.sh users_undergrads.txt users_grads.txt
