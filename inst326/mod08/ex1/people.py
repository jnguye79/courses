# Module 8 - Exercise 1: People

import re

def parse_name(text: str):
    pattern = re.search('^([A-Z])([a-z])+\s([A-Z])([a-z])+', text)
    return pattern

def parse_address(text: str):
    pattern = re.search('\d+\s[A-Za-z]\D+[A-Z]{2}', text)
    return pattern

def parse_email(text: str):
    pattern = re.search('\S[a-z]+.[a-z]+.\w+@\w+.\w+', text)
    return pattern

class Address():
    def __init__(self, street: str, city: str, state: str):
        self.street = street
        self.city = city
        self.state = state

class Employee():
    def __init__(self, first_name: str, last_name: str, address: str, email: str):
        self.first_name = parse_name(first_name)
        self.last_name = parse_name(last_name)
        self.address = parse_address(address)
        self.email = parse_email(email)

def main(path: str):
    employee_list = []
    f = open(path, 'r', encoding = 'utf-8')

    for x in f:
        e = Employee(x, x, x, x)
        employee_list.append(e)

    print(f"Length of Employee List: {len(employee_list)}")

    for x in range(len(employee_list)):
        print(employee_list[x].first_name)
        print(employee_list[x].address)
        print(employee_list[x].email)

    f.close()

if __name__ == "__main__":
    main("people.txt")