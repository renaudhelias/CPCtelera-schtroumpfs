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
	push	af
	push	af
;src/txt_scroll_hard.c:20: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
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
	ld	c, l
	ld	b, h
	ld	hl, #0x7801
	add	hl,bc
	ex	de,hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, de
	ld	d, h
;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
	ld	a, 7 (ix)
	add	a, #0x00
	ld	l, a
	ld	a, 8 (ix)
	adc	a, #0x40
	ld	h, a
	add	hl,bc
	ld	c, l
	ld	b, h
;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
	ld	a, d
	sub	a, #0x40
	jr	NC,00129$
;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
	ld	-4 (ix), #0x00
;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
00123$:
	ld	-3 (ix), #0x00
00111$:
;src/txt_scroll_hard.c:24: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
	ld	a, -4 (ix)
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	h, a
	ld	l, #0x00
	add	hl, bc
	ld	e,-3 (ix)
	ld	d,#0x00
	add	hl, de
;src/txt_scroll_hard.c:26: if (cur_plot<0x4000) {
;src/txt_scroll_hard.c:27: cur_plot=cur_plot-0x4000;
	ld	a,h
	cp	a,#0x40
	jr	NC,00102$
	add	a,#0xc0
	ld	h, a
;src/txt_scroll_hard.c:29: *cur_plot=0xF0;
	ld	(hl), #0xf0
	jr	00112$
00102$:
;src/txt_scroll_hard.c:31: *cur_plot=0xFF;
	ld	(hl), #0xff
00112$:
;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
	inc	-3 (ix)
	ld	a, -3 (ix)
	sub	a, #0x02
	jr	C,00111$
;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
	inc	-4 (ix)
	ld	a, -4 (ix)
	sub	a, #0x08
	jr	C,00123$
	jr	00119$
;src/txt_scroll_hard.c:36: for (y=0;y<8;y++) {
00129$:
	ld	-4 (ix), #0x00
;src/txt_scroll_hard.c:37: for (x=0;x<2;x++) {
00127$:
	ld	-3 (ix), #0x00
00115$:
;src/txt_scroll_hard.c:38: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
	ld	a, -4 (ix)
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	h, a
	ld	l, #0x00
	add	hl, bc
	ld	a, l
	add	a, -3 (ix)
	ld	-2 (ix), a
	ld	a, h
	adc	a, #0x00
	ld	-1 (ix), a
;src/txt_scroll_hard.c:39: cur_image=image+(c*8+y)*2+x;
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, -4 (ix)
	ld	d, #0x00
	add	hl, de
	add	hl, hl
	ex	de,hl
	ld	l,5 (ix)
	ld	h,6 (ix)
	add	hl, de
	ld	e,-3 (ix)
	ld	d,#0x00
	add	hl, de
;src/txt_scroll_hard.c:40: *cur_plot=*cur_image;
	ld	e, (hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), e
;src/txt_scroll_hard.c:37: for (x=0;x<2;x++) {
	inc	-3 (ix)
	ld	a, -3 (ix)
	sub	a, #0x02
	jr	C,00115$
;src/txt_scroll_hard.c:36: for (y=0;y<8;y++) {
	inc	-4 (ix)
	ld	a, -4 (ix)
	sub	a, #0x08
	jr	C,00127$
00119$:
	ld	sp, ix
	pop	ix
	ret
;src/txt_scroll_hard.c:90: void scroll_hard(u16 step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:96: u8* plot=screen_plot_address;
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/txt_scroll_hard.c:99: div=step/8;
	ld	e,4 (ix)
	ld	d,5 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/txt_scroll_hard.c:100: mod=step%8;
	ld	a, 4 (ix)
	and	a, #0x07
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;src/txt_scroll_hard.c:101: div=div%128;
	res	7, e
	ld	d, #0x00
;src/txt_scroll_hard.c:102: if (texte[div]==' ') {
	ld	hl, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:103: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:105: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:108: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
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
;src/txt_scroll_hard.c:112: draw_char(0,(u8*)pointeur, plot);
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
;src/txt_scroll_hard.c:113: draw_char(1,(u8*)pointeur, plot);
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
;src/txt_scroll_hard.c:114: draw_char(2,(u8*)pointeur, plot);
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
;src/txt_scroll_hard.c:115: draw_char(3,(u8*)pointeur, plot);
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
