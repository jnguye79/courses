# Module 3 - Exercise 2: Bulk Testing

# Importing 'isclose' to use to check float value's "closeness" to correct answer (aka error margin/deviation).
from math import isclose
import bp

# 4 Happy Case Function
def test_bulk_pricing_happy_path():
    
    # An okay assertion float check.
    assert abs(bp.get_cost(30) - 0.3333333333333333) <= 0.000000001, \
        ("get_cost(30) returned" 
        " unexpected result")

    # Even better assertion float check.
    assert isclose(bp.get_cost(70), 50.4), \
        ("get cost(70) returned"
         " unexpected result")
    assert isclose(bp.get_cost(500), 350), \
        ("get cost(500) returned"
         " unexpected result")
    assert isclose(bp.get_cost(1200), 804), \
        ("get cost(1200) returned"
         " unexpected result")

# 4 Edge Case Function
def test_bulk_pricing_edge_path():
    assert isclose(bp.get_cost(99), 71.28), \
        ("get_cost(99) returned"
         " unexpected result")
    assert isclose(bp.get_cost(100), 70), \
        ("get_cost(100) returned"
         " unexpected result")
    assert isclose(bp.get_cost(999), 699.3), \
        ("get_cost(999) returned"
         " unexpected result")
    assert isclose(bp.get_cost(1000), 670), \
        ("get_cost(1000) returned"
         " unexpected result")
