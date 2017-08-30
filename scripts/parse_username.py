'''
Example usage:
python parse_username.py undergrads.csv
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

# copy and paste into a file by undergrad vs. grad to be used in disperse_...
