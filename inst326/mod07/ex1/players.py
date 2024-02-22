# Module 7 - Exercise 1: Marathon

import random

class Player():

    def __init__(self, name: str):
        self.name = name
        self.position = 0
    
class RedPlayer(Player):
        
    def walk(self):
        """Red Player walks a random number of times between (1-10)."""
        self.position += random.randrange(1, 10)

class BluePlayer(Player):

    def walk(self):
        """Blue Player walks a random number of times between (4-8)."""
        self.position += random.randrange(4, 8)

def play_game():

        # Initializing variables.
        players = []
        x = 0

        # Append 'BluePlayers' with individual names onto list.
        while (x < 3):
            players.append(BluePlayer("BluePlayer" + str(x)))
            x += 1

        # Resetting x to 0 for reuse.
        x = 0

        # Append 'RedPlayers' with individual names onto list.
        while (x < 3):
            players.append(RedPlayer("RedPlayer" + str(x)))
            x += 1 

        # Resetting x to 0 for reuse + initializing iteration count.
        x = 0
        count = 0

        # Infinitely iterate through list until a player's position is greater than 100
        while (x < 7):
            if (players[x].position > 100):
                ans = (players[x].name, count)
                return ans
            
            if (x == len(players) - 1):
                count += 1
                x = 0

            players[x].walk()
            x += 1

if __name__ == "__main__":
    x = play_game()

    print(x)