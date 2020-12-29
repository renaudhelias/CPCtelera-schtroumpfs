;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module txt_scroll_hard
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scroll_hard
	.globl _cpct_getScreenPtr
	.globl _cpct_drawTileAligned2x8
	.globl _texte
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
;src/txt_scroll_hard.c:14: void scroll_hard(int step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:20: u8* plot=screen_plot_address;
	ld	a, 6 (ix)
	ld	-2 (ix), a
	ld	a, 7 (ix)
	ld	-1 (ix), a
;src/txt_scroll_hard.c:23: div=step/8;
	ld	l,4 (ix)
	ld	h,5 (ix)
	bit	7, h
	jr	Z,00106$
	ld	bc, #0x0007
	add	hl, bc
00106$:
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
;src/txt_scroll_hard.c:24: mod=step%8;
	push	hl
	ld	bc, #0x0008
	push	bc
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	hl
;src/txt_scroll_hard.c:25: div=div%128;
	res	7, l
	ld	h, #0x00
;src/txt_scroll_hard.c:26: if (texte[div]==' ') {
	ld	de, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:27: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:29: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:32: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
	ld	hl, #_g_tile_fontmap32x32plat_000
	ld	a, e
	add	a, a
	ld	d, a
	ld	e, #0x00
	add	hl,de
	ex	de,hl
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl,de
	ex	de,hl
;src/txt_scroll_hard.c:36: p = cpct_getScreenPtr(plot, 0,0);
	pop	bc
	push	bc
	push	bc
	push	de
	ld	hl, #0x0000
	push	hl
	push	bc
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/txt_scroll_hard.c:37: cpct_drawTileAligned2x8((u8*)pointeur, p);
	push	de
	pop	iy
	push	bc
	push	de
	push	hl
	push	iy
	call	_cpct_drawTileAligned2x8
	pop	de
	pop	bc
;src/txt_scroll_hard.c:38: p = cpct_getScreenPtr(plot, 0,8);
	push	bc
	push	de
	ld	hl, #0x0800
	push	hl
	push	bc
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/txt_scroll_hard.c:39: cpct_drawTileAligned2x8((u8*)pointeur+(2*8), p);
	ld	iy, #0x0010
	add	iy, de
	push	bc
	push	de
	push	hl
	push	iy
	call	_cpct_drawTileAligned2x8
	pop	de
	pop	bc
;src/txt_scroll_hard.c:40: p = cpct_getScreenPtr(plot, 0,16);
	push	bc
	push	de
	ld	hl, #0x1000
	push	hl
	push	bc
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/txt_scroll_hard.c:41: cpct_drawTileAligned2x8((u8*)pointeur+(4*8), p);
	push	hl
	pop	iy
	ld	hl, #0x0020
	add	hl, de
	push	bc
	push	de
	push	iy
	push	hl
	call	_cpct_drawTileAligned2x8
	pop	de
	pop	bc
;src/txt_scroll_hard.c:42: p = cpct_getScreenPtr(plot, 0,24);
	push	de
	ld	hl, #0x1800
	push	hl
	push	bc
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
	pop	de
;src/txt_scroll_hard.c:43: cpct_drawTileAligned2x8((u8*)pointeur+(6*8), p);
	ld	hl, #0x0030
	add	hl, de
	push	bc
	push	hl
	call	_cpct_drawTileAligned2x8
	ld	sp, ix
	pop	ix
	ret
_texte:
	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB   AZERTYUIOPQSDFG"
	.ascii "H       "
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
