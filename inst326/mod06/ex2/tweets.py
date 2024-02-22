# Module 6 - Exercise 2: JSON and Twitter Data

import json

f = open('aoc.json', 'r', encoding = 'utf-8')
tweets = json.load(f)
empty = 0
nonEmpty = 0

for x in tweets:
    if (x['hashtags'] == []):
        empty += 1
    else :
        nonEmpty += 1

print(f"Empty: {empty}, Non-Empty: {nonEmpty}")

f.close()