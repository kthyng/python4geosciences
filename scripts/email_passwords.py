import os

f = open('passwords')

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

for line in f.readlines():
    username, password = line.split()
    print('{username}@email.tamu.edu'.format(username=username))
    print(text.format(username=username, password=password))
    # -s is subject, email address is who to send to, after <<< is body of message
    command = 'mail -s "Model output problem" kthyng@tamu.edu <<< "Model output of type ' + timing + ' is not working."'
    os.system(command)

# MAKE THIS ACTUALLY EMAIL
