# Problem Set 2 - camelCase

prompt = input("camelCase: ")

new_ans = ""

for letter in prompt:
    if (letter.isupper()):
        new_ans += "_" + letter.lower()
    else:
        new_ans += letter

print(new_ans)