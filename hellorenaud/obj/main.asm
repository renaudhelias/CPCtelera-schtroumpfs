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
	.globl _crtc
	.globl _bank7_C000
	.globl _bank0123
	.globl _calque8000
	.globl _akp_musicInit
	.globl _scroll_hard
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_hflipSpriteM0
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_setStackLocation
	.globl _cpct_memcpy
	.globl _cpct_memset_f64
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
;src/main.c:45: void crtc(u8* R12R13) {
;	---------------------------------
; Function crtc
; ---------------------------------
_crtc::
;src/main.c:62: __endasm;
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
;src/main.c:141: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:145: u8* sprite=g_items_0;
;src/main.c:153: bank7_C000();
	call	_bank7_C000
;src/main.c:154: akp_musicInit();
	call	_akp_musicInit
;src/main.c:155: bank0123();
	call	_bank0123
;src/main.c:158: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:159: cpct_memcpy(0x6000,0x8000,0x2000);
	ld	hl, #0x2000
	push	hl
	ld	h, #0x80
	push	hl
	ld	h, #0x60
	push	hl
	call	_cpct_memcpy
;src/main.c:160: cpct_setStackLocation(0x6000);
	ld	hl, #0x6000
	call	_cpct_setStackLocation
;src/main.c:161: cpct_memset_f64(0x8000, 0x0000, 0x4000);
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x80
	push	hl
	call	_cpct_memset_f64
;src/main.c:164: bank0123();
	call	_bank0123
;src/main.c:165: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:166: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:167: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:170: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
	ld	hl, #0x6e09
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:171: cpct_hflipSpriteM0(4, 8, sprite);
	ld	bc, #_g_items_0
	push	hl
	push	bc
	push	bc
	ld	de, #0x0804
	push	de
	call	_cpct_hflipSpriteM0
	pop	bc
	pop	hl
;src/main.c:172: cpct_drawSprite(sprite, p, 4, 8);
	ld	de, #0x0804
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
;src/main.c:175: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
	ld	hl, #0x600a
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:176: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:178: calque8000();
	call	_calque8000
;src/main.c:179: screen_location=(u8 *)(0x2000);
	ld	hl, #0x2000
	ld	(_screen_location), hl
;src/main.c:180: screen_plot_address=(u8 *)(0x8000+80-2);
	ld	hl, #0x804e
	ld	(_screen_plot_address), hl
;src/main.c:181: t=0;
	ld	bc, #0x0000
;src/main.c:182: while (1) {
00104$:
;src/main.c:183: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	pop	bc
;src/main.c:186: screen_location++;
	ld	iy, #_screen_location
	inc	0 (iy)
	jr	NZ,00116$
	inc	1 (iy)
00116$:
;src/main.c:187: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x23
	ld	h, a
	ld	(_screen_location), hl
;src/main.c:188: crtc(screen_location);
	push	bc
	ld	hl, (_screen_location)
	push	hl
	call	_crtc
	pop	af
	pop	bc
;src/main.c:190: screen_plot_address++;
	ld	iy, #_screen_plot_address
	inc	0 (iy)
	jr	NZ,00117$
	inc	1 (iy)
00117$:
;src/main.c:191: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:192: screen_plot_address++;
	inc	0 (iy)
	jr	NZ,00118$
	inc	1 (iy)
00118$:
;src/main.c:193: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:198: scroll_hard("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR          ", 120, t,screen_plot_address);
	push	bc
	ld	hl, (_screen_plot_address)
	push	hl
	push	bc
	ld	hl, #0x0078
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_scroll_hard
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:199: t=t+1;
	inc	bc
;src/main.c:200: if (t>=120*8) {t=0;}
	ld	a, c
	sub	a, #0xc0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x83
	jr	C,00104$
	ld	bc, #0x0000
	jr	00104$
___str_0:
	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR          "
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
