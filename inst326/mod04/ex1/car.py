# Module 4 - Exercise 1: Car

class Car():
    """ Object that acts has a car with values.
    
    Attributes:
        x (int): Handles x-coordinates of car.
        y (int): Handles y-coordinates of car.
        heading (char): Current direction of the car.
    """

    def __init__(self):
        """Initializing values upon instantation of class 'car'"""

        self.x = 0
        self.y = 0
        self.heading = 'n'

    def turn(self, direction):
        """Changes the direction of the car."""

        compass = "nesw"
        index = compass.find(self.heading)
        print()
        if (direction == 'l'):
            self.heading = compass[(index - 1) % 4]
        else:
            self.heading = compass[(index + 1) % 4]

    def drive(self):
        """Move the car in a specific direction by just one."""
        
        distance = 1

        if (self.heading == 'n'):
            self.y += distance
        elif (self.heading == 'e'):
            self.x += distance
        elif (self.heading == 's'):
            self.y -= distance
        else:
            self.x -= distance

    def drive(self, distance):
        """Move the car in a specific direction by the value in distance"""

        if (self.heading == 'n'):
            self.y += distance
        elif (self.heading == 'e'):
            self.x += distance
        elif (self.heading == 's'):
            self.y -= distance
        else:
            self.x -= distance

    def status(self):
        """Print out the current coordinates and the direction the car is heading."""

        print(f"Coordinates: ({self.x}, {self.y})")
        print(f"Heading: {self.heading}")