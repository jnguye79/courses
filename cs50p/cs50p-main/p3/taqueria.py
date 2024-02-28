# Problem Set 3 - Felipe's Taqueria

menu = {
    "Baja Taco": 4.00,
    "Burrito": 7.50,
    "Bowl": 8.50,
    "Nachos": 11.00,
    "Quesadilla": 8.50,
    "Super Burrito": 8.50,
    "Super Quesadilla": 9.50,
    "Taco": 3.00,
    "Tortilla Salad": 8.00
}

price = 0.00

while True:
    try:
        prompt = input("Item: ").title()
    except EOFError:
        break
    
    try:
        price += menu.get(prompt)
        print(price)
    except TypeError:
        pass