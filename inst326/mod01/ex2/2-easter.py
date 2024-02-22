# Module 1 - Exercise 2: Calculating Easter

import sys

# replace this comment with your implementation of the easter_date() function
def easter_date(Y):

    # Defining the following variables
    a = Y % 19
    b = Y % 4
    c = Y % 7
    k = Y // 100
    p = (13 + (8*k)) // 25
    q = k // 4
    M = (15 - p + k - q) % 30
    N = (4 + k - q) % 7
    d = ((19*a) + M) % 30
    e = ((2*b) + (4*c) + (6*d) + N) % 7
    r = 22 + d + e
    s = d + e - 9
    # Conditional Statements
    if (d == 29 and e == 6 and s == 26):
        return "April 19"
    elif (d == 28 and e == 6 and ((((11*M) + 11) % 30) < 19) and s == 25):
        return "April 18"
    elif (s > 0):
        return "April " + str(s)
    else:
        return "April " + str(r)

if __name__ == "__main__":
    try:
        year = int(sys.argv[1])
    except IndexError:
        sys.exit("this program expects a year as a command-line argument")
    except ValueError:
        sys.exit("could not convert", sys.argv[1], "into an integer")
    print(easter_date(year))