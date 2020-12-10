;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module audio
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _akp_musicPlay
	.globl _akp_musicInit
	.globl _i
	.globl _effets
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_i::
	.ds 2
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
;src/audio.c:40: void akp_musicInit()
;	---------------------------------
; Function akp_musicInit
; ---------------------------------
_akp_musicInit::
;src/audio.c:42: i=i+1;
	ld	iy, #_i
	inc	0 (iy)
	jr	NZ,00103$
	inc	1 (iy)
00103$:
;src/audio.c:102: __endasm;
;;	backup Z80 state
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	push	iy
	exx
	ex	af, af' ;; '
	push	af
	push	bc
	push	de
	push	hl
	ld	bc,#_effets ;; OK
	ld	hl,#_effets ;; OK
	ld	(#_effets),bc ;; OK
	inc	bc
	inc	bc
	ld	de,#0x0040
	add	hl,de
	ld	a,h
	ld	(bc),a
	inc	bc
	ld	a,l
	ld	(bc),a
;;	AKG6000.BIN/exemple.asm
	ld	bc,#0x7000
	ld	de,#_effets ;;sfx
	call	#0x6000
;;	restore Z80 state
	pop	hl
	pop	de
	pop	bc
	pop	af
	ex	af, af' ;; '
	exx
	pop	iy
	pop	ix
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret
_effets:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x3d	; 61
	.dw #0x00ef
	.db #0x39	; 57	'9'
	.dw #0x00ef
	.db #0x35	; 53	'5'
	.dw #0x00ef
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x01	; 1
	.dw #0x005f
	.db #0xbd	; 189
	.db #0x01	; 1
	.dw #0x0063
	.db #0xb1	; 177
	.db #0x01	; 1
	.dw #0x0066
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x3d	; 61
	.dw #0x00ef
	.db #0x39	; 57	'9'
	.dw #0x00ef
	.db #0x35	; 53	'5'
	.dw #0x00ef
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0xbd	; 189
	.db #0x01	; 1
	.dw #0x012d
	.db #0xbd	; 189
	.db #0x08	; 8
	.dw #0x013f
	.db #0xb9	; 185
	.db #0x02	; 2
	.dw #0x0192
	.db #0x04	; 4
;src/audio.c:105: void akp_musicPlay()
;	---------------------------------
; Function akp_musicPlay
; ---------------------------------
_akp_musicPlay::
;src/audio.c:138: __endasm;
;;	backup Z80 state
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	push	iy
	exx
	ex	af, af' ;; '
	push	af
	push	bc
	push	de
	push	hl
;;	AKG6000.BIN/exemple.asm
	call	#0x6003
;;	restore Z80 state
	pop	hl
	pop	de
	pop	bc
	pop	af
	ex	af, af' ;; '
	exx
	pop	iy
	pop	ix
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
