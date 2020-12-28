;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module audio
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _akp_sfxPlay
	.globl _akp_musicPlay
	.globl _akp_musicInit
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
;src/audio.c:10: void akp_musicInit()
;	---------------------------------
; Function akp_musicInit
; ---------------------------------
_akp_musicInit::
;src/audio.c:50: __endasm;
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
	ld	bc,#0xD000
	call	#0xC000
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
;src/audio.c:53: void akp_musicPlay()
;	---------------------------------
; Function akp_musicPlay
; ---------------------------------
_akp_musicPlay::
;src/audio.c:86: __endasm;
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
	call	#0xC003
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
;src/audio.c:89: void akp_sfxPlay()
;	---------------------------------
; Function akp_sfxPlay
; ---------------------------------
_akp_sfxPlay::
;src/audio.c:122: __endasm;
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
	call	#0xC006
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
