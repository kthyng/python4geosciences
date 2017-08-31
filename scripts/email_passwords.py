import os
import argparse

parser = argparse.ArgumentParser(description='Make user accounts given usernames and passwords.')
parser.add_argument('name', help='name which is used in assumed users and passwords file name', type=str)
args = parser.parse_args()

name = args.name
fu = open('users_' + name + '.txt')
fp = open('passwds_'+ name + '.txt')

text = '''
Python for Geosciences

You will need a username and password to log into the computer where we will view the class materials and work on the homework assignments. The jupyter server is:

    http://redfish.geos.tamu.edu:8000

Your username (same as TAMU NetID) and password are:

    username: {username}
    password: {password}

See you in class,

Dr. Thyng
'''

subject = 'Python class username and password'

for user, passwd in zip(fu.readlines(), fp.readlines()):

    # remove new line at end
    user = user.split()[0]
    passwd = passwd.split()[0]
    email = '{username}@email.tamu.edu'.format(username=user)
    message = text.format(username=user, password=passwd)
    # # -s is subject, email address is who to send to, after <<< is body of message
    command = 'mail -s "' + subject + '" ' + email + ' <<< "' + message + '"'
    os.system(command)
    print('emailed ' + user)
