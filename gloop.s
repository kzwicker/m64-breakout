.export _do_logic

.include "hardware.inc"
.include "data.inc"

Speed = 4
BatSpeed = $30
BatWidth = 24
BallWidth = 8

.proc _do_logic
    jsr move_bat
    jsr move_ball
    jsr collide_ball
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
    lda balldir ; check x direction
    bit #%00000001
    bne @negx

    lda ballx
    clc
    adc ballxvel ; add low bytes
    sta ballx
    lda ballx+1
    adc ballxvel+1 ; add high bytes
    sta ballx+1
    bra @checky

@negx:
    lda ballx
    sec
    sbc ballxvel ; subtract low bytes
    sta ballx
    lda ballx+1
    sbc ballxvel+1 ; subtract high bytes
    sta ballx+1

@checky:
    lda balldir ; check y direction
    bit #%00000010
    bne @negy

    lda bally
    clc
    adc ballyvel ; add low bytes
    sta bally
    lda bally+1
    adc ballyvel+1 ; add high bytes
    sta bally+1
    rts

@negy:
    lda bally
    sec
    sbc ballyvel ; subtract low bytes
    sta bally
    lda bally+1
    sbc ballyvel+1 ; subtract high bytes
    sta bally+1

    rts    


collide_ball:
    lda balldir
    bit #%00000001
    bne @check_left

@check_right:
    lda ballx+1
    cmp #GameWidth-BallWidth
    bcc @check_vertical_collision

    lda #0
    sta ballx
    lda #GameWidth-BallWidth
    sta ballx+1
    bra @flipx


@check_left:
    lda ballx+1
    cmp #GameWidth-4
    bcc @check_vertical_collision

    lda #0
    sta ballx
    lda #0
    sta ballx+1

@flipx:
    lda balldir
    eor #%00000001
    sta balldir


@check_vertical_collision:
    rts
