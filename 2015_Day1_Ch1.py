'''
2015 Advent of Code
Day 1
Challenge 1
Santa is trying to deliver presents in a large apartment building, but he can't
find the right floor - the directions he got are a little confusing. He starts
on the ground floor (floor 0) and then follows the instructions one character
at a time.

An opening parenthesis, (, means he should go up one floor, and a closing
parenthesis, ), means he should go down one floor.

The apartment building is very tall, and the basement is very deep; he will
never find the top or bottom floors.

For example:

    (()) and ()() both result in floor 0.
    ((( and (()(()( both result in floor 3.
    ))((((( also results in floor 3.
    ()) and ))( both result in floor -1 (the first basement level).
    ))) and )())()) both result in floor -3.

To what floor do the instructions take Santa?'''
'''LOGIC
Gather input data from text file
Start at floor 0
For each (, add 1, for each ) subtract 1
Output final result'''
#Start
floor = 0

with open('2015_Day1_input.txt') as source:
    input = source.read()
 
for char in input:
    if char == '(':
        floor = floor + 1
    else:
        floor = floor -1
print("Current floor is",floor)
