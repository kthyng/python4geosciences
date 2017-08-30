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

# Email students their username and password with `email_passwords.py`.
python3 email_passwords.py

# Make student entries to put into nbgrader file
python3 make_student_dict_entries.py $ugroster
python3 make_student_dict_entries.py $groster1
python3 make_student_dict_entries.py $groster2

# disperse class materials to students
sudo ./disperse_python4geosciences_materials.sh users_undergrads.txt users_grads.txt

# Later, disperse another file
# sudo ./disperse_python4geosciences_file.sh users_undergrads.txt users_grads.txt [filename]
