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
;src/txt_scroll_hard.c:11: void draw(u8* image, u8* plot, u8 width, u8 height) {
;	---------------------------------
; Function draw
; ---------------------------------
_draw::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;src/txt_scroll_hard.c:17: for (y=0;y<height;y++) {
	ld	a, 6 (ix)
	add	a, #0x00
	ld	-2 (ix), a
	ld	a, 7 (ix)
	adc	a, #0x40
	ld	-1 (ix), a
	ld	e, #0x00
00110$:
	ld	a, e
	sub	a, 9 (ix)
	jp	NC, 00112$
;src/txt_scroll_hard.c:18: for (x=0;x<width;x++) {
	push	de
	ld	h, 8 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00136$:
	add	hl, hl
	jr	NC,00137$
	add	hl, de
00137$:
	djnz	00136$
	pop	de
	ld	c, l
	ld	b, h
	ld	a, 4 (ix)
	add	a, c
	ld	-4 (ix), a
	ld	a, 5 (ix)
	adc	a, b
	ld	-3 (ix), a
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, 8 (ix)
	jr	NC,00111$
;src/txt_scroll_hard.c:19: cur_plot=plot+ 0x4000 +((y / 8u) * 80u) + ((y % 8u) * 2048u) + x;
	ld	b, e
	ld	d, #0x00
	ld	l, b
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
	ld	-6 (ix), a
	ld	a, -1 (ix)
	adc	a, h
	ld	-5 (ix), a
	ld	a, b
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	l, a
	ld	b, #0x00
	ld	a, -6 (ix)
	add	a, b
	ld	b, a
	ld	a, -5 (ix)
	adc	a, l
	ld	d, a
	ld	a, b
	add	a, c
	ld	-6 (ix), a
	ld	a, d
	adc	a, #0x00
	ld	-5 (ix), a
;src/txt_scroll_hard.c:20: cur_image=image+y*width+x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b, #0x00
	add	hl, bc
;src/txt_scroll_hard.c:21: if (cur_plot<0x4000) {
	ld	d, -5 (ix)
	ld	a, d
	sub	a, #0x40
	jr	NC,00102$
;src/txt_scroll_hard.c:22: cur_plot=cur_plot-0x4000;
	ld	a, -6 (ix)
	add	a, #0x00
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0xc0
	ld	h, a
;src/txt_scroll_hard.c:24: *cur_plot=0xF0;
	ld	(hl), #0xf0
	jr	00108$
00102$:
;src/txt_scroll_hard.c:26: *cur_plot=*cur_image;
	ld	b, (hl)
	pop	hl
	push	hl
	ld	(hl), b
00108$:
;src/txt_scroll_hard.c:18: for (x=0;x<width;x++) {
	inc	c
	jr	00107$
00111$:
;src/txt_scroll_hard.c:17: for (y=0;y<height;y++) {
	inc	e
	jp	00110$
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/txt_scroll_hard.c:76: void scroll_hard(u16 step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:82: u8* plot=screen_plot_address;
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/txt_scroll_hard.c:85: div=step/8;
	ld	e,4 (ix)
	ld	d,5 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/txt_scroll_hard.c:86: mod=step%8;
	ld	a, 4 (ix)
	and	a, #0x07
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;src/txt_scroll_hard.c:87: div=div%128;
	res	7, e
	ld	d, #0x00
;src/txt_scroll_hard.c:88: if (texte[div]==' ') {
	ld	hl, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:89: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:91: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:94: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
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
;src/txt_scroll_hard.c:98: draw((u8*)pointeur, plot, 2, 32);
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
