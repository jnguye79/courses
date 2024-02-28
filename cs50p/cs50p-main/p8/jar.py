# Problem Set 8 - Cookie Jar

class Jar:
    def __init__(self, capacity=12):
        self.capacity = capacity
        self.size = 0

    def __str__(self):
        return "🍪" * self.size

    def deposit(self, n):
        if (self.size + n) > self.capacity:
            raise ValueError("Unable to deposit amount")
        else:
            self.size += n

    def withdraw(self, n):
        if (self.size - n) < 0:
            raise ValueError("Unable to withdraw amount")
        else:
            self.size -= n

    @property
    def capacity(self):
        return self._capacity

    @capacity.setter
    def capacity(self, new_capacity):
        if new_capacity < 0:
            raise ValueError("Capacity cannot be negative")
        self._capacity = new_capacity

    @property
    def size(self):
        return self._size

    @size.setter
    def size(self, new_size):
        if new_size < 0:
            raise ValueError("Size cannot be negative")
        self._size = new_size