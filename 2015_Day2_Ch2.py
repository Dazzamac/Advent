'''
2015 Advent of Code
Day 2
Challenge 2
The elves are also running low on ribbon. Ribbon is all the same width, so
they only have to worry about the length they need to order, which they would
again like to be exact.

The ribbon required to wrap a present is the shortest distance around its
sides, or the smallest perimeter of any one face. Each present also requires
a bow made out of ribbon as well; the feet of ribbon required for the perfect
bow is equal to the cubic feet of volume of the present. Don't ask how they
tie the bow, though; they'll never tell.

For example:

    A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to
    wrap the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total
    of 34 feet.
    A present with dimensions 1x1x10 requires 1+1+1+1 = 4 feet of ribbon to
    wrap the present plus 1*1*10 = 10 feet of ribbon for the bow, for a total
    of 14 feet.

How many total feet of ribbon should they order?'''

'''LOGIC
Gather Data from input file
Create an object to store dimension data from each line
The bow is l*w*h
The length is then the two shortest sides * 2 plus the bow
We will use the math.prod() function to acheive the multiplication here

'''
import math
INPUT = open("2015_Day2_Input.txt", "rt")
TOTAL = 0
for LINE in INPUT:
    LINE = LINE.rstrip()
    SIDES = LINE.split("x")
    #Convert to int for operations
    SIDES_INT = [int(ELEMENT) for ELEMENT in SIDES]
    #print(SIDES_INT)
    BOW = math.prod(SIDES_INT)
    #print(BOW)
    WRAP = (sum(SIDES_INT) - max(SIDES_INT)) * 2
    #print(WRAP)
    LENGTH = BOW + WRAP
    #print(LENGTH)
    TOTAL = TOTAL + LENGTH
print(TOTAL)
