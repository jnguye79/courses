# INST 326 Module 3: Testing #

## Overview ##
Module 3 is the final module in the "fundamentals" unit of the course. Unlike the topics of the previous two modules, this week’s topic, software
testing, is probably new to many of you. Though testing may seem advanced, the reason we are introducing it at this early stage is because testing
is very useful for improving the quality of your code, and hence can be a valuable tool as you are learning to program.

#### Links ####
- [Slides](https://github.com/jnguye79/Python/blob/main/INST326/mod03/slides.adoc)

## Learning Outcomes ##
This module introduces the concept of software testing. After completing this module, you should understand...
- Why software testing is important
- How to organize code for testing
- What assert statements do and how to write them
- What a module is
- What a namespace is and why they are useful
- How to import a module, or specific objects from a module
- How to structure a program as a module
- What if name == "main": does and why it is used
- What Pytest is and how to write Pytest test scripts
You may find it helpful to refer to the following resources:
- Resources on modules, if name == "main":
  - van Rossum, The Python Tutorial: [Section 6: Modules](https://docs.python.org/3/tutorial/modules.html) (covers importing and if `name == "main":`, among other things)
  - Official main [documentation](https://docs.python.org/3/library/__main__.html)
  - bogotobogo.com provides [a nice tutorial](https://realpython.com/pytest-python-testing/) explaining `if name == "main":`
- Resources on testing
  - Official `abs()` [documentation](https://docs.python.org/3/library/functions.html#abs)
  - Official 'math.isclose()' [documentation](https://docs.python.org/3/library/math.html#math.isclose)
  - 'pytest.approx()' [documentation](https://docs.pytest.org/en/stable/reference.html#pytest-approx) (solves the same problem as math.isclose(), but in a different, elegant way)
  - [Pytest documentation](https://docs.pytest.org/en/stable/contents.html)
  - realpython.com: [Effective Python Testing With Pytest](https://realpython.com/pytest-python-testing/)

If you have not already installed Pytest, please take a moment and do so by typing the following in your VSCode terminal window (if `pip3` is not
found try `pip` instead):

```
pip3 install pytest
```
