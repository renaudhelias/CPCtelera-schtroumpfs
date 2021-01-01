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
                             12 	.globl _draw_char
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawTileAligned2x8_f
                             15 	.globl _texte
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 ;src/txt_scroll_hard.c:13: void draw_char(u8 c, u8* image, u8* plot) {
                             48 ;	---------------------------------
                             49 ; Function draw_char
                             50 ; ---------------------------------
   0348                      51 _draw_char::
   0348 DD E5         [15]   52 	push	ix
   034A DD 21 00 00   [14]   53 	ld	ix,#0
   034E DD 39         [15]   54 	add	ix,sp
   0350 21 FA FF      [10]   55 	ld	hl, #-6
   0353 39            [11]   56 	add	hl, sp
   0354 F9            [ 6]   57 	ld	sp, hl
                             58 ;src/txt_scroll_hard.c:21: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
   0355 DD 4E 04      [19]   59 	ld	c, 4 (ix)
   0358 06 00         [ 7]   60 	ld	b, #0x00
   035A 69            [ 4]   61 	ld	l, c
   035B 60            [ 4]   62 	ld	h, b
   035C 29            [11]   63 	add	hl, hl
   035D 29            [11]   64 	add	hl, hl
   035E 09            [11]   65 	add	hl, bc
   035F 29            [11]   66 	add	hl, hl
   0360 29            [11]   67 	add	hl, hl
   0361 29            [11]   68 	add	hl, hl
   0362 29            [11]   69 	add	hl, hl
   0363 DD 75 FE      [19]   70 	ld	-2 (ix), l
   0366 DD 74 FF      [19]   71 	ld	-1 (ix), h
   0369 DD 7E FE      [19]   72 	ld	a, -2 (ix)
   036C C6 01         [ 7]   73 	add	a, #0x01
   036E 4F            [ 4]   74 	ld	c, a
   036F DD 7E FF      [19]   75 	ld	a, -1 (ix)
   0372 CE 78         [ 7]   76 	adc	a, #0x78
   0374 47            [ 4]   77 	ld	b, a
   0375 DD 6E 07      [19]   78 	ld	l,7 (ix)
   0378 DD 66 08      [19]   79 	ld	h,8 (ix)
   037B 09            [11]   80 	add	hl, bc
                             81 ;src/txt_scroll_hard.c:23: if (last_plot<0x4000) {
                             82 ;src/txt_scroll_hard.c:37: for (y=0;y<8;y++) {
   037C DD 7E 07      [19]   83 	ld	a, 7 (ix)
   037F C6 00         [ 7]   84 	add	a, #0x00
   0381 4F            [ 4]   85 	ld	c, a
   0382 DD 7E 08      [19]   86 	ld	a, 8 (ix)
   0385 CE 40         [ 7]   87 	adc	a, #0x40
   0387 47            [ 4]   88 	ld	b, a
                             89 ;src/txt_scroll_hard.c:40: cur_image=image+(c*8+((y+1)%8))*2+x;
   0388 DD 5E 04      [19]   90 	ld	e, 4 (ix)
   038B 16 00         [ 7]   91 	ld	d, #0x00
                             92 ;src/txt_scroll_hard.c:23: if (last_plot<0x4000) {
   038D 7C            [ 4]   93 	ld	a, h
   038E D6 40         [ 7]   94 	sub	a, #0x40
   0390 D2 40 04      [10]   95 	jp	NC, 00106$
                             96 ;src/txt_scroll_hard.c:37: for (y=0;y<8;y++) {
   0393 DD 7E FE      [19]   97 	ld	a, -2 (ix)
   0396 81            [ 4]   98 	add	a, c
   0397 DD 77 FE      [19]   99 	ld	-2 (ix), a
   039A DD 7E FF      [19]  100 	ld	a, -1 (ix)
   039D 88            [ 4]  101 	adc	a, b
   039E DD 77 FF      [19]  102 	ld	-1 (ix), a
   03A1 0E 00         [ 7]  103 	ld	c, #0x00
                            104 ;src/txt_scroll_hard.c:38: for (x=0;x<2;x++) {
   03A3                     105 00116$:
   03A3 06 00         [ 7]  106 	ld	b, #0x00
   03A5                     107 00108$:
                            108 ;src/txt_scroll_hard.c:39: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
   03A5 79            [ 4]  109 	ld	a, c
   03A6 E6 07         [ 7]  110 	and	a, #0x07
   03A8 07            [ 4]  111 	rlca
   03A9 07            [ 4]  112 	rlca
   03AA 07            [ 4]  113 	rlca
   03AB E6 F8         [ 7]  114 	and	a, #0xf8
   03AD 67            [ 4]  115 	ld	h, a
   03AE 2E 00         [ 7]  116 	ld	l, #0x00
   03B0 DD 7E FE      [19]  117 	ld	a, -2 (ix)
   03B3 85            [ 4]  118 	add	a, l
   03B4 6F            [ 4]  119 	ld	l, a
   03B5 DD 7E FF      [19]  120 	ld	a, -1 (ix)
   03B8 8C            [ 4]  121 	adc	a, h
   03B9 67            [ 4]  122 	ld	h, a
   03BA 7D            [ 4]  123 	ld	a, l
   03BB 80            [ 4]  124 	add	a, b
   03BC 6F            [ 4]  125 	ld	l, a
   03BD 7C            [ 4]  126 	ld	a, h
   03BE CE 00         [ 7]  127 	adc	a, #0x00
   03C0 67            [ 4]  128 	ld	h, a
   03C1 33            [ 6]  129 	inc	sp
   03C2 33            [ 6]  130 	inc	sp
   03C3 E5            [11]  131 	push	hl
                            132 ;src/txt_scroll_hard.c:40: cur_image=image+(c*8+((y+1)%8))*2+x;
   03C4 DD 73 FC      [19]  133 	ld	-4 (ix), e
   03C7 DD 72 FD      [19]  134 	ld	-3 (ix), d
   03CA 3E 04         [ 7]  135 	ld	a, #0x03+1
   03CC 18 08         [12]  136 	jr	00141$
   03CE                     137 00140$:
   03CE DD CB FC 26   [23]  138 	sla	-4 (ix)
   03D2 DD CB FD 16   [23]  139 	rl	-3 (ix)
   03D6                     140 00141$:
   03D6 3D            [ 4]  141 	dec	a
   03D7 20 F5         [12]  142 	jr	NZ,00140$
   03D9 69            [ 4]  143 	ld	l, c
   03DA 26 00         [ 7]  144 	ld	h, #0x00
   03DC 23            [ 6]  145 	inc	hl
   03DD E5            [11]  146 	push	hl
   03DE FD E1         [14]  147 	pop	iy
   03E0 C5            [11]  148 	push	bc
   03E1 D5            [11]  149 	push	de
   03E2 21 08 00      [10]  150 	ld	hl, #0x0008
   03E5 E5            [11]  151 	push	hl
   03E6 FD E5         [15]  152 	push	iy
   03E8 CD 9D 4B      [17]  153 	call	__modsint
   03EB F1            [10]  154 	pop	af
   03EC F1            [10]  155 	pop	af
   03ED D1            [10]  156 	pop	de
   03EE C1            [10]  157 	pop	bc
   03EF E5            [11]  158 	push	hl
   03F0 DD 6E FC      [19]  159 	ld	l, -4 (ix)
   03F3 DD 66 FD      [19]  160 	ld	h, -3 (ix)
   03F6 E5            [11]  161 	push	hl
   03F7 FD E1         [14]  162 	pop	iy
   03F9 E1            [10]  163 	pop	hl
   03FA C5            [11]  164 	push	bc
   03FB 4D            [ 4]  165 	ld	c, l
   03FC 44            [ 4]  166 	ld	b, h
   03FD FD 09         [15]  167 	add	iy, bc
   03FF C1            [10]  168 	pop	bc
   0400 FD 29         [15]  169 	add	iy, iy
   0402 C5            [11]  170 	push	bc
   0403 DD 4E 05      [19]  171 	ld	c,5 (ix)
   0406 DD 46 06      [19]  172 	ld	b,6 (ix)
   0409 FD 09         [15]  173 	add	iy, bc
   040B C1            [10]  174 	pop	bc
   040C C5            [11]  175 	push	bc
   040D 48            [ 4]  176 	ld	c,b
   040E 06 00         [ 7]  177 	ld	b,#0x00
   0410 FD 09         [15]  178 	add	iy, bc
   0412 C1            [10]  179 	pop	bc
                            180 ;src/txt_scroll_hard.c:41: if (cur_plot<0x4000) {
   0413 E1            [10]  181 	pop	hl
   0414 E5            [11]  182 	push	hl
   0415 7C            [ 4]  183 	ld	a, h
   0416 D6 40         [ 7]  184 	sub	a, #0x40
   0418 30 10         [12]  185 	jr	NC,00102$
                            186 ;src/txt_scroll_hard.c:42: cur_plot=cur_plot-0x4000;
   041A DD 7E FA      [19]  187 	ld	a, -6 (ix)
   041D C6 00         [ 7]  188 	add	a, #0x00
   041F DD 77 FA      [19]  189 	ld	-6 (ix), a
   0422 DD 7E FB      [19]  190 	ld	a, -5 (ix)
   0425 CE C0         [ 7]  191 	adc	a, #0xc0
   0427 DD 77 FB      [19]  192 	ld	-5 (ix), a
   042A                     193 00102$:
                            194 ;src/txt_scroll_hard.c:44: *cur_plot=*cur_image;
   042A FD 7E 00      [19]  195 	ld	a, 0 (iy)
   042D E1            [10]  196 	pop	hl
   042E E5            [11]  197 	push	hl
   042F 77            [ 7]  198 	ld	(hl), a
                            199 ;src/txt_scroll_hard.c:38: for (x=0;x<2;x++) {
   0430 04            [ 4]  200 	inc	b
   0431 78            [ 4]  201 	ld	a, b
   0432 D6 02         [ 7]  202 	sub	a, #0x02
   0434 DA A5 03      [10]  203 	jp	C, 00108$
                            204 ;src/txt_scroll_hard.c:37: for (y=0;y<8;y++) {
   0437 0C            [ 4]  205 	inc	c
   0438 79            [ 4]  206 	ld	a, c
   0439 D6 08         [ 7]  207 	sub	a, #0x08
   043B DA A3 03      [10]  208 	jp	C, 00116$
   043E 18 31         [12]  209 	jr	00112$
   0440                     210 00106$:
                            211 ;src/txt_scroll_hard.c:48: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
   0440 DD 7E 04      [19]  212 	ld	a, 4 (ix)
   0443 07            [ 4]  213 	rlca
   0444 07            [ 4]  214 	rlca
   0445 07            [ 4]  215 	rlca
   0446 E6 F8         [ 7]  216 	and	a, #0xf8
   0448 D5            [11]  217 	push	de
   0449 F5            [11]  218 	push	af
   044A 33            [ 6]  219 	inc	sp
   044B AF            [ 4]  220 	xor	a, a
   044C F5            [11]  221 	push	af
   044D 33            [ 6]  222 	inc	sp
   044E C5            [11]  223 	push	bc
   044F CD C1 4B      [17]  224 	call	_cpct_getScreenPtr
   0452 D1            [10]  225 	pop	de
                            226 ;src/txt_scroll_hard.c:49: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0453 4D            [ 4]  227 	ld	c, l
   0454 44            [ 4]  228 	ld	b, h
   0455 CB 23         [ 8]  229 	sla	e
   0457 CB 12         [ 8]  230 	rl	d
   0459 CB 23         [ 8]  231 	sla	e
   045B CB 12         [ 8]  232 	rl	d
   045D CB 23         [ 8]  233 	sla	e
   045F CB 12         [ 8]  234 	rl	d
   0461 CB 23         [ 8]  235 	sla	e
   0463 CB 12         [ 8]  236 	rl	d
   0465 DD 6E 05      [19]  237 	ld	l,5 (ix)
   0468 DD 66 06      [19]  238 	ld	h,6 (ix)
   046B 19            [11]  239 	add	hl, de
   046C C5            [11]  240 	push	bc
   046D E5            [11]  241 	push	hl
   046E CD E1 4B      [17]  242 	call	_cpct_drawTileAligned2x8_f
   0471                     243 00112$:
   0471 DD F9         [10]  244 	ld	sp, ix
   0473 DD E1         [14]  245 	pop	ix
   0475 C9            [10]  246 	ret
                            247 ;src/txt_scroll_hard.c:97: void scroll_hard(u16 step, u8* screen_plot_address) {
                            248 ;	---------------------------------
                            249 ; Function scroll_hard
                            250 ; ---------------------------------
   0476                     251 _scroll_hard::
   0476 DD E5         [15]  252 	push	ix
   0478 DD 21 00 00   [14]  253 	ld	ix,#0
   047C DD 39         [15]  254 	add	ix,sp
   047E F5            [11]  255 	push	af
                            256 ;src/txt_scroll_hard.c:103: u8* plot=screen_plot_address;
   047F DD 4E 06      [19]  257 	ld	c,6 (ix)
   0482 DD 46 07      [19]  258 	ld	b,7 (ix)
                            259 ;src/txt_scroll_hard.c:106: div=step/8;
   0485 DD 5E 04      [19]  260 	ld	e,4 (ix)
   0488 DD 56 05      [19]  261 	ld	d,5 (ix)
   048B CB 3A         [ 8]  262 	srl	d
   048D CB 1B         [ 8]  263 	rr	e
   048F CB 3A         [ 8]  264 	srl	d
   0491 CB 1B         [ 8]  265 	rr	e
   0493 CB 3A         [ 8]  266 	srl	d
   0495 CB 1B         [ 8]  267 	rr	e
                            268 ;src/txt_scroll_hard.c:107: mod=step%8;
   0497 DD 7E 04      [19]  269 	ld	a, 4 (ix)
   049A E6 07         [ 7]  270 	and	a, #0x07
   049C DD 77 FE      [19]  271 	ld	-2 (ix), a
   049F DD 36 FF 00   [19]  272 	ld	-1 (ix), #0x00
                            273 ;src/txt_scroll_hard.c:108: div=div%128;
   04A3 CB BB         [ 8]  274 	res	7, e
   04A5 16 00         [ 7]  275 	ld	d, #0x00
                            276 ;src/txt_scroll_hard.c:109: if (texte[div]==' ') {
   04A7 21 0F 05      [10]  277 	ld	hl, #_texte+0
   04AA 19            [11]  278 	add	hl, de
   04AB 5E            [ 7]  279 	ld	e, (hl)
   04AC 7B            [ 4]  280 	ld	a, e
   04AD D6 20         [ 7]  281 	sub	a, #0x20
   04AF 20 05         [12]  282 	jr	NZ,00102$
                            283 ;src/txt_scroll_hard.c:110: o=0;
   04B1 11 00 00      [10]  284 	ld	de, #0x0000
   04B4 18 09         [12]  285 	jr	00103$
   04B6                     286 00102$:
                            287 ;src/txt_scroll_hard.c:112: o=texte[div]-'?';
   04B6 16 00         [ 7]  288 	ld	d, #0x00
   04B8 7B            [ 4]  289 	ld	a, e
   04B9 C6 C1         [ 7]  290 	add	a, #0xc1
   04BB 5F            [ 4]  291 	ld	e, a
   04BC 7A            [ 4]  292 	ld	a, d
   04BD CE FF         [ 7]  293 	adc	a, #0xff
   04BF                     294 00103$:
                            295 ;src/txt_scroll_hard.c:115: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   04BF 21 91 05      [10]  296 	ld	hl, #_g_tile_fontmap32x32plat_000
   04C2 7B            [ 4]  297 	ld	a, e
   04C3 87            [ 4]  298 	add	a, a
   04C4 57            [ 4]  299 	ld	d, a
   04C5 1E 00         [ 7]  300 	ld	e, #0x00
   04C7 19            [11]  301 	add	hl,de
   04C8 EB            [ 4]  302 	ex	de,hl
   04C9 E1            [10]  303 	pop	hl
   04CA E5            [11]  304 	push	hl
   04CB 29            [11]  305 	add	hl, hl
   04CC 29            [11]  306 	add	hl, hl
   04CD 29            [11]  307 	add	hl, hl
   04CE 29            [11]  308 	add	hl, hl
   04CF 29            [11]  309 	add	hl, hl
   04D0 29            [11]  310 	add	hl, hl
   04D1 19            [11]  311 	add	hl, de
                            312 ;src/txt_scroll_hard.c:119: draw_char(0,(u8*)pointeur, plot);
   04D2 E5            [11]  313 	push	hl
   04D3 C5            [11]  314 	push	bc
   04D4 C5            [11]  315 	push	bc
   04D5 E5            [11]  316 	push	hl
   04D6 AF            [ 4]  317 	xor	a, a
   04D7 F5            [11]  318 	push	af
   04D8 33            [ 6]  319 	inc	sp
   04D9 CD 48 03      [17]  320 	call	_draw_char
   04DC F1            [10]  321 	pop	af
   04DD F1            [10]  322 	pop	af
   04DE 33            [ 6]  323 	inc	sp
   04DF C1            [10]  324 	pop	bc
   04E0 E1            [10]  325 	pop	hl
                            326 ;src/txt_scroll_hard.c:120: draw_char(1,(u8*)pointeur, plot);
   04E1 E5            [11]  327 	push	hl
   04E2 C5            [11]  328 	push	bc
   04E3 C5            [11]  329 	push	bc
   04E4 E5            [11]  330 	push	hl
   04E5 3E 01         [ 7]  331 	ld	a, #0x01
   04E7 F5            [11]  332 	push	af
   04E8 33            [ 6]  333 	inc	sp
   04E9 CD 48 03      [17]  334 	call	_draw_char
   04EC F1            [10]  335 	pop	af
   04ED F1            [10]  336 	pop	af
   04EE 33            [ 6]  337 	inc	sp
   04EF C1            [10]  338 	pop	bc
   04F0 E1            [10]  339 	pop	hl
                            340 ;src/txt_scroll_hard.c:121: draw_char(2,(u8*)pointeur, plot);
   04F1 E5            [11]  341 	push	hl
   04F2 C5            [11]  342 	push	bc
   04F3 C5            [11]  343 	push	bc
   04F4 E5            [11]  344 	push	hl
   04F5 3E 02         [ 7]  345 	ld	a, #0x02
   04F7 F5            [11]  346 	push	af
   04F8 33            [ 6]  347 	inc	sp
   04F9 CD 48 03      [17]  348 	call	_draw_char
   04FC F1            [10]  349 	pop	af
   04FD F1            [10]  350 	pop	af
   04FE 33            [ 6]  351 	inc	sp
   04FF C1            [10]  352 	pop	bc
   0500 E1            [10]  353 	pop	hl
                            354 ;src/txt_scroll_hard.c:122: draw_char(3,(u8*)pointeur, plot);
   0501 C5            [11]  355 	push	bc
   0502 E5            [11]  356 	push	hl
   0503 3E 03         [ 7]  357 	ld	a, #0x03
   0505 F5            [11]  358 	push	af
   0506 33            [ 6]  359 	inc	sp
   0507 CD 48 03      [17]  360 	call	_draw_char
   050A DD F9         [10]  361 	ld	sp,ix
   050C DD E1         [14]  362 	pop	ix
   050E C9            [10]  363 	ret
   050F                     364 _texte:
   050F 57 45 20 57 49 53   365 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   054B 41 4E 44 20 41 20   366 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   0587 44 46 47 20 20 20   367 	.ascii "DFG     "
        20 20
   058F 00                  368 	.db 0x00
   0590 00                  369 	.db 0x00
                            370 	.area _CODE
                            371 	.area _INITIALIZER
                            372 	.area _CABS (ABS)
