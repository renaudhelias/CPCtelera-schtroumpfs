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
   4A7D                      26 _vblPosition::
   4A7D                      27 	.ds 2
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
   4388                      52 _killVBL::
                             53 ;src/rupture.c:14: __endasm;
   4388 01 07 BC      [10]   54 	ld	bc,#0xbc07 ; Kill VBL
   438B 3E 7F         [ 7]   55 	ld	a,#0x7f
   438D ED 49         [12]   56 	out	(c),c
   438F 04            [ 4]   57 	inc	b
   4390 ED 79         [12]   58 	out	(c),a
                             59 ;src/rupture.c:15: vblPosition=37;
   4392 21 25 00      [10]   60 	ld	hl, #0x0025
   4395 22 7D 4A      [16]   61 	ld	(_vblPosition), hl
   4398 C9            [10]   62 	ret
                             63 ;src/rupture.c:18: void restoreVBL() {
                             64 ;	---------------------------------
                             65 ; Function restoreVBL
                             66 ; ---------------------------------
   4399                      67 _restoreVBL::
                             68 ;src/rupture.c:25: __endasm;
   4399 01 07 BC      [10]   69 	ld	bc,#0xbc07 ; On repositionne la VBL
   439C 3A 7D 4A      [13]   70 	ld	a,(_vblPosition)
   439F ED 49         [12]   71 	out	(c),c
   43A1 04            [ 4]   72 	inc	b
   43A2 ED 79         [12]   73 	out	(c),a
   43A4 C9            [10]   74 	ret
                             75 ;src/rupture.c:31: void rupture(unsigned char nbCharLigne) {
                             76 ;	---------------------------------
                             77 ; Function rupture
                             78 ; ---------------------------------
   43A5                      79 _rupture::
                             80 ;src/rupture.c:42: __endasm;
   43A5 01 04 BC      [10]   81 	ld	bc,#0xbc04 ; Rupture 1
                             82 ;;ld	a,(_nbCharLigne)
   43A8 21 02 00      [10]   83 	ld	hl, #2+0
   43AB 39            [11]   84 	add	hl, sp
   43AC 7E            [ 7]   85 	ld	a, (hl)
   43AD 3D            [ 4]   86 	dec	a
   43AE ED 49         [12]   87 	out	(c),c
   43B0 04            [ 4]   88 	inc	b
   43B1 ED 79         [12]   89 	out	(c),a
                             90 ;src/rupture.c:43: vblPosition=vblPosition-nbCharLigne;
   43B3 21 02 00      [10]   91 	ld	hl, #2+0
   43B6 39            [11]   92 	add	hl, sp
   43B7 4E            [ 7]   93 	ld	c, (hl)
   43B8 06 00         [ 7]   94 	ld	b, #0x00
   43BA 21 7D 4A      [10]   95 	ld	hl, #_vblPosition
   43BD 7E            [ 7]   96 	ld	a, (hl)
   43BE 91            [ 4]   97 	sub	a, c
   43BF 77            [ 7]   98 	ld	(hl), a
   43C0 23            [ 6]   99 	inc	hl
   43C1 7E            [ 7]  100 	ld	a, (hl)
   43C2 98            [ 4]  101 	sbc	a, b
   43C3 77            [ 7]  102 	ld	(hl), a
   43C4 C9            [10]  103 	ret
                            104 	.area _CODE
                            105 	.area _INITIALIZER
   4A83                     106 __xinit__vblPosition:
   4A83 00 00               107 	.dw #0x0000
                            108 	.area _CABS (ABS)
