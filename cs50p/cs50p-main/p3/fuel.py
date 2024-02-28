# Problem Set 3 - Fuel Gauge

while True:

    prompt = input("Fraction: ")
    res = prompt.split("/")

    try:
        x = int(res[0])
        y = int(res[1])
        ans = x / y
    except (ValueError, ZeroDivisionError):
        pass

    if (x > y):
        pass
    
    else:
        break

if (ans == 1):
    print("F")
elif (ans == 0):
    print("E")
else: 
    ans = int(ans * 100)
    print(str(ans) + "%")