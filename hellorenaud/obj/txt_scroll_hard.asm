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
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
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
;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
	ld	-10 (ix), l
	ld	-9 (ix), h
;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
	ld	a, 7 (ix)
	add	a, #0x00
	ld	e, a
	ld	a, 8 (ix)
	adc	a, #0x40
	ld	d, a
;src/txt_scroll_hard.c:25: cur_image=image+(c*8+((y+1)%8))*2+x;
	ld	l, 4 (ix)
	ld	h, #0x00
;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
	ld	a, e
	add	a, c
	ld	-2 (ix), a
	ld	a, d
	adc	a, b
	ld	-1 (ix), a
;src/txt_scroll_hard.c:25: cur_image=image+(c*8+((y+1)%8))*2+x;
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-8 (ix), l
	ld	-7 (ix), h
;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
	ld	a, -9 (ix)
	sub	a, #0x40
	jp	NC, 00128$
;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
	ld	-12 (ix), #0x00
;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
00122$:
	ld	-11 (ix), #0x00
00110$:
;src/txt_scroll_hard.c:24: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
	ld	a, -12 (ix)
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	d, a
	ld	e, #0x00
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	add	hl, de
	ld	a, l
	add	a, -11 (ix)
	ld	-4 (ix), a
	ld	a, h
	adc	a, #0x00
	ld	-3 (ix), a
;src/txt_scroll_hard.c:25: cur_image=image+(c*8+((y+1)%8))*2+x;
	ld	c, -12 (ix)
	ld	b, #0x00
	inc	bc
	ld	hl, #0x0008
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl, de
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,5 (ix)
	ld	h,6 (ix)
	add	hl, bc
	ld	a, -11 (ix)
	add	a, l
	ld	-6 (ix), a
	ld	a, #0x00
	adc	a, h
	ld	-5 (ix), a
;src/txt_scroll_hard.c:27: if (cur_plot<0x4000) {
	ld	a, -3 (ix)
	sub	a, #0x40
	jr	NC,00102$
;src/txt_scroll_hard.c:28: cur_plot=cur_plot-0x4000;
	ld	a, -4 (ix)
	add	a, #0x00
	ld	-4 (ix), a
	ld	a, -3 (ix)
	adc	a, #0xc0
	ld	-3 (ix), a
00102$:
;src/txt_scroll_hard.c:30: *cur_plot=*cur_image;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c, (hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl), c
;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
	inc	-11 (ix)
	ld	a, -11 (ix)
	sub	a, #0x02
	jp	C, 00110$
;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
	inc	-12 (ix)
	ld	a, -12 (ix)
	sub	a, #0x08
	jp	C, 00122$
	jr	00118$
;src/txt_scroll_hard.c:34: for (y=0;y<8;y++) {
00128$:
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	c, #0x00
;src/txt_scroll_hard.c:35: for (x=0;x<2;x++) {
00126$:
	ld	b, #0x00
00114$:
;src/txt_scroll_hard.c:36: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
	ld	a, c
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	d, a
	ld	e, #0x00
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	add	hl, de
	ld	e,b
	ld	d,#0x00
	add	hl, de
	ex	de,hl
;src/txt_scroll_hard.c:37: cur_image=image+(c*8+y)*2+x;
	ld	l, c
	ld	h, #0x00
	ld	a, -8 (ix)
	add	a, l
	ld	l, a
	ld	a, -7 (ix)
	adc	a, h
	ld	h, a
	add	hl, hl
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, 5 (ix)
	add	a, -4 (ix)
	ld	l, a
	ld	a, 6 (ix)
	adc	a, -3 (ix)
	ld	h, a
	ld	a, l
	add	a, b
	ld	l, a
	ld	a, h
	adc	a, #0x00
	ld	h, a
;src/txt_scroll_hard.c:38: *cur_plot=*cur_image;
	ld	a, (hl)
	ld	(de), a
;src/txt_scroll_hard.c:35: for (x=0;x<2;x++) {
	inc	b
	ld	a, b
	sub	a, #0x02
	jr	C,00114$
;src/txt_scroll_hard.c:34: for (y=0;y<8;y++) {
	inc	c
	ld	a, c
	sub	a, #0x08
	jr	C,00126$
00118$:
	ld	sp, ix
	pop	ix
	ret
;src/txt_scroll_hard.c:88: void scroll_hard(u16 step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:94: u8* plot=screen_plot_address;
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/txt_scroll_hard.c:97: div=step/8;
	ld	e,4 (ix)
	ld	d,5 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/txt_scroll_hard.c:98: mod=step%8;
	ld	a, 4 (ix)
	and	a, #0x07
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;src/txt_scroll_hard.c:99: div=div%128;
	res	7, e
	ld	d, #0x00
;src/txt_scroll_hard.c:100: if (texte[div]==' ') {
	ld	hl, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:101: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:103: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:106: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
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
;src/txt_scroll_hard.c:110: draw_char(0,(u8*)pointeur, plot);
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
;src/txt_scroll_hard.c:111: draw_char(1,(u8*)pointeur, plot);
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
;src/txt_scroll_hard.c:112: draw_char(2,(u8*)pointeur, plot);
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
;src/txt_scroll_hard.c:113: draw_char(3,(u8*)pointeur, plot);
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
