;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module rupture
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rupture
	.globl _restoreVBL
	.globl _killVBL
	.globl _vblPosition
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_vblPosition::
	.ds 2
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
;src/rupture.c:7: void killVBL() {
;	---------------------------------
; Function killVBL
; ---------------------------------
_killVBL::
;src/rupture.c:14: __endasm;
	ld	bc,#0xbc07 ; Kill VBL
	ld	a,#0x7f
	out	(c),c
	inc	b
	out	(c),a
;src/rupture.c:15: vblPosition=37;
	ld	hl, #0x0025
	ld	(_vblPosition), hl
	ret
;src/rupture.c:18: void restoreVBL() {
;	---------------------------------
; Function restoreVBL
; ---------------------------------
_restoreVBL::
;src/rupture.c:25: __endasm;
	ld	bc,#0xbc07 ; On repositionne la VBL
	ld	a,(_vblPosition)
	out	(c),c
	inc	b
	out	(c),a
	ret
;src/rupture.c:31: void rupture(unsigned char nbCharLigne) {
;	---------------------------------
; Function rupture
; ---------------------------------
_rupture::
;src/rupture.c:42: __endasm;
	ld	bc,#0xbc04 ; Rupture 1
;;ld	a,(_nbCharLigne)
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	dec	a
	out	(c),c
	inc	b
	out	(c),a
;src/rupture.c:43: vblPosition=vblPosition-nbCharLigne;
	ld	hl, #2+0
	add	hl, sp
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_vblPosition
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	(hl), a
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__vblPosition:
	.dw #0x0000
	.area _CABS (ABS)
