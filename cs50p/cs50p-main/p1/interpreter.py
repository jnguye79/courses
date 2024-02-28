# Problem Set 1 - Math Interpreter

ans = input("Expression: ")

ans = ans.split()

x = ans[0]
y = ans[1]
z = ans[2]

match y:
    case "+":
        print(float(x) + float(z))
    case "-":
        print(float(x) - float(z))
    case "*":
        print(float(x) * float(z))
    case "/":
        print(float(x) / float(z))