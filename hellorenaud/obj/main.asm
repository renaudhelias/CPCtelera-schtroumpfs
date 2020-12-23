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
	.globl _crtc
	.globl _monter
	.globl _bank4_4000
	.globl _bank0123
	.globl _calqueC000
	.globl _vsync
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_hflipSpriteM0
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_px2byteM0
	.globl _cpct_memset_f64
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _screen_plot_address
	.globl _screen_location
	.globl _slow
	.globl _hOffset
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
_hOffset::
	.ds 2
_slow::
	.ds 1
_screen_location::
	.ds 2
_screen_plot_address::
	.ds 2
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
;src/main.c:53: void monter(unsigned int c,u16 hScroll) {
;	---------------------------------
; Function monter
; ---------------------------------
_monter::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:56: for (l=0;l<8;l++) {
	ld	c,4 (ix)
	ld	b,5 (ix)
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
	ld	hl, #0x0050
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	__moduint
	pop	af
	pop	af
	ld	-3 (ix), h
	ld	-4 (ix), l
	ld	bc, #0x0000
00102$:
;src/main.c:58: plot_column=(u8 *)(0x4000 + l*0x800 + 80*c + hScroll%80);
	ld	a, c
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	d, a
	ld	e, #0x00
	ld	hl, #0x4000
	add	hl, de
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	hl, de
	pop	de
	push	de
	add	hl, de
	ex	de,hl
;src/main.c:60: *plot_column=*plot_column+0X33;
	ld	a, (de)
	add	a, #0x33
	ld	(de), a
;src/main.c:62: plot_column=plot_column-1;
	dec	de
;src/main.c:63: *plot_column=*plot_column+0X33;
	ld	a, (de)
	add	a, #0x33
	ld	(de), a
;src/main.c:56: for (l=0;l<8;l++) {
	inc	bc
	ld	a, c
	sub	a, #0x08
	ld	a, b
	sbc	a, #0x00
	jr	C,00102$
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
;src/main.c:73: void crtc(u16 R12R13) {
;	---------------------------------
; Function crtc
; ---------------------------------
_crtc::
;src/main.c:90: __endasm;
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	ld	bc,#0xbc00+12
	out	(c),c
	inc	b
	out	(c),h
	dec	b
	inc	c
	out	(c),c
	inc	b
	out	(c),l
	pop	ix
	ret
;src/main.c:94: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:97: intCounter=intCounter+1;
	ld	iy, #_intCounter
	inc	0 (iy)
;src/main.c:98: if (intCounter == 6) intCounter=0;
	ld	a, 0 (iy)
	sub	a, #0x06
	jr	NZ,00102$
	ld	0 (iy), #0x00
00102$:
;src/main.c:100: if (intCounter == 2) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/main.c:101: cpct_setBorder(2);
	ld	hl, #0x0210
	push	hl
	call	_cpct_setPALColour
	ret
00104$:
;src/main.c:103: cpct_setBorder(3);
	ld	hl, #0x0310
	push	hl
	call	_cpct_setPALColour
;src/main.c:150: if (intCounter==3) {
	ret
;src/main.c:159: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	push	af
;src/main.c:161: int s=0;
	ld	hl, #0x0000
	ex	(sp), hl
;src/main.c:163: u8* sprite=g_items_0;
;src/main.c:179: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:183: bank4_4000();
	call	_bank4_4000
;src/main.c:184: bank0123();
	call	_bank0123
;src/main.c:185: calqueC000();
	call	_calqueC000
;src/main.c:188: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:191: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:192: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:193: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:198: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:199: cpct_drawSprite(sprite, p, 4, 8);
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
;src/main.c:207: cpct_drawSprite(sprite, p, 4, 8);
	ld	bc, #0x0804
	push	bc
	push	hl
	ld	hl, #_g_items_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:209: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:211: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
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
;src/main.c:214: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	inc	sp
	ld	hl,#0x4f09
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:215: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:229: cpct_srand(77);
	ld	hl,#0x004d
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:252: while (1) {
00102$:
;src/main.c:253: vsync();
	call	_vsync
;src/main.c:255: screen_location++;
	ld	iy, #_screen_location
	inc	0 (iy)
	jr	NZ,00110$
	inc	1 (iy)
00110$:
;src/main.c:256: screen_location=((unsigned int)screen_location) & 0x13FF;
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x13
	ld	h, a
	ld	(_screen_location), hl
;src/main.c:257: crtc((u16)screen_location);
	ld	hl, (_screen_location)
	push	hl
	call	_crtc
	pop	af
;src/main.c:259: screen_plot_address++;
	ld	iy, #_screen_plot_address
	inc	0 (iy)
	jr	NZ,00111$
	inc	1 (iy)
00111$:
;src/main.c:260: screen_plot_address++;
	inc	0 (iy)
	jr	NZ,00112$
	inc	1 (iy)
00112$:
;src/main.c:261: screen_plot_address=((unsigned int)screen_plot_address) & 0x47FF;
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x47
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:263: p = cpct_getScreenPtr(screen_plot_address, 0,0);
	ld	hl, (_screen_plot_address)
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:264: s=(s+1)%32;
	pop	bc
	push	bc
	inc	bc
	ld	hl, #0x0020
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	inc	sp
	inc	sp
	push	hl
;src/main.c:266: cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_00_W, G_TILE_SCHTROUMPF4X32_00_H);
	ld	de, (_screen_plot_address)
	ld	bc, #_g_tile_schtroumpf4x32_tileset+0
	pop	hl
	push	hl
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	jr	00102$
	.area _CODE
	.area _INITIALIZER
__xinit__intCounter:
	.db #0x00	; 0
__xinit__hOffset:
	.dw #0x0000
__xinit__slow:
	.db #0x00	; 0
__xinit__screen_location:
	.dw #0x1000
__xinit__screen_plot_address:
	.dw #0x404e
	.area _CABS (ABS)
