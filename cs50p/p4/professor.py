# Problem Set 4 - Little Professor

import random

def main():
    level = get_level()

    i = 0
    score = 0

    while i < 10:
        j = 0

        x = generate_integer(level)
        y = generate_integer(level)
        ans = x + y

        while j < 4:
            if j == 3:
                print(f"{x} + {y} = {ans}")
                break
            else:
                try:
                    prompt = int(input(f"{x} + {y} = "))
                except ValueError:
                    print("EEE")
                    j += 1
                    continue
                else:
                    if not prompt == ans:
                        print("EEE")
                        j += 1
                        continue
                    else:
                        score += 1
                        break

        i += 1

    print(f"Score: {score}")


def get_level():
    while True:
        try:
            prompt = int(input("Level: "))
        except ValueError:
            continue
        else:
            if (prompt < 1 or
                prompt > 3):
                continue
            else:
                return prompt

def generate_integer(level):
    match level:
        case 1:
            return random.randint(0, 9)
        case 2:
            return random.randint(10, 99)
        case 3:
            return random.randint(100, 999)

if __name__ == "__main__":
    main()