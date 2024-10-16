; Controller

.import _CONTROLLER_1
.import _CONTROLLER_2

CONTROLLER_A_MASK = $80
CONTROLLER_B_MASK = $40
CONTROLLER_UP_MASK = $08
CONTROLLER_DOWN_MASK = $04
CONTROLLER_LEFT_MASK = $02
CONTROLLER_RIGHT_MASK = $01
CONTROLLER_START_MASK = $10
CONTROLLER_SELECT_MASK = $20


; mapache64_zero_page

.import _FRAME ; 4 bytes (?) at address 0


; vram

.import _PMF ; Pattern Memory Foreground, 32 patterns
.import _PMB ; Pattern Memory Background, 32 patterns
.import _NTBL ; NameTaBLe, 30 rows, 32 columns
.import _background_palette
.import _OBM ; OBject Memory
.import _TXBL ; TeXt taBLe

.struct object_s
    xpos .byte
    ypos .byte
    pattern_config .byte
    color .byte
.endstruct

.struct pattern_t
    .byte 16
.endstruct

.enum
    BLACK
    BLUE
    GREEN
    CYAN
    RED
    MAGENTA
    YELLOW
    WHITE
    ALTBLACK = BLACK << 3
    ALTBLUE = BLUE << 3
    ALTGREEN = GREEN << 3
    ALTCYAN = CYAN << 3
    ALTRED = RED << 3
    ALTMAGENTA = MAGENTA << 3
    ALTYELLOW = YELLOW << 3
    ALTWHITE = WHITE << 3
.endenum

GameWidth = 256
GameHeight = 240
