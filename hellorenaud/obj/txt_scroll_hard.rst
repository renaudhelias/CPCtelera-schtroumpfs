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
   0410 DD 36 FC 89   [19]   55 	ld	-4 (ix), #<(_g_tile_fontmap32x32plat_000)
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
   0428 28 06         [12]   68 	jr	Z,00109$
   042A 21 07 00      [10]   69 	ld	hl, #0x0007
   042D 19            [11]   70 	add	hl,de
   042E 4D            [ 4]   71 	ld	c, l
   042F 44            [ 4]   72 	ld	b, h
   0430                      73 00109$:
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
   0442 CD 77 64      [17]   85 	call	__modsint
   0445 F1            [10]   86 	pop	af
   0446 F1            [10]   87 	pop	af
   0447 EB            [ 4]   88 	ex	de,hl
   0448 C1            [10]   89 	pop	bc
                             90 ;src/txt_scroll_hard.c:23: if (div<0 || div>l) {return;}
   0449 CB 78         [ 8]   91 	bit	7, b
   044B 20 57         [12]   92 	jr	NZ,00107$
   044D 69            [ 4]   93 	ld	l, c
   044E 60            [ 4]   94 	ld	h, b
   044F DD 7E 06      [19]   95 	ld	a, 6 (ix)
   0452 95            [ 4]   96 	sub	a, l
   0453 DD 7E 07      [19]   97 	ld	a, 7 (ix)
   0456 9C            [ 4]   98 	sbc	a, h
   0457 38 4B         [12]   99 	jr	C,00107$
                            100 ;src/txt_scroll_hard.c:24: if (texte[div]==' ') {
   0459 DD 6E 04      [19]  101 	ld	l,4 (ix)
   045C DD 66 05      [19]  102 	ld	h,5 (ix)
   045F 09            [11]  103 	add	hl, bc
   0460 4E            [ 7]  104 	ld	c, (hl)
   0461 79            [ 4]  105 	ld	a, c
   0462 D6 20         [ 7]  106 	sub	a, #0x20
   0464 20 05         [12]  107 	jr	NZ,00105$
                            108 ;src/txt_scroll_hard.c:25: o=0;
   0466 21 00 00      [10]  109 	ld	hl, #0x0000
   0469 18 09         [12]  110 	jr	00106$
   046B                     111 00105$:
                            112 ;src/txt_scroll_hard.c:27: o=texte[div]-'?';
   046B 06 00         [ 7]  113 	ld	b, #0x00
   046D 79            [ 4]  114 	ld	a, c
   046E C6 C1         [ 7]  115 	add	a, #0xc1
   0470 6F            [ 4]  116 	ld	l, a
   0471 78            [ 4]  117 	ld	a, b
   0472 CE FF         [ 7]  118 	adc	a, #0xff
   0474                     119 00106$:
                            120 ;src/txt_scroll_hard.c:29: cpct_drawSprite(pointeur+o*8*(32*2)+mod*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   0474 DD 4E 0A      [19]  121 	ld	c,10 (ix)
   0477 DD 46 0B      [19]  122 	ld	b,11 (ix)
   047A 7D            [ 4]  123 	ld	a, l
   047B 87            [ 4]  124 	add	a, a
   047C 6F            [ 4]  125 	ld	l, a
   047D 26 00         [ 7]  126 	ld	h, #0x00
   047F DD 7E FC      [19]  127 	ld	a, -4 (ix)
   0482 84            [ 4]  128 	add	a, h
   0483 DD 77 FE      [19]  129 	ld	-2 (ix), a
   0486 DD 7E FD      [19]  130 	ld	a, -3 (ix)
   0489 8D            [ 4]  131 	adc	a, l
   048A DD 77 FF      [19]  132 	ld	-1 (ix), a
   048D EB            [ 4]  133 	ex	de,hl
   048E 29            [11]  134 	add	hl, hl
   048F 29            [11]  135 	add	hl, hl
   0490 29            [11]  136 	add	hl, hl
   0491 29            [11]  137 	add	hl, hl
   0492 29            [11]  138 	add	hl, hl
   0493 29            [11]  139 	add	hl, hl
   0494 DD 5E FE      [19]  140 	ld	e,-2 (ix)
   0497 DD 56 FF      [19]  141 	ld	d,-1 (ix)
   049A 19            [11]  142 	add	hl, de
   049B 11 02 20      [10]  143 	ld	de, #0x2002
   049E D5            [11]  144 	push	de
   049F C5            [11]  145 	push	bc
   04A0 E5            [11]  146 	push	hl
   04A1 CD 0B 62      [17]  147 	call	_cpct_drawSprite
   04A4                     148 00107$:
   04A4 DD F9         [10]  149 	ld	sp, ix
   04A6 DD E1         [14]  150 	pop	ix
   04A8 C9            [10]  151 	ret
                            152 	.area _CODE
                            153 	.area _INITIALIZER
                            154 	.area _CABS (ABS)
