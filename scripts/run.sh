#!/bin/bash

# Run this script with a command like
#
# bash run.sh combined.csv
#
# where combined.csv is the intput file to the script.
# This script is intended to be used on a combined student CSV file.
# To generate this, get the CSV files for all of the students and use a text
# editor to copy the data rows into a common file. 

# put on the right side of the equal sign the name of the roster file to use
roster=$1

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

# Make student entries to put into nbgrader file
python3 make_student_dict_entries.py $roster

## The following copies all of the python4geosciences directory over
## which may have extra files in it. Instead, can git clone and git pull
# # disperse class materials to students
# sudo ./disperse_python4geosciences_materials.sh users_$name.txt
## Won't need to do the following if I use git pull
# Later, disperse another materials notebook file
# example: sudo ./disperse_python4geosciences_file.sh users_$name.txt ../materials/3_matplotlib.ipynb
# sudo ./disperse_python4geosciences_file.sh users_$name.txt [filename]

# git clone class repo
sudo ./repo_clone.sh users_$name.txt

# git pull later in term
sudo ./repo_update.sh users_$name.txt

# or disperse a file to their home directory:
# sudo ./disperse_nbgrader_file.sh users_$name.txt nbgrader_config.py

# # Email students their username and password with `email_passwords.py`.
# python3 email_passwords.py $name
