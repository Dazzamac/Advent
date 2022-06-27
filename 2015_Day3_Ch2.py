'''The next year, to speed up the process, Santa creates a robot version of
himself, Robo-Santa, to deliver presents with him.

Santa and Robo-Santa start at the same location (delivering two presents to
the same starting house), then take turns moving based on instructions from
the elf, who is eggnoggedly reading from the same script as the previous year.

This year, how many houses receive at least one present?

For example:

    ^v delivers presents to 3 houses, because Santa goes north, and then
    Robo-Santa goes south.
    ^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up
    back where they started.
    ^v^v^v^v^v now delivers presents to 11 houses, with Santa going one
    direction and Robo-Santa going the other.
'''
'''LOGIC
Start with coordinates 0,0
Create a second set of coordinates at 0,0 for Robo-Santa
Keep a track of the number of instructions passed
If the instruction count is odd, the instruction is for Santa
If the count if Even, the instruction is for Robo-Santa
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
with open('2015_Day3_input.txt') as SOURCE:
    INPUT = SOURCE.read()

#SANTA
X = 0
Y = 0
COORD = X,Y
HOUSES = [COORD]
#ROBOSANTA
RX = 0
RY = 0
RCOORD = RX,RY
RHOUSES = [RCOORD]
TICKER = 0
for CHAR in INPUT:
    TICKER += 1
    if TICKER % 2 == 1:
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
    else:
        if CHAR == ">":
            RX = RX + 1
        elif CHAR == "<":
            RX = RX -1
        elif CHAR == "^":
            RY = RY + 1
        elif CHAR =="v":
            RY = RY-  1
        else:
            print("Invalid character found!")
        RCOORD = RX,RY
        HOUSES.append(RCOORD)
#print(TICKER)

COUNT = len(set(HOUSES))
print(COUNT)