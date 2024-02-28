# Problem Set 5 - Refueling
import pytest
from fuel import convert, gauge

def main():
    test_convert()
    test_gauge()

def test_convert():
    assert(convert("3/4")) == 75
    assert(convert("99/100")) == 99
    with pytest.raises(ValueError):
        convert("dog/cat")
    with pytest.raises(ZeroDivisionError):
        convert("4/0")

def test_gauge():
    assert(gauge(99)) == "F"
    assert(gauge(1)) == "E"
    assert(gauge(50)) == "50%"

if __name__ == "__main__":
    main()