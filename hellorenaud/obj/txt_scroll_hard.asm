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
	.globl _cpct_drawSolidBox
	.globl _cpct_drawTileAligned2x8_f
	.globl _firstPlotScreen2
	.globl _c_screen3
	.globl _plot_screen2
	.globl _texte
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_plot_screen2::
	.ds 2
_c_screen3::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_firstPlotScreen2::
	.ds 1
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
;src/txt_scroll_hard.c:16: u8 draw_char(u8 c, u8 ce2, u8* image, u8* plot) {
;	---------------------------------
; Function draw_char
; ---------------------------------
_draw_char::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:24: u8 c_screen2=ce2;
	ld	c, 5 (ix)
;src/txt_scroll_hard.c:25: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	hl, #0x7801
	add	hl,de
	ex	de,hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	add	hl, de
;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
	inc	sp
	inc	sp
	push	hl
;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, de
	ex	de,hl
;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
	ld	a, -1 (ix)
	sub	a, #0x40
	jp	NC, 00118$
;src/txt_scroll_hard.c:29: c_screen3=c;
	ld	b, 4 (ix)
;src/txt_scroll_hard.c:28: if (c<c_screen3) {
	ld	hl, #_c_screen3
	ld	a, 4 (ix)
	sub	a, (hl)
	jr	NC,00102$
;src/txt_scroll_hard.c:29: c_screen3=c;
	ld	hl,#_c_screen3 + 0
	ld	(hl), b
;src/txt_scroll_hard.c:30: plot_screen2=0x8000;
	ld	hl, #0x8000
	ld	(_plot_screen2), hl
00102$:
;src/txt_scroll_hard.c:32: if (c<c_screen2) {
	ld	a, 4 (ix)
	sub	a, c
	jr	NC,00104$
;src/txt_scroll_hard.c:33: c_screen2=c;
	ld	c, b
00104$:
;src/txt_scroll_hard.c:51: p = cpct_getScreenPtr(plot_screen2+0x4000, 0,8*(c-c_screen2));
	ld	a, 4 (ix)
	sub	a, c
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	b, a
	ld	iy, #0x4000
	push	bc
	ld	bc, (_plot_screen2)
	add	iy, bc
	pop	bc
	push	bc
	push	de
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	iy
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
	ld	a, 4 (ix)
	sub	a, #0x03
	jr	NZ,00158$
	ld	a,#0x01
	jr	00159$
00158$:
	xor	a,a
00159$:
	ld	b, a
;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
	ld	a, c
	sub	a,#0x03
	jr	NZ,00114$
	or	a,b
	jr	Z,00114$
;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
	push	bc
	push	hl
	push	de
	call	_cpct_drawTileAligned2x8_f
	pop	bc
	jr	00119$
00114$:
;src/txt_scroll_hard.c:54: } else if (c_screen2==2 && c==2) { // le "suivant" en bas, donc 0 1
	ld	a, c
	sub	a, #0x02
	jr	NZ,00162$
	ld	a,#0x01
	jr	00163$
00162$:
	xor	a,a
00163$:
	ld	-2 (ix), a
	or	a, a
	jr	Z,00110$
	ld	a, 4 (ix)
	sub	a, #0x02
	jr	NZ,00110$
;src/txt_scroll_hard.c:57: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
	push	bc
	push	hl
	push	de
	call	_cpct_drawTileAligned2x8_f
	pop	bc
	jr	00119$
00110$:
;src/txt_scroll_hard.c:58: } else if (c_screen2==2 && c==3) { // le "suivant" en bas, donc 0 1
	ld	a, -2 (ix)
	or	a, a
	jr	Z,00106$
	ld	a, b
	or	a, a
	jr	Z,00106$
;src/txt_scroll_hard.c:61: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
	push	bc
	push	hl
	push	de
	call	_cpct_drawTileAligned2x8_f
	pop	bc
	jr	00119$
00106$:
;src/txt_scroll_hard.c:63: cpct_drawSolidBox(p,c_screen2,2,8);
	push	bc
	ld	de, #0x0802
	push	de
	ld	a, c
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
	jr	00119$
00118$:
;src/txt_scroll_hard.c:85: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
	ld	a, 4 (ix)
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	h, a
	ld	a, 8 (ix)
	add	a, #0x00
	ld	l, a
	ld	a, 9 (ix)
	adc	a, #0x40
	ld	b, a
	push	bc
	push	de
	push	hl
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	h, b
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	push	hl
	push	de
	call	_cpct_drawTileAligned2x8_f
	pop	bc
00119$:
;src/txt_scroll_hard.c:88: return c_screen2;
	ld	l, c
	ld	sp, ix
	pop	ix
	ret
;src/txt_scroll_hard.c:99: void scroll_hard(u16 step, u8* screen_plot_address) {
;	---------------------------------
; Function scroll_hard
; ---------------------------------
_scroll_hard::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/txt_scroll_hard.c:106: u8* plot=screen_plot_address;
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/txt_scroll_hard.c:110: div=step/8;
	ld	e,4 (ix)
	ld	d,5 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/txt_scroll_hard.c:111: mod=step%8;
	ld	a, 4 (ix)
	and	a, #0x07
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;src/txt_scroll_hard.c:112: div=div%128;
	res	7, e
	ld	d, #0x00
;src/txt_scroll_hard.c:113: if (texte[div]==' ') {
	ld	hl, #_texte+0
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, #0x20
	jr	NZ,00102$
;src/txt_scroll_hard.c:114: o=0;
	ld	de, #0x0000
	jr	00103$
00102$:
;src/txt_scroll_hard.c:116: o=texte[div]-'?';
	ld	d, #0x00
	ld	a, e
	add	a, #0xc1
	ld	e, a
	ld	a, d
	adc	a, #0xff
00103$:
;src/txt_scroll_hard.c:119: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
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
	add	hl,de
	ex	de,hl
;src/txt_scroll_hard.c:123: ce2=draw_char(0,4,(u8*)pointeur, plot);
	push	bc
	push	de
	push	bc
	push	de
	ld	hl, #0x0400
	push	hl
	call	_draw_char
	pop	af
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	h, l
;src/txt_scroll_hard.c:124: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
	push	bc
	push	de
	push	bc
	push	de
	push	hl
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_draw_char
	pop	af
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	h, l
;src/txt_scroll_hard.c:125: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
	push	bc
	push	de
	push	bc
	push	de
	push	hl
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	call	_draw_char
	pop	af
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	h, l
;src/txt_scroll_hard.c:126: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
	push	bc
	push	de
	push	hl
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	call	_draw_char
	pop	af
	pop	af
	pop	af
;src/txt_scroll_hard.c:127: if (ce2==4) {
	ld	a, l
	sub	a, #0x04
	jr	NZ,00105$
;src/txt_scroll_hard.c:129: plot_screen2=0x8000;
	ld	hl, #0x8000
	ld	(_plot_screen2), hl
;src/txt_scroll_hard.c:130: c_screen3=4;
	ld	hl,#_c_screen3 + 0
	ld	(hl), #0x04
	jr	00107$
00105$:
;src/txt_scroll_hard.c:132: plot_screen2+=2;
	ld	hl, #_plot_screen2
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;src/txt_scroll_hard.c:133: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
	ld	hl, (_plot_screen2)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_plot_screen2), hl
00107$:
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
__xinit__firstPlotScreen2:
	.db #0x01	; 1
	.area _CABS (ABS)
