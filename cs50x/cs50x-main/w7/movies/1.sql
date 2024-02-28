import csv

with open("movies.db", "r") as file:
    reader = csv.DictReader(file)
    for row in reader: