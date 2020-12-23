;; Hardware text scroller
;; Scrolls text from right to left
;;
;; Code by Kev Thacker
;;
;; Released under the GNU Public License v1

org &0138
nolist

.screen_wide      equ 80    
                         ;no of characters wide*2

.screen_location  equ &1000 
                         ;address to send to CRTC6845 screen chip

.screen_plot_address equ &4000+screen_wide-2 
                         ;screen address to plot column of character

.character_height equ 32 ;height of a character in the font in lines
.character_width  equ 16  ;width of a character in the font
                         ;in bytes (must be divisable by 2)

.no_columns    equ character_width/2
                         ;no of 2 byte wide columns to plot

let no_characters='Z'-'@'+1

.scr_set_mode equ &bc0e
.scr_set_border equ &bc38
.scr_set_ink equ &bc32

xor a
call scr_set_mode

ld hl,palette
xor a
set_palette:
push af
ld b,(hl)
ld c,b
inc hl
push hl
call scr_set_ink
pop hl
pop af
inc a
cp 16
jr nz,set_palette

ld bc,0
call scr_set_border

char_height_1 equ character_height+7
char_height equ char_height_1/8


;; limit height of screen (avoids seeing garbage as it scrolls on)
;;ld bc,&bc06
;;out (c),c
;;ld bc,&bd00+char_height
;;out (c),c


;; ************************ INITIALISE DATA *******************************


call calculate_font_table ;calculate pointers to each character in
                          ;font

xor a
ld (column_counter),a     ;first column of first character

call init_scroll

;; *********************** SCROLL MESSAGE *********************************


.loop ld b,&f5   ;wait frame flyback
.l1 in a,(c)
rra
jr nc,l1

call plot_character  ;plot column of character on screen

;; update screen base address 
.start
ld hl,screen_location  	;; this is modified
inc hl
ld a,h
and &13
ld h,a
ld (start+1),hl
;; write to CRTC
ld bc,&bc00+12
out (c),c
inc b
out (c),h
dec b
inc c
out (c),c
inc b
out (c),l

;; update address to plot column
.plot_address 
ld de,screen_plot_address ;; this is modified
inc de
inc de
ld a,d
and &47
ld d,a
ld (plot_address+1),de

jp loop

.plot_character
ld a,character_height
ld de,(plot_address+1)
.current_character ld hl,0

;; NOTE: Uses I register. So this will not work in interrupt mode 2 without
;; modification.

;; Note: chars are stored a column at a time. Each column is 2 bytes wide.
.plot_column ld i,a
ld a,(hl)
ld (de),a
inc de
inc hl
ld a,(hl)
ld (de),a
dec de
inc hl
ex de,hl
call scr_next_line
ex de,hl
ld a,i
dec a
jr nz,plot_column

ld (current_character+1),hl

ld hl,column_counter   ;current column
inc (hl)        ;update column
ld a,(hl)
cp no_columns
ret nz
xor a            ;reset current column
ld (hl),a
.scroll_address ld hl,scroll_text  ;update for next character
inc hl
ld (scroll_address+1),hl
ld a,(hl)      ;is character 0?? (end of message marker)
or a
jr nz,cont      ;no, so get next character
                ;yes, so put current_character back to 
                ;start of message
.init_scroll
ld hl,scroll_text
ld (scroll_address+1),hl
ld a,(hl)
.cont call get_character_from_font ;get position
ld (current_character+1),de ;store character address
ret

.get_character_from_font
sub "@"                   ;first character number in table
add a,a
ld hl,font_table          ;table of addressess for font data (quicker than)
                          ;calculating address
ld e,a
ld d,0
add hl,de                 ;get address in table
ld e,(hl)                 ;get address of character
inc hl
ld d,(hl)
ret

.calculate_font_table
ld ix,font_table
ld hl,font_data              ;address of font in memory
ld a,no_characters              ;no of characters in table
.table_loop 
ld (ix+0),l               ;write character address
ld (ix+1),h
inc ix                    ;update table address for next address
inc ix
ld bc,character_height*character_width ;length of a characters data in memory
add hl,bc                 ;calculate address
dec a
jr nz,table_loop
ret


.column_counter defb 0

.scroll_text
defb "@A@COOL@HARDWARE@SCROLLER@@@@REPEAT@NOW@@@@@"
defb 0

.scr_next_line
ld a,h
add a,&08
ld h,a
and &38
ret nz
ld a,l
add a,&50
ld l,a
ld a,h
adc a,&c0
ld h,a

and &38
ret z
ld a,h
sub &8
ld h,a
ret


.font_table defs no_characters*2

palette:
defb &00
defb &01
defb &0f
defb &06
defb &0b
defb &01
defb &07
defb &04
defb &00
defb &02
defb &08
defb &0b
defb &10
defb &01
defb &01
defb &07

.font_data 
.font
defs character_height*character_width
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&44,&00,&cf,&6f,&cf,&3f,&cf,&6b,&cf,&3f,&6f,&3f,&6f 
defb &3f,&3f,&3f,&3f,&3f,&6f,&3f,&cf,&3f,&cf,&3f,&c7,&3f,&c3,&3f,&c3 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&15,&97,&00,&c3,&00,&15,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&cc 
defb &cc,&cc,&cc,&cc,&cf,&cf,&cf,&cf,&9f,&3f,&9f,&3f,&3f,&6f,&3f,&cf 
defb &cf,&cf,&cf,&cf,&cf,&c3,&cf,&97,&cb,&c3,&cb,&97,&97,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&44,&00,&cc,&44,&cc,&cc,&cc,&cc,&cc,&cc,&8c,&cc,&0c 
defb &8c,&0c,&8c,&0c,&3f,&6f,&3f,&cf,&6f,&cb,&cf,&c3,&cf,&c3,&c3,&c3 
defb &c3,&3f,&c3,&3f,&97,&3f,&3f,&97,&3f,&6f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&cf,&3f,&cf,&3f,&cf,&6b,&cf,&6b,&cf,&6b,&cf,&3f,&6b,&3f,&3f 
defb &0f,&0f,&4c,&0f,&cc,&0c,&cc,&8c,&cc,&8c,&8c,&0c,&0c,&0c,&0c,&4c 
defb &4c,&8d,&cc,&5f,&cb,&82,&c3,&2a,&c3,&c3,&c3,&c3,&97,&3f,&97,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&0f,&0f,&0f,&0c,&4c,&0c,&4c,&4c,&8d,&cc,&8d,&8d,&0f,&aa,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&0f,&0f,&0f,&8d,&0f,&0f,&5f,&0f,&5f,&0f,&ff,&ff,&ff,&00,&00 
defb &00,&00,&00,&aa,&15,&3f,&15,&3f,&97,&3f,&97,&3f,&3f,&3f,&3f,&6b 
defb &3f,&6b,&c3,&c3,&6b,&c7,&3f,&6f,&3f,&6f,&15,&6f,&15,&6f,&15,&3f 
defb &15,&6f,&15,&6f,&15,&6b,&15,&6b,&15,&6f,&15,&6f,&15,&3f,&15,&3f 
defb &0f,&5f,&0f,&5f,&0f,&ff,&ff,&aa,&ff,&00,&aa,&00,&00,&00,&00,&00 
defb &00,&00,&00,&55,&3f,&3f,&3f,&c3,&3f,&c3,&3f,&c3,&c3,&c7,&c3,&c7 
defb &c7,&cf,&cf,&cf,&cf,&9f,&9f,&3f,&3f,&3f,&6f,&3f,&6f,&9f,&cf,&3f 
defb &9f,&3f,&3f,&6b,&3f,&c7,&c7,&cf,&cf,&cf,&cf,&cf,&3f,&c7,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&af,&00,&8c,&55,&0c,&af,&0c 
defb &af,&0c,&af,&0c,&c3,&3f,&c3,&3f,&c7,&3f,&cf,&3f,&cf,&3f,&9f,&3f 
defb &9f,&3f,&3f,&3f,&9f,&3f,&6b,&3f,&6b,&3f,&6b,&3f,&6b,&3f,&6b,&3f 
defb &c7,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cf,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&44,&00,&cc,&44,&cc,&ee,&cc,&af,&cc,&ff,&8c,&ff,&8c 
defb &ff,&cc,&ff,&ff,&3f,&c7,&3f,&9f,&3f,&9f,&3f,&cf,&3f,&6f,&3f,&6f 
defb &3f,&6f,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf 
defb &3f,&cf,&3f,&cf,&6b,&cf,&6b,&cf,&15,&c7,&00,&c3,&00,&15,&00,&00 
defb &0f,&0f,&4c,&0f,&4c,&cc,&cc,&8d,&cc,&88,&8d,&ff,&0d,&af,&5d,&af 
defb &55,&af,&ff,&4e,&c3,&cf,&6f,&9f,&cf,&6f,&cf,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&cf,&9f,&3f,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cb,&cf,&c3,&cb,&c3,&c3,&c3,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&8d,&ff,&ff,&ff,&af,&0f,&0f,&cc,&4e,&4c,&cc,&af 
defb &8c,&af,&8c,&0a,&3f,&3f,&9f,&cb,&9f,&cb,&cf,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&3f,&9f,&97,&3f,&9f,&3f,&2a,&3f,&2a,&3f,&9f,&6f,&c3 
defb &cf,&cb,&cb,&c3,&c3,&c3,&97,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&0f,&cc,&4e,&8c,&cc,&4c,&0c,&cc,&4c,&cc,&0f,&4e 
defb &0f,&ee,&00,&05,&00,&15,&c3,&c3,&c3,&c3,&9f,&3f,&cf,&3f,&cf,&3f 
defb &3f,&6f,&3f,&cf,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&5f,&0f,&5f,&0c,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc 
defb &cc,&cc,&4e,&8c,&c3,&3f,&c3,&c7,&c3,&c7,&3f,&cf,&3f,&cf,&cf,&cf 
defb &cf,&c3,&c3,&97,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&08,&00,&cc,&00,&cc,&08,&cc,&cc,&8c,&0c 
defb &0c,&4c,&0c,&4c,&3f,&cf,&cf,&cb,&cf,&c3,&cf,&97,&cb,&97,&c3,&97 
defb &97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&15,&3f,&15,&3f,&15,&3f,&3f,&3f 
defb &97,&3f,&3f,&6b,&3f,&c3,&3f,&c3,&c3,&c3,&c3,&c7,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&0a,&00 
defb &8d,&00,&cc,&aa,&c3,&3f,&c3,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&c3,&3f,&c3 
defb &6b,&c7,&c3,&cf,&c3,&cf,&c7,&cf,&cf,&cf,&cf,&cf,&3f,&6f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&3f,&00,&3f,&2a,&3f,&6b,&3f,&9f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&6b,&3f,&c3,&3f,&c7,&3f,&c7,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cf,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&45,&00,&cf,&45,&cb,&6f,&cb,&6b,&c3,&3f,&c3 
defb &3f,&c7,&3f,&c7,&3f,&cf,&3f,&9f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6f 
defb &3f,&9f,&3f,&3f,&3f,&3f,&3f,&6b,&6b,&c7,&15,&c7,&00,&c3,&00,&15 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc 
defb &44,&cc,&cc,&0f,&cb,&c3,&cb,&c3,&c3,&c7,&c3,&c7,&c3,&9f,&cf,&3f 
defb &cf,&3f,&9f,&6b,&9f,&6b,&3f,&3f,&9f,&3f,&9f,&6b,&97,&c3,&3f,&c7 
defb &3f,&c7,&6b,&cf,&c7,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&97,&3f 
defb &00,&00,&00,&00,&00,&44,&00,&cc,&44,&cc,&cc,&0f,&8d,&af,&8d,&0f 
defb &0f,&4e,&0f,&4e,&c3,&cf,&cf,&cf,&cf,&9f,&3f,&9f,&3f,&3f,&3f,&9f 
defb &3f,&2a,&97,&2a,&97,&2a,&97,&2a,&97,&2a,&9f,&2a,&9f,&2a,&3f,&9f 
defb &cf,&cb,&cf,&cb,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f 
defb &00,&00,&0f,&0f,&8d,&0f,&0f,&0f,&0f,&0f,&0f,&4e,&0f,&cc,&cc,&cc 
defb &cc,&0c,&0c,&4c,&9f,&3f,&9f,&3f,&3f,&2a,&3f,&00,&2a,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&cc,&8c,&cc,&0c,&cc,&0c,&8c,&0c,&0c,&cc 
defb &0c,&cc,&aa,&00,&3f,&3f,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&cf,&cf,&cf,&cf,&cf,&c3,&cf,&c3,&c3,&97,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&0c,&4c,&4c,&cc,&dd,&55,&5f,&af,&dd,&4e 
defb &5f,&4e,&00,&00,&3f,&3f,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&cf,&c3,&cb,&97,&c3,&97,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&0f,&5f,&0f,&5f,&dd,&0f,&55,&4e,&af,&cc,&cc,&8c,&0c,&0c 
defb &8c,&cc,&00,&00,&3f,&3f,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6f,&3f,&cf 
defb &00,&00,&00,&00,&00,&00,&00,&00,&dd,&00,&0c,&8d,&4c,&0c,&cc,&0c 
defb &8c,&0c,&55,&8c,&3f,&3f,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&cf,&3f,&cf,&6b,&cb,&6f,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&af,&0f,&af,&0f,&af,&0c,&ff,&0c,&ff,&0c,&ff,&0c,&ff,&cc 
defb &ff,&cc,&ff,&8d,&3f,&c3,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&6b,&3f,&c3,&3f,&c3,&3f,&c3,&3f,&c7,&3f,&cf,&3f,&c7,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&0c,&cc,&4c,&cc,&cc,&8d,&cc,&8d,&cc,&0f 
defb &cc,&0f,&0f,&ff,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&c3,&6b,&c3,&6b,&c3 
defb &c3,&c7,&c7,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&cc,&0f,&cc,&0f,&0f,&ff,&5f,&ff,&5f,&ff 
defb &ff,&00,&af,&aa,&3f,&82,&3f,&2a,&3f,&2a,&3f,&2a,&3f,&2a,&3f,&2a 
defb &3f,&2a,&97,&2a,&97,&2a,&97,&2a,&97,&2a,&97,&2a,&9f,&2a,&9f,&3f 
defb &cf,&cb,&cf,&c3,&3f,&3f,&3f,&6b,&9f,&c7,&97,&c7,&3f,&c7,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&5f,&ff,&ff,&00,&aa,&00,&aa,&00,&00,&00 
defb &00,&00,&00,&55,&00,&15,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f 
defb &00,&00,&0f,&5f,&0f,&ff,&aa,&00,&00,&00,&00,&00,&00,&55,&55,&ff 
defb &ff,&af,&ff,&0f,&97,&c3,&c3,&c3,&41,&c7,&00,&c3,&00,&41,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&97,&c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&55,&00,&ff,&aa,&af,&0f 
defb &0f,&cc,&4e,&cc,&c7,&cf,&cf,&3f,&9f,&6b,&9f,&6f,&97,&9f,&c3,&3f 
defb &15,&97,&00,&6b,&00,&6b,&00,&3f,&00,&3f,&00,&3f,&00,&6b,&15,&6f 
defb &3f,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0a,&00,&8d,&00,&9f,&3f,&3f,&3f,&3f,&6b,&3f,&6b,&3f,&c7,&6b,&9f 
defb &c7,&3f,&9f,&6f,&9f,&cf,&9f,&cf,&9f,&cf,&6f,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&6f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&2a,&00,&3f,&00,&97,&2a,&cf,&c3,&6f,&3f,&6f,&3f 
defb &cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&3f,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cf,&8a,&cf,&00,&8a,&00 
defb &00,&00,&00,&00,&00,&44,&00,&cc,&05,&0c,&05,&4c,&ff,&4c,&ff,&4c 
defb &ff,&cc,&ff,&cc,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&6f 
defb &3f,&3f,&3f,&9f,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cb,&3f,&c3,&3f,&97 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&15,&97,&00,&c3,&00,&15 
defb &00,&00,&0f,&0f,&4c,&0f,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc 
defb &cc,&cc,&cc,&cc,&cf,&9f,&cf,&9f,&cf,&3f,&cf,&3f,&9f,&cf,&6f,&cf 
defb &6f,&cf,&cf,&cb,&cf,&cb,&c3,&97,&c3,&3f,&c3,&3f,&97,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&8c,&cc,&4c 
defb &8c,&0a,&0c,&88,&3f,&2a,&3f,&3f,&3f,&cb,&cf,&c3,&cf,&c3,&cf,&c3 
defb &c3,&97,&c3,&3f,&97,&3f,&3f,&3f,&3f,&3f,&6f,&9f,&3f,&2a,&3f,&3f 
defb &6f,&cb,&3f,&6b,&3f,&3f,&3f,&3f,&6b,&c3,&6b,&c3,&3f,&c3,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&cc,&0c,&8c,&0c,&0c,&0c,&0c,&cc,&cc,&cc 
defb &00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&6b,&c3,&c3,&c7,&c7,&cf,&cf,&cf,&c7,&cf,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&4c,&cc,&4c,&cc,&cc,&cc,&8d,&0f,&0f,&0f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&c3,&2a,&c3,&97,&3f,&cf,&3f,&cf 
defb &3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&97,&3f,&2a,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f 
defb &00,&00,&0f,&5f,&0f,&5f,&8d,&5f,&0f,&ff,&0f,&ff,&0f,&aa,&ff,&aa 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&cf,&3f,&cb,&3f,&cf,&6b,&cb,&6b,&3f,&c7,&3f,&6f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&aa,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&c3,&c3,&c3,&6b,&c7,&c7,&cf,&cf,&cf,&cf,&8a,&cf,&00,&8a,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &c3,&97,&cf,&82,&cf,&00,&8a,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&54,&00,&44,&00,&cc,&44,&cc,&ee,&4c,&3c,&cc,&ff,&cc 
defb &ff,&0c,&ff,&27,&6a,&b7,&3f,&6a,&3f,&6a,&3f,&6a,&3f,&c1,&3f,&c1 
defb &6a,&92,&6a,&35,&3f,&c5,&6a,&cf,&6a,&cf,&6a,&cf,&6a,&cf,&6a,&9a 
defb &6a,&cf,&6a,&cf,&6a,&cf,&c1,&cf,&c1,&cf,&40,&c7,&50,&c3,&00,&15 
defb &00,&00,&0f,&0f,&5d,&0f,&4c,&cc,&cc,&0c,&8c,&0c,&8c,&be,&27,&ff 
defb &fd,&2d,&be,&6c,&c1,&9a,&c7,&60,&92,&c5,&92,&c5,&60,&cf,&60,&cf 
defb &6a,&cf,&c5,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9a,&3f,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cf,&cb,&c3,&b7,&3f,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&0c,&4c,&4c,&dc,&cc,&fd,&fd,&be,&ff,&2d 
defb &0f,&5f,&dd,&28,&6a,&a2,&60,&70,&60,&cb,&cf,&cb,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&35,&cf,&35,&9a,&6a,&60,&b7,&60,&35,&3f,&a0,&3f,&a0 
defb &cf,&20,&cf,&20,&cf,&20,&c7,&20,&c7,&20,&c7,&20,&c5,&20,&6a,&a2 
defb &00,&00,&0f,&0f,&0f,&0f,&be,&1e,&be,&6c,&3c,&cc,&6c,&0c,&6c,&8c 
defb &00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&9a,&6a,&9a,&3f 
defb &9a,&6a,&6a,&cf,&c5,&cf,&cf,&cb,&3f,&3f,&3f,&3f,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&0f,&0f,&0f,&0f,&cc,&8c,&8c,&cc,&4c,&cc,&cc,&cc,&cc,&cc 
defb &00,&00,&00,&00,&00,&00,&00,&00,&d3,&2a,&c3,&d3,&9a,&7a,&90,&7a 
defb &9a,&7a,&9a,&7a,&9a,&7a,&c3,&70,&3f,&d1,&3f,&a0,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&0f,&5e,&0f,&5f,&4c,&cc,&cc,&cc,&cc,&cc,&cc,&8c,&0c,&0c 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&88,&00,&4c,&00,&19,&28,&dd,&5f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&44,&50,&cf,&e5,&cb,&c5,&cb,&c1,&c7,&6a,&cf,&6a,&cf 
defb &6a,&cf,&6a,&db,&6a,&b7,&3f,&3f,&3f,&3f,&3f,&6a,&3f,&6a,&6a,&c3 
defb &6a,&c7,&6a,&cf,&c1,&cf,&c1,&cf,&40,&c7,&50,&c3,&00,&40,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&dd 
defb &dd,&1e,&af,&6c,&cb,&c7,&c3,&cf,&cf,&cf,&9a,&3f,&9a,&6a,&35,&6a 
defb &cb,&db,&3f,&6a,&3f,&c1,&6a,&c7,&c1,&9a,&c7,&cf,&92,&c5,&60,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&b7,&3f,&3f,&3f 
defb &00,&54,&00,&44,&00,&cc,&44,&af,&cc,&3c,&af,&6c,&af,&6c,&1e,&cc 
defb &cc,&cc,&cc,&4c,&9a,&3f,&35,&d1,&60,&cb,&6a,&c3,&60,&b7,&60,&70 
defb &3f,&a0,&b7,&a0,&b7,&a0,&35,&a0,&3f,&a0,&35,&a0,&35,&7a,&9a,&c1 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &0f,&0f,&af,&0f,&af,&6c,&1e,&cc,&cc,&cc,&cc,&cc,&cc,&0c,&8c,&0c 
defb &8c,&af,&27,&0f,&6a,&d3,&c1,&a2,&d3,&00,&a2,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&cc,&0c,&0c,&4c,&0c,&cc,&0c,&cc,&4c,&dc,&36,&00 
defb &5f,&00,&28,&00,&00,&00,&00,&00,&00,&00,&00,&15,&00,&6a,&e1,&cb 
defb &15,&6a,&15,&c5,&15,&c5,&15,&3f,&15,&c1,&15,&3f,&00,&00,&c3,&b7 
defb &c3,&c3,&cf,&cf,&cf,&cb,&cf,&cb,&c3,&b7,&d3,&3f,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&0c,&cc,&5d,&7c,&dc,&ff,&fd,&2d,&ff,&3c,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c1,&c3,&e2,&35,&cf,&35 
defb &cf,&35,&9a,&3f,&9a,&6a,&6a,&cf,&cf,&cf,&c1,&cf,&6a,&c3,&6a,&d3 
defb &c3,&d3,&c3,&b7,&d3,&3f,&b7,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&1e,&0f,&1e,&ff,&2d,&be,&0f,&2d,&6c,&6c,&8c,&cc,&4c,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3,&3f,&c5,&6a,&cf 
defb &c5,&cf,&c5,&cf,&cf,&c3,&cf,&d3,&cf,&d3,&c3,&b7,&b7,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&c1,&3f,&c5,&3f,&7a 
defb &00,&00,&00,&00,&aa,&00,&28,&00,&5d,&1e,&cc,&0c,&8c,&0c,&fd,&8c 
defb &54,&fe,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&b7,&cf,&9a,&9a,&3f 
defb &db,&3f,&d3,&3f,&d3,&3f,&d1,&3f,&d1,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &6a,&9a,&6a,&9a,&6a,&9a,&c1,&db,&c5,&20,&9a,&00,&20,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&44,&00,&cc,&e5,&9a,&c5,&b7,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&c1,&6a,&c3,&6a,&c3,&6a,&c3 
defb &6a,&c7,&6a,&cf,&c1,&cf,&c1,&cf,&40,&c7,&50,&c3,&00,&40,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&cc,&dd,&5f 
defb &af,&ff,&dd,&aa,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6a 
defb &3f,&c1,&3f,&c1,&6a,&c3,&c1,&c3,&c3,&cf,&c7,&cf,&c7,&cf,&9a,&3f 
defb &cf,&db,&cf,&9a,&cf,&35,&9a,&3f,&9a,&6a,&9a,&6a,&b7,&3f,&3f,&3f 
defb &00,&06,&00,&8c,&44,&0c,&cc,&0c,&cc,&0c,&dd,&0c,&ff,&0c,&ff,&0c 
defb &01,&0c,&01,&0c,&3f,&7a,&3f,&3f,&3f,&c5,&c1,&cb,&c1,&c3,&c3,&c7 
defb &c3,&cf,&c7,&cf,&c7,&9a,&9a,&6a,&35,&d1,&9a,&90,&db,&7a,&3f,&7a 
defb &6a,&9a,&6a,&9a,&c1,&9a,&c1,&9a,&c7,&9a,&c7,&9a,&3f,&d1,&3f,&7a 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&a0,&00,&c3,&c3,&c3,&c3,&c7,&cf,&cf,&9a 
defb &35,&3f,&35,&c5,&3f,&c5,&c3,&92,&3f,&3f,&3f,&3f,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&c3,&d3,&c3,&c3,&9a,&6a,&90,&6a 
defb &3f,&c1,&35,&c1,&35,&c1,&3f,&c1,&3f,&3f,&3f,&3f,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &14,&0f,&14,&0f,&55,&2d,&55,&3c,&55,&ee,&55,&ee,&55,&ee,&55,&ee 
defb &55,&ee,&55,&ae,&15,&c5,&15,&3f,&3f,&3f,&c3,&c3,&c3,&9a,&c7,&60 
defb &9a,&c5,&60,&cf,&60,&cf,&60,&cf,&6a,&c7,&3f,&c5,&15,&c5,&15,&c5 
defb &15,&c5,&15,&c5,&15,&c5,&15,&c5,&15,&c5,&15,&c1,&15,&3f,&15,&3f 
defb &0f,&5e,&0f,&5f,&6c,&cc,&cc,&cc,&cc,&8c,&8c,&0c,&0c,&8c,&4c,&cc 
defb &4c,&dc,&cc,&fd,&35,&6a,&3f,&c1,&c1,&92,&cf,&35,&6a,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9a,&3f,&9a,&6a 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cb,&c7,&3f,&c5,&3f,&7a 
defb &00,&00,&00,&00,&00,&00,&88,&00,&4c,&00,&cc,&00,&88,&00,&fd,&00 
defb &ff,&00,&ff,&00,&d3,&7a,&9a,&7a,&90,&7a,&3f,&7a,&9a,&7a,&9a,&7a 
defb &9a,&7a,&9a,&7a,&9a,&7a,&35,&7a,&35,&7a,&9a,&7a,&90,&7a,&9a,&7a 
defb &db,&7a,&db,&7a,&db,&7a,&cf,&70,&c7,&20,&9a,&00,&20,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&2d,&00,&2d,&00,&3c,&00,&ff,&00,&ff,&00,&ff,&00,&ff 
defb &00,&be,&00,&be,&00,&6a,&00,&6a,&00,&3f,&00,&3f,&00,&3f,&00,&3f 
defb &00,&3f,&00,&3f,&00,&3f,&00,&3f,&00,&3f,&00,&3f,&00,&6a,&00,&6a 
defb &00,&6a,&00,&6a,&00,&6a,&00,&6a,&00,&6a,&00,&6a,&00,&6a,&00,&3f 
defb &00,&00,&0f,&0f,&0f,&0f,&8c,&5d,&0c,&4c,&0c,&cc,&cc,&dd,&cc,&af 
defb &0f,&0f,&0f,&0f,&b7,&3f,&b7,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&6a,&3f,&6a,&3f,&c1,&6a,&c3,&c3,&c7,&c3,&cf 
defb &c3,&cf,&c7,&cf,&cf,&cf,&cf,&cf,&cf,&9a,&cf,&35,&cf,&60,&3f,&6a 
defb &00,&00,&a8,&00,&aa,&00,&28,&00,&be,&00,&af,&1e,&0f,&6c,&1e,&2c 
defb &ff,&ae,&ff,&ae,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6a,&b7 
defb &6a,&b7,&c1,&b7,&c3,&35,&c3,&35,&c3,&35,&c7,&35,&9a,&3f,&cf,&35 
defb &cf,&c7,&35,&c5,&b7,&c5,&35,&c5,&6a,&c7,&c1,&9a,&c7,&20,&9a,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&28,&00,&08,&00,&08,&00 
defb &08,&00,&08,&00,&a0,&00,&a0,&00,&a0,&00,&a0,&00,&a0,&00,&a0,&00 
defb &a0,&00,&a0,&00,&a0,&00,&a0,&00,&a0,&00,&a0,&00,&a0,&00,&a0,&00 
defb &20,&00,&20,&00,&20,&00,&20,&00,&a2,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &aa,&00,&aa,&00,&3f,&7a,&6a,&b7,&6a,&35,&3f,&3f,&3f,&c1,&6a,&c7 
defb &6a,&35,&6a,&60,&6a,&60,&6a,&60,&3f,&c5,&6a,&cf,&6a,&cf,&6a,&cf 
defb &6a,&cf,&6a,&cf,&c1,&cf,&c1,&cf,&40,&c7,&50,&c3,&00,&e1,&00,&00 
defb &00,&ad,&00,&a5,&00,&50,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&a0,&00,&7a,&00,&3f,&a0,&d3,&7a,&60,&35 
defb &6a,&35,&cf,&9a,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9a,&9a,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&c3,&b7,&3f,&3f,&3f 
defb &0f,&0f,&6c,&af,&0f,&ff,&a5,&5f,&50,&1e,&00,&a5,&00,&50,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&a0,&00 
defb &7a,&00,&c1,&a2,&35,&a0,&35,&a0,&35,&a0,&35,&a0,&6a,&70,&6a,&cb 
defb &cf,&cb,&cf,&c3,&cf,&c3,&cb,&b7,&cb,&b7,&d3,&3f,&3f,&3f,&3f,&3f 
defb &0f,&0f,&2d,&be,&fe,&2d,&be,&1e,&cc,&4c,&2c,&cc,&1e,&4c,&a5,&6c 
defb &50,&1e,&00,&a5,&00,&50,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&d3,&3f,&b7,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&28,&0f,&5f,&6c,&4c,&cc,&4c,&0c,&cc,&cc,&cc,&cc,&cc,&cc,&cc 
defb &cc,&cc,&6c,&cc,&c3,&35,&e1,&b7,&50,&c3,&00,&e1,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&d3,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&08,&00,&cc,&00,&cc,&08,&cc,&cc,&cc,&8c 
defb &cc,&8c,&8c,&0c,&3f,&6a,&3f,&c5,&cf,&cf,&c7,&cb,&c1,&c3,&15,&3f 
defb &15,&3f,&15,&3f,&15,&3f,&15,&3f,&15,&3f,&15,&3f,&15,&3f,&b7,&3f 
defb &3f,&3f,&3f,&6a,&3f,&6a,&3f,&c1,&3f,&c1,&3f,&c1,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&88,&00 
defb &36,&00,&dd,&28,&cf,&35,&cf,&d3,&cf,&d3,&d3,&3f,&b7,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6a,&6a,&c3 
defb &c1,&c3,&c3,&c7,&c3,&c7,&c3,&cf,&c7,&cf,&c7,&cf,&3f,&c5,&3f,&7a 
defb &00,&01,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&7a,&00,&3f,&a0,&3f,&d1,&6a,&35,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&d1,&3f,&d1,&3f,&d1,&3f,&d3,&3f,&92,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&20,&9a,&00,&20,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&44,&00,&cc,&45,&9f,&6f,&6b,&3f,&c3,&3f,&c3,&3f,&c3,&3f,&c7 
defb &3f,&cf,&3f,&cf,&3f,&9f,&3f,&9f,&3f,&9f,&3f,&6b,&3f,&3f,&3f,&6b 
defb &3f,&c7,&3f,&cf,&6b,&cf,&6b,&cf,&15,&c7,&00,&c3,&00,&15,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&dd,&cc,&af 
defb &dd,&ff,&ff,&0f,&6b,&c3,&6b,&c7,&c3,&cf,&c7,&cf,&cf,&9f,&9f,&3f 
defb &9f,&6f,&9f,&6f,&3f,&cf,&3f,&9f,&6f,&3f,&6b,&3f,&c3,&c7,&cf,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&97,&3f,&3f,&3f 
defb &00,&55,&00,&8c,&44,&0c,&cc,&0c,&cc,&0c,&af,&0c,&0f,&0c,&0f,&0c 
defb &0f,&0c,&4e,&0c,&c7,&9f,&cf,&9f,&cf,&3f,&9f,&cf,&3f,&3f,&3f,&3f 
defb &3f,&6b,&9f,&6b,&3f,&6b,&3f,&c7,&6b,&cf,&c7,&9f,&cf,&3f,&3f,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&cf,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&ee,&8d,&4c,&0d,&8c,&dd 
defb &0c,&dd,&0c,&ff,&3f,&3f,&3f,&3f,&9f,&6b,&3f,&6b,&3f,&97,&c3,&c3 
defb &cf,&6f,&9f,&cf,&9f,&cf,&3f,&cf,&3f,&cf,&6f,&cf,&cf,&cf,&6f,&cf 
defb &cf,&cf,&c3,&cf,&6b,&c7,&00,&c3,&00,&41,&00,&00,&00,&00,&00,&00 
defb &00,&af,&44,&8d,&8c,&0c,&8d,&cc,&5f,&0f,&ff,&4e,&af,&4e,&af,&cc 
defb &af,&8c,&af,&8c,&6b,&cf,&c7,&97,&cf,&3f,&97,&2a,&3f,&00,&2a,&00 
defb &9f,&00,&cf,&00,&cf,&8a,&cf,&cf,&cf,&cf,&cf,&3f,&cf,&3f,&cf,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&c3,&c7,&c3,&c3,&97,&15,&3f,&00,&3f 
defb &0f,&0f,&0f,&0f,&4c,&ff,&88,&ff,&ff,&af,&8d,&4e,&0c,&8d,&4c,&88 
defb &cc,&00,&88,&00,&3f,&00,&2a,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&8a,&00,&cf,&00,&6f,&8a,&9f,&cf 
defb &cf,&cf,&cb,&c3,&cb,&c3,&c3,&97,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&4e,&cc,&4e,&88,&8d,&00,&88,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &8a,&00,&cf,&00,&c7,&8a,&3f,&cf,&3f,&6f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&00,&5f,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&8a,&00,&cf,&00,&6f,&00,&3f,&00 
defb &00,&00,&ff,&00,&af,&0a,&ff,&0f,&ff,&8d,&ff,&cc,&ff,&cc,&ff,&cc 
defb &ff,&cc,&ff,&0f,&3f,&c3,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b 
defb &3f,&c3,&3f,&c3,&3f,&c7,&6b,&cf,&15,&c7,&00,&c3,&00,&15,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&0a,&00,&0f,&00,&8d,&0a,&0f,&0f 
defb &5f,&af,&5f,&ff,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&6b,&3f,&6b,&6b,&c3,&6b,&c3,&6b,&c3,&c3,&cf 
defb &c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&cf,&3f,&97,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &aa,&00,&0f,&00,&9f,&00,&3f,&00,&3f,&00,&3f,&00,&3f,&00,&3f,&00 
defb &3f,&00,&3f,&00,&3f,&00,&3f,&00,&3f,&00,&cb,&00,&97,&2a,&97,&3f 
defb &cf,&3f,&cf,&3f,&cf,&3f,&9f,&3f,&3f,&6b,&3f,&c3,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&6b,&cf,&c7,&cf,&c7,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&15,&6b,&15,&6b,&15,&3f,&15,&c7,&6b,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&6f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&c3,&97,&c3,&cb,&9f,&3f,&3f,&3f,&3f,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cf,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&44,&00,&cc,&45,&cf,&3f,&cf,&6b,&cf,&3f,&cf,&3f,&cf,&3f,&3f 
defb &3f,&3f,&3f,&6f,&3f,&cf,&3f,&cf,&3f,&c3,&3f,&c3,&3f,&97,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&15,&97,&00,&c3,&00,&15,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&cc,&cc,&cc 
defb &cc,&cc,&cc,&cc,&cf,&9f,&cf,&3f,&9f,&3f,&9f,&6f,&3f,&6f,&3f,&cf 
defb &cf,&cf,&cf,&cb,&cf,&c3,&c3,&3f,&c3,&3f,&97,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&5f,&44,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&8c,&cc,&0c 
defb &cc,&0c,&8c,&0c,&3f,&6f,&6f,&cf,&cf,&cb,&cf,&cb,&cf,&6f,&c7,&6f 
defb &c3,&3f,&c3,&3f,&c3,&3f,&6b,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&cf,&3f,&cf,&3f,&cf,&6b,&cf,&6b,&cf,&3f,&cf,&3f,&6b,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&88,&00,&cc,&00,&8c,&88,&0c,&0d,&4c,&cc 
defb &cc,&8d,&cc,&8d,&cf,&c3,&cf,&c3,&c3,&c3,&97,&3f,&97,&3f,&c3,&3f 
defb &6b,&97,&00,&c3,&00,&41,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&44,&00,&cc,&44,&8c,&ee,&cc,&ee,&8d,&4e,&0f 
defb &0f,&0f,&5f,&ff,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6f 
defb &3f,&cf,&6f,&8a,&c3,&00,&2a,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &55,&0f,&8d,&0f,&4c,&0f,&8d,&5f,&8d,&5f,&0f,&5f,&5f,&ff,&ff,&ff 
defb &ff,&aa,&aa,&00,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&cb,&3f,&9f,&3f 
defb &3f,&6b,&15,&6b,&15,&6f,&15,&6f,&15,&6f,&15,&6b,&15,&6f,&15,&6b 
defb &15,&3f,&15,&3f,&15,&3f,&15,&6f,&15,&6f,&15,&6f,&15,&3f,&15,&3f 
defb &0f,&0a,&0f,&5f,&5f,&ff,&ff,&ff,&ff,&aa,&aa,&00,&00,&00,&00,&00 
defb &00,&00,&00,&ff,&3f,&3f,&3f,&3f,&3f,&6b,&6b,&c3,&c3,&c3,&c3,&c7 
defb &c3,&cf,&cf,&cf,&cf,&cf,&cf,&97,&cf,&3f,&97,&6b,&97,&c3,&3f,&c7 
defb &3f,&c7,&6b,&cf,&c7,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&c7,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&8d,&55,&0c,&55,&0c 
defb &05,&0c,&af,&0c,&c3,&3f,&c7,&3f,&c7,&3f,&cf,&3f,&cf,&3f,&cf,&3f 
defb &9f,&3f,&3f,&3f,&cb,&3f,&6b,&3f,&c3,&3f,&c7,&3f,&9f,&3f,&3f,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cf,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&44,&00,&cc,&45,&9f,&3f,&cf,&6b,&9f,&3f,&3f,&3f,&3f,&3f,&6b 
defb &3f,&c7,&3f,&cf,&3f,&9f,&3f,&6f,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf 
defb &3f,&cf,&3f,&cf,&3f,&cf,&6b,&cf,&15,&c7,&00,&c3,&00,&15,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&8d,&cc,&0a 
defb &cc,&55,&0d,&af,&9f,&6b,&3f,&6b,&3f,&c7,&6b,&cf,&c7,&9f,&cf,&6f 
defb &9f,&cf,&6f,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&9f,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&cf,&c3,&cb,&97,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&8d,&44,&0c,&cc,&0c,&8d,&8d,&dd,&5f,&ff,&0f,&af,&4e 
defb &0f,&8c,&4e,&0c,&9f,&cf,&9f,&cf,&6f,&cf,&6f,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&9f,&cf,&6f,&9f,&3f,&9f,&3f,&3f,&3f,&3f,&3f,&cf,&3f 
defb &cf,&cf,&cf,&cf,&c7,&cf,&c3,&cf,&c3,&cf,&3f,&cf,&3f,&6b,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&88,&00 
defb &4c,&00,&cc,&88,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&cf,&3f,&cf,&3f 
defb &9f,&3f,&3f,&6f,&6f,&cf,&c7,&cb,&c3,&cb,&6b,&c3,&00,&c3,&00,&41 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&3f,&00,&3f,&2a,&cf,&3f,&3f,&9f,&6f,&cb,&cf,&cb 
defb &cf,&cb,&cf,&c3,&cf,&c3,&c3,&c3,&97,&3f,&3f,&3f,&3f,&3f,&97,&3f 
defb &c3,&3f,&41,&97,&00,&c3,&00,&41,&00,&00,&00,&00,&00,&00,&00,&00 
defb &55,&0f,&55,&0f,&55,&0e,&55,&ee,&55,&ae,&55,&ae,&55,&ae,&55,&ee 
defb &55,&ee,&55,&ee,&15,&6f,&15,&6f,&15,&6b,&3f,&6b,&3f,&6b,&97,&6b 
defb &97,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&6b,&6b,&c3,&c3,&c3,&c3,&c7,&41,&c3,&00,&3f,&00,&15 
defb &0f,&0a,&0f,&5f,&8c,&4c,&cc,&0c,&8c,&0c,&8c,&4c,&4c,&cc,&cc,&cc 
defb &cc,&cc,&cc,&0f,&c3,&97,&cb,&97,&c3,&97,&97,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&6b,&c3,&c3 
defb &c3,&c7,&c3,&cf,&c3,&cf,&97,&c7,&97,&6b,&3f,&6f,&3f,&6f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&88,&00,&8d,&0f,&cc,&8c,&cc,&0c,&8d,&0c 
defb &0f,&0c,&0f,&0c,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&6b,&3f,&c3,&3f,&c3,&3f,&c3,&3f,&c7,&3f,&c7,&3f 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cb,&c7,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&44,&00,&cc,&44,&8d,&ee,&aa,&ff,&00,&ff,&00,&ff,&00 
defb &ff,&00,&ff,&ff,&3f,&3f,&3f,&6b,&3f,&c3,&3f,&c3,&3f,&c7,&3f,&cf 
defb &3f,&9f,&3f,&9f,&6b,&9f,&6b,&9f,&15,&97,&00,&c3,&00,&41,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &af,&0f,&8d,&0f,&5f,&55,&00,&00,&00,&00,&00,&ff,&ff,&af,&ff,&0f 
defb &af,&0f,&af,&0f,&c3,&c7,&c7,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&9f,&3f 
defb &3f,&3f,&6f,&6f,&9f,&6b,&6b,&3f,&6b,&c3,&c7,&9f,&c7,&6f,&c3,&6f 
defb &41,&c7,&00,&c3,&00,&41,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&0f,&0f,&0f,&ff,&af,&ff,&0f,&ff,&0f,&af,&0f,&0f,&0f,&0f,&5f 
defb &8d,&aa,&cc,&0a,&9f,&2a,&9f,&2a,&9f,&2a,&3f,&2a,&3f,&2a,&9f,&2a 
defb &3f,&82,&97,&3f,&3f,&3f,&6b,&cb,&c7,&9f,&3f,&6f,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&c7,&cf,&c3,&cf,&41,&c7,&00,&c3,&00,&15,&00,&00 
defb &0f,&0f,&0f,&0f,&0f,&4e,&0f,&4e,&0f,&8c,&cc,&0c,&cc,&8c,&00,&00 
defb &00,&0f,&00,&af,&00,&41,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&2a,&00,&3f,&00,&9f,&2a,&cf,&3f,&cf,&9f,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&c3,&97,&3f,&3f,&3f 
defb &0f,&0a,&0f,&5f,&cc,&88,&0c,&dd,&0c,&4c,&0c,&8d,&8c,&88,&00,&0f 
defb &ff,&4e,&0f,&8c,&c3,&9f,&c3,&9f,&41,&97,&00,&c3,&00,&41,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&3f,&97,&c3,&c3 
defb &cf,&cf,&cf,&cb,&cf,&cb,&cf,&c3,&cb,&c3,&97,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&aa,&00,&ff,&00,&af,&0a,&0f,&cc,&4e,&0c 
defb &cc,&4c,&0c,&4c,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&6b,&6f 
defb &3f,&3f,&3f,&3f,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&c7,&6b,&c3,&c3,&c3 
defb &cb,&3f,&97,&3f,&97,&3f,&97,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&88,&00 
defb &cc,&00,&cc,&88,&cf,&9f,&cf,&cf,&cf,&cf,&cf,&9f,&cf,&6f,&3f,&6f 
defb &3f,&cf,&cf,&cf,&cf,&c3,&cf,&c3,&cb,&c3,&cb,&97,&c3,&97,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&3f,&00,&9f,&2a,&3f,&6b,&cf,&3f,&cf,&3f,&cf,&3f 
defb &cf,&3f,&cf,&3f,&c3,&3f,&6b,&3f,&6b,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&cf,&3f,&cf,&3f,&cf,&6b,&cb,&6f,&8a,&cf,&00,&82,&00,&00,&00 
defb &00,&00,&00,&44,&00,&cc,&44,&8c,&ee,&4c,&3c,&dd,&be,&0f,&be,&0f 
defb &be,&5f,&ff,&ff,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&6a,&3f,&c1,&3f,&c1,&6a,&c3,&6a,&c7,&6a,&cf 
defb &6a,&cf,&6a,&cf,&c1,&d3,&c1,&db,&40,&b7,&50,&d3,&00,&15,&00,&00 
defb &2d,&0f,&5d,&0f,&4c,&af,&cc,&af,&dd,&0f,&0f,&ff,&0f,&ff,&5f,&ff 
defb &ff,&ff,&ff,&aa,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6a,&3f,&c1 
defb &3f,&c1,&6a,&c3,&c3,&c7,&c3,&c7,&c3,&cf,&c7,&9a,&cf,&35,&cf,&cf 
defb &db,&6a,&35,&c1,&6a,&c3,&c1,&c7,&c1,&cf,&c1,&c7,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&0f,&ff,&5f,&ff,&5f,&ff,&ff,&aa,&aa,&00,&00,&00 
defb &54,&28,&cc,&08,&3f,&a0,&6a,&70,&c5,&c3,&c1,&c3,&c3,&c7,&c3,&c7 
defb &c3,&cf,&cf,&9a,&cf,&60,&cf,&b7,&60,&35,&3f,&a0,&3f,&a0,&b7,&a0 
defb &c7,&20,&c7,&20,&cf,&20,&cf,&20,&cf,&20,&cf,&20,&c5,&20,&3f,&2a 
defb &0f,&0f,&0f,&0f,&ff,&00,&00,&00,&00,&fd,&00,&fd,&00,&fd,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&cf,&9a,&cf,&35 
defb &9a,&6a,&3f,&c5,&35,&90,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&0f,&0f,&0f,&fd,&be,&fd,&2d,&be,&0f,&2d,&0f,&be,&0f,&00,&bc 
defb &00,&54,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&6a,&35,&6a,&35 
defb &9a,&3f,&35,&6a,&3f,&6a,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&5e,&0f,&1e,&0f,&0f,&0f,&7d,&1e,&cc,&1e,&8c,&6c,&0c,&2c,&0c 
defb &6c,&4c,&2d,&aa,&e1,&b7,&40,&c3,&c3,&c3,&c3,&c3,&c1,&92,&c1,&60 
defb &c1,&60,&92,&c5,&c7,&60,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&aa,&00,&28,&00,&cc,&00,&4c,&aa,&0c,&dd,&5d,&7c 
defb &4c,&ad,&ad,&1e,&c1,&cf,&92,&3f,&92,&c5,&35,&c5,&6a,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&6a,&c7,&3f,&7a,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&aa,&00 
defb &0f,&1e,&8c,&0c,&35,&7a,&3f,&7a,&9a,&3f,&9a,&3f,&9a,&3f,&9a,&3f 
defb &9a,&d1,&cf,&20,&9a,&00,&20,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&44,&50,&cf,&e1,&9a,&d1,&6a,&3f,&6a,&6a,&cf,&6a,&cf 
defb &6a,&cf,&6a,&cf,&6a,&c3,&6a,&d3,&3f,&d1,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&40,&b7,&50,&c3,&00,&15,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&cc 
defb &cc,&0c,&8c,&0c,&35,&c5,&c5,&cf,&cf,&cf,&cf,&cf,&cf,&c3,&c3,&e2 
defb &cb,&b7,&c3,&b7,&b7,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&6a,&c3,&6a,&c3,&c1,&c3,&c3,&c3,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&44,&00,&cc,&44,&cc,&cc,&0c,&8c,&0c,&8c,&4c,&0c,&4c 
defb &4c,&dd,&cc,&af,&cf,&c3,&cb,&b7,&cb,&c3,&c3,&c3,&c3,&d3,&c7,&a2 
defb &6a,&20,&3f,&a0,&3f,&a0,&3f,&a0,&3f,&a0,&3f,&7a,&6a,&cb,&c5,&c3 
defb &c1,&c3,&c1,&c3,&c3,&c7,&c7,&cf,&cf,&cf,&c7,&cf,&3f,&3f,&3f,&3f 
defb &2d,&0f,&af,&0f,&0c,&cc,&0c,&4c,&0c,&dd,&cc,&af,&cc,&af,&dd,&0f 
defb &0f,&0f,&0f,&2d,&e2,&d3,&c1,&a2,&d3,&00,&a2,&00,&00,&00,&00,&00 
defb &00,&00,&00,&40,&00,&40,&00,&15,&00,&15,&00,&15,&d3,&3f,&c3,&c3 
defb &cf,&cf,&cf,&db,&cf,&35,&db,&6a,&db,&c1,&35,&6a,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&cc,&af,&dd,&5f,&0f,&ff,&0f,&ff,&5f,&ff,&5f,&ff 
defb &5f,&00,&aa,&54,&00,&50,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&40,&c3,&c3,&c3,&c3,&c5,&cf,&c5,&9a,&c5,&9a,&90,&3f,&92,&3f 
defb &9a,&3f,&3f,&6a,&c1,&c3,&c3,&cf,&c7,&cf,&c7,&cf,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&ff,&ff,&ff,&ff,&ff,&00,&aa,&00,&00,&00,&00,&00 
defb &00,&fd,&2d,&be,&e2,&c3,&6a,&c3,&6a,&c3,&6a,&cb,&6a,&cf,&6a,&cf 
defb &60,&cf,&e2,&9a,&92,&3f,&35,&3f,&6a,&60,&90,&6a,&6a,&b7,&6a,&c3 
defb &c1,&cf,&c7,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &0f,&28,&0f,&ff,&ff,&00,&00,&54,&00,&fd,&fd,&be,&fd,&2d,&fd,&2d 
defb &be,&0f,&0f,&1e,&c3,&c3,&c7,&cf,&c7,&35,&cf,&35,&9a,&3f,&9a,&3f 
defb &35,&6a,&6a,&9a,&c5,&35,&90,&3f,&35,&6a,&b7,&c1,&6a,&c7,&c3,&9a 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&aa,&00,&ff,&2d,&1e,&8c,&1e,&0c,&6c,&0c 
defb &6c,&0c,&cc,&0c,&9a,&3f,&9a,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&d1,&3f 
defb &db,&3f,&3f,&3f,&d1,&3f,&d1,&3f,&92,&3f,&9a,&3f,&35,&3f,&90,&3f 
defb &cf,&9a,&cf,&9a,&cf,&9a,&cf,&9a,&cf,&9a,&cf,&9a,&6a,&9a,&3f,&3f 
defb &00,&00,&00,&44,&00,&cc,&44,&8c,&ee,&dd,&ff,&ff,&ff,&be,&ff,&3c 
defb &ff,&3c,&ff,&3c,&6a,&92,&6a,&9a,&6a,&35,&3f,&c5,&6a,&cf,&6a,&cf 
defb &6a,&cf,&6a,&cf,&6a,&cf,&6a,&9a,&6a,&35,&3f,&3f,&3f,&3f,&6a,&60 
defb &6a,&cf,&6a,&cf,&c1,&cf,&c1,&d3,&40,&c3,&50,&d3,&00,&15,&00,&00 
defb &2d,&0f,&5d,&0f,&4c,&8c,&fe,&7d,&fd,&2d,&be,&6c,&6c,&8c,&8c,&4c 
defb &cc,&cc,&cc,&cc,&6a,&cf,&c5,&cf,&c5,&cf,&cf,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&9a,&9a,&3f,&3f,&6a,&6a,&cf,&c5,&cf,&c5,&cf,&cf,&cb 
defb &cf,&cb,&c3,&c3,&d3,&6a,&3f,&3f,&b7,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&dd,&3c,&1e,&6c,&1e,&cc,&0c,&0c,&cc,&0c,&cc,&5d 
defb &dd,&28,&99,&28,&35,&a0,&60,&70,&60,&c3,&cf,&c3,&35,&6a,&9a,&6a 
defb &60,&cf,&c5,&cf,&c5,&cf,&cf,&cf,&cf,&cb,&cf,&c3,&c7,&db,&e2,&db 
defb &c7,&cb,&c7,&60,&c7,&20,&c5,&20,&c5,&20,&c5,&20,&6a,&a2,&3f,&a0 
defb &0f,&0f,&0f,&0f,&cc,&4c,&8c,&4c,&0c,&cc,&4c,&cc,&4c,&cc,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&cf,&cf,&cf,&cb 
defb &cb,&d3,&cf,&d3,&cb,&d3,&d3,&3f,&b7,&3f,&b7,&3f,&3f,&3f,&3f,&3f 
defb &b7,&3f,&d3,&3f,&e1,&b7,&50,&c3,&00,&e1,&00,&50,&00,&00,&00,&00 
defb &0f,&0f,&0f,&0f,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&8c,&0c,&0c,&00,&bc 
defb &00,&54,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&cb,&d3,&d3,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6a 
defb &3f,&6a,&3f,&c1,&c1,&c3,&c3,&c3,&c3,&c7,&c3,&c7,&15,&3f,&00,&3f 
defb &0f,&28,&0f,&5f,&0c,&4c,&8c,&19,&8c,&0c,&0c,&4c,&4c,&dd,&6c,&dd 
defb &3c,&af,&2d,&5f,&e1,&b7,&40,&d3,&c3,&d3,&c3,&b7,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&7a,&00,&3f,&a0,&b7,&7a 
defb &c3,&b7,&c7,&db,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&35,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&28,&00,&be,&00,&af,&aa,&0f,&5f,&0f,&ff 
defb &0f,&ff,&ff,&ff,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&c1,&6a,&c3,&6a,&c7,&3f,&c5,&3f,&7a,&00,&00,&00,&00,&00,&00 
defb &a0,&00,&7a,&00,&35,&a0,&9a,&7a,&cf,&35,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&aa,&00 
defb &fe,&2d,&44,&8c,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&d1,&3f,&d1,&3f 
defb &92,&d1,&c7,&20,&9a,&00,&20,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&a0,&00,&7a,&00,&3f,&a0,&3f,&a0 
defb &00,&00,&00,&44,&00,&dd,&44,&dd,&ee,&ff,&ff,&aa,&ff,&00,&ff,&00 
defb &ff,&54,&ff,&54,&3f,&3f,&3f,&3f,&3f,&6a,&6a,&c3,&6a,&c3,&6a,&c3 
defb &6a,&c7,&40,&c7,&50,&c3,&00,&15,&00,&00,&00,&00,&00,&00,&c1,&c3 
defb &c1,&c3,&6a,&c7,&6a,&cf,&40,&cf,&40,&cf,&50,&c3,&00,&40,&00,&00 
defb &2d,&0f,&af,&0f,&5f,&ff,&aa,&00,&00,&00,&00,&00,&00,&54,&54,&ff 
defb &ff,&2d,&be,&1e,&6a,&c3,&c1,&c3,&c3,&c7,&c7,&cf,&cf,&cf,&cf,&35 
defb &9a,&c5,&db,&c1,&b7,&6a,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&b7,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&54,&ff,&54,&be,&54,&be,&fd,&be,&be,&0f,&3c,&dd 
defb &6c,&08,&8c,&08,&35,&7a,&35,&c1,&35,&c5,&35,&3f,&35,&90,&c5,&92 
defb &b7,&d1,&c3,&c3,&c3,&cf,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&2d,&0f,&0f,&1e,&1e,&cc,&6c,&cc,&1e,&cc,&00,&00 
defb &00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&3f,&c1,&6a,&c3,&6a,&92 
defb &c1,&35,&c3,&60,&c7,&9a,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &0f,&28,&0f,&5f,&6c,&be,&cc,&8c,&cc,&8c,&0c,&0c,&8c,&8c,&00,&00 
defb &00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&c7,&35,&35,&6a,&6a,&cf 
defb &c5,&cf,&cf,&cf,&c5,&cf,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&c3,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&88,&00,&4c,&00,&0c,&88,&cc,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3,&c5,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&9a,&35,&3f,&6a,&b7,&3f,&c5,&15,&c5,&40,&c7,&c3,&cf 
defb &c7,&c3,&cf,&c3,&cb,&b7,&cb,&b7,&c3,&b7,&b7,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&c3,&f2,&c3,&b7,&cf,&9a,&cf,&60,&35,&3f 
defb &35,&6a,&3f,&c5,&3f,&c5,&6a,&cf,&cf,&cf,&cf,&c3,&cb,&b7,&cb,&b7 
defb &c3,&b7,&b7,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6a,&3f,&c5,&3f,&7a 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&a0,&00,&7a,&00,&35,&a0,&6a,&d3 
defb &9a,&7a,&9a,&7a,&9a,&7a,&db,&7a,&d3,&7a,&d3,&7a,&3f,&7a,&3f,&7a 
defb &6a,&9a,&6a,&9a,&6a,&9a,&6a,&db,&c5,&20,&9a,&00,&20,&00,&00,&00 
defb &00,&00,&00,&44,&00,&cc,&44,&cc,&06,&0c,&b4,&0c,&55,&8c,&55,&cc 
defb &55,&dd,&55,&dd,&40,&c3,&40,&c3,&40,&b7,&15,&3f,&15,&6a,&15,&c1 
defb &40,&d3,&e1,&a2,&15,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &2d,&0f,&5d,&0f,&8c,&cc,&0c,&cc,&4c,&dd,&4c,&dd,&cc,&af,&cc,&af 
defb &0f,&5f,&0f,&ff,&b7,&6a,&b7,&c1,&6a,&d3,&c1,&a2,&d3,&00,&a2,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&0f,&0f,&0f,&af,&0f,&dd,&0f,&0f,&5f,&5f,&ff,&0f,&ff,&5f,&ff 
defb &be,&5f,&2d,&ff,&d3,&3f,&a2,&15,&00,&15,&00,&15,&00,&15,&00,&15 
defb &00,&15,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15 
defb &00,&15,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15 
defb &0f,&0f,&0f,&0f,&2d,&ff,&ff,&00,&ff,&00,&aa,&00,&00,&00,&00,&00 
defb &aa,&54,&fe,&ff,&3f,&6a,&3f,&6a,&3f,&c1,&3f,&c1,&6a,&c7,&c1,&cf 
defb &c1,&cf,&c5,&9a,&c5,&9a,&90,&3f,&3f,&3f,&90,&c5,&3f,&3f,&3f,&6a 
defb &6a,&c3,&6a,&c7,&6a,&c7,&c1,&cf,&c5,&cf,&c5,&cf,&3f,&6a,&3f,&3f 
defb &0f,&0f,&0f,&0f,&00,&54,&00,&00,&00,&54,&54,&ff,&54,&be,&54,&be 
defb &ff,&2d,&ff,&2d,&c3,&c3,&c3,&c7,&c3,&9a,&c7,&35,&cf,&35,&cf,&35 
defb &35,&3f,&3f,&3f,&3f,&90,&6a,&35,&90,&d1,&c3,&b7,&c1,&d3,&c3,&35 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9a,&c7,&20,&7a,&00 
defb &0f,&0f,&0f,&0f,&ff,&ff,&fd,&be,&be,&0f,&2d,&1e,&0f,&6c,&0f,&6c 
defb &1e,&cc,&6c,&8c,&cf,&cf,&db,&3f,&90,&3f,&7a,&00,&7a,&00,&7a,&00 
defb &7a,&00,&7a,&00,&7a,&00,&7a,&00,&7a,&00,&7a,&00,&7a,&00,&7a,&00 
defb &9a,&00,&9a,&00,&9a,&00,&9a,&00,&20,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&28,&0f,&5f,&2d,&1e,&0f,&7d,&1e,&cc,&cc,&cc,&cc,&0c,&cc,&0c 
defb &8c,&0c,&0c,&4c,&cb,&b7,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&28,&00,&dd,&0f,&8c,&0c,&0c,&0c,&36,&0c 
defb &ff,&0c,&fd,&0c,&d1,&3f,&6a,&35,&3f,&3f,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&44,&00,&cc,&44,&8c,&ae,&4c,&af,&cc,&ff,&cc,&ff,&cc 
defb &ff,&cc,&ff,&cc,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&9f,&3f,&3f 
defb &3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&c7,&3f,&c3,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&15,&97,&00,&c3,&00,&15,&00,&00 
defb &af,&0f,&0d,&0f,&cc,&8c,&cc,&0c,&0c,&4c,&cc,&4c,&cc,&cc,&cc,&cc 
defb &cc,&cc,&cc,&cc,&cf,&9f,&cf,&9f,&3f,&3f,&3f,&6f,&3f,&cf,&6f,&cb 
defb &cf,&cb,&cf,&cb,&cb,&c3,&cb,&3f,&c3,&97,&c3,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&5f,&0f,&8d,&0c,&0c,&cc,&0c,&cc,&0c,&cc,&0c,&cc,&0c,&8c,&0c 
defb &0c,&0c,&0c,&0c,&3f,&3f,&6f,&3f,&cf,&3f,&cf,&3f,&cf,&3f,&c3,&3f 
defb &c3,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&cf,&3f,&6b,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&c3,&6b,&c3,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&2a,&00,&c3,&c3,&c3,&c3 
defb &6b,&c3,&6b,&c7,&6b,&cf,&c3,&cf,&c7,&cf,&c7,&cf,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3,&c3,&c3 
defb &c7,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&aa,&00,&aa,&00,&ff,&00,&ff,&aa,&ff,&aa,&ff,&00 
defb &ff,&00,&ff,&00,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b 
defb &3f,&6b,&3f,&c3,&3f,&c7,&3f,&cf,&3f,&9f,&6b,&9f,&c7,&9f,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&c3,&97,&3f,&c3,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&55,&00,&3f,&3f,&3f,&c3,&6b,&c3,&c3,&c7,&c3,&c7,&c3,&cf 
defb &c7,&9f,&cf,&cf,&cf,&97,&cf,&3f,&6f,&3f,&3f,&cb,&6f,&9f,&cf,&97 
defb &cf,&3f,&9f,&6b,&3f,&6b,&3f,&c3,&3f,&c7,&c3,&c7,&3f,&6f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&3f,&00,&97,&2a,&cb,&82,&cf,&8a,&cf,&2a,&9f,&2a 
defb &3f,&2a,&cb,&2a,&3f,&2a,&6b,&2a,&c7,&2a,&c7,&2a,&c7,&2a,&c7,&8a 
defb &c7,&8a,&cf,&8a,&cf,&8a,&cf,&8a,&cf,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&55,&00,&8c,&44,&8d,&cc,&4e,&cc,&cc,&4e,&cc,&ee,&8c,&ee,&0c 
defb &ee,&0c,&af,&0f,&3f,&3f,&3f,&6b,&3f,&c7,&6b,&cf,&6b,&9f,&6b,&9f 
defb &6f,&3f,&6f,&6f,&3f,&cf,&97,&cf,&97,&cf,&6b,&cf,&41,&c7,&00,&c3 
defb &00,&41,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&0f,&0f,&0f,&cc,&8c,&8c,&0c,&8c,&4c,&8c,&4c,&0c,&cc,&0c,&88 
defb &4c,&aa,&af,&ff,&c3,&c7,&cf,&3f,&9f,&cf,&6f,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&cf,&9f,&cf,&cf 
defb &c7,&cf,&c3,&cf,&41,&c7,&00,&c3,&00,&41,&00,&00,&00,&00,&00,&00 
defb &0f,&0a,&8c,&08,&0c,&08,&0c,&08,&0c,&08,&0c,&08,&0e,&08,&ae,&08 
defb &ae,&08,&0e,&08,&9f,&2a,&3f,&2a,&9f,&2a,&9f,&2a,&9f,&2a,&9f,&2a 
defb &9f,&2a,&9f,&2a,&9f,&82,&3f,&97,&3f,&9f,&3f,&cb,&6f,&cb,&cf,&cb 
defb &cf,&cb,&cb,&c3,&cb,&3f,&c3,&97,&c3,&3f,&c3,&3f,&15,&3f,&00,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&2a,&00,&3f,&00,&3f,&3f,&97,&3f 
defb &97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&55,&00,&55,&00,&55,&00,&55,&00,&55,&00,&55 
defb &00,&55,&00,&55,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15,&00,&15 
defb &00,&15,&00,&15,&00,&15,&00,&3f,&41,&97,&6b,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&6b,&3f,&6f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&00,&00,&aa,&00,&ee,&00,&ae,&88,&ae,&4c 
defb &ae,&4c,&ae,&4c,&6f,&cb,&6f,&c3,&6b,&c3,&6b,&97,&6b,&97,&6b,&97 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&6b,&3f,&6b,&3f,&cf,&c7,&cf,&c7,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0a,&00,&5f,&00,&c3,&3f,&c3,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&6f,&3f,&cf,&c3,&cf 
defb &6f,&8a,&cf,&00,&8a,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&2a,&00,&3f,&00,&3f,&00,&6f,&00,&3f,&00,&3f,&00 
defb &3f,&00,&3f,&00,&97,&00,&97,&00,&9f,&00,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&44,&00,&cc,&44,&dd,&ee,&ff,&ff,&aa,&ff,&00,&ff,&00 
defb &ff,&55,&ff,&ff,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&c3,&3f,&c3,&3f,&c7 
defb &3f,&cf,&3f,&cf,&3f,&9f,&6b,&9f,&6b,&cb,&15,&97,&00,&c3,&00,&41 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &af,&0f,&8d,&0f,&5f,&00,&00,&00,&00,&00,&00,&55,&00,&ff,&00,&ff 
defb &ff,&ff,&ff,&0f,&c3,&c3,&c3,&cf,&c7,&cf,&c7,&cf,&cf,&9f,&cf,&9f 
defb &3f,&6f,&3f,&3f,&3f,&3f,&6f,&3f,&97,&6b,&3f,&c3,&6b,&c7,&c7,&cf 
defb &c3,&cf,&41,&c7,&00,&c3,&00,&41,&00,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&5f,&0f,&8d,&ff,&8c,&55,&0c,&55,&0c,&ff,&0c,&af,&0c,&af,&0c 
defb &4e,&0c,&4e,&0c,&cf,&3f,&9f,&3f,&3f,&3f,&3f,&3f,&6b,&3f,&3f,&3f 
defb &3f,&3f,&3f,&9f,&6b,&cf,&c3,&9f,&c7,&3f,&9f,&6f,&9f,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&c7,&cf,&c3,&cf,&41,&c7,&00,&c3,&00,&15 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&45,&00,&cf,&6f,&cf 
defb &6f,&cf,&cf,&cf,&6f,&cf,&6f,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&8a,&cf,&00,&8a,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&82,&00,&9f,&00,&cf,&82,&cf,&c3 
defb &cf,&cb,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&9f,&3f,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cb,&3f,&c3,&00,&c3,&00,&41,&00,&00,&00,&00 
defb &55,&0f,&55,&0f,&55,&ff,&55,&ff,&55,&ff,&55,&af,&55,&ee,&55,&ae 
defb &55,&ee,&55,&ee,&15,&6f,&15,&6f,&15,&6f,&15,&6f,&15,&6f,&3f,&3f 
defb &3f,&3f,&cb,&97,&3f,&3f,&9f,&3f,&3f,&6f,&3f,&cf,&6f,&cf,&cf,&cf 
defb &cf,&c3,&c3,&c3,&c3,&3f,&c3,&3f,&97,&3f,&97,&3f,&3f,&3f,&15,&3f 
defb &0f,&0a,&0f,&5f,&af,&8d,&4e,&8c,&4e,&4c,&8c,&4c,&0c,&cc,&4c,&cc 
defb &cc,&cc,&cc,&cc,&cf,&cf,&cf,&cf,&cf,&9f,&cf,&9f,&cf,&9f,&9f,&3f 
defb &3f,&3f,&3f,&6f,&6f,&cb,&cf,&cb,&cf,&c3,&c3,&97,&c3,&3f,&c3,&3f 
defb &97,&3f,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&00,&00,&00,&08,&00,&8c,&aa,&cc,&0d,&cc,&0c,&cc,&0c 
defb &cc,&0c,&cc,&0c,&cf,&3f,&9f,&3f,&3f,&3f,&3f,&3f,&6f,&3f,&cf,&3f 
defb &cf,&3f,&cf,&3f,&c7,&3f,&c3,&3f,&6b,&3f,&6b,&3f,&3f,&3f,&3f,&cf 
defb &3f,&cf,&3f,&cf,&3f,&cf,&6b,&cb,&c7,&8a,&cf,&00,&82,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&cc 
defb &cc,&8d,&4c,&5f,&6b,&97,&41,&97,&00,&c3,&00,&41,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&15,&00,&3f,&15,&3f,&3f,&6b,&3f,&6b,&3f,&c3 
defb &6b,&c7,&6b,&cf,&6f,&cf,&6f,&cf,&6f,&cf,&6f,&cf,&3f,&3f,&3f,&3f 
defb &00,&00,&00,&44,&00,&cc,&44,&cc,&cc,&8d,&cc,&0f,&8d,&5f,&0f,&ff 
defb &0f,&ff,&ff,&ff,&3f,&3f,&3f,&3f,&3f,&3f,&97,&3f,&c3,&3f,&15,&3f 
defb &15,&3f,&3f,&6b,&6b,&c3,&6b,&c7,&c3,&c7,&c3,&cf,&c7,&9f,&cf,&cf 
defb &cf,&97,&cf,&3f,&cf,&3f,&cf,&cb,&cf,&9f,&cf,&3f,&3f,&3f,&3f,&3f 
defb &0a,&00,&88,&00,&dd,&00,&5f,&00,&5f,&aa,&5f,&aa,&ff,&00,&ff,&00 
defb &aa,&00,&00,&00,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&c3,&3f,&c3,&3f,&c7 
defb &c3,&c7,&c3,&cf,&cf,&cf,&cf,&3f,&cf,&3f,&9f,&3f,&3f,&6f,&cb,&97 
defb &3f,&3f,&3f,&6b,&c7,&cf,&c7,&cf,&c7,&cf,&c7,&8a,&cf,&00,&2a,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&55,&00,&55 
defb &55,&ff,&ff,&ff,&3f,&6b,&3f,&c7,&c3,&c7,&c3,&cf,&cf,&cf,&cf,&6f 
defb &cf,&3f,&9f,&3f,&9f,&3f,&6f,&3f,&3f,&3f,&3f,&6b,&3f,&c3,&6b,&c7 
defb &c3,&cf,&cf,&cf,&cf,&2a,&8a,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&44,&00,&cc,&44,&8d,&cc,&8d,&cc,&0f,&0f,&0f 
defb &0f,&4e,&0f,&cc,&c7,&cf,&cf,&cf,&cf,&3f,&9f,&3f,&9f,&3f,&6b,&97 
defb &3f,&6b,&3f,&c7,&6b,&cf,&c7,&9f,&c7,&6f,&c7,&6f,&9f,&6f,&cf,&cf 
defb &cf,&cf,&cf,&cf,&c7,&cf,&41,&cf,&00,&c7,&00,&41,&00,&00,&00,&00 
defb &55,&0f,&cc,&0f,&8d,&0f,&af,&0f,&0f,&0f,&0f,&cc,&4e,&cc,&cc,&cc 
defb &cc,&0c,&0c,&0c,&3f,&9f,&3f,&cf,&6f,&9f,&6f,&3f,&9f,&3f,&97,&6f 
defb &c3,&cb,&9f,&6f,&6f,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&c7,&8a,&41,&00 
defb &0f,&0f,&0f,&0f,&4e,&cc,&cc,&8c,&cc,&0c,&cc,&0c,&8c,&4c,&4c,&88 
defb &aa,&55,&55,&af,&3f,&c7,&3f,&cf,&6b,&cf,&6f,&8a,&cf,&00,&9f,&00 
defb &2a,&00,&3f,&00,&3f,&2a,&cf,&3f,&cf,&3f,&cf,&cf,&cf,&9f,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&8a,&cf,&00,&8a,&00,&00,&00,&00,&00,&00,&00 
defb &0f,&5f,&cc,&5d,&8c,&5d,&0c,&5d,&0e,&5d,&04,&5d,&04,&5d,&ae,&5d 
defb &ae,&5d,&8c,&5f,&cf,&15,&8a,&15,&00,&15,&00,&15,&00,&15,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&2a,&00,&3f,&00,&3f,&82,&cf,&00 
defb &8a,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&aa,&00,&ee,&00,&ee,&88,&ee,&cc,&ee,&cc,&ee,&cc 
defb &ee,&cc,&ee,&cc,&6f,&cf,&6f,&3f,&3f,&3f,&97,&3f,&c7,&3f,&6b,&cf 
defb &41,&c3,&00,&c3,&00,&41,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&88,&00,&8c,&00 
defb &cc,&88,&8c,&4c,&9f,&3f,&3f,&6f,&6f,&cf,&cf,&cb,&cb,&c3,&c3,&97 
defb &c3,&97,&c3,&3f,&97,&3f,&c3,&3f,&41,&97,&00,&c3,&00,&41,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&ff,&0f,&cb,&c3,&cb,&97,&cb,&97,&c3,&3f,&c3,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&97,&3f,&3f,&3f 
defb &15,&6b,&15,&6b,&15,&6f,&15,&6f,&15,&6b,&15,&3f,&15,&3f,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&0f,&0f,&c3,&c3,&97,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&3f,&3f,&3f,&3f,&6b,&3f,&c3,&3f,&c3,&6b,&c3,&6b,&c7,&c3,&cf 
defb &c7,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&cf,&3f,&6b,&3f,&2a,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&0f,&0f,&c3,&c3,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &3f,&6b,&c7,&3f,&97,&9f,&97,&2a,&97,&2a,&9f,&2a,&9f,&2a,&cf,&8a 
defb &cf,&8a,&c7,&8a,&c7,&82,&cf,&00,&8a,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&05,&00,&0f 
defb &05,&5f,&0f,&ff,&3f,&3f,&3f,&3f,&3f,&c3,&c3,&c3,&c3,&cf,&c7,&cf 
defb &c3,&cf,&3f,&3f,&3f,&3f,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&05,&00,&0f,&05,&5f,&0f,&ff,&5f,&af,&ff,&af 
defb &ff,&0f,&ff,&0f,&6b,&c7,&c7,&cf,&c7,&cf,&cf,&9f,&cf,&9f,&6f,&6f 
defb &cf,&6f,&3f,&cf,&3f,&2a,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &55,&08,&4e,&08,&4e,&08,&ae,&08,&0e,&08,&0e,&08,&0e,&08,&0e,&08 
defb &8c,&08,&8c,&08,&9f,&2a,&9f,&2a,&3f,&2a,&3f,&2a,&9f,&82,&cf,&00 
defb &8a,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&50 
defb &00,&e5,&50,&cf,&e5,&cf,&cf,&cf,&c5,&9a,&c7,&35,&c5,&35,&c5,&cf 
defb &c5,&cf,&c5,&cf,&c7,&cf,&c7,&cf,&c1,&c3,&e1,&d3,&00,&3f,&00,&15 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&44,&00,&cc,&44,&4c,&ff,&00 
defb &00,&00,&00,&00,&00,&00,&00,&50,&00,&e5,&50,&cf,&e5,&cf,&cf,&cf 
defb &cf,&cf,&cf,&cf,&cf,&35,&35,&3f,&3f,&3f,&3f,&c5,&6a,&cf,&cf,&cf 
defb &cf,&c3,&cf,&d3,&cf,&d3,&c3,&b7,&c3,&b7,&3f,&3f,&3f,&3f,&3f,&3f 
defb &00,&14,&00,&8c,&44,&cc,&cc,&4c,&8c,&4c,&0c,&cc,&8c,&cc,&00,&00 
defb &00,&00,&00,&00,&00,&00,&c3,&c3,&cf,&c3,&cf,&35,&cf,&35,&35,&3f 
defb &35,&3f,&35,&c5,&6a,&cf,&6a,&cf,&c5,&db,&cb,&d3,&cb,&d3,&c3,&c3 
defb &c3,&c3,&d1,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&0f,&af,&0f,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&00,&00 
defb &00,&00,&00,&00,&00,&50,&c3,&c3,&c3,&c3,&6a,&cf,&6a,&cf,&6a,&cb 
defb &c5,&c3,&cb,&c3,&cb,&d3,&b7,&3f,&3f,&3f,&2a,&00,&a0,&00,&c3,&c3 
defb &c3,&c3,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&cc,&0c,&00,&54 
defb &00,&fd,&bc,&1e,&c3,&cf,&c7,&cb,&cf,&cb,&cf,&cb,&cb,&d3,&c3,&d3 
defb &b7,&3f,&b7,&6a,&6a,&c7,&6a,&9a,&3f,&a0,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&3f,&c1,&6a,&c3,&6a,&c3,&c1,&c3,&6a,&c3,&3f,&3f,&3f,&3f 
defb &0f,&0f,&0f,&0f,&8c,&0c,&cc,&0c,&cc,&0c,&0c,&4c,&0c,&4c,&2c,&cc 
defb &cc,&dd,&cc,&af,&cb,&d3,&c3,&d3,&b7,&3f,&b7,&6a,&3f,&c5,&6a,&9a 
defb &c5,&20,&9a,&00,&20,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&c3,&cf,&c7,&cf,&c7,&cf,&cf,&cf,&cf,&cf,&3f,&3f,&3f,&3f 
defb &1e,&00,&0f,&aa,&0c,&88,&0c,&be,&cc,&dd,&dd,&0f,&af,&5f,&af,&5f 
defb &0f,&1e,&5f,&ff,&3f,&c5,&6a,&9a,&c5,&20,&9a,&00,&20,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&c3 
defb &c3,&c3,&cf,&cf,&cf,&9a,&cf,&60,&9a,&6a,&9a,&c5,&6a,&9a,&3f,&a0 
defb &00,&00,&00,&00,&00,&00,&00,&00,&28,&00,&28,&00,&aa,&00,&ff,&00 
defb &6c,&00,&cc,&00,&20,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00 
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&c3,&a2 
defb &c7,&20,&c7,&20,&c5,&20,&c7,&a2,&9a,&00,&20,&00,&00,&00,&00,&00
;; font