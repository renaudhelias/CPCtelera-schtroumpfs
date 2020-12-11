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
	.globl _bank0123
	.globl _calque4000
	.globl _calqueC000
	.globl _raster_halt
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMemoryOffset
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawCharM0
	.globl _cpct_hflipSpriteM0
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_px2byteM0
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_setStackLocation
	.globl _cpct_memset_f64
	.globl _cpct_setInterruptHandler
	.globl _g_items_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_myInterruptHandler_i_1_80:
	.ds 1
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
;src/main.c:41: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:45: cpct_setBorder(i+1);
	ld	hl,#_myInterruptHandler_i_1_80 + 0
	ld	b, (hl)
	inc	b
	push	bc
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_cpct_setPALColour
;src/main.c:46: if (++i > 5) i=0;
	ld	iy, #_myInterruptHandler_i_1_80
	inc	0 (iy)
	ld	a, #0x05
	sub	a, 0 (iy)
	ret	NC
	ld	0 (iy), #0x00
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
;src/main.c:55: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:58: u8* sprite=g_items_0;
;src/main.c:71: raster_halt();
	call	_raster_halt
;src/main.c:72: cpct_setStackLocation(0x8000);
	ld	hl, #0x8000
	call	_cpct_setStackLocation
;src/main.c:77: bank0123();
	call	_bank0123
;src/main.c:78: calque4000();
	call	_calque4000
;src/main.c:82: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:84: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:85: cpct_setPalette(g_tile_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:89: cpct_setVideoMemoryOffset(3);
	ld	l, #0x03
	call	_cpct_setVideoMemoryOffset
;src/main.c:92: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:93: cpct_drawSprite(sprite, p, 4, 8);
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
;src/main.c:101: cpct_drawSprite(sprite, p, 4, 8);
	ld	bc, #0x0804
	push	bc
	push	hl
	ld	hl, #_g_items_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:103: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:104: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
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
;src/main.c:107: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
	inc	sp
	ld	hl,#0x5814
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:108: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
	ld	bc, #___str_0+0
	ld	de, #0x0002
	push	de
	push	hl
	push	bc
	call	_cpct_drawStringM0
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:111: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	ld	hl, #0x4f09
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:112: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:114: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
	ld	hl, #0x960a
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:115: cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
	ld	bc, #___str_1+0
	ld	de, #0x0203
	push	de
	push	hl
	push	bc
	call	_cpct_drawStringM0
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:117: cpct_srand(77);
	ld	hl,#0x004d
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:124: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:125: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
00102$:
	ld	hl, #0x4000
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00104$
	ld	hl, #0x0402
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00104$
;src/main.c:126: p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
	ld	hl, #0x5e07
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:127: cpct_drawCharM0(p, 2,0, cpct_rand());
	push	hl
	call	_cpct_getRandom_mxor_u8
	ld	d, l
	pop	hl
	ld	c, l
	ld	b, h
	push	de
	inc	sp
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_cpct_drawCharM0
	pop	af
	pop	af
	inc	sp
;src/main.c:128: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00102$
00104$:
;src/main.c:130: calqueC000();
	call	_calqueC000
;src/main.c:131: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:132: while (1) {}
00106$:
	jr	00106$
___str_0:
	.ascii "Welcome to you!"
	.db 0x00
___str_1:
	.ascii "Press ENTER."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
