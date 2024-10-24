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

; table of ball velocities and directions from python script
ballxlowveltable:
    .byte $ae
    .byte $a5
    .byte $9a
    .byte $8e
    .byte $7f
    .byte $6d
    .byte $57
    .byte $3e
    .byte $1f
    .byte $f9
    .byte $cc
    .byte $97
    .byte $57
    .byte $0d
    .byte $ba
    .byte $5f
    .byte $00
    .byte $5f
    .byte $ba
    .byte $0d
    .byte $57
    .byte $97
    .byte $cc
    .byte $f9
    .byte $1f
    .byte $3e
    .byte $57
    .byte $6d
    .byte $7f
    .byte $8e
    .byte $9a
    .byte $a5
    .byte $ae

ballxhighveltable:
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02

ballylowveltable:
    .byte $57
    .byte $69
    .byte $7d
    .byte $92
    .byte $aa
    .byte $c3
    .byte $df
    .byte $fe
    .byte $1f
    .byte $41
    .byte $66
    .byte $8b
    .byte $ae
    .byte $cf
    .byte $e9
    .byte $fa
    .byte $00
    .byte $fa
    .byte $e9
    .byte $cf
    .byte $ae
    .byte $8b
    .byte $66
    .byte $41
    .byte $1f
    .byte $fe
    .byte $df
    .byte $c3
    .byte $aa
    .byte $92
    .byte $7d
    .byte $69
    .byte $57

ballyhighveltable:
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $03
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01
    .byte $01

balldirtable:
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %11
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
    .byte %10
