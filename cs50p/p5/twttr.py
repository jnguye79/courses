# Problem Set 5 - Testing my twttr

def main():
    prompt = input("Input: ")
    ans = shorten(prompt)

    print("Output: " + ans)

def shorten(word):
    ans = ""
    for x in word:
        letter = x.upper()

        match letter:
            case "A" | "E" | "I" | "O" | "U":
                {}
            case _:
                ans += x
    return ans

if __name__ == "__main__":
    main()