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
   0348                      48 _scroll_hard::
   0348 DD E5         [15]   49 	push	ix
   034A DD 21 00 00   [14]   50 	ld	ix,#0
   034E DD 39         [15]   51 	add	ix,sp
   0350 F5            [11]   52 	push	af
   0351 F5            [11]   53 	push	af
                             54 ;src/txt_scroll_hard.c:15: u16 pointeur=(u16)g_tile_fontmap32x32plat_000;
   0352 DD 36 FC E9   [19]   55 	ld	-4 (ix), #<(_g_tile_fontmap32x32plat_000)
   0356 DD 36 FD 03   [19]   56 	ld	-3 (ix), #>(_g_tile_fontmap32x32plat_000)
                             57 ;src/txt_scroll_hard.c:18: div=step/8;
   035A DD 4E 08      [19]   58 	ld	c,8 (ix)
   035D DD 46 09      [19]   59 	ld	b,9 (ix)
   0360 CB 78         [ 8]   60 	bit	7, b
   0362 28 06         [12]   61 	jr	Z,00109$
   0364 21 07 00      [10]   62 	ld	hl, #0x0007
   0367 09            [11]   63 	add	hl,bc
   0368 4D            [ 4]   64 	ld	c, l
   0369 44            [ 4]   65 	ld	b, h
   036A                      66 00109$:
   036A CB 28         [ 8]   67 	sra	b
   036C CB 19         [ 8]   68 	rr	c
   036E CB 28         [ 8]   69 	sra	b
   0370 CB 19         [ 8]   70 	rr	c
   0372 CB 28         [ 8]   71 	sra	b
   0374 CB 19         [ 8]   72 	rr	c
                             73 ;src/txt_scroll_hard.c:19: mod=step%8;
   0376 C5            [11]   74 	push	bc
   0377 21 08 00      [10]   75 	ld	hl, #0x0008
   037A E5            [11]   76 	push	hl
   037B DD 6E 08      [19]   77 	ld	l,8 (ix)
   037E DD 66 09      [19]   78 	ld	h,9 (ix)
   0381 E5            [11]   79 	push	hl
   0382 CD D9 49      [17]   80 	call	__modsint
   0385 F1            [10]   81 	pop	af
   0386 F1            [10]   82 	pop	af
   0387 EB            [ 4]   83 	ex	de,hl
   0388 C1            [10]   84 	pop	bc
                             85 ;src/txt_scroll_hard.c:20: if (div<0 || div>l) {return;}
   0389 CB 78         [ 8]   86 	bit	7, b
   038B 20 57         [12]   87 	jr	NZ,00107$
   038D 69            [ 4]   88 	ld	l, c
   038E 60            [ 4]   89 	ld	h, b
   038F DD 7E 06      [19]   90 	ld	a, 6 (ix)
   0392 95            [ 4]   91 	sub	a, l
   0393 DD 7E 07      [19]   92 	ld	a, 7 (ix)
   0396 9C            [ 4]   93 	sbc	a, h
   0397 38 4B         [12]   94 	jr	C,00107$
                             95 ;src/txt_scroll_hard.c:21: if (texte[div]==' ') {
   0399 DD 6E 04      [19]   96 	ld	l,4 (ix)
   039C DD 66 05      [19]   97 	ld	h,5 (ix)
   039F 09            [11]   98 	add	hl, bc
   03A0 4E            [ 7]   99 	ld	c, (hl)
   03A1 79            [ 4]  100 	ld	a, c
   03A2 D6 20         [ 7]  101 	sub	a, #0x20
   03A4 20 05         [12]  102 	jr	NZ,00105$
                            103 ;src/txt_scroll_hard.c:22: o=0;
   03A6 21 00 00      [10]  104 	ld	hl, #0x0000
   03A9 18 09         [12]  105 	jr	00106$
   03AB                     106 00105$:
                            107 ;src/txt_scroll_hard.c:24: o=texte[div]-'?';
   03AB 06 00         [ 7]  108 	ld	b, #0x00
   03AD 79            [ 4]  109 	ld	a, c
   03AE C6 C1         [ 7]  110 	add	a, #0xc1
   03B0 6F            [ 4]  111 	ld	l, a
   03B1 78            [ 4]  112 	ld	a, b
   03B2 CE FF         [ 7]  113 	adc	a, #0xff
   03B4                     114 00106$:
                            115 ;src/txt_scroll_hard.c:26: cpct_drawSprite(pointeur+o*8*(32*2)+mod*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   03B4 DD 4E 0A      [19]  116 	ld	c,10 (ix)
   03B7 DD 46 0B      [19]  117 	ld	b,11 (ix)
   03BA 7D            [ 4]  118 	ld	a, l
   03BB 87            [ 4]  119 	add	a, a
   03BC 6F            [ 4]  120 	ld	l, a
   03BD 26 00         [ 7]  121 	ld	h, #0x00
   03BF DD 7E FC      [19]  122 	ld	a, -4 (ix)
   03C2 84            [ 4]  123 	add	a, h
   03C3 DD 77 FE      [19]  124 	ld	-2 (ix), a
   03C6 DD 7E FD      [19]  125 	ld	a, -3 (ix)
   03C9 8D            [ 4]  126 	adc	a, l
   03CA DD 77 FF      [19]  127 	ld	-1 (ix), a
   03CD EB            [ 4]  128 	ex	de,hl
   03CE 29            [11]  129 	add	hl, hl
   03CF 29            [11]  130 	add	hl, hl
   03D0 29            [11]  131 	add	hl, hl
   03D1 29            [11]  132 	add	hl, hl
   03D2 29            [11]  133 	add	hl, hl
   03D3 29            [11]  134 	add	hl, hl
   03D4 DD 5E FE      [19]  135 	ld	e,-2 (ix)
   03D7 DD 56 FF      [19]  136 	ld	d,-1 (ix)
   03DA 19            [11]  137 	add	hl, de
   03DB 11 02 20      [10]  138 	ld	de, #0x2002
   03DE D5            [11]  139 	push	de
   03DF C5            [11]  140 	push	bc
   03E0 E5            [11]  141 	push	hl
   03E1 CD 39 48      [17]  142 	call	_cpct_drawSprite
   03E4                     143 00107$:
   03E4 DD F9         [10]  144 	ld	sp, ix
   03E6 DD E1         [14]  145 	pop	ix
   03E8 C9            [10]  146 	ret
                            147 	.area _CODE
                            148 	.area _INITIALIZER
                            149 	.area _CABS (ABS)
