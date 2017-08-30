from random import shuffle
import argparse

parser = argparse.ArgumentParser(description='Generate random passwords based on english words.')
parser.add_argument('--passwords', type=int, default=1,
                    help='Number of passwords to return')
parser.add_argument('--length', default=3,
                    help='Number of words in each password')

args = parser.parse_args()

# load in list of words
f = open('../words.txt')
words = f.readlines()
f.close()

for n in range(args.passwords):
    # shuffle words
    shuffle(words)

    # select and print 3 random words
    print('{}-{}-{}'.format(*[w.strip() for w in words[:args.length]]))
