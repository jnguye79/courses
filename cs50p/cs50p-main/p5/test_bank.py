# Problem Set 5 - Back to the Bank

from bank import value

def main():
    test_hello()
    test_h()
    test_all()

def test_hello():
    assert value("Hello") == 0
    assert value("Hello there") == 0
    assert value("Hello, Newman") == 0

def test_h():
    assert value("Hey there") == 20
    assert value("Howdy yall") == 20
    assert value("Hey all!") == 20

def test_all():
    assert value("What's up?") == 100
    assert value("Anything else?") == 100
    assert value("Think that's all of it!") == 100

if __name__ == "__main__":
    main()