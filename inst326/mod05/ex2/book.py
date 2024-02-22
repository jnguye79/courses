# Module 5 - Exercise 2: Book Indexer

import argparse

def indexer(path1: str, path2: str):

    # Open the files into a file object.
    f1 = open(path1, "r", encoding='utf-8')
    f2 = open(path2, "r", encoding='utf-8')
    
    # Initializing variables.
    s1 = {}
    s2 = {}
    d1 = dict()
    d2 = dict()

    # Add unique words into sets.
    for x in f1:
        if (x not in s1):
            s1.add(x)
            d1[x] = 1
        else:
            change = d1[x] + 1
            d1[x] = change
    # FIX THESE LOOPS HERE.
    for x in f2:
        if (x not in s2):
            s2.add(x)
            d2[x] = 0
        else:
            change = d2[x] + 1
            d2[x] = change

    # Create one large set that unionizes both sets.
    s1.union(s2)

    # Close files.
    f1.close()
    f2.close()

def main(arg1: str, arg2: str):
    ans = indexer('monte_cristo.txt', 'two_cities.txt')

    for item in ans:
        print(item)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = 'Created a set and dictionary from two files')
    parser.add_argument('Argument 1', type = str, help = 'Enter a file location as string')
    parser.add_argument('Argument 2', type = str, help = 'Enter a file location as string')
