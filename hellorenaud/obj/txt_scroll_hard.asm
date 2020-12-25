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
;src/txt_scroll_hard.c:11: void scroll_hard(char * texte, unsigned int l, int step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/txt_scroll_hard.c:17: u16 pointeur=(u16)g_tile_fontmap32x32plat_000;
	ld	-4 (ix), #<(_g_tile_fontmap32x32plat_000)
	ld	-3 (ix), #>(_g_tile_fontmap32x32plat_000)
;src/txt_scroll_hard.c:18: c2=step+SCREEN_WIDTH; // on insère du vide au début de step
	ld	a, 8 (ix)
	add	a, #0x50
	ld	e, a
	ld	a, 9 (ix)
	adc	a, #0x00
	ld	d, a
;src/txt_scroll_hard.c:21: div=c2/8;
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z,00106$
	ld	hl, #0x0007
	add	hl,de
	ld	c, l
	ld	b, h
00106$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;src/txt_scroll_hard.c:22: mod=c2%8;
	push	bc
	ld	hl, #0x0008
	push	hl
	push	de
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	-2 (ix), l
	ld	-1 (ix), h
;src/txt_scroll_hard.c:23: if (div<0 || div>l) {return;}
	bit	7, b
	jr	NZ,00104$
	ld	e, c
	ld	d, b
	ld	a, 6 (ix)
	sub	a, e
	ld	a, 7 (ix)
	sbc	a, d
	jr	C,00104$
;src/txt_scroll_hard.c:24: o=texte[div]-'?';
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xc1
	ld	e, a
	ld	a, b
	adc	a, #0xff
;src/txt_scroll_hard.c:25: cpct_drawSprite(pointeur+o*8*(32*2)+mod*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
	ld	c,10 (ix)
	ld	b,11 (ix)
	ld	a, e
	add	a, a
	ld	d, a
	ld	e, #0x00
	ld	a, -4 (ix)
	add	a, e
	ld	e, a
	ld	a, -3 (ix)
	adc	a, d
	ld	d, a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #0x2002
	push	de
	push	bc
	push	hl
	call	_cpct_drawSprite
00104$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
