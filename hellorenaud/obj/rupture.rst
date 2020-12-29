                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module rupture
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _rupture
                             12 	.globl _restoreVBL
                             13 	.globl _killVBL
                             14 	.globl _vblPosition
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
   4A67                      26 _vblPosition::
   4A67                      27 	.ds 2
                             28 ;--------------------------------------------------------
                             29 ; absolute external ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DABS (ABS)
                             32 ;--------------------------------------------------------
                             33 ; global & static initialisations
                             34 ;--------------------------------------------------------
                             35 	.area _HOME
                             36 	.area _GSINIT
                             37 	.area _GSFINAL
                             38 	.area _GSINIT
                             39 ;--------------------------------------------------------
                             40 ; Home
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _HOME
                             44 ;--------------------------------------------------------
                             45 ; code
                             46 ;--------------------------------------------------------
                             47 	.area _CODE
                             48 ;src/rupture.c:7: void killVBL() {
                             49 ;	---------------------------------
                             50 ; Function killVBL
                             51 ; ---------------------------------
   4372                      52 _killVBL::
                             53 ;src/rupture.c:14: __endasm;
   4372 01 07 BC      [10]   54 	ld	bc,#0xbc07 ; Kill VBL
   4375 3E 7F         [ 7]   55 	ld	a,#0x7f
   4377 ED 49         [12]   56 	out	(c),c
   4379 04            [ 4]   57 	inc	b
   437A ED 79         [12]   58 	out	(c),a
                             59 ;src/rupture.c:15: vblPosition=37;
   437C 21 25 00      [10]   60 	ld	hl, #0x0025
   437F 22 67 4A      [16]   61 	ld	(_vblPosition), hl
   4382 C9            [10]   62 	ret
                             63 ;src/rupture.c:18: void restoreVBL() {
                             64 ;	---------------------------------
                             65 ; Function restoreVBL
                             66 ; ---------------------------------
   4383                      67 _restoreVBL::
                             68 ;src/rupture.c:25: __endasm;
   4383 01 07 BC      [10]   69 	ld	bc,#0xbc07 ; On repositionne la VBL
   4386 3A 67 4A      [13]   70 	ld	a,(_vblPosition)
   4389 ED 49         [12]   71 	out	(c),c
   438B 04            [ 4]   72 	inc	b
   438C ED 79         [12]   73 	out	(c),a
   438E C9            [10]   74 	ret
                             75 ;src/rupture.c:31: void rupture(unsigned char nbCharLigne) {
                             76 ;	---------------------------------
                             77 ; Function rupture
                             78 ; ---------------------------------
   438F                      79 _rupture::
                             80 ;src/rupture.c:42: __endasm;
   438F 01 04 BC      [10]   81 	ld	bc,#0xbc04 ; Rupture 1
                             82 ;;ld	a,(_nbCharLigne)
   4392 21 02 00      [10]   83 	ld	hl, #2+0
   4395 39            [11]   84 	add	hl, sp
   4396 7E            [ 7]   85 	ld	a, (hl)
   4397 3D            [ 4]   86 	dec	a
   4398 ED 49         [12]   87 	out	(c),c
   439A 04            [ 4]   88 	inc	b
   439B ED 79         [12]   89 	out	(c),a
                             90 ;src/rupture.c:43: vblPosition=vblPosition-nbCharLigne;
   439D 21 02 00      [10]   91 	ld	hl, #2+0
   43A0 39            [11]   92 	add	hl, sp
   43A1 4E            [ 7]   93 	ld	c, (hl)
   43A2 06 00         [ 7]   94 	ld	b, #0x00
   43A4 21 67 4A      [10]   95 	ld	hl, #_vblPosition
   43A7 7E            [ 7]   96 	ld	a, (hl)
   43A8 91            [ 4]   97 	sub	a, c
   43A9 77            [ 7]   98 	ld	(hl), a
   43AA 23            [ 6]   99 	inc	hl
   43AB 7E            [ 7]  100 	ld	a, (hl)
   43AC 98            [ 4]  101 	sbc	a, b
   43AD 77            [ 7]  102 	ld	(hl), a
   43AE C9            [10]  103 	ret
                            104 	.area _CODE
                            105 	.area _INITIALIZER
   4A6D                     106 __xinit__vblPosition:
   4A6D 00 00               107 	.dw #0x0000
                            108 	.area _CABS (ABS)
