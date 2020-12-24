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
	.globl _calque4000
	.globl _calqueC000
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
	.globl _cpct_memset_f64
	.globl _cpct_setInterruptHandler
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
;src/main.c:67: void wait_frame_flyback() {
;	---------------------------------
; Function wait_frame_flyback
; ---------------------------------
_wait_frame_flyback::
;src/main.c:73: __endasm;
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
;src/main.c:76: void crtc(u8* R12R13) {
;	---------------------------------
; Function crtc
; ---------------------------------
_crtc::
;src/main.c:93: __endasm;
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
;src/main.c:106: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:109: intCounter=intCounter+1;
	ld	iy, #_intCounter
	inc	0 (iy)
;src/main.c:110: if (intCounter == 6) intCounter=0;
	ld	a, 0 (iy)
	sub	a, #0x06
	jr	NZ,00102$
	ld	0 (iy), #0x00
00102$:
;src/main.c:112: if (intCounter == 2) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/main.c:113: cpct_setBorder(2);
	ld	hl, #0x0210
	push	hl
	call	_cpct_setPALColour
	jr	00105$
00104$:
;src/main.c:115: cpct_setBorder(3);
	ld	hl, #0x0310
	push	hl
	call	_cpct_setPALColour
00105$:
;src/main.c:124: if (intCounter==5) {
	ld	iy, #_intCounter
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	NZ,00107$
;src/main.c:154: __endasm;
	ld	bc,#0xbc06
	out	(c),c
	ld	bc,#0xbd04
	out	(c),c
;src/main.c:156: screen_location++;
	ld	iy, #_screen_location
	inc	0 (iy)
	jr	NZ,00140$
	inc	1 (iy)
00140$:
;src/main.c:157: screen_location=(u8 *)(((unsigned int)screen_location) & 0x13FF);
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x13
	ld	h, a
	ld	(_screen_location), hl
;src/main.c:158: crtc(screen_location);
	ld	hl, (_screen_location)
	push	hl
	call	_crtc
	pop	af
;src/main.c:160: screen_plot_address++;
	ld	iy, #_screen_plot_address
	inc	0 (iy)
	jr	NZ,00141$
	inc	1 (iy)
00141$:
;src/main.c:161: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x47
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:162: screen_plot_address++;
	inc	0 (iy)
	jr	NZ,00142$
	inc	1 (iy)
00142$:
;src/main.c:163: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x47
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:166: killVBL();
	call	_killVBL
;src/main.c:167: rupture(19-1);
	ld	a, #0x12
	push	af
	inc	sp
	call	_rupture
	inc	sp
00107$:
;src/main.c:172: if (intCounter==2) {
	ld	iy, #_intCounter
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	NZ,00109$
;src/main.c:178: __endasm;
	ld	bc,#0xbc06
	out	(c),c
	ld	bc,#0xbd19
	out	(c),c
;src/main.c:179: calqueC000();
	call	_calqueC000
;src/main.c:180: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:181: rupture(7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_rupture
	inc	sp
00109$:
;src/main.c:184: if (intCounter==3) {
	ld	a,(#_intCounter + 0)
	sub	a, #0x03
	ret	NZ
;src/main.c:185: calqueC000();
	call	_calqueC000
;src/main.c:186: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:187: restoreVBL();
	call	_restoreVBL
;src/main.c:188: rupture(39-19-7+1);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_rupture
	inc	sp
	ret
;src/main.c:193: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:195: int s=0;
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
;src/main.c:197: u8* sprite=g_items_0;
;src/main.c:213: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:223: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:225: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:227: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:238: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
	ld	hl, #0x2000
	push	hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_memset_f64
;src/main.c:241: cpct_hflipSpriteM0(4, 8, sprite);
	ld	bc, #_g_items_0
	push	bc
	push	bc
	ld	hl, #0x0804
	push	hl
	call	_cpct_hflipSpriteM0
	pop	bc
;src/main.c:242: cpct_drawSprite(sprite, p, 4, 8);
	pop	de
	push	de
	ld	hl, #0x0804
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
;src/main.c:244: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:246: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
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
;src/main.c:249: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	ld	hl, #0x4f09
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	inc	sp
	inc	sp
;src/main.c:250: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	c, l
	ld	b, h
	push	bc
	ld	hl, #0x2010
	push	hl
	push	bc
	ld	hl, #_g_tile_schtroumpf
	push	hl
	call	_cpct_drawSpriteMasked
;src/main.c:288: cpct_memset_f64(0x4000,0x00,0x4000); // SCR_VMEM, 0, 0x4000
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x40
	push	hl
	call	_cpct_memset_f64
;src/main.c:298: calque4000(); // faut que le AND du début match
	call	_calque4000
;src/main.c:300: screen_location=0x1000;
	ld	hl, #0x1000
	ld	(_screen_location), hl
;src/main.c:301: screen_plot_address=0x4000+80-2;
	ld	hl, #0x404e
	ld	(_screen_plot_address), hl
;src/main.c:303: while (1) {
00102$:
;src/main.c:306: wait_frame_flyback();
	call	_wait_frame_flyback
;src/main.c:311: s=(s+1)%8;
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	inc	bc
	ld	hl, #0x0008
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	-2 (ix), l
	ld	-1 (ix), h
;src/main.c:312: cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_0_W, G_TILE_SCHTROUMPF4X32_0_H);
	ld	de, (_screen_plot_address)
	ld	bc, #_g_tile_schtroumpf4x32_tileset+0
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x2002
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
	.area _CABS (ABS)
