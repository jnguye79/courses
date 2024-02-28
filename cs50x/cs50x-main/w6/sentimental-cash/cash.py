# import get_float variable from cs50 library
from cs50 import get_float

# Globalizing 'cents' variable
cents = 0


def get_cents():
    # Initializing global variable 'cents'
    cents = -1

    # Continuously use get_float if input is NULL/has alphabets/
    # less than one. Otherwise break
    while True:

        cents = get_float("Change owed: ")

        if (float(cents) < 0):
            continue
        else:
            break

    # Return cents
    return cents


def calculate_quarters():

    # Initializing local/global variables
    global cents
    count = 0

    # Subtract from global 'cents' variable and count
    while (cents >= .25):
        cents = cents - .25
        count = count + 1

    return count


def calculate_dimes():

    # Initializing local/global variables
    global cents
    count = 0

    # IMPORTANT: Round the cents by two decimal places to
    # fix subtraction errors
    cents = round(cents, 2)

    # Subtract from global 'cents' variable and count # of coins
    while (cents >= .10 and cents < .25):
        cents = cents - .10
        count = count + 1

    return count


def calculate_nickels():

    # Initializing local/global variables
    global cents
    count = 0

    # IMPORTANT: Round the cents by two decimal places to
    # fix subtraction errors
    cents = round(cents, 2)

    # Subtract from global 'cents' variable and count # of coins
    while (cents >= .05 and cents < .10):
        cents = cents - .05
        count = count + 1

    return count


def calculate_pennies():

    # Initializing local/global variables
    global cents
    count = 0

    # IMPORTANT: Round the cents by two decimal places to
    # fix subtraction errors
    cents = round(cents, 2)

    # Subtract from global 'cents' variable and count # of coins
    while (cents >= .01 and cents < .05):
        cents = cents - .01
        count = count + 1

    return count


def main():

    # Initializing local/global variables
    global cents
    coins = 0

    cents = get_cents()

    # Count total number of coins per each function
    coins += calculate_quarters()
    coins += calculate_dimes()
    coins += calculate_nickels()
    coins += calculate_pennies()

    # Print # of coins and add 'new_line' at the end
    print(coins, end='\n')


# Run the function
main()