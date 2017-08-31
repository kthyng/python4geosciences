'''
Usage:
python3 make_student_dict_entries.py undergrads.csv
'''


import pandas as pd
import argparse

parser = argparse.ArgumentParser(description='make student entries for nbgrader_config.py file.')
parser.add_argument('filename', help='Name of student csv file to parse')
args = parser.parse_args()

ds = pd.read_csv(args.filename)

last_name = ds['LAST NAME']
first_name = ds['FIRST NAME']
id = [email.split('@')[0] for email in ds['EMAIL']]

for info in zip(id, first_name, last_name):
    print('    dict(id="{}", first_name="{}", last_name="{}"),'.format(*info))
