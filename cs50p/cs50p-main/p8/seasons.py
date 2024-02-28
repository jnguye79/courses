# Problem Set 8 - Seasons of Love

import re
import sys
import inflect
from datetime import date, datetime

def main():
    try:
        print(days_since(input("Date of Birth: ")))
    except ValueError:
        sys.exit("Invalid date")

def days_since(s):

    match = re.match(r"[0-9]{4}-[0-9]{2}-[0-9]{2}", s)

    if match:
        if validity(s):
            input_date = datetime.strptime(s, "%Y-%m-%d")
            curr_date = date.today()
            mins = int((curr_date - input_date.date()).total_seconds() / 60)

            p = inflect.engine()
            ans = p.number_to_words(mins, andword="")

            return ans.capitalize() + " minutes"
        else:
            raise ValueError("Invalid date")
    else:
        raise ValueError("Invalid date")

def validity(s):

    check = re.split(r"-", s)

    year = int(check[0])
    month = int(check[1])
    day = int(check[2])

    if ((0 < year <= 2023) and
        (0 < month <= 12) and
        (0 < day <= 31)):
        return True
    else:
        return False

if __name__ == "__main__":
    main()