import os
import argparse

parser = argparse.ArgumentParser(description='Make user accounts given usernames and passwords.')
parser.add_argument('name', help='name which is used in assumed users and passwords file name', type=str)
args = parser.parse_args()

name = args.name
fu = open('users_' + name + '.txt')
fp = open('passwds_'+ name + '.txt')

for user, passwd in zip(fu.readlines(), fp.readlines()):

    # remove new line at end
    user = user.split()[0]
    passwd = passwd.split()[0]

    # https://www.systutorials.com/39549/changing-linux-users-password-in-one-command-line/
    command = 'sudo useradd ' + user + '; echo -e "' + passwd + '\n' + passwd + '" | sudo passwd ' + user
    print(command)
    os.system(command)
