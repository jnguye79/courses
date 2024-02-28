# Problem Set 6 - Lines of Code (Sample)
'''
There might be something wrong with this sample.
Let's check it out, shall we?
'''

"""
Guess we'll also try out the double quotes.
"""

def main():
    x = int(input("X: "))
    y = int(input("Y: "))

    # Print the sum
    print(add(x, y))

def add(x, y):
    '''This function makes sure that you add the two values together'''
    return (x + y) # Returns the sum

if __name__ == "__main__":
    main()