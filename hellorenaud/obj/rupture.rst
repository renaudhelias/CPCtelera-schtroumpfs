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
   4C0D                      26 _vblPosition::
   4C0D                      27 	.ds 2
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
   44A8                      52 _killVBL::
                             53 ;src/rupture.c:14: __endasm;
   44A8 01 07 BC      [10]   54 	ld	bc,#0xbc07 ; Kill VBL
   44AB 3E 7F         [ 7]   55 	ld	a,#0x7f
   44AD ED 49         [12]   56 	out	(c),c
   44AF 04            [ 4]   57 	inc	b
   44B0 ED 79         [12]   58 	out	(c),a
                             59 ;src/rupture.c:15: vblPosition=37;
   44B2 21 25 00      [10]   60 	ld	hl, #0x0025
   44B5 22 0D 4C      [16]   61 	ld	(_vblPosition), hl
   44B8 C9            [10]   62 	ret
                             63 ;src/rupture.c:18: void restoreVBL() {
                             64 ;	---------------------------------
                             65 ; Function restoreVBL
                             66 ; ---------------------------------
   44B9                      67 _restoreVBL::
                             68 ;src/rupture.c:25: __endasm;
   44B9 01 07 BC      [10]   69 	ld	bc,#0xbc07 ; On repositionne la VBL
   44BC 3A 0D 4C      [13]   70 	ld	a,(_vblPosition)
   44BF ED 49         [12]   71 	out	(c),c
   44C1 04            [ 4]   72 	inc	b
   44C2 ED 79         [12]   73 	out	(c),a
   44C4 C9            [10]   74 	ret
                             75 ;src/rupture.c:31: void rupture(unsigned char nbCharLigne) {
                             76 ;	---------------------------------
                             77 ; Function rupture
                             78 ; ---------------------------------
   44C5                      79 _rupture::
                             80 ;src/rupture.c:42: __endasm;
   44C5 01 04 BC      [10]   81 	ld	bc,#0xbc04 ; Rupture 1
                             82 ;;ld	a,(_nbCharLigne)
   44C8 21 02 00      [10]   83 	ld	hl, #2+0
   44CB 39            [11]   84 	add	hl, sp
   44CC 7E            [ 7]   85 	ld	a, (hl)
   44CD 3D            [ 4]   86 	dec	a
   44CE ED 49         [12]   87 	out	(c),c
   44D0 04            [ 4]   88 	inc	b
   44D1 ED 79         [12]   89 	out	(c),a
                             90 ;src/rupture.c:43: vblPosition=vblPosition-nbCharLigne;
   44D3 21 02 00      [10]   91 	ld	hl, #2+0
   44D6 39            [11]   92 	add	hl, sp
   44D7 4E            [ 7]   93 	ld	c, (hl)
   44D8 06 00         [ 7]   94 	ld	b, #0x00
   44DA 21 0D 4C      [10]   95 	ld	hl, #_vblPosition
   44DD 7E            [ 7]   96 	ld	a, (hl)
   44DE 91            [ 4]   97 	sub	a, c
   44DF 77            [ 7]   98 	ld	(hl), a
   44E0 23            [ 6]   99 	inc	hl
   44E1 7E            [ 7]  100 	ld	a, (hl)
   44E2 98            [ 4]  101 	sbc	a, b
   44E3 77            [ 7]  102 	ld	(hl), a
   44E4 C9            [10]  103 	ret
                            104 	.area _CODE
                            105 	.area _INITIALIZER
   4C15                     106 __xinit__vblPosition:
   4C15 00 00               107 	.dw #0x0000
                            108 	.area _CABS (ABS)
