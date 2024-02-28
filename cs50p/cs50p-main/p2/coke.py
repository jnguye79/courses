# Problem Set 2 - Coke Machine

price = 50

while (price > 0):
    print("Amount Due: " + str(price))
    coin = input("Insert Coin: ")

    match coin:
        case "25":
            price = price - 25
        case "10":
            price = price - 10
        case "5":
            price = price - 5
        case "1":
            price = price - 1
        case _:
            {}
change = (-1 * price)
print("Change Owed: " + str(change))