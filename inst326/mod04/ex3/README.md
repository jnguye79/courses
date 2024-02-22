# Exercise: COVID Test Result Class #

## Background ##
The Department of Health and Human Services has noticed the large volume of high quality test data coming from your lab. Top officials in HHS met last
week with your Director to better understand why that might be the case, and she highlighted your team’s work on the COVID data entry program.

The IT department at HHS has asked if it might be possible to restructure your program using object oriented programming techniques so that it can be
distributed and reused more widely by other labs. They have given you a test suite (see below) that demonstrates how they would like the `CovidTestResult`
class to behave.

## Instructions ##
- Create a module named covid which contains a class called `CovidTestResult`.
- Define the `CovidTestResult` class constructor so that it takes two arguments: `sample_quality` and `last_calibration` which it sets as properties of the new object.
- Define a method `is_valid()` which returns `True` or `False` depending on whether the `CovidTestResult` is valid according to the rules from module 3.
- Write docstrings for your class and its methods that document how the code is to be used.
- Run the supplied test suite [test_covid.py](https://umd-ischool-inst326.github.io/inst326-public/modules/module04/exercises/test_covid.py) to make sure that it is working as expected.
