# Problem Set 4 - Adieu, Adieu
import inflect

def main():
    p = inflect.engine()
    names = []

    while True:
        try:
            prompt = input("Name: ")
        except EOFError:
                match len(names):
                    case 1:
                        print("Adieu, adieu, to " + str(names[0]))
                        exit(0)
                    case 2:
                        ans = p.join((names[0], names[1]))
                        print("Adieu, adieu, to " + str(ans))
                        exit(0)
                    case 3:
                        ans = p.join((names[0], names[1], names[2]))
                        print("Adieu, adieu, to " + str(ans))
                        exit(0)
                    case 4:
                        ans = p.join((names[0], names[1], names[2], names[3]))
                        print("Adieu, adieu, to " + str(ans))
                        exit(0)
                    case 5:
                        ans = p.join((names[0], names[1], names[2], names[3], names[4]))
                        print("Adieu, adieu, to " + str(ans))
                        exit(0)
                    case 6:
                        ans = p.join((names[0], names[1], names[2], names[3], names[4], names[5]))
                        print("Adieu, adieu, to " + str(ans))
                        exit(0)
                    case 7:
                        ans = p.join((names[0], names[1], names[2], names[3], names[4], names[5], names[6]))
                        print("Adieu, adieu, to " + str(ans))
                        exit(0)
                    case _:
                        exit(0)
        else:
            if (prompt):
                names.append(prompt)

if __name__ == "__main__":
    main()