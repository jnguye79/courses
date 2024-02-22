# Exercise: Enron #

## Inheritance ##
Object Oriented Programming provides a way to reuse software. When you reuse classes you often need to adapt it in a particular way by adding or 
modifying behavior or data. One way of doing this is to create a new class that extends the existing one using the pattern of inheritance.

Imagine that you have been using the Email class found in the attached file [enron.py](https://umd-ischool-inst326.github.io/inst326-public/modules/module09/exercises/files/enron.py).
You would like the class to provide access to the Subject of the email (which can be found by searching for the first occurence of "Subject" at the 
beginning of a line in the text of the email). But you don’t want to change the behavior of the Email class itself because other people are using it 
already. Write a new class called ExtendedEmail that provides this additional method get_subject().

You can download the [enron-sample.zip](https://umd-ischool-inst326.github.io/inst326-public/modules/module09/exercises/files/enron-sample.zip) as test
data for this exercise. Any of the files contained in that zip archive is an email message that should have a subject line.
