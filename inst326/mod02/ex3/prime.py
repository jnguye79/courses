# Module 2 - Exercise 3: Prime Number Finder

count = 0

def is_prime(number):
    global count
    check = number - 1

    while (check != 1):
        if (number % check == 0):
            return False
        else:
            check -= 1
            count += 1
    return True

print(is_prime(5), count)