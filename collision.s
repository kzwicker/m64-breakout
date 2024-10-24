.export collide_wall
.export collide_bat

.import move_ball

.include "hardware.inc"
.include "data.inc"

collide_wall: ; returns 0 in A if play continues, returns 1 in A if game should restart
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
    sta ballx+1

@flipx:
    lda balldir
    eor #%00000001
    sta balldir


@check_vertical_collision:
    lda balldir
    bit #%00000010
    bne @check_top

@check_bottom:
    lda bally+1
    cmp #GameHeight-BallHeight
    bcc @end

    lda #$01 ; reset if ball goes out of lower bound
    rts

@check_top:
    lda bally+1
    cmp #$ff-8
    bcc @end

    lda #0
    sta bally
    sta bally+1

@flipy:
    lda balldir
    eor #%00000010
    sta balldir

@end:
    lda #$00
    rts

collide_bat:
    lda bally+1
    cmp #BatStartY-BallHeight ; check upper bound of bat
    bcc @end

    lda ballx+1
    clc
    adc #BallWidth ; check left bound of bat
    cmp batx
    bcc @end

    sec
    sbc #BallWidth+BatWidth-1 ; check right bound of bat
    cmp batx
    bcs @end
    
@hit:
    clc 
    adc #BallWidth+BatWidth-1
    sec
    sbc batx
    tax ; store position of ball relative to bat in x

    lda balldir
    eor #%00000011
    sta balldir
    jsr move_ball ; get ball out of bat by reversing mvmt

    lda ballxlowveltable,x
    sta ballxvel
    lda ballxhighveltable,x
    sta ballxvel+1

    lda ballylowveltable,x
    sta ballyvel
    lda ballyhighveltable,x
    sta ballyvel+1

    lda balldirtable,x
    sta balldir

@end:
    rts
