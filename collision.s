.export collide_wall

.include "hardware.inc"
.include "data.inc"

collide_wall: ; returns 0 if play continues, returns 1 if game should restart
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

    lda #$01 ; reset if ball goes out of bounds
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
