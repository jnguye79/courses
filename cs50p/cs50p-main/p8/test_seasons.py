# Problem Set 8 - Seasons of Love (Test)

import pytest
from seasons import days_since

def main():
    test_days_since()
    test_days_since2()

def test_days_since():
    assert(days_since("2022-07-07")) == "Five hundred twenty-five thousand, six hundred minutes"

def test_days_since2():
    with pytest.raises(ValueError):
        days_since("July 07, 2022")

if __name__ == "__main__":
    main()