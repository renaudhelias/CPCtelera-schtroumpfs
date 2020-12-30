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
                             12 	.globl _draw
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
                             45 ;src/txt_scroll_hard.c:9: void draw(u8* image, u8* plot, u8 width, u8 height) {
                             46 ;	---------------------------------
                             47 ; Function draw
                             48 ; ---------------------------------
   0348                      49 _draw::
   0348 DD E5         [15]   50 	push	ix
   034A DD 21 00 00   [14]   51 	ld	ix,#0
   034E DD 39         [15]   52 	add	ix,sp
   0350 F5            [11]   53 	push	af
                             54 ;src/txt_scroll_hard.c:14: for (y=0;y<height;y++) {
   0351 DD 7E 06      [19]   55 	ld	a, 6 (ix)
   0354 C6 00         [ 7]   56 	add	a, #0x00
   0356 DD 77 FE      [19]   57 	ld	-2 (ix), a
   0359 DD 7E 07      [19]   58 	ld	a, 7 (ix)
   035C CE 40         [ 7]   59 	adc	a, #0x40
   035E DD 77 FF      [19]   60 	ld	-1 (ix), a
   0361 0E 00         [ 7]   61 	ld	c, #0x00
   0363                      62 00109$:
   0363 79            [ 4]   63 	ld	a, c
   0364 DD 96 09      [19]   64 	sub	a, 9 (ix)
   0367 30 4E         [12]   65 	jr	NC,00111$
                             66 ;src/txt_scroll_hard.c:15: for (x=0;x<width;x++) {
   0369 06 00         [ 7]   67 	ld	b, #0x00
   036B                      68 00106$:
   036B 78            [ 4]   69 	ld	a, b
   036C DD 96 08      [19]   70 	sub	a, 8 (ix)
   036F 30 43         [12]   71 	jr	NC,00110$
                             72 ;src/txt_scroll_hard.c:16: cur_plot=plot+0x4000+ ((y / 8u) * 80u) + ((y % 8u) * 2048u) + x;
   0371 59            [ 4]   73 	ld	e, c
   0372 16 00         [ 7]   74 	ld	d, #0x00
   0374 6B            [ 4]   75 	ld	l, e
   0375 62            [ 4]   76 	ld	h, d
   0376 CB 3C         [ 8]   77 	srl	h
   0378 CB 1D         [ 8]   78 	rr	l
   037A CB 3C         [ 8]   79 	srl	h
   037C CB 1D         [ 8]   80 	rr	l
   037E CB 3C         [ 8]   81 	srl	h
   0380 CB 1D         [ 8]   82 	rr	l
   0382 D5            [11]   83 	push	de
   0383 5D            [ 4]   84 	ld	e, l
   0384 54            [ 4]   85 	ld	d, h
   0385 29            [11]   86 	add	hl, hl
   0386 29            [11]   87 	add	hl, hl
   0387 19            [11]   88 	add	hl, de
   0388 29            [11]   89 	add	hl, hl
   0389 29            [11]   90 	add	hl, hl
   038A 29            [11]   91 	add	hl, hl
   038B 29            [11]   92 	add	hl, hl
   038C D1            [10]   93 	pop	de
   038D DD 7E FE      [19]   94 	ld	a, -2 (ix)
   0390 85            [ 4]   95 	add	a, l
   0391 6F            [ 4]   96 	ld	l, a
   0392 DD 7E FF      [19]   97 	ld	a, -1 (ix)
   0395 8C            [ 4]   98 	adc	a, h
   0396 67            [ 4]   99 	ld	h, a
   0397 7B            [ 4]  100 	ld	a, e
   0398 E6 07         [ 7]  101 	and	a, #0x07
   039A 07            [ 4]  102 	rlca
   039B 07            [ 4]  103 	rlca
   039C 07            [ 4]  104 	rlca
   039D E6 F8         [ 7]  105 	and	a, #0xf8
   039F 57            [ 4]  106 	ld	d, a
   03A0 1E 00         [ 7]  107 	ld	e, #0x00
   03A2 19            [11]  108 	add	hl, de
   03A3 58            [ 4]  109 	ld	e,b
   03A4 16 00         [ 7]  110 	ld	d,#0x00
   03A6 19            [11]  111 	add	hl, de
                            112 ;src/txt_scroll_hard.c:17: if (cur_plot<0x4000) {
                            113 ;src/txt_scroll_hard.c:18: cur_plot=cur_plot-0x4000;
   03A7 7C            [ 4]  114 	ld	a,h
   03A8 FE 40         [ 7]  115 	cp	a,#0x40
   03AA 30 03         [12]  116 	jr	NC,00102$
   03AC C6 C0         [ 7]  117 	add	a,#0xc0
   03AE 67            [ 4]  118 	ld	h, a
   03AF                     119 00102$:
                            120 ;src/txt_scroll_hard.c:22: *cur_plot=0x0F;//*cur_image;
   03AF 36 0F         [10]  121 	ld	(hl), #0x0f
                            122 ;src/txt_scroll_hard.c:15: for (x=0;x<width;x++) {
   03B1 04            [ 4]  123 	inc	b
   03B2 18 B7         [12]  124 	jr	00106$
   03B4                     125 00110$:
                            126 ;src/txt_scroll_hard.c:14: for (y=0;y<height;y++) {
   03B4 0C            [ 4]  127 	inc	c
   03B5 18 AC         [12]  128 	jr	00109$
   03B7                     129 00111$:
   03B7 DD F9         [10]  130 	ld	sp, ix
   03B9 DD E1         [14]  131 	pop	ix
   03BB C9            [10]  132 	ret
                            133 ;src/txt_scroll_hard.c:71: void scroll_hard(u16 step, u8* screen_plot_address) {
                            134 ;	---------------------------------
                            135 ; Function scroll_hard
                            136 ; ---------------------------------
   03BC                     137 _scroll_hard::
   03BC DD E5         [15]  138 	push	ix
   03BE DD 21 00 00   [14]  139 	ld	ix,#0
   03C2 DD 39         [15]  140 	add	ix,sp
   03C4 F5            [11]  141 	push	af
                            142 ;src/txt_scroll_hard.c:77: u8* plot=screen_plot_address;
   03C5 DD 4E 06      [19]  143 	ld	c,6 (ix)
   03C8 DD 46 07      [19]  144 	ld	b,7 (ix)
                            145 ;src/txt_scroll_hard.c:80: div=step/8;
   03CB DD 5E 04      [19]  146 	ld	e,4 (ix)
   03CE DD 56 05      [19]  147 	ld	d,5 (ix)
   03D1 CB 3A         [ 8]  148 	srl	d
   03D3 CB 1B         [ 8]  149 	rr	e
   03D5 CB 3A         [ 8]  150 	srl	d
   03D7 CB 1B         [ 8]  151 	rr	e
   03D9 CB 3A         [ 8]  152 	srl	d
   03DB CB 1B         [ 8]  153 	rr	e
                            154 ;src/txt_scroll_hard.c:81: mod=step%8;
   03DD DD 7E 04      [19]  155 	ld	a, 4 (ix)
   03E0 E6 07         [ 7]  156 	and	a, #0x07
   03E2 DD 77 FE      [19]  157 	ld	-2 (ix), a
   03E5 DD 36 FF 00   [19]  158 	ld	-1 (ix), #0x00
                            159 ;src/txt_scroll_hard.c:82: div=div%128;
   03E9 CB BB         [ 8]  160 	res	7, e
   03EB 16 00         [ 7]  161 	ld	d, #0x00
                            162 ;src/txt_scroll_hard.c:83: if (texte[div]==' ') {
   03ED 21 2B 04      [10]  163 	ld	hl, #_texte+0
   03F0 19            [11]  164 	add	hl, de
   03F1 5E            [ 7]  165 	ld	e, (hl)
   03F2 7B            [ 4]  166 	ld	a, e
   03F3 D6 20         [ 7]  167 	sub	a, #0x20
   03F5 20 05         [12]  168 	jr	NZ,00102$
                            169 ;src/txt_scroll_hard.c:84: o=0;
   03F7 11 00 00      [10]  170 	ld	de, #0x0000
   03FA 18 09         [12]  171 	jr	00103$
   03FC                     172 00102$:
                            173 ;src/txt_scroll_hard.c:86: o=texte[div]-'?';
   03FC 16 00         [ 7]  174 	ld	d, #0x00
   03FE 7B            [ 4]  175 	ld	a, e
   03FF C6 C1         [ 7]  176 	add	a, #0xc1
   0401 5F            [ 4]  177 	ld	e, a
   0402 7A            [ 4]  178 	ld	a, d
   0403 CE FF         [ 7]  179 	adc	a, #0xff
   0405                     180 00103$:
                            181 ;src/txt_scroll_hard.c:89: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   0405 21 AD 04      [10]  182 	ld	hl, #_g_tile_fontmap32x32plat_000
   0408 7B            [ 4]  183 	ld	a, e
   0409 87            [ 4]  184 	add	a, a
   040A 57            [ 4]  185 	ld	d, a
   040B 1E 00         [ 7]  186 	ld	e, #0x00
   040D 19            [11]  187 	add	hl,de
   040E EB            [ 4]  188 	ex	de,hl
   040F E1            [10]  189 	pop	hl
   0410 E5            [11]  190 	push	hl
   0411 29            [11]  191 	add	hl, hl
   0412 29            [11]  192 	add	hl, hl
   0413 29            [11]  193 	add	hl, hl
   0414 29            [11]  194 	add	hl, hl
   0415 29            [11]  195 	add	hl, hl
   0416 29            [11]  196 	add	hl, hl
   0417 19            [11]  197 	add	hl, de
                            198 ;src/txt_scroll_hard.c:93: draw((u8*)pointeur, plot, 2, 32);
   0418 11 02 20      [10]  199 	ld	de, #0x2002
   041B D5            [11]  200 	push	de
   041C C5            [11]  201 	push	bc
   041D E5            [11]  202 	push	hl
   041E CD 48 03      [17]  203 	call	_draw
   0421 21 06 00      [10]  204 	ld	hl, #6
   0424 39            [11]  205 	add	hl, sp
   0425 F9            [ 6]  206 	ld	sp, hl
   0426 DD F9         [10]  207 	ld	sp, ix
   0428 DD E1         [14]  208 	pop	ix
   042A C9            [10]  209 	ret
   042B                     210 _texte:
   042B 57 45 20 57 49 53   211 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0467 41 4E 44 20 41 20   212 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   04A3 44 46 47 20 20 20   213 	.ascii "DFG     "
        20 20
   04AB 00                  214 	.db 0x00
   04AC 00                  215 	.db 0x00
                            216 	.area _CODE
                            217 	.area _INITIALIZER
                            218 	.area _CABS (ABS)
