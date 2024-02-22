# Module 2 - Exercise 5: Turtle Drawing

# Import turtle library and instantiate an object called 'testudo' to use.
import turtle
testudo = turtle.Turtle()


def polygon(sides, length):

    # Initiate variables
    angle = 360/sides
    count = 0

    # Continue moving line and turning until count is equal to # of sides.
    while (count < sides):
        testudo.forward(length)
        testudo.left(angle)
        count += 1

# Ask user input.
sides = int(input("How many sides are there?: "))
length = int(input("What is the length of each side?: "))

# Use formula.
polygon(sides, length)