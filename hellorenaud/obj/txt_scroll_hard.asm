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
;src/txt_scroll_hard.c:12: void scroll_hard(char * texte, unsigned int l, int step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/txt_scroll_hard.c:16: u16 pointeur=(u16)g_tile_fontmap32x32plat_000;
	ld	-4 (ix), #<(_g_tile_fontmap32x32plat_000)
	ld	-3 (ix), #>(_g_tile_fontmap32x32plat_000)
;src/txt_scroll_hard.c:19: div=step/8;
	ld	c,8 (ix)
	ld	b,9 (ix)
	bit	7, b
	jr	Z,00109$
	ld	hl, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
00109$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;src/txt_scroll_hard.c:20: mod=step%8;
	push	bc
	ld	hl, #0x0008
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
;src/txt_scroll_hard.c:21: if (div<0 || div>l) {return;}
	bit	7, b
	jr	NZ,00107$
	ld	l, c
	ld	h, b
	ld	a, 6 (ix)
	sub	a, l
	ld	a, 7 (ix)
	sbc	a, h
	jr	C,00107$
;src/txt_scroll_hard.c:22: if (texte[div]==' ') {
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	c, (hl)
	ld	a, c
	sub	a, #0x20
	jr	NZ,00105$
;src/txt_scroll_hard.c:23: o=0;
	ld	hl, #0x0000
	jr	00106$
00105$:
;src/txt_scroll_hard.c:25: o=texte[div]-'?';
	ld	b, #0x00
	ld	a, c
	add	a, #0xc1
	ld	l, a
	ld	a, b
	adc	a, #0xff
00106$:
;src/txt_scroll_hard.c:30: cpct_drawSprite(pointeur+o*8*(32*2)+mod*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
	ld	c,10 (ix)
	ld	b,11 (ix)
	ld	a, l
	add	a, a
	ld	l, a
	ld	h, #0x00
	ld	a, -4 (ix)
	add	a, h
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, l
	ld	-1 (ix), a
	ex	de,hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	hl, de
	ld	de, #0x2002
	push	de
	push	bc
	push	hl
	call	_cpct_drawSprite
00107$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
