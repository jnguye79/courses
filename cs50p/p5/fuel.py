# Problem Set 5 - Refueling

import re

def main():
    while True:
        prompt = input("Fraction: ")
        value = convert(prompt)

        if value:
            break

    print(gauge(value))

def convert(fraction):

    res = re.split('[-+*/]', fraction)
    res2 = re.findall('[-+*/]', fraction)

    try:
        res[0] = int(res[0])
        res[1] = int(res[1])
    except ValueError:
        raise ValueError("Invalid Input")
    else:
        if (res[0] >= 0 and
            res[1] >= 0 and
            res2[0] == '/'):
            try:
                ans = round((res[0] / res[1]), 2)
                ans = int(ans * 100)
                return ans
            except ZeroDivisionError:
                raise ZeroDivisionError("Error: Divide By Zero")

def gauge(percentage):

    # End of Loop
    if (percentage >= 99):
        return("F")
    elif (percentage <= 1):
        return("E")
    else:
        return(str(percentage) + "%")

if __name__ == "__main__":
    main()
