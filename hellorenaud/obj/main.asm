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
	.globl _cpct_loadBinaryFile
	.globl _InitializeAmsdos
	.globl _StoreDriveLetter
	.globl _bank7_C000
	.globl _bank0123
	.globl _calque8000
	.globl _akp_musicPlay
	.globl _akp_musicInit
	.globl _scroll_hard
	.globl _rupture
	.globl _restoreVBL
	.globl _killVBL
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMemoryOffset
	.globl _cpct_setVideoMemoryPage
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_hflipSpriteM0
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_scanKeyboard_f
	.globl _cpct_setStackLocation
	.globl _cpct_memcpy
	.globl _cpct_memset_f64
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _intCounter
	.globl _screen_plot_address
	.globl _screen_location
	.globl _g_items_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_screen_location::
	.ds 2
_screen_plot_address::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_intCounter::
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
;src/main.c:46: void crtc(u8* R12R13) {
;	---------------------------------
; Function crtc
; ---------------------------------
_crtc::
;src/main.c:63: __endasm;
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
;src/main.c:74: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:77: intCounter=intCounter+1;
	ld	iy, #_intCounter
	inc	0 (iy)
;src/main.c:78: if (intCounter == 6) intCounter=0;
	ld	a, 0 (iy)
	sub	a, #0x06
	jr	NZ,00102$
	ld	0 (iy), #0x00
00102$:
;src/main.c:80: if (intCounter == 2) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/main.c:81: cpct_setBorder(0x54);
	ld	hl, #0x5410
	push	hl
	call	_cpct_setPALColour
	jr	00105$
00104$:
;src/main.c:83: cpct_setBorder(0x50);
	ld	hl, #0x5010
	push	hl
	call	_cpct_setPALColour
00105$:
;src/main.c:86: if (intCounter==5) {
	ld	iy, #_intCounter
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	NZ,00107$
;src/main.c:92: __endasm;
	ld	bc,#0xbc06
	out	(c),c
	ld	bc,#0xbd04
	out	(c),c
;src/main.c:94: crtc(screen_location);
	ld	hl, (_screen_location)
	push	hl
	call	_crtc
	pop	af
;src/main.c:96: killVBL();
	call	_killVBL
;src/main.c:97: rupture(19-1);
	ld	a, #0x12
	push	af
	inc	sp
	call	_rupture
	inc	sp
00107$:
;src/main.c:101: if (intCounter==2) {
	ld	iy, #_intCounter
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	NZ,00109$
;src/main.c:107: __endasm;
	ld	bc,#0xbc06
	out	(c),c
	ld	bc,#0xbd19
	out	(c),c
;src/main.c:108: cpct_setVideoMemoryPage(cpct_pageC0);
	ld	l, #0x30
	call	_cpct_setVideoMemoryPage
;src/main.c:109: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:110: rupture(7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_rupture
	inc	sp
00109$:
;src/main.c:113: if (intCounter==3) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x03
	jr	NZ,00111$
;src/main.c:114: cpct_setVideoMemoryPage(cpct_pageC0);
	ld	l, #0x30
	call	_cpct_setVideoMemoryPage
;src/main.c:115: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:116: restoreVBL();
	call	_restoreVBL
;src/main.c:117: rupture(39-19-7+1);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_rupture
	inc	sp
00111$:
;src/main.c:121: if (intCounter==4) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x04
	ret	NZ
;src/main.c:122: bank7_C000();
	call	_bank7_C000
;src/main.c:123: akp_musicPlay();
	call	_akp_musicPlay
;src/main.c:124: bank0123();
	call	_bank0123
	ret
;src/main.c:131: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:135: u8* sprite=g_items_0;
;src/main.c:137: StoreDriveLetter();
	call	_StoreDriveLetter
;src/main.c:138: InitializeAmsdos();
	call	_InitializeAmsdos
;src/main.c:140: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:141: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:142: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:144: cpct_loadBinaryFile("CPC-BAT.SCR", 0xC000);
	ld	hl, #0xc000
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_cpct_loadBinaryFile
	pop	af
	pop	af
;src/main.c:149: bank7_C000();
	call	_bank7_C000
;src/main.c:150: akp_musicInit();
	call	_akp_musicInit
;src/main.c:151: bank0123();
	call	_bank0123
;src/main.c:154: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:155: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
	ld	hl, #0x2000
	push	hl
	ld	h, #0x80
	push	hl
	ld	h, #0x60
	push	hl
	call	_cpct_memcpy
;src/main.c:156: cpct_setStackLocation(0x6000);
	ld	hl, #0x6000
	call	_cpct_setStackLocation
;src/main.c:157: cpct_memset_f64(0x8000, 0x0000, 0x4000);
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x80
	push	hl
	call	_cpct_memset_f64
;src/main.c:163: bank0123();
	call	_bank0123
;src/main.c:166: p = cpct_getScreenPtr(CPCT_VMEM_START, 0,110+16);
	ld	hl, #0x7e00
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:167: cpct_hflipSpriteM0(4, 8, sprite);
	ld	bc, #_g_items_0
	push	hl
	push	bc
	push	bc
	ld	de, #0x0804
	push	de
	call	_cpct_hflipSpriteM0
	pop	bc
	pop	hl
;src/main.c:168: cpct_drawSprite(sprite, p, 4, 8);
	ld	de, #0x0804
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
;src/main.c:171: p = cpct_getScreenPtr(CPCT_VMEM_START, 1,96+16);
	ld	hl, #0x7001
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:172: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:174: calque8000();
	call	_calque8000
;src/main.c:177: screen_location=(u8 *)(0x2000);
	ld	hl, #0x2000
	ld	(_screen_location), hl
;src/main.c:178: screen_plot_address=(u8 *)(0x8000+80-2);
	ld	hl, #0x804e
	ld	(_screen_plot_address), hl
;src/main.c:180: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:182: while (1) {
	ld	bc, #0x0000
00104$:
;src/main.c:183: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	pop	bc
;src/main.c:185: screen_location++;
	ld	iy, #_screen_location
	inc	0 (iy)
	jr	NZ,00116$
	inc	1 (iy)
00116$:
;src/main.c:186: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x23
	ld	h, a
	ld	(_screen_location), hl
;src/main.c:190: screen_plot_address+=2;
	ld	hl, #_screen_plot_address
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;src/main.c:191: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:197: scroll_hard(t,screen_plot_address);
	push	bc
	ld	hl, (_screen_plot_address)
	push	hl
	push	bc
	call	_scroll_hard
	pop	af
	pop	af
	pop	bc
;src/main.c:199: t=t+1;
	inc	bc
;src/main.c:201: cpct_scanKeyboard_f();
	push	bc
	call	_cpct_scanKeyboard_f
	call	_cpct_isAnyKeyPressed_f
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/main.c:203: cpct_memset_f64(0x8000, 0x0000, 0x4000);
	push	bc
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x80
	push	hl
	call	_cpct_memset_f64
	pop	bc
	jr	00104$
___str_0:
	.ascii "CPC-BAT.SCR"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__intCounter:
	.db #0x00	; 0
	.area _CABS (ABS)
