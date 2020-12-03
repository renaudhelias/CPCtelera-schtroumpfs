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
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawCharM0
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_px2byteM0
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _cpct_disableFirmware
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
;src/main.c:34: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;src/main.c:37: u8* sprite=g_items_0;
;src/main.c:42: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:43: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:44: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:45: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:46: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:49: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
	ld	hl, #0x5814
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	-6 (ix), l
	ld	-5 (ix), h
;src/main.c:59: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:60: cpct_drawSprite(sprite, p, 4, 8);
	ld	bc, #0x0804
	push	bc
	push	hl
	ld	hl, #_g_items_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:62: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:63: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
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
;src/main.c:67: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	ld	hl, #___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:71: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	ld	hl, #0x4f09
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:72: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:75: while (1){
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), a
00116$:
;src/main.c:76: seed++;
	inc	-4 (ix)
	jr	NZ,00156$
	inc	-3 (ix)
	jr	NZ,00156$
	inc	-2 (ix)
	jr	NZ,00156$
	inc	-1 (ix)
00156$:
;src/main.c:78: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:82: if      (cpct_isKeyPressed(Key_CursorRight) && pos < 0xFF ) ++pos; 
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00105$
	ld	a, -7 (ix)
	sub	a, #0xff
	jr	NC,00105$
	inc	-7 (ix)
	jr	00106$
00105$:
;src/main.c:83: else if (cpct_isKeyPressed(Key_CursorLeft)  && pos > 0    ) --pos; 
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00106$
	ld	a, -7 (ix)
	or	a, a
	jr	Z,00106$
	dec	-7 (ix)
00106$:
;src/main.c:84: if      (cpct_isKeyPressed(Key_CursorUp)    && pos > 0    ) --pos;
	ld	hl, #0x0100
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00112$
	ld	a, -7 (ix)
	or	a, a
	jr	Z,00112$
	dec	-7 (ix)
	jr	00113$
00112$:
;src/main.c:85: else if (cpct_isKeyPressed(Key_CursorDown)  && pos < 0xFF ) ++pos;
	ld	hl, #0x0400
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00113$
	ld	a, -7 (ix)
	sub	a, #0xff
	jr	NC,00113$
	inc	-7 (ix)
00113$:
;src/main.c:88: p = cpct_getScreenPtr(CPCT_VMEM_START, 32-1,16-1);
	ld	hl, #0x0f1f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:89: cpct_drawCharM0(p, 2,0, pos);
	ld	a, -7 (ix)
	push	af
	inc	sp
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_cpct_drawCharM0
	pop	af
;src/main.c:90: p  = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
	inc	sp
	ld	hl,#0x5e07
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:91: cpct_srand(seed);
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
	call	_cpct_getRandom_mxor_u8
	ld	d, l
	pop	bc
	push	de
	inc	sp
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_cpct_drawCharM0
	pop	af
	pop	af
	inc	sp
	jp	00116$
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
___str_0:
	.ascii "Welcome to you!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
