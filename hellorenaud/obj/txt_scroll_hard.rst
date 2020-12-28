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
                             54 ;src/txt_scroll_hard.c:19: u8* plot=screen_plot_address;
   0351 DD 7E 06      [19]   55 	ld	a, 6 (ix)
   0354 DD 77 FE      [19]   56 	ld	-2 (ix), a
   0357 DD 7E 07      [19]   57 	ld	a, 7 (ix)
   035A DD 77 FF      [19]   58 	ld	-1 (ix), a
                             59 ;src/txt_scroll_hard.c:22: div=step/8;
   035D DD 6E 04      [19]   60 	ld	l,4 (ix)
   0360 DD 66 05      [19]   61 	ld	h,5 (ix)
   0363 CB 7C         [ 8]   62 	bit	7, h
   0365 28 04         [12]   63 	jr	Z,00106$
   0367 01 07 00      [10]   64 	ld	bc, #0x0007
   036A 09            [11]   65 	add	hl, bc
   036B                      66 00106$:
   036B CB 2C         [ 8]   67 	sra	h
   036D CB 1D         [ 8]   68 	rr	l
   036F CB 2C         [ 8]   69 	sra	h
   0371 CB 1D         [ 8]   70 	rr	l
   0373 CB 2C         [ 8]   71 	sra	h
   0375 CB 1D         [ 8]   72 	rr	l
                             73 ;src/txt_scroll_hard.c:23: mod=step%8;
   0377 E5            [11]   74 	push	hl
   0378 01 08 00      [10]   75 	ld	bc, #0x0008
   037B C5            [11]   76 	push	bc
   037C DD 4E 04      [19]   77 	ld	c,4 (ix)
   037F DD 46 05      [19]   78 	ld	b,5 (ix)
   0382 C5            [11]   79 	push	bc
   0383 CD B6 49      [17]   80 	call	__modsint
   0386 F1            [10]   81 	pop	af
   0387 F1            [10]   82 	pop	af
   0388 4D            [ 4]   83 	ld	c, l
   0389 44            [ 4]   84 	ld	b, h
   038A E1            [10]   85 	pop	hl
                             86 ;src/txt_scroll_hard.c:25: div=div%128;
   038B C5            [11]   87 	push	bc
   038C 11 80 00      [10]   88 	ld	de, #0x0080
   038F D5            [11]   89 	push	de
   0390 E5            [11]   90 	push	hl
   0391 CD B6 49      [17]   91 	call	__modsint
   0394 F1            [10]   92 	pop	af
   0395 F1            [10]   93 	pop	af
   0396 C1            [10]   94 	pop	bc
                             95 ;src/txt_scroll_hard.c:26: if (texte[div]==' ') {
   0397 11 D2 03      [10]   96 	ld	de, #_texte+0
   039A 19            [11]   97 	add	hl, de
   039B 5E            [ 7]   98 	ld	e, (hl)
   039C 7B            [ 4]   99 	ld	a, e
   039D D6 20         [ 7]  100 	sub	a, #0x20
   039F 20 05         [12]  101 	jr	NZ,00102$
                            102 ;src/txt_scroll_hard.c:27: o=0;
   03A1 11 00 00      [10]  103 	ld	de, #0x0000
   03A4 18 09         [12]  104 	jr	00103$
   03A6                     105 00102$:
                            106 ;src/txt_scroll_hard.c:29: o=texte[div]-'?';
   03A6 16 00         [ 7]  107 	ld	d, #0x00
   03A8 7B            [ 4]  108 	ld	a, e
   03A9 C6 C1         [ 7]  109 	add	a, #0xc1
   03AB 5F            [ 4]  110 	ld	e, a
   03AC 7A            [ 4]  111 	ld	a, d
   03AD CE FF         [ 7]  112 	adc	a, #0xff
   03AF                     113 00103$:
                            114 ;src/txt_scroll_hard.c:32: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   03AF 21 53 04      [10]  115 	ld	hl, #_g_tile_fontmap32x32plat_000
   03B2 7B            [ 4]  116 	ld	a, e
   03B3 87            [ 4]  117 	add	a, a
   03B4 57            [ 4]  118 	ld	d, a
   03B5 1E 00         [ 7]  119 	ld	e, #0x00
   03B7 19            [11]  120 	add	hl,de
   03B8 EB            [ 4]  121 	ex	de,hl
   03B9 69            [ 4]  122 	ld	l, c
   03BA 60            [ 4]  123 	ld	h, b
   03BB 29            [11]  124 	add	hl, hl
   03BC 29            [11]  125 	add	hl, hl
   03BD 29            [11]  126 	add	hl, hl
   03BE 29            [11]  127 	add	hl, hl
   03BF 29            [11]  128 	add	hl, hl
   03C0 29            [11]  129 	add	hl, hl
   03C1 19            [11]  130 	add	hl, de
                            131 ;src/txt_scroll_hard.c:35: cpct_drawSprite((u8*)pointeur, plot, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   03C2 C1            [10]  132 	pop	bc
   03C3 C5            [11]  133 	push	bc
   03C4 11 02 20      [10]  134 	ld	de, #0x2002
   03C7 D5            [11]  135 	push	de
   03C8 C5            [11]  136 	push	bc
   03C9 E5            [11]  137 	push	hl
   03CA CD F1 47      [17]  138 	call	_cpct_drawSprite
   03CD DD F9         [10]  139 	ld	sp, ix
   03CF DD E1         [14]  140 	pop	ix
   03D1 C9            [10]  141 	ret
   03D2                     142 _texte:
   03D2 57 45 20 57 49 53   143 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   040E 41 4E 44 20 41 20   144 	.ascii "AND A HAPPY NEW YEAR                                        "
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
   044A 20 20 20 20 20 20   145 	.ascii "        "
        20 20
   0452 00                  146 	.db 0x00
                            147 	.area _CODE
                            148 	.area _INITIALIZER
                            149 	.area _CABS (ABS)
