                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module txt_scroll_hard
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _scroll_hard
                             12 	.globl _cpct_drawSprite
                             13 	.globl _texte
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 ;src/txt_scroll_hard.c:14: void scroll_hard(int step, u8* screen_plot_address) {
                             46 ;	---------------------------------
                             47 ; Function scroll_hard
                             48 ; ---------------------------------
   0348                      49 _scroll_hard::
   0348 DD E5         [15]   50 	push	ix
   034A DD 21 00 00   [14]   51 	ld	ix,#0
   034E DD 39         [15]   52 	add	ix,sp
   0350 F5            [11]   53 	push	af
                             54 ;src/txt_scroll_hard.c:20: u8* plot=screen_plot_address;
   0351 DD 7E 06      [19]   55 	ld	a, 6 (ix)
   0354 DD 77 FE      [19]   56 	ld	-2 (ix), a
   0357 DD 7E 07      [19]   57 	ld	a, 7 (ix)
   035A DD 77 FF      [19]   58 	ld	-1 (ix), a
                             59 ;src/txt_scroll_hard.c:23: div=step/8;
   035D DD 6E 04      [19]   60 	ld	l,4 (ix)
   0360 DD 66 05      [19]   61 	ld	h,5 (ix)
   0363 CB 7C         [ 8]   62 	bit	7, h
   0365 28 04         [12]   63 	jr	Z,00106$
   0367 01 07 00      [10]   64 	ld	bc, #0x0007
   036A 09            [11]   65 	add	hl, bc
   036B                      66 00106$:
   036B CB 3C         [ 8]   67 	srl	h
   036D CB 1D         [ 8]   68 	rr	l
   036F CB 3C         [ 8]   69 	srl	h
   0371 CB 1D         [ 8]   70 	rr	l
   0373 CB 3C         [ 8]   71 	srl	h
   0375 CB 1D         [ 8]   72 	rr	l
                             73 ;src/txt_scroll_hard.c:24: mod=step%8;
   0377 E5            [11]   74 	push	hl
   0378 01 08 00      [10]   75 	ld	bc, #0x0008
   037B C5            [11]   76 	push	bc
   037C DD 4E 04      [19]   77 	ld	c,4 (ix)
   037F DD 46 05      [19]   78 	ld	b,5 (ix)
   0382 C5            [11]   79 	push	bc
   0383 CD 95 49      [17]   80 	call	__modsint
   0386 F1            [10]   81 	pop	af
   0387 F1            [10]   82 	pop	af
   0388 4D            [ 4]   83 	ld	c, l
   0389 44            [ 4]   84 	ld	b, h
   038A E1            [10]   85 	pop	hl
                             86 ;src/txt_scroll_hard.c:25: div=div%128;
   038B CB BD         [ 8]   87 	res	7, l
   038D 26 00         [ 7]   88 	ld	h, #0x00
                             89 ;src/txt_scroll_hard.c:26: if (texte[div]==' ') {
   038F 11 CA 03      [10]   90 	ld	de, #_texte+0
   0392 19            [11]   91 	add	hl, de
   0393 5E            [ 7]   92 	ld	e, (hl)
   0394 7B            [ 4]   93 	ld	a, e
   0395 D6 20         [ 7]   94 	sub	a, #0x20
   0397 20 05         [12]   95 	jr	NZ,00102$
                             96 ;src/txt_scroll_hard.c:27: o=0;
   0399 11 00 00      [10]   97 	ld	de, #0x0000
   039C 18 09         [12]   98 	jr	00103$
   039E                      99 00102$:
                            100 ;src/txt_scroll_hard.c:29: o=texte[div]-'?';
   039E 16 00         [ 7]  101 	ld	d, #0x00
   03A0 7B            [ 4]  102 	ld	a, e
   03A1 C6 C1         [ 7]  103 	add	a, #0xc1
   03A3 5F            [ 4]  104 	ld	e, a
   03A4 7A            [ 4]  105 	ld	a, d
   03A5 CE FF         [ 7]  106 	adc	a, #0xff
   03A7                     107 00103$:
                            108 ;src/txt_scroll_hard.c:32: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   03A7 21 49 04      [10]  109 	ld	hl, #_g_tile_fontmap32x32plat_000
   03AA 7B            [ 4]  110 	ld	a, e
   03AB 87            [ 4]  111 	add	a, a
   03AC 57            [ 4]  112 	ld	d, a
   03AD 1E 00         [ 7]  113 	ld	e, #0x00
   03AF 19            [11]  114 	add	hl,de
   03B0 EB            [ 4]  115 	ex	de,hl
   03B1 69            [ 4]  116 	ld	l, c
   03B2 60            [ 4]  117 	ld	h, b
   03B3 29            [11]  118 	add	hl, hl
   03B4 29            [11]  119 	add	hl, hl
   03B5 29            [11]  120 	add	hl, hl
   03B6 29            [11]  121 	add	hl, hl
   03B7 29            [11]  122 	add	hl, hl
   03B8 29            [11]  123 	add	hl, hl
   03B9 19            [11]  124 	add	hl, de
                            125 ;src/txt_scroll_hard.c:34: cpct_drawSprite((u8*)pointeur, plot, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   03BA C1            [10]  126 	pop	bc
   03BB C5            [11]  127 	push	bc
   03BC 11 02 20      [10]  128 	ld	de, #0x2002
   03BF D5            [11]  129 	push	de
   03C0 C5            [11]  130 	push	bc
   03C1 E5            [11]  131 	push	hl
   03C2 CD F5 47      [17]  132 	call	_cpct_drawSprite
   03C5 DD F9         [10]  133 	ld	sp, ix
   03C7 DD E1         [14]  134 	pop	ix
   03C9 C9            [10]  135 	ret
   03CA                     136 _texte:
   03CA 57 45 20 57 49 53   137 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0406 41 4E 44 20 41 20   138 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB   AZERTYUIOPQSDFG"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 41 5A 45
        52 54 59 55 49 4F
        50 51 53 44 46 47
   0442 48 20 20 20 20 20   139 	.ascii "H     "
   0448 00                  140 	.db 0x00
                            141 	.area _CODE
                            142 	.area _INITIALIZER
                            143 	.area _CABS (ABS)
