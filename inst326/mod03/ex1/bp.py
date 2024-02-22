# Module 3 - Exercise 1: Bulk Pricing

""" Calculate the price of an order of magnets according to a bulk
pricing scheme. """

import sys

# replace this comment with your implementation of the get_cost() function
def get_cost(n):
    if (n < 0):
        # needs to handle ValueError type. don't return it like this.
        return "Unable to find cost of " + sys.argv[1] + " magnets"
    else:
        if (n >= 0 and n <= 49):
            return n * 0.75
        elif (n >= 50 and n <= 99):
            return n * 0.72
        elif (n >= 100 and n <= 999):
            return n * 0.70
        else:
            return n * 0.67

if __name__ == "__main__":
    try:
        magnets = int(sys.argv[1])
    except IndexError:
        sys.exit("this program expects a number of magnets as a command-line"
                 " argument")
    except ValueError:
        sys.exit("could not convert " + sys.argv[1] + " into an integer")
    print(get_cost(magnets))
