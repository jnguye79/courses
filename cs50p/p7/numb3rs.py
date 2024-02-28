# Problem Set 7 - NUMB3RS

import re
import sys

def main():
    print(validate(input("IPv4 Address: ")))

def validate(ip):
    segments = ip.split(".")

    if len(segments) != 4:
        return False

    for segment in segments:
        if not segment.isdigit():
            return False

        num = int(segment)
        if num < 0 or num > 255:
            return False

    return True

if __name__ == "__main__":
    main()