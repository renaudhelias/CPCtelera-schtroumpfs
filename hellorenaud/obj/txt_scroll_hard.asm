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
	.globl _cpct_drawSprite
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
;src/txt_scroll_hard.c:19: u8* plot=screen_plot_address;
	ld	a, 6 (ix)
	ld	-2 (ix), a
	ld	a, 7 (ix)
	ld	-1 (ix), a
;src/txt_scroll_hard.c:22: div=step/8;
	ld	l,4 (ix)
	ld	h,5 (ix)
	bit	7, h
	jr	Z,00106$
	ld	bc, #0x0007
	add	hl, bc
00106$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
;src/txt_scroll_hard.c:23: mod=step%8;
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
;src/txt_scroll_hard.c:24: div=div%128;
	push	bc
	ld	de, #0x0080
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
;src/txt_scroll_hard.c:25: if (texte[div]==' ') {
	ld	de, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:26: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:28: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:31: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
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
	add	hl, de
;src/txt_scroll_hard.c:33: cpct_drawSprite((u8*)pointeur, plot, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
	pop	bc
	push	bc
	ld	de, #0x2002
	push	de
	push	bc
	push	hl
	call	_cpct_drawSprite
	ld	sp, ix
	pop	ix
	ret
_texte:
	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
	.ascii "AND A HAPPY NEW YEAR                                        "
	.ascii "        "
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
