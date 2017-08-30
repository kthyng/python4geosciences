# Set up for class

Many of these steps can be run together in run.sh.

## Set up student accounts

1. Download class rosters for all sections into csv files that are put into this directory.
1. Generate an undergrad and grad student username listing using `parse_username.py`.
1. Generate an analogous set of files of passwords using `make_passwd.py`.
1. Make the user accounts with `make_user_account.sh`.
1. Email students their username and password with `email_passwords.py`.


## Set up nbgrader_config.py

1. Generate student entries for the file with `make_student_dict_entries.py`.


## Disperse materials to students

1. Initially: use `disperse_python4geosciences_materials.sh` to copy in the python4geosciences directory.
1. Later when updating a file: `disperse_python4geosciences_file.sh`.
