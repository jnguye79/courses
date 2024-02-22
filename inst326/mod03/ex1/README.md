# Exercise: Bulk Pricing #

## Background ##
An online magnet seller sells a particular magnet at a base price of $0.75 but offers bulk pricing depending on the quantity of magnets 
ordered, as follows:

|Quantity|Price|
|--------|-----|
|0-49    |$0.75|
|50-99   |$0.72|
|100-999 |$0.70|
|1000+   |$0.67|

# Instructions #
Write a script using the [template](https://umd-ischool-inst326.github.io/inst326-public/modules/module03/exercises/bulk_pricing.py) below. Replace
the comment in the template with a function called get_cost() that calculates the cost of an order of magnets using the pricing scheme in the table
above. Your function should take a non-negative number of magnets (an integer) as its only argument. It should return [1] a float indicating the 
costof the order in dollars.

If the number of magnets is less than zero, your function should raise a ```ValueError```.

Your function should have a docstring that briefly states
1. what the function does
2. what argument(s) it requires
3. what kind of value it returns and what this value means
4. what error(s) it raises and what they mean

The template code is designed to take one integer as a [command-line argument](https://realpython.com/python-command-line-arguments/). It validates
this argument, converts it to an integer, invokes your function, and prints a string containing the value returned by your function.

Template
```
""" Calculate the price of an order of magnets according to a bulk
pricing scheme. """

import sys


# replace this comment with your implementation of the get_cost() function


if __name__ == "__main__":
    try:
        magnets = int(sys.argv[1])
    except IndexError:
        sys.exit("this program expects a number of magnets as a command-line"
                 " argument")
    except ValueError:
        sys.exit("could not convert " + sys.argv[1] + " into an integer")
    print(get_cost(magnets))
```

## Running your program ##
To run your program, open a terminal and ensure you are in the directory where your script is saved. At the command prompt, type python3 
(Windows users, type python instead) followed by a space, the name of your script, another space, and an integer. For example, if your script 
were called bulk_pricing.py and you wanted to calculate the cost of ordering 75 magnets, you would type

```
python3 bulk_pricing.py 75
```
