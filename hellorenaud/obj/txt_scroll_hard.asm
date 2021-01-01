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
	.globl _draw_char
	.globl _cpct_getScreenPtr
	.globl _cpct_drawTileAligned2x8_f
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
;src/txt_scroll_hard.c:13: void draw_char(u8 c, u8* image, u8* plot) {
;	---------------------------------
; Function draw_char
; ---------------------------------
_draw_char::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;src/txt_scroll_hard.c:21: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, -2 (ix)
	add	a, #0x01
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x78
	ld	b, a
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, bc
;src/txt_scroll_hard.c:23: if (last_plot<0x4000) {
;src/txt_scroll_hard.c:37: for (y=0;y<8;y++) {
	ld	a, 7 (ix)
	add	a, #0x00
	ld	c, a
	ld	a, 8 (ix)
	adc	a, #0x40
	ld	b, a
;src/txt_scroll_hard.c:40: cur_image=image+(c*8+((y+1)%8))*2+x;
	ld	e, 4 (ix)
	ld	d, #0x00
;src/txt_scroll_hard.c:23: if (last_plot<0x4000) {
	ld	a, h
	sub	a, #0x40
	jp	NC, 00106$
;src/txt_scroll_hard.c:37: for (y=0;y<8;y++) {
	ld	a, -2 (ix)
	add	a, c
	ld	-2 (ix), a
	ld	a, -1 (ix)
	adc	a, b
	ld	-1 (ix), a
	ld	c, #0x00
;src/txt_scroll_hard.c:38: for (x=0;x<2;x++) {
00116$:
	ld	b, #0x00
00108$:
;src/txt_scroll_hard.c:39: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
	ld	a, c
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	h, a
	ld	l, #0x00
	ld	a, -2 (ix)
	add	a, l
	ld	l, a
	ld	a, -1 (ix)
	adc	a, h
	ld	h, a
	ld	a, l
	add	a, b
	ld	l, a
	ld	a, h
	adc	a, #0x00
	ld	h, a
	inc	sp
	inc	sp
	push	hl
;src/txt_scroll_hard.c:40: cur_image=image+(c*8+((y+1)%8))*2+x;
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	a, #0x03+1
	jr	00141$
00140$:
	sla	-4 (ix)
	rl	-3 (ix)
00141$:
	dec	a
	jr	NZ,00140$
	ld	l, c
	ld	h, #0x00
	inc	hl
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0008
	push	hl
	push	iy
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	add	iy, iy
	push	bc
	ld	c,5 (ix)
	ld	b,6 (ix)
	add	iy, bc
	pop	bc
	push	bc
	ld	c,b
	ld	b,#0x00
	add	iy, bc
	pop	bc
;src/txt_scroll_hard.c:41: if (cur_plot<0x4000) {
	pop	hl
	push	hl
	ld	a, h
	sub	a, #0x40
	jr	NC,00102$
;src/txt_scroll_hard.c:42: cur_plot=cur_plot-0x4000;
	ld	a, -6 (ix)
	add	a, #0x00
	ld	-6 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xc0
	ld	-5 (ix), a
00102$:
;src/txt_scroll_hard.c:44: *cur_plot=*cur_image;
	ld	a, 0 (iy)
	pop	hl
	push	hl
	ld	(hl), a
;src/txt_scroll_hard.c:38: for (x=0;x<2;x++) {
	inc	b
	ld	a, b
	sub	a, #0x02
	jp	C, 00108$
;src/txt_scroll_hard.c:37: for (y=0;y<8;y++) {
	inc	c
	ld	a, c
	sub	a, #0x08
	jp	C, 00116$
	jr	00112$
00106$:
;src/txt_scroll_hard.c:48: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
	ld	a, 4 (ix)
	rlca
	rlca
	rlca
	and	a, #0xf8
	push	de
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_getScreenPtr
	pop	de
;src/txt_scroll_hard.c:49: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
	ld	c, l
	ld	b, h
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	l,5 (ix)
	ld	h,6 (ix)
	add	hl, de
	push	bc
	push	hl
	call	_cpct_drawTileAligned2x8_f
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/txt_scroll_hard.c:97: void scroll_hard(u16 step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:103: u8* plot=screen_plot_address;
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/txt_scroll_hard.c:106: div=step/8;
	ld	e,4 (ix)
	ld	d,5 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/txt_scroll_hard.c:107: mod=step%8;
	ld	a, 4 (ix)
	and	a, #0x07
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;src/txt_scroll_hard.c:108: div=div%128;
	res	7, e
	ld	d, #0x00
;src/txt_scroll_hard.c:109: if (texte[div]==' ') {
	ld	hl, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:110: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:112: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:115: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
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
;src/txt_scroll_hard.c:119: draw_char(0,(u8*)pointeur, plot);
	push	hl
	push	bc
	push	bc
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_draw_char
	pop	af
	pop	af
	inc	sp
	pop	bc
	pop	hl
;src/txt_scroll_hard.c:120: draw_char(1,(u8*)pointeur, plot);
	push	hl
	push	bc
	push	bc
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_draw_char
	pop	af
	pop	af
	inc	sp
	pop	bc
	pop	hl
;src/txt_scroll_hard.c:121: draw_char(2,(u8*)pointeur, plot);
	push	hl
	push	bc
	push	bc
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_draw_char
	pop	af
	pop	af
	inc	sp
	pop	bc
	pop	hl
;src/txt_scroll_hard.c:122: draw_char(3,(u8*)pointeur, plot);
	push	bc
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_draw_char
	ld	sp,ix
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
