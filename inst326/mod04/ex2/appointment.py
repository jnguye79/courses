# Module 4 - Exercise 2: Appointment

class Appointment:
    """ Creates an appointment on a calendar sheet.
    
    Arguments:
    name (str): Name of client.
    start (tuple): Beginning time of appointment.
    end (tuple): Ending time of appointment.
    """

    def __init__(self, name, start, end):
        """Initializing object variables."""
        self.name = "Sales brunch"
        self.start = ("00", "00")
        self.end = ("00", "00")

    def overlaps(self, other):
        """Function that checks if appointments overlap"""
        if ((self.start <= other.start < self.end) == True):
            return True
        elif ((self.start <= other.end < self.end) == True):
            return True
        else:
            return False