.export batx
.export ballx
.export bally
.export ballxvel
.export ballyvel
.export balldir
.export ballpat


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
