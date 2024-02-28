# Add an iterator to repeat through each line and intialize their value
global row
row = 0
global col
col = 0

while True:

    num = input("Height: ")

    # Repeat input process if num is NULL or consists of a letter
    if (len(num) == 0 or num.isalpha()):
        continue

    num = int(num)

    # Repeats input process if value is less than 0 or greater than 8
    if (num > 0 and num <= 8):
        break

# Repeat through each row
while (row < num):

    # Resetting column value
    col = 0

    # Repeat through each column
    while (col < num):

        # If the current count 'col' is less than the total number
        # of rows needed by the current number of rows - 1, then an
        # empty space.
        if (col < (num - row) - 1):
            print(" ", end='')
            col = col + 1
        # Otherwise, print out '#' in the row
        else:
            print("#", end='')
            col = col + 1

    # Print a new line, increase row count
    row = row + 1
    print("")