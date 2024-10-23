.include "hardware.inc"
.include "data.inc"

.segment "BSS"
batx:
    .res 1
ballx:
    .res 2
bally:
    .res 2
ballxvel:
    .res 2
ballyvel:
    .res 2
balldir:
    .res 1
brickstates:
    .res GameWidth/8 * (BrickEnd-BrickStart)

.segment "DATA"
ballpat:
    .byte %00011011, %11100100
    .byte %01111111, %11111101
    .byte %10111111, %11111110
    .byte %11111111, %11111111
    .byte %11111111, %11111111
    .byte %10111111, %11111110
    .byte %01111111, %11111101
    .byte %00011011, %11100100

CasesPerSide = BatWidth/2+BallWidth/2 ; number of positions the ball can have relative to the bat on either side
    
ballxlowveltable:
    .repeat CasesPerSide, I
    .byte <(BallSpeed * (CasesPerSide-I) / CasesPerSide) 
    .endrepeat
    
    .repeat CasesPerSide, I
    .byte <(BallSpeed * I / CasesPerSide) 
    .endrepeat


ballxhighveltable:
    .repeat CasesPerSide, I
    .byte >(BallSpeed * (CasesPerSide-I) / CasesPerSide) 
    .endrepeat
    
    .repeat CasesPerSide, I
    .byte >(BallSpeed * I / CasesPerSide) 
    .endrepeat

ballylowveltable:
    .repeat CasesPerSide*2
    .byte 0
    .endrepeat

ballyhighveltable:
    .repeat CasesPerSide*2
    .byte 2
    .endrepeat

balldirtable:
    .repeat CasesPerSide
    .byte %11
    .endrepeat

    .repeat CasesPerSide
    .byte %10
    .endrepeat


