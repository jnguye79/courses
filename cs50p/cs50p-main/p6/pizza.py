# Problem Set 6 - Pizza Py
import sys
from tabulate import tabulate

def main():

    if len(sys.argv) < 2:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 2:
        sys.exit("Too many command-line arguments")
    else:
        if not (sys.argv[1].endswith(".csv")):
            sys.exit("Not a CSV file")
        else:
            try:
                file = open(sys.argv[1])
            except FileNotFoundError:
                sys.exit("File does not exist")
            else:
                table = []
                headers = "firstrow"
                for line in file:
                    list = []
                    items = line.split(",")
                    for item in items:
                        list.append(item.strip())
                    table.append(list)

                print(tabulate(table, headers, tablefmt="grid"))
                file.close()

if __name__ == "__main__":
    main()