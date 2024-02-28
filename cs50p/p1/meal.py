# Problem Set 1 - Meal Time

def main():
    prompt = input("What time is it? ")
    new_ans = convert(prompt)

    if (new_ans >= 7 and new_ans <= 8):
        print("breakfast time")
    elif (new_ans >= 12 and new_ans <= 13):
        print("lunch time")
    elif (new_ans >= 18 and new_ans <= 19):
        print("dinner time")
    else:
        {}

def convert(time):
    time = time.split(":")

    converted = float(time[0])
    converted += float(time[1]) / 60
    return converted

if __name__ == "__main__":
    main()