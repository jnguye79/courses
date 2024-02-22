# Module 1 - Exercise 1: Rock, Paper, Scissors

def main():
    retry = True

    # Retries
    while (retry == True):
        p1input = False
        p2input = False
        
        # Player 1 Inputs
        while (p1input == False):
            p1 = input("Player 1, what is your hand play (r,p,s): ")
            if ( (p1.lower() == "r") or (p1.lower() == "p") or (p1.lower() == "s") ):
                p1input = True
            else:
                print("Incorrect Response")
        # Player 2 Inputs
        while (p2input == False):
            p2 = input("Player 2, what is your hand-play? (r,p,s): ")
            if ( (p2.lower() == "r") or (p2.lower() == "p") or (p2.lower() == "s") ):
                p2input = True
            else:
                print("Incorrect Response")
        # Winning Calculations
        p1 = p1.lower()
        p2 = p2.lower()

        if (p1 < p2):
            print("Player 1 wins!")
        elif (p1 == p2):
            print("Tie!")
        else:
            print("Player 2 wins!")
        # Retry Loop
        round2 = input("Would you like to play again? (y,n): ")

        if (round2 == 'n'):
            retry = False
    
    print("Goodbye!")

if __name__ == "__main__":
    main()
