# python script for generating the ball velocity tables used in data.s
import math

if __name__ == "__main__":
    ballspeed = 3
    batwidth = 24
    ballwidth = 8
    batheight = 8
    
    xvelocities = []
    yvelocities = []

    dy = -(batheight+ballwidth)/2
    # calculate velocities of ball based on contact with bat at different locations using T R I A N G L E S
    for dx in range(int(-(batwidth+ballwidth)/2), int((batwidth+ballwidth)/2+1)):
        print(dx)
        xvelocities.append(dx * ballspeed / math.sqrt(dx**2 + dy**2))
        yvelocities.append(dy * ballspeed / math.sqrt(dx**2 + dy**2))

    # print the fractional and whole bytes of the x and y velocities in a nice table
    print("ballxlowveltable:")
    for xvel in xvelocities:
        print("    .byte $%.2x" % math.floor(math.fabs(xvel)*256%256))

    print("\nballxhighveltable:")
    for xvel in xvelocities:
        print("    .byte $%.2x" % math.floor(math.fabs(xvel)))

    print("\nballylowveltable:")
    for yvel in yvelocities:
        print("    .byte $%.2x" % math.floor(math.fabs(yvel)*256%256))

    print("\nballyhighveltable:")
    for yvel in yvelocities:
        print("    .byte $%.2x" % math.floor(math.fabs(yvel)))

    print("\nballdirtable:")
    for i in range(len(xvelocities)):
        print("    .byte %%%.1d%.1d" % (1 if yvelocities[i] < 0 else 0, 1 if xvelocities[i] < 0 else 0))
        
