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
                             14 	.globl _cpct_drawSolidBox
                             15 	.globl _cpct_drawTileAligned2x8_f
                             16 	.globl _firstPlotScreen2
                             17 	.globl _c_screen3
                             18 	.globl _plot_screen2
                             19 	.globl _texte
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
   4D24                      27 _plot_screen2::
   4D24                      28 	.ds 2
   4D26                      29 _c_screen3::
   4D26                      30 	.ds 1
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
   4D2B                      35 _firstPlotScreen2::
   4D2B                      36 	.ds 1
                             37 ;--------------------------------------------------------
                             38 ; absolute external ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DABS (ABS)
                             41 ;--------------------------------------------------------
                             42 ; global & static initialisations
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _GSINIT
                             46 	.area _GSFINAL
                             47 	.area _GSINIT
                             48 ;--------------------------------------------------------
                             49 ; Home
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _HOME
                             53 ;--------------------------------------------------------
                             54 ; code
                             55 ;--------------------------------------------------------
                             56 	.area _CODE
                             57 ;src/txt_scroll_hard.c:16: u8 draw_char(u8 c, u8 ce2, u8* image, u8* plot) {
                             58 ;	---------------------------------
                             59 ; Function draw_char
                             60 ; ---------------------------------
   0348                      61 _draw_char::
   0348 DD E5         [15]   62 	push	ix
   034A DD 21 00 00   [14]   63 	ld	ix,#0
   034E DD 39         [15]   64 	add	ix,sp
   0350 F5            [11]   65 	push	af
                             66 ;src/txt_scroll_hard.c:24: u8 c_screen2=ce2;
   0351 DD 4E 05      [19]   67 	ld	c, 5 (ix)
                             68 ;src/txt_scroll_hard.c:25: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
   0354 DD 5E 04      [19]   69 	ld	e, 4 (ix)
   0357 16 00         [ 7]   70 	ld	d, #0x00
   0359 6B            [ 4]   71 	ld	l, e
   035A 62            [ 4]   72 	ld	h, d
   035B 29            [11]   73 	add	hl, hl
   035C 29            [11]   74 	add	hl, hl
   035D 19            [11]   75 	add	hl, de
   035E 29            [11]   76 	add	hl, hl
   035F 29            [11]   77 	add	hl, hl
   0360 29            [11]   78 	add	hl, hl
   0361 29            [11]   79 	add	hl, hl
   0362 EB            [ 4]   80 	ex	de,hl
   0363 21 01 78      [10]   81 	ld	hl, #0x7801
   0366 19            [11]   82 	add	hl,de
   0367 EB            [ 4]   83 	ex	de,hl
   0368 DD 6E 08      [19]   84 	ld	l,8 (ix)
   036B DD 66 09      [19]   85 	ld	h,9 (ix)
   036E 19            [11]   86 	add	hl, de
                             87 ;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
   036F 33            [ 6]   88 	inc	sp
   0370 33            [ 6]   89 	inc	sp
   0371 E5            [11]   90 	push	hl
                             91 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0372 DD 6E 04      [19]   92 	ld	l, 4 (ix)
   0375 26 00         [ 7]   93 	ld	h, #0x00
   0377 29            [11]   94 	add	hl, hl
   0378 29            [11]   95 	add	hl, hl
   0379 29            [11]   96 	add	hl, hl
   037A 29            [11]   97 	add	hl, hl
   037B EB            [ 4]   98 	ex	de,hl
   037C DD 6E 06      [19]   99 	ld	l,6 (ix)
   037F DD 66 07      [19]  100 	ld	h,7 (ix)
   0382 19            [11]  101 	add	hl, de
   0383 EB            [ 4]  102 	ex	de,hl
                            103 ;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
   0384 DD 7E FF      [19]  104 	ld	a, -1 (ix)
   0387 D6 40         [ 7]  105 	sub	a, #0x40
   0389 D2 30 04      [10]  106 	jp	NC, 00118$
                            107 ;src/txt_scroll_hard.c:29: c_screen3=c;
   038C DD 46 04      [19]  108 	ld	b, 4 (ix)
                            109 ;src/txt_scroll_hard.c:28: if (c<c_screen3) {
   038F 21 26 4D      [10]  110 	ld	hl, #_c_screen3
   0392 DD 7E 04      [19]  111 	ld	a, 4 (ix)
   0395 96            [ 7]  112 	sub	a, (hl)
   0396 30 0A         [12]  113 	jr	NC,00102$
                            114 ;src/txt_scroll_hard.c:29: c_screen3=c;
   0398 21 26 4D      [10]  115 	ld	hl,#_c_screen3 + 0
   039B 70            [ 7]  116 	ld	(hl), b
                            117 ;src/txt_scroll_hard.c:30: plot_screen2=0x8000;
   039C 21 00 80      [10]  118 	ld	hl, #0x8000
   039F 22 24 4D      [16]  119 	ld	(_plot_screen2), hl
   03A2                     120 00102$:
                            121 ;src/txt_scroll_hard.c:32: if (c<c_screen2) {
   03A2 DD 7E 04      [19]  122 	ld	a, 4 (ix)
   03A5 91            [ 4]  123 	sub	a, c
   03A6 30 01         [12]  124 	jr	NC,00104$
                            125 ;src/txt_scroll_hard.c:33: c_screen2=c;
   03A8 48            [ 4]  126 	ld	c, b
   03A9                     127 00104$:
                            128 ;src/txt_scroll_hard.c:51: p = cpct_getScreenPtr(plot_screen2+0x4000, 0,8*(c-c_screen2));
   03A9 DD 7E 04      [19]  129 	ld	a, 4 (ix)
   03AC 91            [ 4]  130 	sub	a, c
   03AD 07            [ 4]  131 	rlca
   03AE 07            [ 4]  132 	rlca
   03AF 07            [ 4]  133 	rlca
   03B0 E6 F8         [ 7]  134 	and	a, #0xf8
   03B2 47            [ 4]  135 	ld	b, a
   03B3 FD 21 00 40   [14]  136 	ld	iy, #0x4000
   03B7 C5            [11]  137 	push	bc
   03B8 ED 4B 24 4D   [20]  138 	ld	bc, (_plot_screen2)
   03BC FD 09         [15]  139 	add	iy, bc
   03BE C1            [10]  140 	pop	bc
   03BF C5            [11]  141 	push	bc
   03C0 D5            [11]  142 	push	de
   03C1 C5            [11]  143 	push	bc
   03C2 33            [ 6]  144 	inc	sp
   03C3 AF            [ 4]  145 	xor	a, a
   03C4 F5            [11]  146 	push	af
   03C5 33            [ 6]  147 	inc	sp
   03C6 FD E5         [15]  148 	push	iy
   03C8 CD 7E 4C      [17]  149 	call	_cpct_getScreenPtr
   03CB D1            [10]  150 	pop	de
   03CC C1            [10]  151 	pop	bc
                            152 ;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
   03CD DD 7E 04      [19]  153 	ld	a, 4 (ix)
   03D0 D6 03         [ 7]  154 	sub	a, #0x03
   03D2 20 04         [12]  155 	jr	NZ,00158$
   03D4 3E 01         [ 7]  156 	ld	a,#0x01
   03D6 18 01         [12]  157 	jr	00159$
   03D8                     158 00158$:
   03D8 AF            [ 4]  159 	xor	a,a
   03D9                     160 00159$:
   03D9 47            [ 4]  161 	ld	b, a
                            162 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
                            163 ;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
   03DA 79            [ 4]  164 	ld	a, c
   03DB D6 03         [ 7]  165 	sub	a,#0x03
   03DD 20 0C         [12]  166 	jr	NZ,00114$
   03DF B0            [ 4]  167 	or	a,b
   03E0 28 09         [12]  168 	jr	Z,00114$
                            169 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   03E2 C5            [11]  170 	push	bc
   03E3 E5            [11]  171 	push	hl
   03E4 D5            [11]  172 	push	de
   03E5 CD 9E 4C      [17]  173 	call	_cpct_drawTileAligned2x8_f
   03E8 C1            [10]  174 	pop	bc
   03E9 18 6D         [12]  175 	jr	00119$
   03EB                     176 00114$:
                            177 ;src/txt_scroll_hard.c:54: } else if (c_screen2==2 && c==2) { // le "suivant" en bas, donc 0 1
   03EB 79            [ 4]  178 	ld	a, c
   03EC D6 02         [ 7]  179 	sub	a, #0x02
   03EE 20 04         [12]  180 	jr	NZ,00162$
   03F0 3E 01         [ 7]  181 	ld	a,#0x01
   03F2 18 01         [12]  182 	jr	00163$
   03F4                     183 00162$:
   03F4 AF            [ 4]  184 	xor	a,a
   03F5                     185 00163$:
   03F5 DD 77 FE      [19]  186 	ld	-2 (ix), a
   03F8 B7            [ 4]  187 	or	a, a
   03F9 28 10         [12]  188 	jr	Z,00110$
   03FB DD 7E 04      [19]  189 	ld	a, 4 (ix)
   03FE D6 02         [ 7]  190 	sub	a, #0x02
   0400 20 09         [12]  191 	jr	NZ,00110$
                            192 ;src/txt_scroll_hard.c:57: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0402 C5            [11]  193 	push	bc
   0403 E5            [11]  194 	push	hl
   0404 D5            [11]  195 	push	de
   0405 CD 9E 4C      [17]  196 	call	_cpct_drawTileAligned2x8_f
   0408 C1            [10]  197 	pop	bc
   0409 18 4D         [12]  198 	jr	00119$
   040B                     199 00110$:
                            200 ;src/txt_scroll_hard.c:58: } else if (c_screen2==2 && c==3) { // le "suivant" en bas, donc 0 1
   040B DD 7E FE      [19]  201 	ld	a, -2 (ix)
   040E B7            [ 4]  202 	or	a, a
   040F 28 0D         [12]  203 	jr	Z,00106$
   0411 78            [ 4]  204 	ld	a, b
   0412 B7            [ 4]  205 	or	a, a
   0413 28 09         [12]  206 	jr	Z,00106$
                            207 ;src/txt_scroll_hard.c:61: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0415 C5            [11]  208 	push	bc
   0416 E5            [11]  209 	push	hl
   0417 D5            [11]  210 	push	de
   0418 CD 9E 4C      [17]  211 	call	_cpct_drawTileAligned2x8_f
   041B C1            [10]  212 	pop	bc
   041C 18 3A         [12]  213 	jr	00119$
   041E                     214 00106$:
                            215 ;src/txt_scroll_hard.c:63: cpct_drawSolidBox(p,c_screen2,2,8);
   041E C5            [11]  216 	push	bc
   041F 11 02 08      [10]  217 	ld	de, #0x0802
   0422 D5            [11]  218 	push	de
   0423 79            [ 4]  219 	ld	a, c
   0424 F5            [11]  220 	push	af
   0425 33            [ 6]  221 	inc	sp
   0426 E5            [11]  222 	push	hl
   0427 CD AE 4B      [17]  223 	call	_cpct_drawSolidBox
   042A F1            [10]  224 	pop	af
   042B F1            [10]  225 	pop	af
   042C 33            [ 6]  226 	inc	sp
   042D C1            [10]  227 	pop	bc
   042E 18 28         [12]  228 	jr	00119$
   0430                     229 00118$:
                            230 ;src/txt_scroll_hard.c:85: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
   0430 DD 7E 04      [19]  231 	ld	a, 4 (ix)
   0433 07            [ 4]  232 	rlca
   0434 07            [ 4]  233 	rlca
   0435 07            [ 4]  234 	rlca
   0436 E6 F8         [ 7]  235 	and	a, #0xf8
   0438 67            [ 4]  236 	ld	h, a
   0439 DD 7E 08      [19]  237 	ld	a, 8 (ix)
   043C C6 00         [ 7]  238 	add	a, #0x00
   043E 6F            [ 4]  239 	ld	l, a
   043F DD 7E 09      [19]  240 	ld	a, 9 (ix)
   0442 CE 40         [ 7]  241 	adc	a, #0x40
   0444 47            [ 4]  242 	ld	b, a
   0445 C5            [11]  243 	push	bc
   0446 D5            [11]  244 	push	de
   0447 E5            [11]  245 	push	hl
   0448 33            [ 6]  246 	inc	sp
   0449 AF            [ 4]  247 	xor	a, a
   044A F5            [11]  248 	push	af
   044B 33            [ 6]  249 	inc	sp
   044C 60            [ 4]  250 	ld	h, b
   044D E5            [11]  251 	push	hl
   044E CD 7E 4C      [17]  252 	call	_cpct_getScreenPtr
   0451 D1            [10]  253 	pop	de
   0452 E5            [11]  254 	push	hl
   0453 D5            [11]  255 	push	de
   0454 CD 9E 4C      [17]  256 	call	_cpct_drawTileAligned2x8_f
   0457 C1            [10]  257 	pop	bc
   0458                     258 00119$:
                            259 ;src/txt_scroll_hard.c:88: return c_screen2;
   0458 69            [ 4]  260 	ld	l, c
   0459 DD F9         [10]  261 	ld	sp, ix
   045B DD E1         [14]  262 	pop	ix
   045D C9            [10]  263 	ret
                            264 ;src/txt_scroll_hard.c:99: void scroll_hard(u16 step, u8* screen_plot_address) {
                            265 ;	---------------------------------
                            266 ; Function scroll_hard
                            267 ; ---------------------------------
   045E                     268 _scroll_hard::
   045E DD E5         [15]  269 	push	ix
   0460 DD 21 00 00   [14]  270 	ld	ix,#0
   0464 DD 39         [15]  271 	add	ix,sp
   0466 F5            [11]  272 	push	af
                            273 ;src/txt_scroll_hard.c:106: u8* plot=screen_plot_address;
   0467 DD 4E 06      [19]  274 	ld	c,6 (ix)
   046A DD 46 07      [19]  275 	ld	b,7 (ix)
                            276 ;src/txt_scroll_hard.c:110: div=step/8;
   046D DD 5E 04      [19]  277 	ld	e,4 (ix)
   0470 DD 56 05      [19]  278 	ld	d,5 (ix)
   0473 CB 3A         [ 8]  279 	srl	d
   0475 CB 1B         [ 8]  280 	rr	e
   0477 CB 3A         [ 8]  281 	srl	d
   0479 CB 1B         [ 8]  282 	rr	e
   047B CB 3A         [ 8]  283 	srl	d
   047D CB 1B         [ 8]  284 	rr	e
                            285 ;src/txt_scroll_hard.c:111: mod=step%8;
   047F DD 7E 04      [19]  286 	ld	a, 4 (ix)
   0482 E6 07         [ 7]  287 	and	a, #0x07
   0484 DD 77 FE      [19]  288 	ld	-2 (ix), a
   0487 DD 36 FF 00   [19]  289 	ld	-1 (ix), #0x00
                            290 ;src/txt_scroll_hard.c:112: div=div%128;
   048B CB BB         [ 8]  291 	res	7, e
   048D 16 00         [ 7]  292 	ld	d, #0x00
                            293 ;src/txt_scroll_hard.c:113: if (texte[div]==' ') {
   048F 21 2D 05      [10]  294 	ld	hl, #_texte+0
   0492 19            [11]  295 	add	hl, de
   0493 5E            [ 7]  296 	ld	e, (hl)
   0494 7B            [ 4]  297 	ld	a, e
   0495 D6 20         [ 7]  298 	sub	a, #0x20
   0497 20 05         [12]  299 	jr	NZ,00102$
                            300 ;src/txt_scroll_hard.c:114: o=0;
   0499 11 00 00      [10]  301 	ld	de, #0x0000
   049C 18 09         [12]  302 	jr	00103$
   049E                     303 00102$:
                            304 ;src/txt_scroll_hard.c:116: o=texte[div]-'?';
   049E 16 00         [ 7]  305 	ld	d, #0x00
   04A0 7B            [ 4]  306 	ld	a, e
   04A1 C6 C1         [ 7]  307 	add	a, #0xc1
   04A3 5F            [ 4]  308 	ld	e, a
   04A4 7A            [ 4]  309 	ld	a, d
   04A5 CE FF         [ 7]  310 	adc	a, #0xff
   04A7                     311 00103$:
                            312 ;src/txt_scroll_hard.c:119: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   04A7 21 AF 05      [10]  313 	ld	hl, #_g_tile_fontmap32x32plat_000
   04AA 7B            [ 4]  314 	ld	a, e
   04AB 87            [ 4]  315 	add	a, a
   04AC 57            [ 4]  316 	ld	d, a
   04AD 1E 00         [ 7]  317 	ld	e, #0x00
   04AF 19            [11]  318 	add	hl,de
   04B0 EB            [ 4]  319 	ex	de,hl
   04B1 E1            [10]  320 	pop	hl
   04B2 E5            [11]  321 	push	hl
   04B3 29            [11]  322 	add	hl, hl
   04B4 29            [11]  323 	add	hl, hl
   04B5 29            [11]  324 	add	hl, hl
   04B6 29            [11]  325 	add	hl, hl
   04B7 29            [11]  326 	add	hl, hl
   04B8 29            [11]  327 	add	hl, hl
   04B9 19            [11]  328 	add	hl,de
   04BA EB            [ 4]  329 	ex	de,hl
                            330 ;src/txt_scroll_hard.c:123: ce2=draw_char(0,4,(u8*)pointeur, plot);
   04BB C5            [11]  331 	push	bc
   04BC D5            [11]  332 	push	de
   04BD C5            [11]  333 	push	bc
   04BE D5            [11]  334 	push	de
   04BF 21 00 04      [10]  335 	ld	hl, #0x0400
   04C2 E5            [11]  336 	push	hl
   04C3 CD 48 03      [17]  337 	call	_draw_char
   04C6 F1            [10]  338 	pop	af
   04C7 F1            [10]  339 	pop	af
   04C8 F1            [10]  340 	pop	af
   04C9 D1            [10]  341 	pop	de
   04CA C1            [10]  342 	pop	bc
   04CB 65            [ 4]  343 	ld	h, l
                            344 ;src/txt_scroll_hard.c:124: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
   04CC C5            [11]  345 	push	bc
   04CD D5            [11]  346 	push	de
   04CE C5            [11]  347 	push	bc
   04CF D5            [11]  348 	push	de
   04D0 E5            [11]  349 	push	hl
   04D1 33            [ 6]  350 	inc	sp
   04D2 3E 01         [ 7]  351 	ld	a, #0x01
   04D4 F5            [11]  352 	push	af
   04D5 33            [ 6]  353 	inc	sp
   04D6 CD 48 03      [17]  354 	call	_draw_char
   04D9 F1            [10]  355 	pop	af
   04DA F1            [10]  356 	pop	af
   04DB F1            [10]  357 	pop	af
   04DC D1            [10]  358 	pop	de
   04DD C1            [10]  359 	pop	bc
   04DE 65            [ 4]  360 	ld	h, l
                            361 ;src/txt_scroll_hard.c:125: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
   04DF C5            [11]  362 	push	bc
   04E0 D5            [11]  363 	push	de
   04E1 C5            [11]  364 	push	bc
   04E2 D5            [11]  365 	push	de
   04E3 E5            [11]  366 	push	hl
   04E4 33            [ 6]  367 	inc	sp
   04E5 3E 02         [ 7]  368 	ld	a, #0x02
   04E7 F5            [11]  369 	push	af
   04E8 33            [ 6]  370 	inc	sp
   04E9 CD 48 03      [17]  371 	call	_draw_char
   04EC F1            [10]  372 	pop	af
   04ED F1            [10]  373 	pop	af
   04EE F1            [10]  374 	pop	af
   04EF D1            [10]  375 	pop	de
   04F0 C1            [10]  376 	pop	bc
   04F1 65            [ 4]  377 	ld	h, l
                            378 ;src/txt_scroll_hard.c:126: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
   04F2 C5            [11]  379 	push	bc
   04F3 D5            [11]  380 	push	de
   04F4 E5            [11]  381 	push	hl
   04F5 33            [ 6]  382 	inc	sp
   04F6 3E 03         [ 7]  383 	ld	a, #0x03
   04F8 F5            [11]  384 	push	af
   04F9 33            [ 6]  385 	inc	sp
   04FA CD 48 03      [17]  386 	call	_draw_char
   04FD F1            [10]  387 	pop	af
   04FE F1            [10]  388 	pop	af
   04FF F1            [10]  389 	pop	af
                            390 ;src/txt_scroll_hard.c:127: if (ce2==4) {
   0500 7D            [ 4]  391 	ld	a, l
   0501 D6 04         [ 7]  392 	sub	a, #0x04
   0503 20 0D         [12]  393 	jr	NZ,00105$
                            394 ;src/txt_scroll_hard.c:129: plot_screen2=0x8000;
   0505 21 00 80      [10]  395 	ld	hl, #0x8000
   0508 22 24 4D      [16]  396 	ld	(_plot_screen2), hl
                            397 ;src/txt_scroll_hard.c:130: c_screen3=4;
   050B 21 26 4D      [10]  398 	ld	hl,#_c_screen3 + 0
   050E 36 04         [10]  399 	ld	(hl), #0x04
   0510 18 16         [12]  400 	jr	00107$
   0512                     401 00105$:
                            402 ;src/txt_scroll_hard.c:132: plot_screen2+=2;
   0512 21 24 4D      [10]  403 	ld	hl, #_plot_screen2
   0515 7E            [ 7]  404 	ld	a, (hl)
   0516 C6 02         [ 7]  405 	add	a, #0x02
   0518 77            [ 7]  406 	ld	(hl), a
   0519 23            [ 6]  407 	inc	hl
   051A 7E            [ 7]  408 	ld	a, (hl)
   051B CE 00         [ 7]  409 	adc	a, #0x00
   051D 77            [ 7]  410 	ld	(hl), a
                            411 ;src/txt_scroll_hard.c:133: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
   051E 2A 24 4D      [16]  412 	ld	hl, (_plot_screen2)
   0521 7C            [ 4]  413 	ld	a, h
   0522 E6 87         [ 7]  414 	and	a, #0x87
   0524 67            [ 4]  415 	ld	h, a
   0525 22 24 4D      [16]  416 	ld	(_plot_screen2), hl
   0528                     417 00107$:
   0528 DD F9         [10]  418 	ld	sp, ix
   052A DD E1         [14]  419 	pop	ix
   052C C9            [10]  420 	ret
   052D                     421 _texte:
   052D 57 45 20 57 49 53   422 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0569 41 4E 44 20 41 20   423 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   05A5 44 46 47 20 20 20   424 	.ascii "DFG     "
        20 20
   05AD 00                  425 	.db 0x00
   05AE 00                  426 	.db 0x00
                            427 	.area _CODE
                            428 	.area _INITIALIZER
   4D33                     429 __xinit__firstPlotScreen2:
   4D33 01                  430 	.db #0x01	; 1
                            431 	.area _CABS (ABS)
