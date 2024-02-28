# Problem Set 4 - Frank, Ian and Glen's Letters

import sys
import random
from pyfiglet import Figlet

def main():

    figlet = Figlet()

    if (len(sys.argv) == 1):

            prompt = input("Input: ")
            print(figlet.renderText(prompt))

    elif (len(sys.argv) == 3):
        if (sys.argv[1] == '-f' or sys.argv[1] == '--font'):

            font_list = figlet.getFonts()
            font_find = ''

            # Font Search Checker
            for item in font_list:
                if (sys.argv[2] == item):
                    font_find = item

            if (font_find):
                prompt = input("Input: ")
                figlet.setFont(font=font_find)
                print(figlet.renderText(prompt))
            else:
                sys.exit("Font Not Found -- Exiting Program")
        else:
            sys.exit("Incorrect arguments -- Exiting Program")
    else:
        sys.exit("Incorrect command-line arguments -- Exiting Program")

if __name__ == "__main__":
    main()