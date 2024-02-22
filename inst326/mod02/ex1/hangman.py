# Module 2 - Exercise 1: Hangman

def hangman(word, usedLetters):
    """This method assumes that the player will NOT retype the same word twice."""
    tempUse = ""
    ans = ""
    new = ""

    # Creating a secondary string for temporary use.
    for x in usedLetters:
        tempUse += x

    # Continously fill out string until new_guess is complete.
    for x in word:
        for y in tempUse:
            if (x == y):
                ans += x

    return ans

def main():

    # Initializing variables and prompting user to give word.
    strikes = 0
    guess = ""
    usedLetters = []
    word = input("Please input a word in: ")
    
    # Creating the guessing string
    for x in word:
        guess += "-"
    
    # Looping through strikes
    while (strikes < 5):

        # Keep printing out the guessed letters and ask for a new letter.
        print(guess)
        prompt = input("Please input a letter (or exit by typing 'quit'): ").lower()
        usedLetters.append(prompt)

        # Unless the prompt is 'quit', continue looping through the hangman function above.
        if (prompt == 'quit'):
            exit()
        else:
            new_guess = hangman(word, usedLetters)

            # If the new_guess from the hangman function is different from the guess
            # we currently have, then the user has guessed correctly and has updated the string.
            # Therefore, we won't give them a strike. Else, give them a strike.
            if (new_guess == guess):
                strikes += 1
                print(f"Strikes: {strikes}")
            elif (word == new_guess):
                break
            else:
                guess = new_guess
                
    # Finalizing game results
    if (strikes < 5):
        print("You win!")
    else:
        print("You lose!")

main()