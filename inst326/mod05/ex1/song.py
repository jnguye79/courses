# Module 5 - Exercise 1: Song Maker

class song():
    """ This class gives a song descriptive information.
    
    Argument:
        name (str): Name of song.
        artists (list): List of artists associated with song.
        bpm (int): Beats per minute of song.
        chords (list): Chords used within the song.
    """

    def __init__(self, name: str, primary_artist: str, bpm: int, chords: list):
        """Initialize variables with given arguments."""
        self.name = name
        self.artists = [primary_artist]
        self.bpm = bpm
        self.chords = chords

    def associated_artists(self, other_artists):
        """Add on additional artists associated to a song."""
        temp = other_artists.split()
        
        for x in temp:
            self.artists.append(x)

    def change_beat(self, increase: bool = True, change: int = 5):
        """Change the beats per minute of a song."""
        if (increase == True):
            self.bpm += change
        else:
            self.bpm -= change

    def modulate(self, steps: int = 1):
        """Move the song around by a desired number of half-octaves."""
        notes = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
        new_list = []

        for x in self.chords:
            halfStep = int(steps * 2)
            index = notes.index(x)
            index = (index + halfStep) % 12
            new_list.append(notes[index])

        self.chords = new_list

    def info(self):
        """Displays a set of information about the song object."""
        print(f"Name: {self.name}")
        print(f"Artists: ", end = "")

        for x in self.artists:
            print(f"{x} ", end = "")

        print("")
        print(f"Chords: {self.chords}")
        print(f"Beats Per Minute: {self.bpm}")

if __name__ == "__main__":
    s = song("Jingle Bells", "Me", 90, ['C'])
    s.change_beat()
    s.modulate(.5)
    s.associated_artists('You Us Aisyah')
    s.info()

    