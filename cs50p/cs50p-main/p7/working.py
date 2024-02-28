# Problem Set 7 - Working 9 to 5

import re
import sys


def main():
    try:
        ans = convert(input("Hours: "))
        print(ans)
    except ValueError:
        sys.exit(ValueError)

def convert(s):
    pattern = r"\d{1,2}(?::\d{2})?\s+(?:AM|PM)\s+to\s+\d{1,2}(?::\d{2})?\s+(?:AM|PM)"
    match = re.match(pattern, s)

    if match:
        check = re.split("[: ]", s)
        if valid(check):
            ans = convert_ampm(check)
            if len(ans) > 5:
                return (f"{int(ans[0]):02d}:{int(ans[1]):02d} {ans[3]} {int(ans[4]):02d}:{int(ans[5]):02d}")
            else:
                return (f"{int(ans[0]):02d}:00 {ans[2]} {int(ans[3]):02d}:00")

    raise ValueError("ValueError")

def valid(check):
    # Separate between two time formats ('# AM to # PM' and '#:## AM to #:## PM')
    if len(check) > 5:
        # Check hours
        if (0 < int(check[0]) <= 12 and 0 < int(check[4]) <= 12):
            # Check minutes
            if (0 <= int(check[1]) <= 59 and 0 <= int(check[5]) <= 59):
                return True
    else:
        # Check hours
        if (0 < int(check[0]) <= 12 and 0 < int(check[3]) <= 12):
            return True

    return False

def convert_ampm(check):
    if len(check) > 5:
        # Special Condition
        # 12 AM == 00:00
        if (int(check[0]) == 12 and check[2] == 'AM'):
            check[0] = "00"
        if (int(check[4]) == 12 and check[6] == 'AM'):
            check[4] = "00"

        # Regular Condition
        if check[2] == 'PM':
            if not int(check[0]) == 12:
                check[0] = str(int(check[0]) + 12)
        if check[6] == 'PM':
            if not int(check[4]) == 12:
                check[4] = str(int(check[4]) + 12)
        return check
    else:
        # Special Condition 12 AM  == 00:00
        if (int(check[0]) == 12 and check[1] == 'AM'):
            check[0] = "00"
        if (int(check[3]) == 12 and check[4] == 'AM'):
            check[3] = "00"

        if check[1] == 'PM':
            if not int(check[0]) == 12:
                check[0] = str(int(check[0]) + 12)
        if check[4] == 'PM':
            if not int(check[3]) == 12:
                check[3] = str(int(check[3]) + 12)
        return check

if __name__ == "__main__":
    main()
