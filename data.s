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
    .res 1
bally:
    .res 1
ballxvel:
    .res 1
ballyvel:
    .res 1
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
