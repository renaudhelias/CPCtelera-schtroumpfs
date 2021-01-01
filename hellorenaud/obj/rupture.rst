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
   4BC0                      26 _vblPosition::
   4BC0                      27 	.ds 2
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
   44A4                      52 _killVBL::
                             53 ;src/rupture.c:14: __endasm;
   44A4 01 07 BC      [10]   54 	ld	bc,#0xbc07 ; Kill VBL
   44A7 3E 7F         [ 7]   55 	ld	a,#0x7f
   44A9 ED 49         [12]   56 	out	(c),c
   44AB 04            [ 4]   57 	inc	b
   44AC ED 79         [12]   58 	out	(c),a
                             59 ;src/rupture.c:15: vblPosition=37;
   44AE 21 25 00      [10]   60 	ld	hl, #0x0025
   44B1 22 C0 4B      [16]   61 	ld	(_vblPosition), hl
   44B4 C9            [10]   62 	ret
                             63 ;src/rupture.c:18: void restoreVBL() {
                             64 ;	---------------------------------
                             65 ; Function restoreVBL
                             66 ; ---------------------------------
   44B5                      67 _restoreVBL::
                             68 ;src/rupture.c:25: __endasm;
   44B5 01 07 BC      [10]   69 	ld	bc,#0xbc07 ; On repositionne la VBL
   44B8 3A C0 4B      [13]   70 	ld	a,(_vblPosition)
   44BB ED 49         [12]   71 	out	(c),c
   44BD 04            [ 4]   72 	inc	b
   44BE ED 79         [12]   73 	out	(c),a
   44C0 C9            [10]   74 	ret
                             75 ;src/rupture.c:31: void rupture(unsigned char nbCharLigne) {
                             76 ;	---------------------------------
                             77 ; Function rupture
                             78 ; ---------------------------------
   44C1                      79 _rupture::
                             80 ;src/rupture.c:42: __endasm;
   44C1 01 04 BC      [10]   81 	ld	bc,#0xbc04 ; Rupture 1
                             82 ;;ld	a,(_nbCharLigne)
   44C4 21 02 00      [10]   83 	ld	hl, #2+0
   44C7 39            [11]   84 	add	hl, sp
   44C8 7E            [ 7]   85 	ld	a, (hl)
   44C9 3D            [ 4]   86 	dec	a
   44CA ED 49         [12]   87 	out	(c),c
   44CC 04            [ 4]   88 	inc	b
   44CD ED 79         [12]   89 	out	(c),a
                             90 ;src/rupture.c:43: vblPosition=vblPosition-nbCharLigne;
   44CF 21 02 00      [10]   91 	ld	hl, #2+0
   44D2 39            [11]   92 	add	hl, sp
   44D3 4E            [ 7]   93 	ld	c, (hl)
   44D4 06 00         [ 7]   94 	ld	b, #0x00
   44D6 21 C0 4B      [10]   95 	ld	hl, #_vblPosition
   44D9 7E            [ 7]   96 	ld	a, (hl)
   44DA 91            [ 4]   97 	sub	a, c
   44DB 77            [ 7]   98 	ld	(hl), a
   44DC 23            [ 6]   99 	inc	hl
   44DD 7E            [ 7]  100 	ld	a, (hl)
   44DE 98            [ 4]  101 	sbc	a, b
   44DF 77            [ 7]  102 	ld	(hl), a
   44E0 C9            [10]  103 	ret
                            104 	.area _CODE
                            105 	.area _INITIALIZER
   4BC7                     106 __xinit__vblPosition:
   4BC7 00 00               107 	.dw #0x0000
                            108 	.area _CABS (ABS)
