#!/bin/bash

# rerun this file for all roster csv files

# put on the right side of the equal sign the name of the roster file to use
roster=extra.csv

name=${roster%.*}  # remove suffix and use for file names

# Save usernames
python3 parse_username.py $roster > users_$name.txt

# Save passwords
num="$(wc -l < users_$name.txt)"  # count number of users
python3 make_passwd.py --passwords $num > passwds_$name.txt

# Make user accounts
python3 make_user_accounts.py $name

# If you mess it up and have to start over, remove user accounts:
# ./remove_users.sh $name

# # Email students their username and password with `email_passwords.py`.
# python3 email_passwords.py $name

# Make student entries to put into nbgrader file
python3 make_student_dict_entries.py $roster

# disperse class materials to students
sudo ./disperse_python4geosciences_materials.sh users_$name.txt

# Later, disperse another file
# sudo ./disperse_python4geosciences_file.sh users_$name.txt [filename]
