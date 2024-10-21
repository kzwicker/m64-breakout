.export _do_logic
.export move_ball
    
.import collide_wall
.import collide_bat
.import reset_game

.include "hardware.inc"
.include "data.inc"

.proc _do_logic
    jsr move_bat
    jsr move_ball

    jsr collide_wall
    beq no_reset ; if collide_wall returns 1, reset the game
    jsr reset_game
no_reset:

    jsr collide_bat
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
