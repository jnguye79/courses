# Exercise: Calculating Easter #

## Background ##
The Christian holiday Easter is scheduled based on a conventionalized lunar calendar. For most Christian denominations that schedule their holidays according to the Gregorian calendar, Easter falls on a Sunday between March 22 and April 25.

One of the earliest algorithms for computing the date of Gregorian Easter was given by mathematician Carl Friedrich Gauss.[1] The steps in this algorithm are given below. Note the following notational conventions:

- $Y$ represents a year
- $mod$ represents the modulo operation
- $⌊x⌋$ represents the closest integer less than or equal to $x$ (this is called the floor of x)
  - For example, $[7/3]$ is 2. $[6/3]$ is also 2. $[5/3]$ is 1.

### Algorithm ###
Define the following variables:
- $a = Y$ $mod$ $19$
- $b = Y$ $mod$ $4$
- $c = Y$ $mod$ $7$
- $k = [Y /100]$
- $p = [13 + 8k/25]$
- $q = [k/4]$
- $M = (15 - p + k - q)$ $mod$ $30$
- $N = (4 + k − q)$ $mod$ $7$
- $d = (19a + M)$ $mod$ $30$
- $e = (2b + 4c + 6d + N)$ $mod$ $7$
- $r = 22 + d + e$
- $s = d + e − 9$

Then, if all of the following conditions are true, Gregorian Easter falls on April 19:
- $d = 29$
- $e = 6$
- $s = 26$

Otherwise, if all of the following conditions are true, Gregorian Easter falls on April 18:
- $d = 28$
- $e = 6$
- $(11M + 11)$ $mod$ $30 < 19$
- $s = 25$

Otherwise, if $s > 0$, Gregorian Easter falls on the $s$th day of April.

Otherwise, Gregorian Easter falls on the $r$th day of March.

### Limitations ###
The Gregorian calendar was first adopted in October 1582, so the output of Gauss’s algorithm will be meaningless for years prior to 1583.

## Instructions ##
Make a script using the template below. Replace the comment in the template with a function called easter_date() that implements Gauss’s algorithm 
for computing Gregorian Easter. Your function should take a four-digit year (an integer) as its only argument. It should return[2] a string consisting
of a month and a day (e.g., "April 4").

If the year is less than 1583, your function should raise a ValueError.

Your function should have a docstring that briefly states
- what the function does
- what argument(s) it requires
- what kind of value it returns and what this value means
- what error(s) it raises and what they mean

Template
```
"""Calculate Gregorian Easter using Gauss's algorithm."""

import sys


# replace this comment with your implementation of the easter_date() function


if __name__ == "__main__":
    try:
        year = int(sys.argv[1])
    except IndexError:
        sys.exit("this program expects a year as a command-line argument")
    except ValueError:
        sys.exit("could not convert", sys.argv[1], "into an integer")
    print(easter_date(year))
```

## Running your program ##
To run your program, open a terminal and ensure you are in the directory where your script is saved. At the command prompt, type python3 
(Windows users, type python instead) followed by a space, the name of your script, another space, and a year. For example, if your script 
were called easter.py and you wanted to find the date of Easter in 2025, you would type

```
python3 easter.py 2025
```

## Hints ##
Expressions like $19a$ are perfectly valid in algebra, but not in Python. You will need to explicitly tell Python to multiply in these situations.

The floor operation in Gauss’s algorithm is always used in conjunction with division. Remember that Python has a floor division operator.

## Testing ##
You can use the script [test_easter.py](https://umd-ischool-inst326.github.io/inst326-public/modules/module01/exercises/test_easter.py) to test your solution. Make sure you have Pytest installed (see https://docs.pytest.org/en/latest/getting-started.html#install-pytest) 
and that your script and test_easter.py are in the same directory on your computer. Edit line 4 of test_easter.py so that it contains the name of your
script (withou the .py ending).

To use the test script, open a terminal and navigate to the directory containing your script and test_easter.py. 
Then type the following at the command prompt:

```
pytest test_easter.py
```
