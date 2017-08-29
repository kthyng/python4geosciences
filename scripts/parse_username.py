'''
Example usage:
python3 parse_username.py undergrads.csv > users_undergrads.txt
python3 parse_username.py grads-600.csv > users_grads.txt
python3 parse_username.py grads-650.csv >> users_grads.txt
'''

import pandas as pd
import argparse

parser = argparse.ArgumentParser(description='Generate random passwords based on english words.')
parser.add_argument('filename',
                    help='Name of student csv file to parse')
args = parser.parse_args()

ds = pd.read_csv(args.filename)

for email in ds['EMAIL']:
    username, domain = email.split('@')
    assert domain=='email.tamu.edu', 'email needs to be TAMU netID'
    print(username)

# redirect into a file by undergrad vs. grad to be used in disperse_...
