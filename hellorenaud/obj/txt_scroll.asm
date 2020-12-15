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
;src/txt_scroll.c:6: void scroll(char * texte, unsigned int l, unsigned int step) {
;	---------------------------------
; Function scroll
; ---------------------------------
_scroll::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/txt_scroll.c:10: for(c=step;c<G_TILE_FONTMAP20X22_00_W*l;c=c+1) {
	ld	c, 8 (ix)
	ld	b, c
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de,hl
00108$:
	ld	l, b
	ld	h, #0x00
	cp	a, a
	sbc	hl, de
	jp	NC, 00110$
;src/txt_scroll.c:11: if (c-step>SCREEN_WIDTH) {return;}
	ld	l, b
	ld	h, #0x00
	ld	a, l
	sub	a, 8 (ix)
	ld	l, a
	ld	a, h
	sbc	a, 9 (ix)
	ld	h, a
	ld	a, #0xa0
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	C,00110$
;src/txt_scroll.c:12: if (texte[c]!=' ' && c%G_TILE_FONTMAP20X22_00_W==0) {
	ld	a, 4 (ix)
	add	a, b
	ld	l, a
	ld	a, 5 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	sub	a, #0x20
	jp	Z,00109$
	push	bc
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00109$
;src/txt_scroll.c:13: o=texte[c/G_TILE_FONTMAP20X22_00_W]-'A';
	push	bc
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__divuchar
	pop	af
	ld	-1 (ix), l
	pop	de
	pop	bc
	ld	a, 4 (ix)
	add	a, -1 (ix)
	ld	l, a
	ld	a, 5 (ix)
	adc	a, #0x00
	ld	h, a
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	add	a, #0xbf
	ld	-5 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-4 (ix), a
;src/txt_scroll.c:14: p = cpct_getScreenPtr(CPCT_VMEM_START, c-step,120-1);
	ld	a, b
	sub	a, c
	ld	h, a
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
;src/txt_scroll.c:15: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
	push	hl
	pop	iy
	pop	hl
	push	hl
	add	hl, hl
	ld	a, #<(_g_tile_tileset)
	add	a, l
	ld	l, a
	ld	a, #>(_g_tile_tileset)
	adc	a, h
	ld	h, a
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	-3 (ix), a
	ld	-2 (ix), h
	push	bc
	push	de
	ld	hl, #0x160a
	push	hl
	push	iy
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
00109$:
;src/txt_scroll.c:10: for(c=step;c<G_TILE_FONTMAP20X22_00_W*l;c=c+1) {
	inc	b
	jp	00108$
00110$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
