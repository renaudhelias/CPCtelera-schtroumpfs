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
	.globl _i
	.globl _effets2
	.globl _effets1
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
;src/audio.c:51: void akp_musicInit()
;	---------------------------------
; Function akp_musicInit
; ---------------------------------
_akp_musicInit::
;src/audio.c:53: i=i+1;
	ld	iy, #_i
	inc	0 (iy)
	jr	NZ,00103$
	inc	1 (iy)
00103$:
;src/audio.c:111: __endasm;
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
	ld	bc,#_effets1 ;; OK
	ld	(#_effets1),bc ;; OK
	inc	bc
	inc	bc
	ld	de,#_effets2
	ld	a,d
	LD	(bc),a
	inc	bc
	ld	a,e
	LD	(bc),a
	inc	bc
;;	AKG6000.BIN/exemple.asm
	ld	bc,#0x7000
	ld	de,#_effets1 ;;sfx
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
_effets1:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x3d	; 61
	.dw #0x00ef
	.db #0x39	; 57	'9'
	.dw #0x00ef
	.db #0x35	; 53	'5'
	.dw #0x00ef
	.db #0x31	; 49	'1'
	.dw #0x00ef
	.db #0xc7	; 199
	.dw #0x00ef
	.db #0x29	; 41
	.dw #0x00ef
	.db #0x25	; 37
	.dw #0x00ef
	.db #0x21	; 33
	.dw #0x00ef
	.db #0x1d	; 29
	.dw #0x00ef
	.db #0x19	; 25
	.dw #0x00ef
	.db #0x15	; 21
	.dw #0x0153
	.db #0x11	; 17
	.dw #0x00ef
	.db #0x0d	; 13
	.dw #0x00ef
	.db #0x09	; 9
	.dw #0x00ef
	.db #0x05	; 5
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
	.db #0xad	; 173
	.db #0x01	; 1
	.dw #0x006a
	.db #0x04	; 4
_effets2:
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x01	; 1
	.dw #0x012d
	.db #0xbd	; 189
	.db #0x08	; 8
	.dw #0x013f
	.db #0xb9	; 185
	.db #0x02	; 2
	.dw #0x0192
	.db #0xb5	; 181
	.db #0x10	; 16
	.dw #0x00d5
	.db #0xb1	; 177
	.db #0x02	; 2
	.dw #0x00e1
	.db #0xad	; 173
	.db #0x02	; 2
	.dw #0x00ef
	.db #0xa5	; 165
	.db #0x10	; 16
	.dw #0x0166
	.db #0x9d	; 157
	.db #0x1f	; 31
	.dw #0x0077
	.db #0x99	; 153
	.db #0x07	; 7
	.dw #0x0050
	.db #0x04	; 4
;src/audio.c:114: void akp_musicPlay()
;	---------------------------------
; Function akp_musicPlay
; ---------------------------------
_akp_musicPlay::
;src/audio.c:147: __endasm;
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
;src/audio.c:150: void akp_sfxPlay()
;	---------------------------------
; Function akp_sfxPlay
; ---------------------------------
_akp_sfxPlay::
;src/audio.c:183: __endasm;
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
	call	#0x6006
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
