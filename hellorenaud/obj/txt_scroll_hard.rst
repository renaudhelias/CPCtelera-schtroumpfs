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
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawTileAligned2x8
                             14 	.globl _texte
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
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 ;src/txt_scroll_hard.c:14: void scroll_hard(int step, u8* screen_plot_address) {
                             47 ;	---------------------------------
                             48 ; Function scroll_hard
                             49 ; ---------------------------------
   0348                      50 _scroll_hard::
   0348 DD E5         [15]   51 	push	ix
   034A DD 21 00 00   [14]   52 	ld	ix,#0
   034E DD 39         [15]   53 	add	ix,sp
   0350 F5            [11]   54 	push	af
                             55 ;src/txt_scroll_hard.c:20: u8* plot=screen_plot_address;
   0351 DD 7E 06      [19]   56 	ld	a, 6 (ix)
   0354 DD 77 FE      [19]   57 	ld	-2 (ix), a
   0357 DD 7E 07      [19]   58 	ld	a, 7 (ix)
   035A DD 77 FF      [19]   59 	ld	-1 (ix), a
                             60 ;src/txt_scroll_hard.c:23: div=step/8;
   035D DD 6E 04      [19]   61 	ld	l,4 (ix)
   0360 DD 66 05      [19]   62 	ld	h,5 (ix)
   0363 CB 7C         [ 8]   63 	bit	7, h
   0365 28 04         [12]   64 	jr	Z,00106$
   0367 01 07 00      [10]   65 	ld	bc, #0x0007
   036A 09            [11]   66 	add	hl, bc
   036B                      67 00106$:
   036B CB 3C         [ 8]   68 	srl	h
   036D CB 1D         [ 8]   69 	rr	l
   036F CB 3C         [ 8]   70 	srl	h
   0371 CB 1D         [ 8]   71 	rr	l
   0373 CB 3C         [ 8]   72 	srl	h
   0375 CB 1D         [ 8]   73 	rr	l
                             74 ;src/txt_scroll_hard.c:24: mod=step%8;
   0377 E5            [11]   75 	push	hl
   0378 01 08 00      [10]   76 	ld	bc, #0x0008
   037B C5            [11]   77 	push	bc
   037C DD 4E 04      [19]   78 	ld	c,4 (ix)
   037F DD 46 05      [19]   79 	ld	b,5 (ix)
   0382 C5            [11]   80 	push	bc
   0383 CD 0D 4A      [17]   81 	call	__modsint
   0386 F1            [10]   82 	pop	af
   0387 F1            [10]   83 	pop	af
   0388 4D            [ 4]   84 	ld	c, l
   0389 44            [ 4]   85 	ld	b, h
   038A E1            [10]   86 	pop	hl
                             87 ;src/txt_scroll_hard.c:25: div=div%128;
   038B CB BD         [ 8]   88 	res	7, l
   038D 26 00         [ 7]   89 	ld	h, #0x00
                             90 ;src/txt_scroll_hard.c:26: if (texte[div]==' ') {
   038F 11 29 04      [10]   91 	ld	de, #_texte+0
   0392 19            [11]   92 	add	hl, de
   0393 5E            [ 7]   93 	ld	e, (hl)
   0394 7B            [ 4]   94 	ld	a, e
   0395 D6 20         [ 7]   95 	sub	a, #0x20
   0397 20 05         [12]   96 	jr	NZ,00102$
                             97 ;src/txt_scroll_hard.c:27: o=0;
   0399 11 00 00      [10]   98 	ld	de, #0x0000
   039C 18 09         [12]   99 	jr	00103$
   039E                     100 00102$:
                            101 ;src/txt_scroll_hard.c:29: o=texte[div]-'?';
   039E 16 00         [ 7]  102 	ld	d, #0x00
   03A0 7B            [ 4]  103 	ld	a, e
   03A1 C6 C1         [ 7]  104 	add	a, #0xc1
   03A3 5F            [ 4]  105 	ld	e, a
   03A4 7A            [ 4]  106 	ld	a, d
   03A5 CE FF         [ 7]  107 	adc	a, #0xff
   03A7                     108 00103$:
                            109 ;src/txt_scroll_hard.c:32: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   03A7 21 AA 04      [10]  110 	ld	hl, #_g_tile_fontmap32x32plat_000
   03AA 7B            [ 4]  111 	ld	a, e
   03AB 87            [ 4]  112 	add	a, a
   03AC 57            [ 4]  113 	ld	d, a
   03AD 1E 00         [ 7]  114 	ld	e, #0x00
   03AF 19            [11]  115 	add	hl,de
   03B0 EB            [ 4]  116 	ex	de,hl
   03B1 69            [ 4]  117 	ld	l, c
   03B2 60            [ 4]  118 	ld	h, b
   03B3 29            [11]  119 	add	hl, hl
   03B4 29            [11]  120 	add	hl, hl
   03B5 29            [11]  121 	add	hl, hl
   03B6 29            [11]  122 	add	hl, hl
   03B7 29            [11]  123 	add	hl, hl
   03B8 29            [11]  124 	add	hl, hl
   03B9 19            [11]  125 	add	hl,de
   03BA EB            [ 4]  126 	ex	de,hl
                            127 ;src/txt_scroll_hard.c:36: p = cpct_getScreenPtr(plot, 0,0);
   03BB C1            [10]  128 	pop	bc
   03BC C5            [11]  129 	push	bc
   03BD C5            [11]  130 	push	bc
   03BE D5            [11]  131 	push	de
   03BF 21 00 00      [10]  132 	ld	hl, #0x0000
   03C2 E5            [11]  133 	push	hl
   03C3 C5            [11]  134 	push	bc
   03C4 CD 1A 4A      [17]  135 	call	_cpct_getScreenPtr
   03C7 D1            [10]  136 	pop	de
   03C8 C1            [10]  137 	pop	bc
                            138 ;src/txt_scroll_hard.c:37: cpct_drawTileAligned2x8((u8*)pointeur, p);
   03C9 D5            [11]  139 	push	de
   03CA FD E1         [14]  140 	pop	iy
   03CC C5            [11]  141 	push	bc
   03CD D5            [11]  142 	push	de
   03CE E5            [11]  143 	push	hl
   03CF FD E5         [15]  144 	push	iy
   03D1 CD E9 49      [17]  145 	call	_cpct_drawTileAligned2x8
   03D4 D1            [10]  146 	pop	de
   03D5 C1            [10]  147 	pop	bc
                            148 ;src/txt_scroll_hard.c:38: p = cpct_getScreenPtr(plot, 0,8);
   03D6 C5            [11]  149 	push	bc
   03D7 D5            [11]  150 	push	de
   03D8 21 00 08      [10]  151 	ld	hl, #0x0800
   03DB E5            [11]  152 	push	hl
   03DC C5            [11]  153 	push	bc
   03DD CD 1A 4A      [17]  154 	call	_cpct_getScreenPtr
   03E0 D1            [10]  155 	pop	de
   03E1 C1            [10]  156 	pop	bc
                            157 ;src/txt_scroll_hard.c:39: cpct_drawTileAligned2x8((u8*)pointeur+(2*8), p);
   03E2 FD 21 10 00   [14]  158 	ld	iy, #0x0010
   03E6 FD 19         [15]  159 	add	iy, de
   03E8 C5            [11]  160 	push	bc
   03E9 D5            [11]  161 	push	de
   03EA E5            [11]  162 	push	hl
   03EB FD E5         [15]  163 	push	iy
   03ED CD E9 49      [17]  164 	call	_cpct_drawTileAligned2x8
   03F0 D1            [10]  165 	pop	de
   03F1 C1            [10]  166 	pop	bc
                            167 ;src/txt_scroll_hard.c:40: p = cpct_getScreenPtr(plot, 0,16);
   03F2 C5            [11]  168 	push	bc
   03F3 D5            [11]  169 	push	de
   03F4 21 00 10      [10]  170 	ld	hl, #0x1000
   03F7 E5            [11]  171 	push	hl
   03F8 C5            [11]  172 	push	bc
   03F9 CD 1A 4A      [17]  173 	call	_cpct_getScreenPtr
   03FC D1            [10]  174 	pop	de
   03FD C1            [10]  175 	pop	bc
                            176 ;src/txt_scroll_hard.c:41: cpct_drawTileAligned2x8((u8*)pointeur+(4*8), p);
   03FE E5            [11]  177 	push	hl
   03FF FD E1         [14]  178 	pop	iy
   0401 21 20 00      [10]  179 	ld	hl, #0x0020
   0404 19            [11]  180 	add	hl, de
   0405 C5            [11]  181 	push	bc
   0406 D5            [11]  182 	push	de
   0407 FD E5         [15]  183 	push	iy
   0409 E5            [11]  184 	push	hl
   040A CD E9 49      [17]  185 	call	_cpct_drawTileAligned2x8
   040D D1            [10]  186 	pop	de
   040E C1            [10]  187 	pop	bc
                            188 ;src/txt_scroll_hard.c:42: p = cpct_getScreenPtr(plot, 0,24);
   040F D5            [11]  189 	push	de
   0410 21 00 18      [10]  190 	ld	hl, #0x1800
   0413 E5            [11]  191 	push	hl
   0414 C5            [11]  192 	push	bc
   0415 CD 1A 4A      [17]  193 	call	_cpct_getScreenPtr
   0418 4D            [ 4]  194 	ld	c, l
   0419 44            [ 4]  195 	ld	b, h
   041A D1            [10]  196 	pop	de
                            197 ;src/txt_scroll_hard.c:43: cpct_drawTileAligned2x8((u8*)pointeur+(6*8), p);
   041B 21 30 00      [10]  198 	ld	hl, #0x0030
   041E 19            [11]  199 	add	hl, de
   041F C5            [11]  200 	push	bc
   0420 E5            [11]  201 	push	hl
   0421 CD E9 49      [17]  202 	call	_cpct_drawTileAligned2x8
   0424 DD F9         [10]  203 	ld	sp, ix
   0426 DD E1         [14]  204 	pop	ix
   0428 C9            [10]  205 	ret
   0429                     206 _texte:
   0429 57 45 20 57 49 53   207 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0465 41 4E 44 20 41 20   208 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB   AZERTYUIOPQSDFG"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 41 5A 45
        52 54 59 55 49 4F
        50 51 53 44 46 47
   04A1 48 20 20 20 20 20   209 	.ascii "H       "
        20 20
   04A9 00                  210 	.db 0x00
                            211 	.area _CODE
                            212 	.area _INITIALIZER
                            213 	.area _CABS (ABS)
