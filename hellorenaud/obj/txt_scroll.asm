;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module txt_scroll
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scroll
	.globl _cpct_getScreenPtr
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
;src/txt_scroll.c:11: void scroll(char * texte, unsigned int l, int step) {//step 160 200
;	---------------------------------
; Function scroll
; ---------------------------------
_scroll::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/txt_scroll.c:18: c2=step+SCREEN_WIDTH; // on insère du vide au début de step
	ld	a, 8 (ix)
	add	a, #0x50
	ld	c, a
	ld	a, 9 (ix)
	adc	a, #0x00
	ld	b, a
;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	hl, #0x0000
	ex	(sp), hl
00111$:
;src/txt_scroll.c:22: c2=c2+1;
	inc	bc
;src/txt_scroll.c:24: if (c2 < 0) {continue;}
	bit	7, b
	jr	NZ,00109$
;src/txt_scroll.c:25: if (c2 > l*G_TILE_FONTMAP20X22_00_W) {continue;}
	ld	e, c
	ld	d, b
	ld	a, -2 (ix)
	sub	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jr	C,00109$
;src/txt_scroll.c:27: div=c2/G_TILE_FONTMAP20X22_00_W;
	push	bc
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__divsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
;src/txt_scroll.c:28: mod=c2%G_TILE_FONTMAP20X22_00_W;
	push	bc
	push	de
	ld	hl, #0x000a
	push	hl
	push	bc
;src/txt_scroll.c:29: if (mod==0) {
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, h
	or	a,l
	jr	NZ,00109$
;src/txt_scroll.c:30: if (texte[div]!=' ') {
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	Z,00109$
;src/txt_scroll.c:31: o=texte[div]-'A';
	ld	d, #0x00
	ld	a, e
	add	a, #0xbf
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
;src/txt_scroll.c:33: p = cpct_getScreenPtr(CPCT_VMEM_START, c1,120-1);
	ld	h, -4 (ix)
	push	bc
	push	de
	ld	a, #0x77
	push	af
	inc	sp
	push	hl
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/txt_scroll.c:34: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
	push	hl
	pop	iy
	ex	de,hl
	add	hl, hl
	ld	de, #_g_tile_tileset
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0x160a
	push	hl
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
00109$:
;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
	inc	-4 (ix)
	jr	NZ,00136$
	inc	-3 (ix)
00136$:
	ld	a, #0x46
	cp	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	jp	PO, 00137$
	xor	a, #0x80
00137$:
	jp	P, 00111$
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
