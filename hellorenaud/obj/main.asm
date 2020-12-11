;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _myInterruptHandler
	.globl _bank0123
	.globl _calque4000
	.globl _calqueC000
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setVideoMode
	.globl _cpct_drawCharM0
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _g_items_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_myInterruptHandler_i_1_80:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:41: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:45: cpct_setBorder(i+1);
	ld	hl,#_myInterruptHandler_i_1_80 + 0
	ld	b, (hl)
	inc	b
	push	bc
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_cpct_setPALColour
;src/main.c:46: if (++i > 5) i=0;
	ld	iy, #_myInterruptHandler_i_1_80
	inc	0 (iy)
	ld	a, #0x05
	sub	a, 0 (iy)
	ret	NC
	ld	0 (iy), #0x00
	ret
_g_items_0:
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;src/main.c:55: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:70: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:77: bank0123();
	call	_bank0123
;src/main.c:78: calque4000();
	call	_calque4000
;src/main.c:82: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:83: while (1) {}
00102$:
;src/main.c:132: while (1) {}
	jr	00102$
___str_0:
	.ascii "Welcome to you!"
	.db 0x00
___str_1:
	.ascii "Press ENTER."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
