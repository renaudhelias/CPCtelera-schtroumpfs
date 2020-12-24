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
	.globl _wait_frame_flyback
	.globl _calque4000
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_memset_f64
	.globl _cpct_disableFirmware
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
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;src/main.c:169: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	push	af
;src/main.c:171: int s=0;
	ld	hl, #0x0000
	ex	(sp), hl
;src/main.c:186: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:199: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:201: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:203: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:264: cpct_memset_f64(0x4000,0x00,0x4000); // SCR_VMEM, 0, 0x4000
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x40
	push	hl
	call	_cpct_memset_f64
;src/main.c:274: calque4000(); // faut que le AND du début match
	call	_calque4000
;src/main.c:276: screen_location=0x1000;
	ld	hl, #0x1000
	ld	(_screen_location), hl
;src/main.c:277: screen_plot_address=0x4000+80-2;
	ld	hl, #0x404e
	ld	(_screen_plot_address), hl
;src/main.c:279: while (1) {
00102$:
;src/main.c:282: wait_frame_flyback();
	call	_wait_frame_flyback
;src/main.c:283: screen_location++;
	ld	iy, #_screen_location
	inc	0 (iy)
	jr	NZ,00110$
	inc	1 (iy)
00110$:
;src/main.c:284: screen_location=(u8 *)(((unsigned int)screen_location) & 0x13FF);
	ld	hl, (_screen_location)
	ld	a, h
	and	a, #0x13
	ld	h, a
	ld	(_screen_location), hl
;src/main.c:285: crtc(screen_location);
	ld	hl, (_screen_location)
	push	hl
	call	_crtc
	pop	af
;src/main.c:287: screen_plot_address++;
	ld	iy, #_screen_plot_address
	inc	0 (iy)
	jr	NZ,00111$
	inc	1 (iy)
00111$:
;src/main.c:288: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x47
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:289: screen_plot_address++;
	inc	0 (iy)
	jr	NZ,00112$
	inc	1 (iy)
00112$:
;src/main.c:290: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
	ld	hl, (_screen_plot_address)
	ld	a, h
	and	a, #0x47
	ld	h, a
	ld	(_screen_plot_address), hl
;src/main.c:295: s=(s+1)%8;
	pop	bc
	push	bc
	inc	bc
	ld	hl, #0x0008
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	inc	sp
	inc	sp
	push	hl
;src/main.c:296: cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_0_W, G_TILE_SCHTROUMPF4X32_0_H);
	ld	de, (_screen_plot_address)
	ld	bc, #_g_tile_schtroumpf4x32_tileset+0
	pop	hl
	push	hl
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
__xinit__screen_location:
	.dw #0x1000
__xinit__screen_plot_address:
	.dw #0x404e
	.area _CABS (ABS)
