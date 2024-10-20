.export _reset
.export _fill_vram

.include "hardware.inc"
.include "data.inc"

BatStartX = 116
BatStartY = 230
BallStartX = 124
BallStartY = 200
BallStartXVel = $0300
BallStartYVel = $0300
BallStartDir = %00000010 ; bit 0: x sign, bit 1: y sign
BatPatternNo = 0
BallPatternNo = 1


.segment "CODE"

.proc _reset
    lda #$ff

    .repeat 16, I
    sta _PMF+.sizeof(pattern_t)*BatPatternNo+I ; sprite pattern 0
    .endrepeat

    ldx #$00
@pat1loop:
    lda ballpat,x
    sta _PMF+.sizeof(pattern_t)*BallPatternNo,x ; sprite pattern 1
    inx
    cpx #16
    bne @pat1loop

    jsr reset_game

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

ball:
    lda ballx+1
    sta _OBM+.sizeof(object_s)*3+object_s::xpos
    lda bally+1
    sta _OBM+.sizeof(object_s)*3+object_s::ypos

    rts
.endproc

reset_game:
    ; set up data for bat sprite
    lda #BatStartX
    sta batx
    lda #BatStartY
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

    ; set up data for ball sprite
    lda #<BallStartX
    sta ballx
    lda #>BallStartX
    sta ballx+1
    lda #<BallStartY
    sta bally
    lda #>BallStartY
    sta bally+1
    lda #RED
    sta _OBM+.sizeof(object_s)*3+object_s::color
    lda #$01
    sta _OBM+.sizeof(object_s)*3+object_s::pattern_config

    ; set up velocities
    lda #<BallStartXVel
    sta ballxvel
    lda #>BallStartXVel
    sta ballxvel+1
    lda #<BallStartYVel
    sta ballyvel
    lda #>BallStartYVel
    sta ballyvel+1
    lda #BallStartDir
    sta balldir

    rts
