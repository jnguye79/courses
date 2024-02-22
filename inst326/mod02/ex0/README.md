# Warm Ups #
These are sample exercises intended to test your commend of Python fundamentals.

#### Warm Up 1 ####
What errror message do you get when you run this program. (hint: there are at least two problems)

```
def get_energy(mass):
    speed_of_light = 300000000
    return mass * speed_of_light ** 2

weights = [1, 100, .5, .75]

while weights:
    joules = get_energy(kg)
    print(kg, "kg is equal to ", joules, "joules")
```

What output do you see when you fix it?

#### Warm Up 2 ####
Write a program that will let you enter a word or phrase and then tell you how many characters long it is. The program should allow the user to keep entering words and phrases until they enter "quit".

Here's what a sample run might look like:

```
Enter a word/phrase: python
This is 6 characters long

Enter a word/phrase: holy coding, batman!
That is 20 characters long

Enter a word/phrase: quit
Bye!
```

#### Warm Up 3 ####
Write a program that will let you enter in a word or sentence in lower case and will print it out with the first letter. Hint, all strings have a method capitalize, see if you can use it.

#### Warm Up 4 ####
Write a program that will let you enter a sentence and will print each word out separately with the first letter capitalized. Hint: Use the string's **split** function together with what you know about **for loops** and **lists**.
