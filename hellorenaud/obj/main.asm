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
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
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
;src/main.c:37: u8* sprite=g_items_0;
;src/main.c:40: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:41: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:42: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:43: cpct_setPalette(g_tile_palette, 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, #_g_tile_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:44: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:47: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
	ld	hl, #0x5814
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:57: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
	push	hl
	ld	hl, #0x0f0f
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	de, #0x0804
	push	de
	push	hl
	ld	hl, #_g_items_0
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/main.c:62: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
	ld	hl, #0x0002
	push	hl
	push	bc
	ld	hl, #___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:66: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
	ld	hl, #0x4f09
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:67: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
	ld	bc, #_g_tile_schtroumpf+0
	ld	de, #0x2010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSpriteMasked
;src/main.c:70: while (1);
00102$:
	jr	00102$
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
