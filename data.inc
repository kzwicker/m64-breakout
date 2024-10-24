.global batx
.global ballx
.global bally
.global ballxvel
.global ballyvel
.global balldir
.global ballpat
.global ballxlowveltable
.global ballxhighveltable
.global ballylowveltable
.global ballyhighveltable
.global balldirtable
.global brickstates

Speed = 4
BallSpeed = $0300
BatWidth = 24
BallWidth = 8
BallHeight = 8

BatStartX = 116
BatStartY = 230
BallStartX = 124 << 8
BallStartY = 180 << 8
BallStartXVel = $0000
BallStartYVel = $0200
BallStartDir = %00 ; bit 0: x sign, bit 1: y sign
BatPatternNo = 0
BallPatternNo = 1
BGPatternNo = 0
BrickPatternNo = 1
BrickStart = 2 ; row number in tiles of first line of bricks
BrickEnd = 8 ; row number in tiles after bricks
