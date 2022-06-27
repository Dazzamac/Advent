'''Santa is delivering presents to an infinite two-dimensional grid of houses.

He begins by delivering a present to the house at his starting location, and
then an elf at the North Pole calls him via radio and tells him where to move
next. Moves are always exactly one house to the north (^), south (v), east (>)
or west (<). After each move, he delivers another present to the house at his
new location.

However, the elf back at the north pole has had a little too much eggnog, and
so his directions are a little off, and Santa ends up visiting some houses
more than once. How many houses receive at least one present?

For example:

    > delivers presents to 2 houses: one at the starting location, and one to
    the east.
    ^>v< delivers presents to 4 houses in a square, including twice to the
    house at his starting/ending location.
    ^v^v^v^v^v delivers a bunch of presents to some very lucky children at
    only 2 houses.
'''
'''LOGIC
Start with coordinates 0,0
As each character is checked, modify the x or y coordinate as required
    > = x+1
    < = x-1
    ^ = y+1
    v = y-1
As we need to count the total number of unique coordinates, they must be
stored for comparison,
If the new coordinate is not already in the list, add it to the list
When all characters have been checked, count the unqique items in the list
'''
#Start
with open('2015_Day3_input.txt') as SOURCE:
    INPUT = SOURCE.read()
X = 0
Y = 0
COORD = X,Y
HOUSES = [COORD]
#print(INPUT)
#print(HOUSES)
for CHAR in INPUT:
    if CHAR == ">":
        X = X + 1
    elif CHAR == "<":
        X = X -1
    elif CHAR == "^":
        Y = Y + 1
    elif CHAR =="v":
        Y = Y-  1
    else:
        print("Invalid character found!")
    COORD = X,Y
    HOUSES.append(COORD)
#Convert list to set to remove duplicates and dislay count
COUNT = len(set(HOUSES))
print(COUNT)