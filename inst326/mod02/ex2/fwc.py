# Module 2 - Exercise 2: (Grouped) Frequency Word Counter

words = []
dict = {}

def frequency(string):
    words = string.split()

    for x in words:
        if (dict.get(x) == 'None'):
            dict[x] = 1
        elif (dict.get(x) == x):
            dict.update('x', dict.value + 1)
# RECHECK THIS FREQUENCY FUNCTION. REDO IF NECESSARY.

def count():
    newdict = {}

    for k, v in dict.items():
        newdict[v] = k

    return newdict

def main():
    text = 'to be or not to be'
    frequency(text)

main()