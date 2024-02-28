# Problem Set 1 - Deep Thought

ans = input("What is the Answer to the Great Question of Life, the Universe, and Everything? ")
ans = ans.strip()

match ans:
    case "42" | "forty-two" | "forty two" | "FoRty TwO" | " 42 ":
        print("Yes")
    case _:
        print("No")