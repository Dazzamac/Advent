'''
The elves are running low on wrapping paper, and so they need to submit an
order for more. They have a list of the dimensions (length l, width w, and height h) of
each present, and only want to order exactly as much as they need.

Fortunately, every present is a box (a perfect right rectangular prism), which makes
calculating the required wrapping paper for each gift a little easier: find the
surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. The elves also need a
little extra paper for each present: the area of the smallest side.

For example:

    A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet
    of wrapping paper plus 6 square feet of slack, for a total of 58 square
    feet.
    A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square
    feet of wrapping paper plus 1 square foot of slack, for a total of 43
    square feet.

All numbers in the elves' list are in feet. How many total square feet of
wrapping paper should they order?
2015 Advent of Code
Day 2
Challenge 1
'''

'''LOGIC
Gather Data from input file
Create an object to store dimension data from each line
Multiply the dimensions using "2*l*w + 2*w*h + 2*h*l" plus the smallest side
to get the paper needed per box
Output a running Total '''
#Start
INPUT = open("2015_Day2_Input.txt", "rt")
#Initialize dimensions
DIMENSIONS = {
    "LENGTH": 0,
    "WIDTH": 0,
    "HEIGHT": 0,
}
TOTAL = 0

for LINE in INPUT:
    DIMENSIONS["LENGTH"],DIMENSIONS["WIDTH"],DIMENSIONS["HEIGHT"] = LINE.split("x")
    DIMENSIONS["HEIGHT"] = DIMENSIONS["HEIGHT"].rstrip()#Strip newline character
    #print(DIMENSIONS)
    SIDES = [
        (2 * int(DIMENSIONS["LENGTH"]) * int(DIMENSIONS["WIDTH"])),
        (2 * int(DIMENSIONS["LENGTH"]) * int(DIMENSIONS["HEIGHT"])),
        (2 * int(DIMENSIONS["WIDTH"]) * int(DIMENSIONS["HEIGHT"])),
    ]
    #print(SIDES)
    #print(min(SIDES) / 2)
    TOTAL = TOTAL + sum(SIDES) + (min(SIDES)/2)
print(TOTAL)