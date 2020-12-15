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
;src/txt_scroll.c:4: void scroll(char * texte, unsigned int l) {
;	---------------------------------
; Function scroll
; ---------------------------------
_scroll::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/txt_scroll.c:8: for(c=0;c<l;c=c+1) {
	ld	-1 (ix), #0x00
00105$:
	ld	a, -1 (ix)
	ld	b, #0x00
	sub	a, 6 (ix)
	ld	a, b
	sbc	a, 7 (ix)
	jr	NC,00107$
;src/txt_scroll.c:9: if (texte[c]!=' ') {
	ld	a, 4 (ix)
	add	a, -1 (ix)
	ld	l, a
	ld	a, 5 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c, (hl)
	ld	a, c
	sub	a, #0x20
	jr	Z,00106$
;src/txt_scroll.c:10: o=texte[c]-'A';
	ld	b, #0x00
	ld	a, c
	add	a, #0xbf
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
;src/txt_scroll.c:11: p = cpct_getScreenPtr(CPCT_VMEM_START, c*G_TILE_FONTMAP20X22_00_W,120-1);
	ld	a, -1 (ix)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	ld	d, a
	push	bc
	ld	a, #0x77
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/txt_scroll.c:12: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
	pop	hl
	add	hl, hl
	ld	bc, #_g_tile_tileset
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x160a
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
00106$:
;src/txt_scroll.c:8: for(c=0;c<l;c=c+1) {
	inc	-1 (ix)
	jr	00105$
00107$:
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
