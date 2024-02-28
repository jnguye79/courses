# Problem Set 6 - Lines of Code
import sys

def main():
    count = 0
    com_count = 0

    if len(sys.argv) < 2:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 2:
        sys.exit("Too many command-line arguments")
    else:
        if not (sys.argv[1].endswith(".py")):
            sys.exit("Not a Python file")
        else:
            try:
                file = open(sys.argv[1])
            except FileNotFoundError:
                sys.exit("File does not exist")
            else:
                for line in file:
                    line = line.strip()

                    # Search for file, then count the number lines inside the file excluding whitespaces and commentary lines.
                    if (line.startswith('#') or line == ""):
                        pass
                    elif (len(line) == 3 and
                          (line.endswith('"""') or line.endswith("'''"))):
                        count += 1
                    elif (len(line) > 3 and
                          (line.startswith('"""') and line.endswith('"""')) or
                          (line.startswith("'''") and line.endswith("'''"))):
                        count += 1
                    else:
                        if (com_count % 2) == 0:
                            count += 1
                        else:
                            pass
                print(count)

if __name__ == "__main__":
    main()