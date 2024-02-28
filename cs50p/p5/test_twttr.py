# Problem Set 5 - Testing my twttr

from twttr import shorten

def main():
    test_shorten()

def test_shorten():
    assert shorten("Twitter") == "Twttr"
    assert shorten("AEIOU") == ""
    assert shorten("understanding") == "ndrstndng"
    assert shorten("power!100") == "pwr!100"

if __name__ == "__main__":
    main()