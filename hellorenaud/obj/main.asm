;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _myInterruptHandler
	.globl _monterDerniereColonne
	.globl _bank4_4000
	.globl _bank0123
	.globl _calque4000
	.globl _calqueC000
	.globl _vsync
	.globl _rupture
	.globl _restoreVBL
	.globl _killVBL
	.globl _scroll
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMemoryOffset
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_hflipSpriteM0
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_px2byteM0
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memcpy
	.globl _cpct_memset_f64
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _hScroll
	.globl _intCounter
	.globl _g_items_0
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
_intCounter::
	.ds 1
_hScroll::
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
;src/main.c:49: void monterDerniereColonne() {
;	---------------------------------
; Function monterDerniereColonne
; ---------------------------------
_monterDerniereColonne::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:55: for (c=0;c<4;c++) {// caractères hauteur
	ld	bc, #0x0000
;src/main.c:56: for (l=0;l<8;l++) {
00109$:
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #0x404f
	add	hl, de
	ex	(sp), hl
	ld	de, #0x0000
00103$:
;src/main.c:58: plot_column=0x4000 + l*0x800 + 80*c+79;
	ld	a, e
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
;src/main.c:59: cpct_memcpy(plot_column,plot_column,1);
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0001
	push	hl
	push	iy
	push	iy
	call	_cpct_memcpy
	pop	de
	pop	bc
;src/main.c:56: for (l=0;l<8;l++) {
	inc	de
	ld	a, e
	sub	a, #0x08
	ld	a, d
	sbc	a, #0x00
	jr	C,00103$
;src/main.c:55: for (c=0;c<4;c++) {// caractères hauteur
	inc	bc
	ld	a, c
	sub	a, #0x04
	ld	a, b
	sbc	a, #0x00
	jr	C,00109$
	ld	sp, ix
	pop	ix
	ret
_g_items_0:
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;src/main.c:67: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:68: intCounter=intCounter+1;
	ld	iy, #_intCounter
	inc	0 (iy)
;src/main.c:69: if (intCounter == 6) intCounter=0;
	ld	a, 0 (iy)
	sub	a, #0x06
	jr	NZ,00102$
	ld	0 (iy), #0x00
00102$:
;src/main.c:71: if (intCounter == 2) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/main.c:72: cpct_setBorder(2);
	ld	hl, #0x0210
	push	hl
	call	_cpct_setPALColour
	jr	00105$
00104$:
;src/main.c:74: cpct_setBorder(3);
	ld	hl, #0x0310
	push	hl
	call	_cpct_setPALColour
00105$:
;src/main.c:83: if (intCounter==5) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x05
	jr	NZ,00109$
;src/main.c:84: calque4000();
	call	_calque4000
;src/main.c:86: hScroll+=1;
	ld	iy, #_hScroll
	inc	0 (iy)
;src/main.c:91: if (hScroll==240) {hScroll=0;}
	ld	a, 0 (iy)
	sub	a, #0xf0
	jr	NZ,00107$
	ld	0 (iy), #0x00
00107$:
;src/main.c:93: cpct_setVideoMemoryOffset(hScroll);
	ld	iy, #_hScroll
	ld	l, 0 (iy)
	call	_cpct_setVideoMemoryOffset
;src/main.c:94: killVBL();
	call	_killVBL
;src/main.c:95: rupture(19-1);
	ld	a, #0x12
	push	af
	inc	sp
	call	_rupture
	inc	sp
00109$:
;src/main.c:98: if (intCounter==2) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x02
	jr	NZ,00111$
;src/main.c:99: calqueC000();
	call	_calqueC000
;src/main.c:100: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:101: rupture(7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_rupture
	inc	sp
00111$:
;src/main.c:104: if (intCounter==3) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x03
	ret	NZ
;src/main.c:105: calqueC000();
	call	_calqueC000
;src/main.c:106: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:107: restoreVBL();
	call	_restoreVBL
;src/main.c:108: rupture(39-19-7+1);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_rupture
	inc	sp
	ret
;src/main.c:113: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:116: u8* sprite=g_items_0;
;src/main.c:132: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:136: bank4_4000();
	call	_bank4_4000
;src/main.c:137: bank0123();
	call	_bank0123
;src/main.c:138: calqueC000();
	call	_calqueC000
;src/main.c:141: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:144: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:145: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:146: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:151: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:152: cpct_drawSprite(sprite, p, 4, 8);
	push	hl
	ld	bc, #0x0804
	push	bc
	push	hl
	ld	bc, #_g_items_0
	push	bc
	call	_cpct_drawSprite
	ld	bc, #0x2000
	push	bc
	ld	bc, #0xffff
	push	bc
	ld	bc, #0xc000
	push	bc
	call	_cpct_memset_f64
	ld	bc, #_g_items_0
	push	bc
	ld	bc, #0x0804
	push	bc
	call	_cpct_hflipSpriteM0
	pop	hl
;src/main.c:160: cpct_drawSprite(sprite, p, 4, 8);
	ld	bc, #0x0804
	push	bc
	push	hl
	ld	hl, #_g_items_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:162: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:164: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
	push	hl
	ld	hl, #0x0302
	push	hl
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x140a
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
;src/main.c:167: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	inc	sp
	ld	hl,#0x4f09
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:168: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:182: cpct_srand(77);
	ld	hl,#0x004d
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:186: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:187: t=0;
	ld	bc, #0x0000
;src/main.c:188: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
00107$:
	push	bc
	ld	hl, #0x0080
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, h
	or	a,l
	jr	NZ,00108$
	push	bc
	ld	hl, #0x4000
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00109$
	push	bc
	ld	hl, #0x0402
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00109$
00108$:
;src/main.c:189: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
	push	bc
	push	bc
	ld	hl, #0x006e
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_scroll
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:190: t=t+1;
	inc	bc
;src/main.c:191: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
	ld	a, #0xec
	cp	a, c
	ld	a, #0x04
	sbc	a, b
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	P, 00102$
	ld	bc, #0x0000
00102$:
;src/main.c:192: if (t%128==0) {
	push	bc
	ld	hl, #0x0080
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, h
	or	a,l
	jr	NZ,00107$
;src/main.c:193: cpct_scanKeyboard_f();
	push	bc
	call	_cpct_scanKeyboard_f
	pop	bc
	jr	00107$
00109$:
;src/main.c:199: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:200: calque4000();
	call	_calque4000
;src/main.c:202: while (1) {
00111$:
;src/main.c:203: vsync();
	call	_vsync
	jr	00111$
___str_0:
	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__intCounter:
	.db #0x00	; 0
__xinit__hScroll:
	.db #0x00	; 0
	.area _CABS (ABS)
