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
;src/main.c:157: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x23
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
;src/main.c:161: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:162: screen_plot_address++;
	inc	0 (iy)
	jr	NZ,00142$
	inc	1 (iy)
00142$:
;src/main.c:163: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
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
;src/main.c:195: int s=0;
	ld	bc, #0x0000
;src/main.c:197: u8* sprite=g_items_0;
;src/main.c:201: int o=0;
	ld	hl, #0x0000
	ex	(sp), hl
;src/main.c:216: cpct_disableFirmware();
	push	bc
	call	_cpct_disableFirmware
	ld	hl, #0x1000
	push	hl
	ld	h, #0x80
	push	hl
	ld	h, #0x70
	push	hl
	call	_cpct_memcpy
	ld	hl, #0x7000
	call	_cpct_setStackLocation
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x80
	push	hl
	call	_cpct_memset_f64
	call	_bank0123
	ld	l, #0x00
	call	_cpct_setVideoMode
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/main.c:246: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
	push	hl
	push	bc
	ld	de, #0x2000
	push	de
	ld	de, #0xffff
	push	de
	ld	de, #0xc000
	push	de
	call	_cpct_memset_f64
	ld	de, #_g_items_0
	push	de
	ld	de, #0x0804
	push	de
	call	_cpct_hflipSpriteM0
	pop	bc
	pop	hl
;src/main.c:250: cpct_drawSprite(sprite, p, 4, 8);
	push	bc
	ld	de, #0x0804
	push	de
	push	hl
	ld	hl, #_g_items_0
	push	hl
	call	_cpct_drawSprite
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/main.c:254: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
	push	hl
	push	bc
	ld	de, #0x0302
	push	de
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	pop	iy
	push	bc
	ld	hl, #0x140a
	push	hl
	push	de
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ld	hl, #0x4f09
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	ld	hl, #0x2010
	push	hl
	push	de
	ld	hl, #_g_tile_schtroumpf
	push	hl
	call	_cpct_drawSpriteMasked
	call	_calqueC000
	call	_calque8000
	pop	bc
;src/main.c:308: screen_location=(u8 *)(0x2000);
	ld	hl, #0x2000
	ld	(_screen_location), hl
;src/main.c:309: screen_plot_address=(u8 *)(0x8000+80-2);
	ld	hl, #0x804e
	ld	(_screen_plot_address), hl
;src/main.c:311: while (1) {
00107$:
;src/main.c:314: wait_frame_flyback();
	push	bc
	call	_wait_frame_flyback
	pop	bc
;src/main.c:318: screen_location++;
	ld	iy, #_screen_location
	inc	0 (iy)
	jr	NZ,00135$
	inc	1 (iy)
00135$:
;src/main.c:319: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x23
	ld	h, a
	ld	(_screen_location), hl
;src/main.c:320: crtc(screen_location);
	push	bc
	ld	hl, (_screen_location)
	push	hl
	call	_crtc
	pop	af
	pop	bc
;src/main.c:322: screen_plot_address++;
	ld	iy, #_screen_plot_address
	inc	0 (iy)
	jr	NZ,00136$
	inc	1 (iy)
00136$:
;src/main.c:323: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:324: screen_plot_address++;
	inc	0 (iy)
	jr	NZ,00137$
	inc	1 (iy)
00137$:
;src/main.c:325: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x87
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:329: s=s+1;
	inc	bc
;src/main.c:330: if (s==8) {s=0;}
	ld	a, c
	sub	a, #0x08
	or	a, b
	jr	NZ,00102$
	ld	bc, #0x0000
00102$:
;src/main.c:336: o=o+1;//(texte[texte_cur]-'?')*8+s;
	inc	-2 (ix)
	jr	NZ,00140$
	inc	-1 (ix)
00140$:
;src/main.c:337: if (o==8) {o=0;}
	ld	a, -2 (ix)
	sub	a, #0x08
	or	a, -1 (ix)
	jr	NZ,00104$
	ld	hl, #0x0000
	ex	(sp), hl
00104$:
;src/main.c:339: pointeur=(u8 *)g_tile_fontmap32x32plat_000;
;src/main.c:340: pointeur=pointeur+8*(32*2);
	ld	de, #_g_tile_fontmap32x32plat_000 + 512
;src/main.c:341: for (oc=0;oc<o;oc++) {
	ld	hl, #0x0000
00110$:
	ld	a, l
	sub	a, -2 (ix)
	ld	a, h
	sbc	a, -1 (ix)
	jp	PO, 00143$
	xor	a, #0x80
00143$:
	jp	P, 00119$
;src/main.c:342: pointeur=pointeur+(32*2);
	ld	a, e
	add	a, #0x40
	ld	e, a
	ld	a, d
	adc	a, #0x00
	ld	d, a
;src/main.c:341: for (oc=0;oc<o;oc++) {
	inc	hl
	jr	00110$
00119$:
;src/main.c:344: cpct_drawSprite(pointeur, screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
	ld	iy, (_screen_plot_address)
	push	bc
	ld	hl, #0x2002
	push	hl
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
	jp	00107$
___str_0:
	.ascii "HELLO@LES@AMIS@@"
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
