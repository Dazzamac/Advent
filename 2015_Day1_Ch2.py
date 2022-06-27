'''
2015 Advent of Code
Day 1
Challenge 2
Now, given the same instructions, find the position of the first character
that causes him to enter the basement (floor -1). The first character in the
instructions has position 1, the second character has position 2, and so on.

For example:

    ) causes him to enter the basement at character position 1.
    ()()) causes him to enter the basement at character position 5.

What is the position of the character that causes Santa to first enter the
basement?
'''

'''LOGIC
Gather input dat from file
Start at Floor 0
For each character, if its ( add 1, if it's ), subtract one.
Keep a running count of how many characters have been checked
Stop counting when floor = -1
Output the count at that point'''
#Start
floor = 0

with open('2015_Day1_input.txt') as source:
    input = source.read()

#Start Counter
charcount = 0

for char in input:
    if floor == -1:
        print("Instruction",charcount,"leaves us on floor", floor)
        break
    if char == '(':
        floor = floor + 1
    else:
        floor = floor -1
    charcount += 1
print("Current floor is",floor)
