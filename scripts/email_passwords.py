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

You will need a username and password to log into the computer where we will view the class materials and work on the homework assignments. You will only be able to access this off-campus if you use VPN to connect to campus first. You can set up VPN by going to https://connect.tamu.edu, sign in with your netid, and click on the little blue link that says AnyConnect VPN if and when you find that Web-based installation was unsuccessful to install Cisco AnyConnect. Then you can run this application to use your computer as if you are on campus. This may be slightly complicated by two-factor authentication being introduced.

If you are on campus or if you have successfully logged into VPN, use the following web address to sign into the class server:

    https://redfish.geos.tamu.edu:8000

Your username is the same as your TAMU NetID and your password is:

    password: {password}

See you in class,

Kristen
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
