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
	.globl _bank4_4000
	.globl _bank0123
	.globl _calque4000
	.globl _calqueC000
	.globl _akp_sfxPlay
	.globl _akp_musicPlay
	.globl _akp_musicInit
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
	.globl _cpct_memset_f64
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
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
;src/main.c:42: void myInterruptHandler() {
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:46: cpct_setBorder(i+1);
	ld	hl,#_myInterruptHandler_i_1_80 + 0
	ld	b, (hl)
	inc	b
	push	bc
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_cpct_setPALColour
;src/main.c:47: if (++i > 5) i=0;
	ld	iy, #_myInterruptHandler_i_1_80
	inc	0 (iy)
	ld	a, #0x05
	sub	a, 0 (iy)
	jr	NC,00102$
	ld	0 (iy), #0x00
00102$:
;src/main.c:50: if (i==2) {
	ld	a,(#_myInterruptHandler_i_1_80 + 0)
	sub	a, #0x02
	ret	NZ
;src/main.c:51: akp_musicPlay();
	call	_akp_musicPlay
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
;src/main.c:56: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:58: u8* sprite=g_items_0;
;src/main.c:67: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:71: bank4_4000();
	call	_bank4_4000
;src/main.c:72: bank0123();
	call	_bank0123
;src/main.c:73: calqueC000();
	call	_calqueC000
;src/main.c:76: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:79: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:80: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:81: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:84: cpct_setVideoMemoryOffset(3);
	ld	l, #0x03
	call	_cpct_setVideoMemoryOffset
;src/main.c:87: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:88: cpct_drawSprite(sprite, p, 4, 8);
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
;src/main.c:96: cpct_drawSprite(sprite, p, 4, 8);
	ld	bc, #0x0804
	push	bc
	push	hl
	ld	hl, #_g_items_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:98: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
	ld	hl, #0x1f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:100: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
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
;src/main.c:103: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	inc	sp
	ld	hl,#0x4f09
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:104: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:106: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,120-1);
	ld	hl, #0x7709
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:107: cpct_drawSprite(g_tile_fontmap20x22_00, p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
	ld	bc, #_g_tile_fontmap20x22_00+0
	ld	de, #0x160a
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
;src/main.c:117: cpct_srand(77);
	ld	hl,#0x004d
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:121: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:122: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
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
;src/main.c:123: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00102$
00104$:
;src/main.c:127: akp_musicInit();
	call	_akp_musicInit
;src/main.c:131: cpct_setVideoMemoryOffset(0);
	ld	l, #0x00
	call	_cpct_setVideoMemoryOffset
;src/main.c:132: calque4000();
	call	_calque4000
;src/main.c:134: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:135: while (1) {
00108$:
;src/main.c:136: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:137: if (cpct_isKeyPressed(Key_Space)) {
	ld	hl, #0x8005
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00108$
;src/main.c:138: akp_sfxPlay();
	call	_akp_sfxPlay
	jr	00108$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
