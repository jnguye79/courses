# Problem Set 4 - Guessing Game

import random

def main():

    while True:
        try:
            prompt = int(input("Level: "))
        except ValueError:
            continue
        else:
            if prompt < 1:
                continue
            else:
                num = random.randint(1, prompt)

                while True:
                    try:
                        guess = int(input("Guess: "))
                    except ValueError:
                        continue
                    else:
                        if guess < num:
                            print("Too small!")
                        elif guess > num:
                            print("Too large!")
                        else:
                            print("Just right!")
                            exit()


if __name__ == "__main__":
    main()