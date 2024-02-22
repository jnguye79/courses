# Module 6 Exercise 1: Energy Data in CSV

import csv

def energy(state: str, powerType: str):
    f = open('energy.csv', 'r', encoding = 'utf-8')
    ss = csv.DictReader(f)

    for row in ss:
        if (row['State'] == state):
            print(row[powerType])
            break

    f.close()


def main():
    f = open('energy.csv', 'r', encoding = 'utf-8')
    ss = csv.DictReader(f)
    totalNuclear = 0
    coalPower = 0
    coalState = ''

    for row in ss:
        if (row['Region'] == 'Mid Atlantic'):
            print(row['Abbreviation'], row['Nuclear'])
            totalNuclear += row['Nuclear']

        if (coalPower < row['Coal']):
            coalPower = row['Coal']
            coalState = row['State']

    print(f"Total Amount of Nuclear Power in Tri-State Area: {totalNuclear}")
    print(f"State with Most Coal Power: {coalState}")

    energy()
    f.close()



main()