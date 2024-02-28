# Problem Set 6 - CS50 P-Shirt
import sys
from PIL import Image, ImageOps

def main():

    if len(sys.argv) < 3:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 3:
        sys.exit("Too many command-line arguments")
    else:
        if not ((sys.argv[1].endswith(".jpg") or sys.argv[1].endswith(".jpeg") or sys.argv[1].endswith(".png")) and
                (sys.argv[2].endswith(".jpg") or sys.argv[2].endswith(".jpeg") or sys.argv[2].endswith(".png"))):
            sys.exit("Invalid output")
        else:
            if not sys.argv[2].split(".")[1] == sys.argv[1].split(".")[1]:
                sys.exit("Input and output have different extensions")
            else:
                try:
                    image = Image.open(sys.argv[1])
                except FileNotFoundError:
                    sys.exit("Input does not exist")
                else:
                    size = (600, 600)
                    crop_image = ImageOps.fit(image, size)

                    shirt_image = Image.open("shirt.png")
                    crop_image.paste(shirt_image, (0, 0), mask=shirt_image)
                    crop_image.save(sys.argv[2])
                    sys.exit()

if __name__ == "__main__":
    main()