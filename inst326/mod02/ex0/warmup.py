# Module 2: Warm-Up

"""
Warm Up 1
What error message do you get when you run this program (hint: there are at least two problems)

def get energy(mass):
    speed_of_light = 300000000
    return mass * speed_of_light ** 2

weights = [1, 100, .5, .75]

while weights:
    joules = get_energy(kg)
    print(kg, "kg is equal to ", joules, "joules")

ANSWER RESPONSE:
- kg is not identified (should be identified as weights)
- while 'weights' does not fit the 'while' loop criteria
- speed_of_light variable is too big, causing memory error
- its required to input only one input while using 'get_energy formula'
and one input while printing.

What output do you see when you fix it?
ANSWER RESPONSE:
1 kg is equal to  9 joules
100 kg is equal to  900 joules
0.5 kg is equal to  4.5 joules
0.75 kg is equal to  6.75 joules
"""

def get_energy(mass):
    speed_of_light = 3
    return mass * (speed_of_light ** 2)

counter = 0
kg = [1, 100, .5, .75]

while (counter < len(kg)):
    joules = get_energy(kg[counter])
    print(kg[counter], "kg is equal to ", joules, "joules")
    counter = counter + 1

"""
Warm Up 2
Write a program that will let you enter a word or phrase and 
then tell you how many characters long it is. The program should
allow the user to keep entering words and phrases until they enter 'quit'
"""

def length(word):
    ans = len(word)
    return ans

while (True):
    phrase = input("Enter a word/phrase: ")
    if (phrase.lower() == 'quit'):
        break
    else:
        print("That is " + length(phrase) + "characters long")
        print()

print("Bye!")

"""
Warm Up 3
Write a program that will let you enter in a word or sentence in lower case
and will print it out with the first letter capitalized. Hint, all strings
have a method capitalize, see if you can use it.
"""

def capitalize(phrase):
    phrase = phrase.capitalize()
    return phrase

response = input("Enter in a word/sentence in lower case: ")
print(capitalize(response))

"""
Warm Up 4
Write a program that will let you enter a sentence and will print each word 
out separately with the first letter capitalized. Hint: use the string’s split 
function together with what you know about for loops and lists.
"""

def capitalize2(phrase):
    words = phrase.split()
    for x in words:
        x.capitalize()
        print(x)
        print()

response2 = input("Enter in a word/sentence")
capitalize2(response2)



