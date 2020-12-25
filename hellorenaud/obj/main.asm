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
	.globl _wait_frame_flyback
	.globl _bank0123
	.globl _calque8000
	.globl _calqueC000
	.globl _scroll_hard
	.globl _rupture
	.globl _restoreVBL
	.globl _killVBL
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
	.globl _cpct_setStackLocation
	.globl _cpct_memcpy
	.globl _cpct_memset_f64
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _slow
	.globl _hOffset
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
_hOffset::
	.ds 2
_slow::
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
;src/main.c:68: void wait_frame_flyback() {
;	---------------------------------
; Function wait_frame_flyback
; ---------------------------------
_wait_frame_flyback::
;src/main.c:74: __endasm;
	ld	b,#0xf5 ;wait frame flyback
	l1:
	in a,(c)
	rra
	jr	nc,l1
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
;src/main.c:77: void crtc(u8* R12R13) {
;	---------------------------------
; Function crtc
; ---------------------------------
_crtc::
;src/main.c:94: __endasm;
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
;src/main.c:107: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:110: intCounter=intCounter+1;
	ld	iy, #_intCounter
	inc	0 (iy)
;src/main.c:111: if (intCounter == 6) intCounter=0;
	ld	a, 0 (iy)
	sub	a, #0x06
	jr	NZ,00102$
	ld	0 (iy), #0x00
00102$:
;src/main.c:113: if (intCounter == 2) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/main.c:114: cpct_setBorder(2);
	ld	hl, #0x0210
	push	hl
	call	_cpct_setPALColour
	jr	00105$
00104$:
;src/main.c:116: cpct_setBorder(3);
	ld	hl, #0x0310
	push	hl
	call	_cpct_setPALColour
00105$:
;src/main.c:125: if (intCounter==5) {
	ld	iy, #_intCounter
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	NZ,00107$
;src/main.c:155: __endasm;
	ld	bc,#0xbc06
	out	(c),c
	ld	bc,#0xbd04
	out	(c),c
;src/main.c:157: screen_location++;
	ld	iy, #_screen_location
	inc	0 (iy)
	jr	NZ,00140$
	inc	1 (iy)
00140$:
;src/main.c:158: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x23
	ld	h, a
	ld	(_screen_location), hl
;src/main.c:159: crtc(screen_location);
	ld	hl, (_screen_location)
	push	hl
	call	_crtc
	pop	af
;src/main.c:161: screen_plot_address++;
	ld	iy, #_screen_plot_address
	inc	0 (iy)
	jr	NZ,00141$
	inc	1 (iy)
00141$:
;src/main.c:162: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:163: screen_plot_address++;
	inc	0 (iy)
	jr	NZ,00142$
	inc	1 (iy)
00142$:
;src/main.c:164: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:167: killVBL();
	call	_killVBL
;src/main.c:168: rupture(19-1);
	ld	a, #0x12
	push	af
	inc	sp
	call	_rupture
	inc	sp
00107$:
;src/main.c:173: if (intCounter==2) {
	ld	iy, #_intCounter
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	NZ,00109$
;src/main.c:179: __endasm;
	ld	bc,#0xbc06
	out	(c),c
	ld	bc,#0xbd19
	out	(c),c
;src/main.c:180: calqueC000();
	call	_calqueC000
;src/main.c:181: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:182: rupture(7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_rupture
	inc	sp
00109$:
;src/main.c:185: if (intCounter==3) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x03
	ret	NZ
;src/main.c:186: calqueC000();
	call	_calqueC000
;src/main.c:187: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:188: restoreVBL();
	call	_restoreVBL
;src/main.c:189: rupture(39-19-7+1);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_rupture
	inc	sp
	ret
;src/main.c:195: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:199: u8* sprite=g_items_0;
;src/main.c:218: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:219: cpct_memcpy(0x7000,0x8000,0x1000);
	ld	hl, #0x1000
	push	hl
	ld	h, #0x80
	push	hl
	ld	h, #0x70
	push	hl
	call	_cpct_memcpy
;src/main.c:220: cpct_setStackLocation(0x7000);
	ld	hl, #0x7000
	call	_cpct_setStackLocation
;src/main.c:221: cpct_memset_f64(0x8000, 0x0000, 0x4000);
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x80
	push	hl
	call	_cpct_memset_f64
;src/main.c:223: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:228: bank0123();
	call	_bank0123
;src/main.c:233: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:235: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:237: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:243: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:248: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
	push	hl
	ld	bc, #0x2000
	push	bc
	ld	bc, #0xffff
	push	bc
	ld	bc, #0xc000
	push	bc
	call	_cpct_memset_f64
	pop	hl
;src/main.c:251: cpct_hflipSpriteM0(4, 8, sprite);
	ld	bc, #_g_items_0
	push	hl
	push	bc
	push	bc
	ld	de, #0x0804
	push	de
	call	_cpct_hflipSpriteM0
	pop	bc
	pop	hl
;src/main.c:252: cpct_drawSprite(sprite, p, 4, 8);
	ld	de, #0x0804
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
;src/main.c:254: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:256: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
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
	pop	af
	inc	sp
;src/main.c:259: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	ld	hl, #0x4f09
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:260: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:299: calqueC000();
	call	_calqueC000
;src/main.c:308: calque8000(); // faut que le AND du début match
	call	_calque8000
;src/main.c:310: screen_location=(u8 *)(0x2000);
	ld	hl, #0x2000
	ld	(_screen_location), hl
;src/main.c:311: screen_plot_address=(u8 *)(0x8000+80-2);
	ld	hl, #0x804e
	ld	(_screen_plot_address), hl
;src/main.c:312: t=0;
	ld	bc, #0x0000
;src/main.c:313: while (1) {
00104$:
;src/main.c:316: wait_frame_flyback();
	push	bc
	call	_wait_frame_flyback
	pop	bc
;src/main.c:327: scroll_hard("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t,screen_plot_address);
	push	bc
	ld	hl, (_screen_plot_address)
	push	hl
	push	bc
	ld	hl, #0x006e
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_scroll_hard
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:328: t=t+1;
	inc	bc
;src/main.c:329: if (t>110*G_TILE_FONTMAP32X32PLAT_000_W+160) {t=0;}
	ld	a, #0x7c
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	jp	P, 00104$
	ld	bc, #0x0000
	jr	00104$
___str_0:
	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__intCounter:
	.db #0x00	; 0
__xinit__hOffset:
	.dw #0x0000
__xinit__slow:
	.db #0x00	; 0
	.area _CABS (ABS)
