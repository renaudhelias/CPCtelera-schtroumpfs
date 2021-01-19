                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _cpct_loadBinaryFile
                             13 	.globl _InitializeAmsdos
                             14 	.globl _StoreDriveLetter
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_drawStringM1
                             17 	.globl _cpct_memset
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/main.c:22: void main(void) {
                             50 ;	---------------------------------
                             51 ; Function main
                             52 ; ---------------------------------
   4000                      53 _main::
                             54 ;src/main.c:25: StoreDriveLetter();
   4000 CD 5C 40      [17]   55 	call	_StoreDriveLetter
                             56 ;src/main.c:26: InitializeAmsdos();
   4003 CD 6A 40      [17]   57 	call	_InitializeAmsdos
                             58 ;src/main.c:29: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   4006 21 00 40      [10]   59 	ld	hl, #0x4000
   4009 E5            [11]   60 	push	hl
   400A AF            [ 4]   61 	xor	a, a
   400B F5            [11]   62 	push	af
   400C 33            [ 6]   63 	inc	sp
   400D 26 C0         [ 7]   64 	ld	h, #0xc0
   400F E5            [11]   65 	push	hl
   4010 CD 92 41      [17]   66 	call	_cpct_memset
                             67 ;src/main.c:32: cpct_loadBinaryFile("FOND.SCR", 0xC000);
   4013 21 00 C0      [10]   68 	ld	hl, #0xc000
   4016 E5            [11]   69 	push	hl
   4017 21 3D 40      [10]   70 	ld	hl, #___str_0
   401A E5            [11]   71 	push	hl
   401B CD A7 40      [17]   72 	call	_cpct_loadBinaryFile
   401E F1            [10]   73 	pop	af
                             74 ;src/main.c:36: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
   401F 21 14 60      [10]   75 	ld	hl, #0x6014
   4022 E3            [19]   76 	ex	(sp),hl
   4023 21 00 C0      [10]   77 	ld	hl, #0xc000
   4026 E5            [11]   78 	push	hl
   4027 CD A1 41      [17]   79 	call	_cpct_getScreenPtr
                             80 ;src/main.c:37: cpct_drawStringM1("Welcome to CPCtelera!", pvmem, 1, 0);
   402A 01 46 40      [10]   81 	ld	bc, #___str_1+0
   402D 11 01 00      [10]   82 	ld	de, #0x0001
   4030 D5            [11]   83 	push	de
   4031 E5            [11]   84 	push	hl
   4032 C5            [11]   85 	push	bc
   4033 CD E5 40      [17]   86 	call	_cpct_drawStringM1
   4036 21 06 00      [10]   87 	ld	hl, #6
   4039 39            [11]   88 	add	hl, sp
   403A F9            [ 6]   89 	ld	sp, hl
                             90 ;src/main.c:40: while (1);
   403B                      91 00102$:
   403B 18 FE         [12]   92 	jr	00102$
   403D                      93 ___str_0:
   403D 46 4F 4E 44 2E 53    94 	.ascii "FOND.SCR"
        43 52
   4045 00                   95 	.db 0x00
   4046                      96 ___str_1:
   4046 57 65 6C 63 6F 6D    97 	.ascii "Welcome to CPCtelera!"
        65 20 74 6F 20 43
        50 43 74 65 6C 65
        72 61 21
   405B 00                   98 	.db 0x00
                             99 	.area _CODE
                            100 	.area _INITIALIZER
                            101 	.area _CABS (ABS)
