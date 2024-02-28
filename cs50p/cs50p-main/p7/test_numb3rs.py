# Problem Set 7 - NUMB3RS (Test)

from numb3rs import validate

def main():
    test_validate()
    test_validate2()

def test_validate():
    assert(validate("127.0.0.1")) == True
    assert(validate("255.255.255.255")) == True
    assert(validate("1.2.3.1000")) == False
    assert(validate("512.512.512.512")) == False
    assert(validate("cat")) == False

def test_validate2():
    assert(validate("512.0.0.0")) == False
    assert(validate("0.512.0.0")) == False
    assert(validate("0.0.512.0")) == False
    assert(validate("0.0.0.512")) == False

if __name__ == "__main__":
    main()