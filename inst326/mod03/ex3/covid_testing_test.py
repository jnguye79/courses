# Module 3 - Exercise 3: COVID Testing

from math import isclose
import covid_testing as ct

"""
The effectiveness of this test approach is very high due to the fact that these two functions within
covid_testing.py are the building blocks for how the rest of the code is conducted. Dependant on each factor,
the code follows these approaches through the return values from these two functions.
"""

# Test Function checking both acceptable/unacceptable values
# for the is_valid_sample and is_valid calibration functions.
def test_covid_testing():
    assert ct.is_valid_sample(1.23) == True, \
        ("is_valid_sample(1.23) return"
         " unexpected value")
    assert ct.is_valid_sample(0.80) == True, \
        ("is_valid_sample(0.80) return"
         " unexpected value")
    assert ct.is_valid_calibration(3) == True, \
        ("is_valid_calibration(3) return"
         " unexpected value")
    assert ct.is_valid_calibration(6) == True, \
        ("is_valid_calibration(6) return"
         " unexpected value")