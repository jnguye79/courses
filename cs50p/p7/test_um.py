# Problem Set 7 - Regular, um, Expressions (Test)

from um import count

def main():
    test_um()
    test_um2()

def test_um():
    assert(count("testum")) == 0
    assert(count("    um      ")) == 1
    assert(count("I have NO UM idea")) == 1
    assert(count("dum num")) == 0
    assert(count("umm")) == 0

def test_um2():
    assert(count("um")) == 1
    assert(count(" um")) == 1
    assert(count("um ")) == 1
    assert(count(" um ")) == 1

if __name__ == "__main__":
    main()