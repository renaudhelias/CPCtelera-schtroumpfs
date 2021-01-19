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
	.globl _cpct_loadBinaryFile
	.globl _InitializeAmsdos
	.globl _StoreDriveLetter
	.globl _cpct_getScreenPtr
	.globl _cpct_drawStringM1
	.globl _cpct_memset
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
;src/main.c:22: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:25: StoreDriveLetter();
	call	_StoreDriveLetter
;src/main.c:26: InitializeAmsdos();
	call	_InitializeAmsdos
;src/main.c:29: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:32: cpct_loadBinaryFile("FOND.SCR", 0xC000);
	ld	hl, #0xc000
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_cpct_loadBinaryFile
	pop	af
;src/main.c:36: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
	ld	hl, #0x6014
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:37: cpct_drawStringM1("Welcome to CPCtelera!", pvmem, 1, 0);
	ld	bc, #___str_1+0
	ld	de, #0x0001
	push	de
	push	hl
	push	bc
	call	_cpct_drawStringM1
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:40: while (1);
00102$:
	jr	00102$
___str_0:
	.ascii "FOND.SCR"
	.db 0x00
___str_1:
	.ascii "Welcome to CPCtelera!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
