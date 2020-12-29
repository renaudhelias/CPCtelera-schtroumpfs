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
                             45 ;src/txt_scroll_hard.c:14: void scroll_hard(u16 step, u8* screen_plot_address) {
                             46 ;	---------------------------------
                             47 ; Function scroll_hard
                             48 ; ---------------------------------
   0348                      49 _scroll_hard::
   0348 DD E5         [15]   50 	push	ix
   034A DD 21 00 00   [14]   51 	ld	ix,#0
   034E DD 39         [15]   52 	add	ix,sp
   0350 F5            [11]   53 	push	af
                             54 ;src/txt_scroll_hard.c:20: u8* plot=screen_plot_address;
   0351 DD 4E 06      [19]   55 	ld	c,6 (ix)
   0354 DD 46 07      [19]   56 	ld	b,7 (ix)
                             57 ;src/txt_scroll_hard.c:23: div=step/8;
   0357 DD 5E 04      [19]   58 	ld	e,4 (ix)
   035A DD 56 05      [19]   59 	ld	d,5 (ix)
   035D CB 3A         [ 8]   60 	srl	d
   035F CB 1B         [ 8]   61 	rr	e
   0361 CB 3A         [ 8]   62 	srl	d
   0363 CB 1B         [ 8]   63 	rr	e
   0365 CB 3A         [ 8]   64 	srl	d
   0367 CB 1B         [ 8]   65 	rr	e
                             66 ;src/txt_scroll_hard.c:24: mod=step%8;
   0369 DD 7E 04      [19]   67 	ld	a, 4 (ix)
   036C E6 07         [ 7]   68 	and	a, #0x07
   036E DD 77 FE      [19]   69 	ld	-2 (ix), a
   0371 DD 36 FF 00   [19]   70 	ld	-1 (ix), #0x00
                             71 ;src/txt_scroll_hard.c:25: div=div%128;
   0375 CB BB         [ 8]   72 	res	7, e
   0377 16 00         [ 7]   73 	ld	d, #0x00
                             74 ;src/txt_scroll_hard.c:26: if (texte[div]==' ') {
   0379 21 B2 03      [10]   75 	ld	hl, #_texte+0
   037C 19            [11]   76 	add	hl, de
   037D 5E            [ 7]   77 	ld	e, (hl)
   037E 7B            [ 4]   78 	ld	a, e
   037F D6 20         [ 7]   79 	sub	a, #0x20
   0381 20 05         [12]   80 	jr	NZ,00102$
                             81 ;src/txt_scroll_hard.c:27: o=0;
   0383 11 00 00      [10]   82 	ld	de, #0x0000
   0386 18 09         [12]   83 	jr	00103$
   0388                      84 00102$:
                             85 ;src/txt_scroll_hard.c:29: o=texte[div]-'?';
   0388 16 00         [ 7]   86 	ld	d, #0x00
   038A 7B            [ 4]   87 	ld	a, e
   038B C6 C1         [ 7]   88 	add	a, #0xc1
   038D 5F            [ 4]   89 	ld	e, a
   038E 7A            [ 4]   90 	ld	a, d
   038F CE FF         [ 7]   91 	adc	a, #0xff
   0391                      92 00103$:
                             93 ;src/txt_scroll_hard.c:32: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   0391 21 34 04      [10]   94 	ld	hl, #_g_tile_fontmap32x32plat_000
   0394 7B            [ 4]   95 	ld	a, e
   0395 87            [ 4]   96 	add	a, a
   0396 57            [ 4]   97 	ld	d, a
   0397 1E 00         [ 7]   98 	ld	e, #0x00
   0399 19            [11]   99 	add	hl,de
   039A EB            [ 4]  100 	ex	de,hl
   039B E1            [10]  101 	pop	hl
   039C E5            [11]  102 	push	hl
   039D 29            [11]  103 	add	hl, hl
   039E 29            [11]  104 	add	hl, hl
   039F 29            [11]  105 	add	hl, hl
   03A0 29            [11]  106 	add	hl, hl
   03A1 29            [11]  107 	add	hl, hl
   03A2 29            [11]  108 	add	hl, hl
   03A3 19            [11]  109 	add	hl, de
                            110 ;src/txt_scroll_hard.c:35: cpct_drawSprite((u8*)pointeur, plot, 2, 32);
   03A4 11 02 20      [10]  111 	ld	de, #0x2002
   03A7 D5            [11]  112 	push	de
   03A8 C5            [11]  113 	push	bc
   03A9 E5            [11]  114 	push	hl
   03AA CD E1 47      [17]  115 	call	_cpct_drawSprite
   03AD DD F9         [10]  116 	ld	sp, ix
   03AF DD E1         [14]  117 	pop	ix
   03B1 C9            [10]  118 	ret
   03B2                     119 _texte:
   03B2 57 45 20 57 49 53   120 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   03EE 41 4E 44 20 41 20   121 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   042A 44 46 47 20 20 20   122 	.ascii "DFG     "
        20 20
   0432 00                  123 	.db 0x00
   0433 00                  124 	.db 0x00
                            125 	.area _CODE
                            126 	.area _INITIALIZER
                            127 	.area _CABS (ABS)
