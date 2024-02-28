# Problem Set 5 - Re-requesting a Vanity Plate

from plates import is_valid

def main():
    test_case1()
    test_case2()
    test_case3()
    test_case4()

def test_case1():
    assert(is_valid("ER")) == True
    assert(is_valid("5E")) == False
    assert(is_valid("E2")) == False
    assert(is_valid("42")) == False
    assert(is_valid("^E")) == False

def test_case2():
    assert(is_valid("EREEUN")) == True
    assert(is_valid("EREELONG")) == False

def test_case3():
    assert(is_valid("EREE55")) == True
    assert(is_valid("ER33EE")) == False
    assert(is_valid("EREE03")) == False

def test_case4():
    assert(is_valid("EREE50")) == True
    assert(is_valid("ERE@@2")) == False

if __name__ == "__main__":
    main()