# Problem Set 5 - Re-requesting a Vanity Plate

# Problem Set 2 - Vanity Plates

def main():
    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")

def is_valid(s):

    # Case 1 - All Vanity Plates must start with at least two letters
    firstTwoLetters = s[0:2]
    if not firstTwoLetters.isalpha():
        return False

    # Case 2 - Vanity Plates may contain a max of 6 characters (letters or numbers) and a min of 2 characters
    length = len(s)
    if not (length >= 2 and
            length <= 6):
        return False

     # Case 3 - Numbers cannot be used in the middle of plate; they must come at the end. The first number cannot be a '0'.
    num_count = 0

    for x in s:
        if (x.isdigit()):
            if (x == "0" and num_count == 0):
                return False
            else:
                num_count += 1
        if (x.isalpha()):
            if (num_count > 0):
                return False

    # Case 4 - No periods, spaces, or punctuation marks are allowed.
    if any(not c.isalnum() for c in s):
        return False
    if (s.isspace()):
        return False

    # All test passed, return True.
    return True

if __name__ == "__main__":
    main()