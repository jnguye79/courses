# Problem Set 3 - Grocery List

d = {}

while True:
    try: 
        item = input().upper()
    except EOFError:
        keys = list(d.keys())
        keys.sort()
        sort_d = {i: d[i] for i in keys}

        for item in sort_d:
            print(str(sort_d[item]) + " " + str(item))
        exit()
    
    try:
        if (item in d):
            d[item] += 1
        else:
            d[item] = 1
    except TypeError:
        pass

