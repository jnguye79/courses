# Problem Set 6 - Pizza Py
import sys
import csv

def main():

    if len(sys.argv) < 3:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 3:
        sys.exit("Too many command-line arguments")
    else:
        if not (sys.argv[1].endswith(".csv")):
            sys.exit("Not a CSV file")
        else:
            try:
                file = open(sys.argv[1], "r")
            except FileNotFoundError:
                sys.exit(f"Could not read {sys.argv[1]}")
            else:
                data = []
                reader = csv.DictReader(file)

                for row in reader:
                    list = []
                    last = row["name"].split(",")[0].lstrip()
                    first = row["name"].split(",")[1].lstrip()
                    house = row["house"]
                    list.extend([first, last, house])
                    data.append(list)

                file.close()

                with open(sys.argv[2], "w", newline='') as file2:
                    fieldnames = ['first', 'last', 'house']
                    writer = csv.DictWriter(file2, fieldnames=fieldnames)
                    writer.writeheader()

                    for row in data:
                        writer.writerow({"first": row[0], "last": row[1], "house": row[2]})

if __name__ == "__main__":
    main()