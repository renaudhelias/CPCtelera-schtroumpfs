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
   0410 DD 36 FC 83   [19]   55 	ld	-4 (ix), #<(_g_tile_fontmap32x32plat_000)
   0414 DD 36 FD 06   [19]   56 	ld	-3 (ix), #>(_g_tile_fontmap32x32plat_000)
                             57 ;src/txt_scroll_hard.c:18: c2=step; // on insère du vide au début de step
   0418 DD 5E 08      [19]   58 	ld	e,8 (ix)
   041B DD 56 09      [19]   59 	ld	d,9 (ix)
                             60 ;src/txt_scroll_hard.c:21: div=c2/8;
   041E 4B            [ 4]   61 	ld	c, e
   041F 42            [ 4]   62 	ld	b, d
   0420 CB 7A         [ 8]   63 	bit	7, d
   0422 28 06         [12]   64 	jr	Z,00109$
   0424 21 07 00      [10]   65 	ld	hl, #0x0007
   0427 19            [11]   66 	add	hl,de
   0428 4D            [ 4]   67 	ld	c, l
   0429 44            [ 4]   68 	ld	b, h
   042A                      69 00109$:
   042A CB 28         [ 8]   70 	sra	b
   042C CB 19         [ 8]   71 	rr	c
   042E CB 28         [ 8]   72 	sra	b
   0430 CB 19         [ 8]   73 	rr	c
   0432 CB 28         [ 8]   74 	sra	b
   0434 CB 19         [ 8]   75 	rr	c
                             76 ;src/txt_scroll_hard.c:22: mod=c2%8;
   0436 C5            [11]   77 	push	bc
   0437 21 08 00      [10]   78 	ld	hl, #0x0008
   043A E5            [11]   79 	push	hl
   043B D5            [11]   80 	push	de
   043C CD 71 64      [17]   81 	call	__modsint
   043F F1            [10]   82 	pop	af
   0440 F1            [10]   83 	pop	af
   0441 EB            [ 4]   84 	ex	de,hl
   0442 C1            [10]   85 	pop	bc
                             86 ;src/txt_scroll_hard.c:23: if (div<0 || div>l) {return;}
   0443 CB 78         [ 8]   87 	bit	7, b
   0445 20 57         [12]   88 	jr	NZ,00107$
   0447 69            [ 4]   89 	ld	l, c
   0448 60            [ 4]   90 	ld	h, b
   0449 DD 7E 06      [19]   91 	ld	a, 6 (ix)
   044C 95            [ 4]   92 	sub	a, l
   044D DD 7E 07      [19]   93 	ld	a, 7 (ix)
   0450 9C            [ 4]   94 	sbc	a, h
   0451 38 4B         [12]   95 	jr	C,00107$
                             96 ;src/txt_scroll_hard.c:24: if (texte[div]==' ') {
   0453 DD 6E 04      [19]   97 	ld	l,4 (ix)
   0456 DD 66 05      [19]   98 	ld	h,5 (ix)
   0459 09            [11]   99 	add	hl, bc
   045A 4E            [ 7]  100 	ld	c, (hl)
   045B 79            [ 4]  101 	ld	a, c
   045C D6 20         [ 7]  102 	sub	a, #0x20
   045E 20 05         [12]  103 	jr	NZ,00105$
                            104 ;src/txt_scroll_hard.c:25: o=0;
   0460 21 00 00      [10]  105 	ld	hl, #0x0000
   0463 18 09         [12]  106 	jr	00106$
   0465                     107 00105$:
                            108 ;src/txt_scroll_hard.c:27: o=texte[div]-'?';
   0465 06 00         [ 7]  109 	ld	b, #0x00
   0467 79            [ 4]  110 	ld	a, c
   0468 C6 C1         [ 7]  111 	add	a, #0xc1
   046A 6F            [ 4]  112 	ld	l, a
   046B 78            [ 4]  113 	ld	a, b
   046C CE FF         [ 7]  114 	adc	a, #0xff
   046E                     115 00106$:
                            116 ;src/txt_scroll_hard.c:29: cpct_drawSprite(pointeur+o*8*(32*2)+mod*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   046E DD 4E 0A      [19]  117 	ld	c,10 (ix)
   0471 DD 46 0B      [19]  118 	ld	b,11 (ix)
   0474 7D            [ 4]  119 	ld	a, l
   0475 87            [ 4]  120 	add	a, a
   0476 6F            [ 4]  121 	ld	l, a
   0477 26 00         [ 7]  122 	ld	h, #0x00
   0479 DD 7E FC      [19]  123 	ld	a, -4 (ix)
   047C 84            [ 4]  124 	add	a, h
   047D DD 77 FE      [19]  125 	ld	-2 (ix), a
   0480 DD 7E FD      [19]  126 	ld	a, -3 (ix)
   0483 8D            [ 4]  127 	adc	a, l
   0484 DD 77 FF      [19]  128 	ld	-1 (ix), a
   0487 EB            [ 4]  129 	ex	de,hl
   0488 29            [11]  130 	add	hl, hl
   0489 29            [11]  131 	add	hl, hl
   048A 29            [11]  132 	add	hl, hl
   048B 29            [11]  133 	add	hl, hl
   048C 29            [11]  134 	add	hl, hl
   048D 29            [11]  135 	add	hl, hl
   048E DD 5E FE      [19]  136 	ld	e,-2 (ix)
   0491 DD 56 FF      [19]  137 	ld	d,-1 (ix)
   0494 19            [11]  138 	add	hl, de
   0495 11 02 20      [10]  139 	ld	de, #0x2002
   0498 D5            [11]  140 	push	de
   0499 C5            [11]  141 	push	bc
   049A E5            [11]  142 	push	hl
   049B CD 05 62      [17]  143 	call	_cpct_drawSprite
   049E                     144 00107$:
   049E DD F9         [10]  145 	ld	sp, ix
   04A0 DD E1         [14]  146 	pop	ix
   04A2 C9            [10]  147 	ret
                            148 	.area _CODE
                            149 	.area _INITIALIZER
                            150 	.area _CABS (ABS)
