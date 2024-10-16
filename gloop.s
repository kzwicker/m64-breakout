.export _do_logic

.include "hardware.inc"
.include "data.inc"

Speed = 4
BatWidth = 24

.proc _do_logic
    jsr move_bat
    rts
.endproc


move_bat:
    lda _CONTROLLER_1
    bit #CONTROLLER_LEFT_MASK
    beq @left_not_pressed
    lda batx
    sec
    sbc #Speed
    bcs @no_negative_overflow

    lda #$00 ; stop bat if hit left edge of screen

@no_negative_overflow:
    sta batx
    lda _CONTROLLER_1
@left_not_pressed:

    bit #CONTROLLER_RIGHT_MASK
    beq @right_not_pressed
    lda batx
    clc
    adc #Speed
    cmp #GameWidth-BatWidth
    bcc @no_positive_overflow
    
    lda #GameWidth-BatWidth ; stop bat if hit right edge of screen

@no_positive_overflow:
    sta batx
@right_not_pressed:
    rts

move_ball:
    lda balldir
