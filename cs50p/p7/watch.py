# Problem Set 7 - Watch on Youtube

import re
import sys

def main():
    print(parse(input("HTML: ")))

def parse(s):

    iframe_match = re.search(r"<iframe.*?</iframe>", s, re.DOTALL)

    if iframe_match:
        iframe_content = iframe_match.group(0)
        youtube_match = re.search(r"(https?://)?(?:www\.)?youtube\.com/embed/([A-Za-z0-9_-]+)", iframe_content)

        if youtube_match:
            src_address = youtube_match.group(0)
            short_address = re.sub(r"https?://(?:www\.)?youtube\.com/embed/([A-Za-z0-9_-]+)", r"https://youtu.be/\1", src_address)
            return short_address

    return None

if __name__ == "__main__":
    main()