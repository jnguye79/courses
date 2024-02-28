# Problem Set 2 - Just setting up my twttr

prompt = input("Input: ")
new_ans = ""

for x in prompt:
    letter = x.upper()

    match letter:
        case "A" | "E" | "I" | "O" | "U":
            {}
        case _:
            new_ans += x

print("Output: " + new_ans)