# Problem Set 3 - Outdated

myList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]

while True:

    prompt = input("Date: ")
    prompt = prompt.split("/")
    print(f'{prompt[0]:02}/{prompt[1]:02}/{prompt[2]:04}')

    break