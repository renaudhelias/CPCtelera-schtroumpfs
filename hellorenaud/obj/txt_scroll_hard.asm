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
	.globl _draw
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
;src/txt_scroll_hard.c:9: void draw(u8* image, u8* plot, u8 width, u8 height) {
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:14: for (y=0;y<height;y++) {
	ld	a, 6 (ix)
	add	a, #0x00
	ld	-2 (ix), a
	ld	a, 7 (ix)
	adc	a, #0x40
	ld	-1 (ix), a
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, 9 (ix)
	jr	NC,00111$
;src/txt_scroll_hard.c:15: for (x=0;x<width;x++) {
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, 8 (ix)
	jr	NC,00110$
;src/txt_scroll_hard.c:16: cur_plot=plot+0x4000+ ((y / 8u) * 80u) + ((y % 8u) * 2048u) + x;
	ld	e, c
	ld	d, #0x00
	ld	l, e
	ld	h, d
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	pop	de
	ld	a, -2 (ix)
	add	a, l
	ld	l, a
	ld	a, -1 (ix)
	adc	a, h
	ld	h, a
	ld	a, e
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	d, a
	ld	e, #0x00
	add	hl, de
	ld	e,b
	ld	d,#0x00
	add	hl, de
;src/txt_scroll_hard.c:17: if (cur_plot<0x4000) {
;src/txt_scroll_hard.c:18: cur_plot=cur_plot-0x4000;
	ld	a,h
	cp	a,#0x40
	jr	NC,00102$
	add	a,#0xc0
	ld	h, a
00102$:
;src/txt_scroll_hard.c:22: *cur_plot=0x0F;//*cur_image;
	ld	(hl), #0x0f
;src/txt_scroll_hard.c:15: for (x=0;x<width;x++) {
	inc	b
	jr	00106$
00110$:
;src/txt_scroll_hard.c:14: for (y=0;y<height;y++) {
	inc	c
	jr	00109$
00111$:
	ld	sp, ix
	pop	ix
	ret
;src/txt_scroll_hard.c:71: void scroll_hard(u16 step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:77: u8* plot=screen_plot_address;
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/txt_scroll_hard.c:80: div=step/8;
	ld	e,4 (ix)
	ld	d,5 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/txt_scroll_hard.c:81: mod=step%8;
	ld	a, 4 (ix)
	and	a, #0x07
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;src/txt_scroll_hard.c:82: div=div%128;
	res	7, e
	ld	d, #0x00
;src/txt_scroll_hard.c:83: if (texte[div]==' ') {
	ld	hl, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:84: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:86: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:89: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
	ld	hl, #_g_tile_fontmap32x32plat_000
	ld	a, e
	add	a, a
	ld	d, a
	ld	e, #0x00
	add	hl,de
	ex	de,hl
	pop	hl
	push	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;src/txt_scroll_hard.c:93: draw((u8*)pointeur, plot, 2, 32);
	ld	de, #0x2002
	push	de
	push	bc
	push	hl
	call	_draw
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ld	sp, ix
	pop	ix
	ret
_texte:
	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
	.ascii "DFG     "
	.db 0x00
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
