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
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 ;src/txt_scroll_hard.c:11: void scroll_hard(char * texte, unsigned int l, int step, u8* screen_plot_address) {
                             45 ;	---------------------------------
                             46 ; Function scroll_hard
                             47 ; ---------------------------------
   0406                      48 _scroll_hard::
   0406 DD E5         [15]   49 	push	ix
   0408 DD 21 00 00   [14]   50 	ld	ix,#0
   040C DD 39         [15]   51 	add	ix,sp
   040E F5            [11]   52 	push	af
   040F F5            [11]   53 	push	af
                             54 ;src/txt_scroll_hard.c:17: u16 pointeur=(u16)g_tile_fontmap32x32plat_000;
   0410 DD 36 FC 7F   [19]   55 	ld	-4 (ix), #<(_g_tile_fontmap32x32plat_000)
   0414 DD 36 FD 06   [19]   56 	ld	-3 (ix), #>(_g_tile_fontmap32x32plat_000)
                             57 ;src/txt_scroll_hard.c:18: c2=step+SCREEN_WIDTH; // on insère du vide au début de step
   0418 DD 7E 08      [19]   58 	ld	a, 8 (ix)
   041B C6 50         [ 7]   59 	add	a, #0x50
   041D 5F            [ 4]   60 	ld	e, a
   041E DD 7E 09      [19]   61 	ld	a, 9 (ix)
   0421 CE 00         [ 7]   62 	adc	a, #0x00
   0423 57            [ 4]   63 	ld	d, a
                             64 ;src/txt_scroll_hard.c:21: div=c2/8;
   0424 4B            [ 4]   65 	ld	c, e
   0425 42            [ 4]   66 	ld	b, d
   0426 CB 7A         [ 8]   67 	bit	7, d
   0428 28 06         [12]   68 	jr	Z,00106$
   042A 21 07 00      [10]   69 	ld	hl, #0x0007
   042D 19            [11]   70 	add	hl,de
   042E 4D            [ 4]   71 	ld	c, l
   042F 44            [ 4]   72 	ld	b, h
   0430                      73 00106$:
   0430 CB 28         [ 8]   74 	sra	b
   0432 CB 19         [ 8]   75 	rr	c
   0434 CB 28         [ 8]   76 	sra	b
   0436 CB 19         [ 8]   77 	rr	c
   0438 CB 28         [ 8]   78 	sra	b
   043A CB 19         [ 8]   79 	rr	c
                             80 ;src/txt_scroll_hard.c:22: mod=c2%8;
   043C C5            [11]   81 	push	bc
   043D 21 08 00      [10]   82 	ld	hl, #0x0008
   0440 E5            [11]   83 	push	hl
   0441 D5            [11]   84 	push	de
   0442 CD F6 64      [17]   85 	call	__modsint
   0445 F1            [10]   86 	pop	af
   0446 F1            [10]   87 	pop	af
   0447 C1            [10]   88 	pop	bc
   0448 DD 75 FE      [19]   89 	ld	-2 (ix), l
   044B DD 74 FF      [19]   90 	ld	-1 (ix), h
                             91 ;src/txt_scroll_hard.c:23: if (div<0 || div>l) {return;}
   044E CB 78         [ 8]   92 	bit	7, b
   0450 20 48         [12]   93 	jr	NZ,00104$
   0452 59            [ 4]   94 	ld	e, c
   0453 50            [ 4]   95 	ld	d, b
   0454 DD 7E 06      [19]   96 	ld	a, 6 (ix)
   0457 93            [ 4]   97 	sub	a, e
   0458 DD 7E 07      [19]   98 	ld	a, 7 (ix)
   045B 9A            [ 4]   99 	sbc	a, d
   045C 38 3C         [12]  100 	jr	C,00104$
                            101 ;src/txt_scroll_hard.c:24: o=texte[div]-'?';
   045E DD 6E 04      [19]  102 	ld	l,4 (ix)
   0461 DD 66 05      [19]  103 	ld	h,5 (ix)
   0464 09            [11]  104 	add	hl, bc
   0465 4E            [ 7]  105 	ld	c, (hl)
   0466 06 00         [ 7]  106 	ld	b, #0x00
   0468 79            [ 4]  107 	ld	a, c
   0469 C6 C1         [ 7]  108 	add	a, #0xc1
   046B 5F            [ 4]  109 	ld	e, a
   046C 78            [ 4]  110 	ld	a, b
   046D CE FF         [ 7]  111 	adc	a, #0xff
                            112 ;src/txt_scroll_hard.c:25: cpct_drawSprite(pointeur+o*8*(32*2)+mod*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   046F DD 4E 0A      [19]  113 	ld	c,10 (ix)
   0472 DD 46 0B      [19]  114 	ld	b,11 (ix)
   0475 7B            [ 4]  115 	ld	a, e
   0476 87            [ 4]  116 	add	a, a
   0477 57            [ 4]  117 	ld	d, a
   0478 1E 00         [ 7]  118 	ld	e, #0x00
   047A DD 7E FC      [19]  119 	ld	a, -4 (ix)
   047D 83            [ 4]  120 	add	a, e
   047E 5F            [ 4]  121 	ld	e, a
   047F DD 7E FD      [19]  122 	ld	a, -3 (ix)
   0482 8A            [ 4]  123 	adc	a, d
   0483 57            [ 4]  124 	ld	d, a
   0484 DD 6E FE      [19]  125 	ld	l,-2 (ix)
   0487 DD 66 FF      [19]  126 	ld	h,-1 (ix)
   048A 29            [11]  127 	add	hl, hl
   048B 29            [11]  128 	add	hl, hl
   048C 29            [11]  129 	add	hl, hl
   048D 29            [11]  130 	add	hl, hl
   048E 29            [11]  131 	add	hl, hl
   048F 29            [11]  132 	add	hl, hl
   0490 19            [11]  133 	add	hl, de
   0491 11 02 20      [10]  134 	ld	de, #0x2002
   0494 D5            [11]  135 	push	de
   0495 C5            [11]  136 	push	bc
   0496 E5            [11]  137 	push	hl
   0497 CD 8A 62      [17]  138 	call	_cpct_drawSprite
   049A                     139 00104$:
   049A DD F9         [10]  140 	ld	sp, ix
   049C DD E1         [14]  141 	pop	ix
   049E C9            [10]  142 	ret
                            143 	.area _CODE
                            144 	.area _INITIALIZER
                            145 	.area _CABS (ABS)
