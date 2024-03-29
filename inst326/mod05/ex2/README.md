# Exercise: Book Indexer #

## Background ##
For this exercise we are going to write a function that will create an index for words in two different books. Creating this kind of solution could 
allow users in the future to find word usage across different books and compare usage over time.

## Notes ##
- The name of your file should consist exclusively of lower-case letters, numbers, and underscores, and the file extension .py. Your filename should not start with a number.
- This exercise does require the use of command line arguments.
- Your function does not need to clean input, however if you would like to try to make all your words in the index uppercase or lowercase (or get rid of non words) feel free to take on the challenge!

## Instructions ##
- Write a function named indexer that will do the following:
  - Contain two parameters, both strings, which will both be paths to a file.
  - Your function should read those files
    - For information on reading files please read this tutorial: https://www.w3schools.com/python/python_file_open.asp
  - Once you have read in the files use sets to determine unique words in each text file.
  - Create one large set that is the union of both sets
  - Return a dictionary which is the index of the words to files:
    - Where key is the word and value is a list of all files containing that word
- Download the following files and place them in the same directory as your python script:
  - [Monte Cristo](https://umd-ischool-inst326.github.io/inst326-public/modules/module05/exercises/files/monte_cristo.txt)
  - [Two Cities](https://umd-ischool-inst326.github.io/inst326-public/modules/module05/exercises/files/two_cities.txt)
- Write a `main` function that takes two arguments, two paths and call the function that you wrote by passing in these two arguments. Print the returned value (which should be the index dictionary)
- Write an `if __name__ == __main__` statement and use `argparse` to take two command line arguments with which you will call your `main` function. To run your file, you should pass in the names of both text files. For example, it should look something like this:

```
python exercise_05.py 'monte_cristo.txt' 'two_cities.txt'
```
