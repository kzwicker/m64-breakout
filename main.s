.export _reset
.export _fill_vram
.export batx
.include "hardware.inc"

StartX = 116
StartY = 230

.segment "BSS"
batx:
    .res 1

.segment "CODE"

.proc _reset
    lda #$ff

    .repeat 16, I
    sta _PMF+I ; sprite pattern 0
    .endrepeat

    ; set up data for bat sprite
    lda #StartX
    sta batx
    lda #StartY
    sta _OBM+object_s::ypos
    sta _OBM+.sizeof(object_s)+object_s::ypos
    sta _OBM+.sizeof(object_s)*2+object_s::ypos
    lda #WHITE
    sta _OBM+object_s::color
    sta _OBM+.sizeof(object_s)+object_s::color
    sta _OBM+.sizeof(object_s)*2+object_s::color
    ; zero
    stz _OBM+object_s::pattern_config
    stz _OBM+.sizeof(object_s)+object_s::pattern_config
    stz _OBM+.sizeof(object_s)*2+object_s::pattern_config

    rts
.endproc


.proc _fill_vram
bat:
    lda batx
    sta _OBM+object_s::xpos
    clc
    adc #8
    sta _OBM+.sizeof(object_s)+object_s::xpos
    clc
    adc #8
    sta _OBM+.sizeof(object_s)*2+object_s::xpos
    rts
.endproc
