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
   4D2F                      27 _plot_screen2::
   4D2F                      28 	.ds 2
   4D31                      29 _c_screen3::
   4D31                      30 	.ds 1
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
   4D36                      35 _firstPlotScreen2::
   4D36                      36 	.ds 1
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
   0389 D2 3B 04      [10]  106 	jp	NC, 00118$
                            107 ;src/txt_scroll_hard.c:29: c_screen3=c;
   038C DD 46 04      [19]  108 	ld	b, 4 (ix)
                            109 ;src/txt_scroll_hard.c:28: if (c<c_screen3) {
   038F 21 31 4D      [10]  110 	ld	hl, #_c_screen3
   0392 DD 7E 04      [19]  111 	ld	a, 4 (ix)
   0395 96            [ 7]  112 	sub	a, (hl)
   0396 30 0A         [12]  113 	jr	NC,00102$
                            114 ;src/txt_scroll_hard.c:29: c_screen3=c;
   0398 21 31 4D      [10]  115 	ld	hl,#_c_screen3 + 0
   039B 70            [ 7]  116 	ld	(hl), b
                            117 ;src/txt_scroll_hard.c:30: plot_screen2=0x8000;
   039C 21 00 80      [10]  118 	ld	hl, #0x8000
   039F 22 2F 4D      [16]  119 	ld	(_plot_screen2), hl
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
   03B8 ED 4B 2F 4D   [20]  138 	ld	bc, (_plot_screen2)
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
   03C8 CD 89 4C      [17]  149 	call	_cpct_getScreenPtr
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
   03DD 20 0D         [12]  166 	jr	NZ,00114$
   03DF B0            [ 4]  167 	or	a,b
   03E0 28 0A         [12]  168 	jr	Z,00114$
                            169 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   03E2 C5            [11]  170 	push	bc
   03E3 E5            [11]  171 	push	hl
   03E4 D5            [11]  172 	push	de
   03E5 CD A9 4C      [17]  173 	call	_cpct_drawTileAligned2x8_f
   03E8 C1            [10]  174 	pop	bc
   03E9 C3 63 04      [10]  175 	jp	00119$
   03EC                     176 00114$:
                            177 ;src/txt_scroll_hard.c:54: } else if (c_screen2==2 && c==2) { // le "suivant" en bas, donc 0 1
   03EC 79            [ 4]  178 	ld	a, c
   03ED D6 02         [ 7]  179 	sub	a, #0x02
   03EF 20 04         [12]  180 	jr	NZ,00162$
   03F1 3E 01         [ 7]  181 	ld	a,#0x01
   03F3 18 01         [12]  182 	jr	00163$
   03F5                     183 00162$:
   03F5 AF            [ 4]  184 	xor	a,a
   03F6                     185 00163$:
   03F6 DD 77 FE      [19]  186 	ld	-2 (ix), a
   03F9 B7            [ 4]  187 	or	a, a
   03FA 28 1A         [12]  188 	jr	Z,00110$
   03FC DD 7E 04      [19]  189 	ld	a, 4 (ix)
   03FF D6 02         [ 7]  190 	sub	a, #0x02
   0401 20 13         [12]  191 	jr	NZ,00110$
                            192 ;src/txt_scroll_hard.c:56: cpct_drawSolidBox(p,0xFF,2,8);
   0403 C5            [11]  193 	push	bc
   0404 11 02 08      [10]  194 	ld	de, #0x0802
   0407 D5            [11]  195 	push	de
   0408 3E FF         [ 7]  196 	ld	a, #0xff
   040A F5            [11]  197 	push	af
   040B 33            [ 6]  198 	inc	sp
   040C E5            [11]  199 	push	hl
   040D CD B9 4B      [17]  200 	call	_cpct_drawSolidBox
   0410 F1            [10]  201 	pop	af
   0411 F1            [10]  202 	pop	af
   0412 33            [ 6]  203 	inc	sp
   0413 C1            [10]  204 	pop	bc
   0414 18 4D         [12]  205 	jr	00119$
   0416                     206 00110$:
                            207 ;src/txt_scroll_hard.c:57: } else if (c_screen2==2 && c==3) { // le "suivant" en bas, donc 0 1
   0416 DD 7E FE      [19]  208 	ld	a, -2 (ix)
   0419 B7            [ 4]  209 	or	a, a
   041A 28 0D         [12]  210 	jr	Z,00106$
   041C 78            [ 4]  211 	ld	a, b
   041D B7            [ 4]  212 	or	a, a
   041E 28 09         [12]  213 	jr	Z,00106$
                            214 ;src/txt_scroll_hard.c:60: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0420 C5            [11]  215 	push	bc
   0421 E5            [11]  216 	push	hl
   0422 D5            [11]  217 	push	de
   0423 CD A9 4C      [17]  218 	call	_cpct_drawTileAligned2x8_f
   0426 C1            [10]  219 	pop	bc
   0427 18 3A         [12]  220 	jr	00119$
   0429                     221 00106$:
                            222 ;src/txt_scroll_hard.c:62: cpct_drawSolidBox(p,c_screen2,2,8);
   0429 C5            [11]  223 	push	bc
   042A 11 02 08      [10]  224 	ld	de, #0x0802
   042D D5            [11]  225 	push	de
   042E 79            [ 4]  226 	ld	a, c
   042F F5            [11]  227 	push	af
   0430 33            [ 6]  228 	inc	sp
   0431 E5            [11]  229 	push	hl
   0432 CD B9 4B      [17]  230 	call	_cpct_drawSolidBox
   0435 F1            [10]  231 	pop	af
   0436 F1            [10]  232 	pop	af
   0437 33            [ 6]  233 	inc	sp
   0438 C1            [10]  234 	pop	bc
   0439 18 28         [12]  235 	jr	00119$
   043B                     236 00118$:
                            237 ;src/txt_scroll_hard.c:84: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
   043B DD 7E 04      [19]  238 	ld	a, 4 (ix)
   043E 07            [ 4]  239 	rlca
   043F 07            [ 4]  240 	rlca
   0440 07            [ 4]  241 	rlca
   0441 E6 F8         [ 7]  242 	and	a, #0xf8
   0443 67            [ 4]  243 	ld	h, a
   0444 DD 7E 08      [19]  244 	ld	a, 8 (ix)
   0447 C6 00         [ 7]  245 	add	a, #0x00
   0449 6F            [ 4]  246 	ld	l, a
   044A DD 7E 09      [19]  247 	ld	a, 9 (ix)
   044D CE 40         [ 7]  248 	adc	a, #0x40
   044F 47            [ 4]  249 	ld	b, a
   0450 C5            [11]  250 	push	bc
   0451 D5            [11]  251 	push	de
   0452 E5            [11]  252 	push	hl
   0453 33            [ 6]  253 	inc	sp
   0454 AF            [ 4]  254 	xor	a, a
   0455 F5            [11]  255 	push	af
   0456 33            [ 6]  256 	inc	sp
   0457 60            [ 4]  257 	ld	h, b
   0458 E5            [11]  258 	push	hl
   0459 CD 89 4C      [17]  259 	call	_cpct_getScreenPtr
   045C D1            [10]  260 	pop	de
   045D E5            [11]  261 	push	hl
   045E D5            [11]  262 	push	de
   045F CD A9 4C      [17]  263 	call	_cpct_drawTileAligned2x8_f
   0462 C1            [10]  264 	pop	bc
   0463                     265 00119$:
                            266 ;src/txt_scroll_hard.c:87: return c_screen2;
   0463 69            [ 4]  267 	ld	l, c
   0464 DD F9         [10]  268 	ld	sp, ix
   0466 DD E1         [14]  269 	pop	ix
   0468 C9            [10]  270 	ret
                            271 ;src/txt_scroll_hard.c:98: void scroll_hard(u16 step, u8* screen_plot_address) {
                            272 ;	---------------------------------
                            273 ; Function scroll_hard
                            274 ; ---------------------------------
   0469                     275 _scroll_hard::
   0469 DD E5         [15]  276 	push	ix
   046B DD 21 00 00   [14]  277 	ld	ix,#0
   046F DD 39         [15]  278 	add	ix,sp
   0471 F5            [11]  279 	push	af
                            280 ;src/txt_scroll_hard.c:105: u8* plot=screen_plot_address;
   0472 DD 4E 06      [19]  281 	ld	c,6 (ix)
   0475 DD 46 07      [19]  282 	ld	b,7 (ix)
                            283 ;src/txt_scroll_hard.c:109: div=step/8;
   0478 DD 5E 04      [19]  284 	ld	e,4 (ix)
   047B DD 56 05      [19]  285 	ld	d,5 (ix)
   047E CB 3A         [ 8]  286 	srl	d
   0480 CB 1B         [ 8]  287 	rr	e
   0482 CB 3A         [ 8]  288 	srl	d
   0484 CB 1B         [ 8]  289 	rr	e
   0486 CB 3A         [ 8]  290 	srl	d
   0488 CB 1B         [ 8]  291 	rr	e
                            292 ;src/txt_scroll_hard.c:110: mod=step%8;
   048A DD 7E 04      [19]  293 	ld	a, 4 (ix)
   048D E6 07         [ 7]  294 	and	a, #0x07
   048F DD 77 FE      [19]  295 	ld	-2 (ix), a
   0492 DD 36 FF 00   [19]  296 	ld	-1 (ix), #0x00
                            297 ;src/txt_scroll_hard.c:111: div=div%128;
   0496 CB BB         [ 8]  298 	res	7, e
   0498 16 00         [ 7]  299 	ld	d, #0x00
                            300 ;src/txt_scroll_hard.c:112: if (texte[div]==' ') {
   049A 21 38 05      [10]  301 	ld	hl, #_texte+0
   049D 19            [11]  302 	add	hl, de
   049E 5E            [ 7]  303 	ld	e, (hl)
   049F 7B            [ 4]  304 	ld	a, e
   04A0 D6 20         [ 7]  305 	sub	a, #0x20
   04A2 20 05         [12]  306 	jr	NZ,00102$
                            307 ;src/txt_scroll_hard.c:113: o=0;
   04A4 11 00 00      [10]  308 	ld	de, #0x0000
   04A7 18 09         [12]  309 	jr	00103$
   04A9                     310 00102$:
                            311 ;src/txt_scroll_hard.c:115: o=texte[div]-'?';
   04A9 16 00         [ 7]  312 	ld	d, #0x00
   04AB 7B            [ 4]  313 	ld	a, e
   04AC C6 C1         [ 7]  314 	add	a, #0xc1
   04AE 5F            [ 4]  315 	ld	e, a
   04AF 7A            [ 4]  316 	ld	a, d
   04B0 CE FF         [ 7]  317 	adc	a, #0xff
   04B2                     318 00103$:
                            319 ;src/txt_scroll_hard.c:118: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   04B2 21 BA 05      [10]  320 	ld	hl, #_g_tile_fontmap32x32plat_000
   04B5 7B            [ 4]  321 	ld	a, e
   04B6 87            [ 4]  322 	add	a, a
   04B7 57            [ 4]  323 	ld	d, a
   04B8 1E 00         [ 7]  324 	ld	e, #0x00
   04BA 19            [11]  325 	add	hl,de
   04BB EB            [ 4]  326 	ex	de,hl
   04BC E1            [10]  327 	pop	hl
   04BD E5            [11]  328 	push	hl
   04BE 29            [11]  329 	add	hl, hl
   04BF 29            [11]  330 	add	hl, hl
   04C0 29            [11]  331 	add	hl, hl
   04C1 29            [11]  332 	add	hl, hl
   04C2 29            [11]  333 	add	hl, hl
   04C3 29            [11]  334 	add	hl, hl
   04C4 19            [11]  335 	add	hl,de
   04C5 EB            [ 4]  336 	ex	de,hl
                            337 ;src/txt_scroll_hard.c:122: ce2=draw_char(0,4,(u8*)pointeur, plot);
   04C6 C5            [11]  338 	push	bc
   04C7 D5            [11]  339 	push	de
   04C8 C5            [11]  340 	push	bc
   04C9 D5            [11]  341 	push	de
   04CA 21 00 04      [10]  342 	ld	hl, #0x0400
   04CD E5            [11]  343 	push	hl
   04CE CD 48 03      [17]  344 	call	_draw_char
   04D1 F1            [10]  345 	pop	af
   04D2 F1            [10]  346 	pop	af
   04D3 F1            [10]  347 	pop	af
   04D4 D1            [10]  348 	pop	de
   04D5 C1            [10]  349 	pop	bc
   04D6 65            [ 4]  350 	ld	h, l
                            351 ;src/txt_scroll_hard.c:123: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
   04D7 C5            [11]  352 	push	bc
   04D8 D5            [11]  353 	push	de
   04D9 C5            [11]  354 	push	bc
   04DA D5            [11]  355 	push	de
   04DB E5            [11]  356 	push	hl
   04DC 33            [ 6]  357 	inc	sp
   04DD 3E 01         [ 7]  358 	ld	a, #0x01
   04DF F5            [11]  359 	push	af
   04E0 33            [ 6]  360 	inc	sp
   04E1 CD 48 03      [17]  361 	call	_draw_char
   04E4 F1            [10]  362 	pop	af
   04E5 F1            [10]  363 	pop	af
   04E6 F1            [10]  364 	pop	af
   04E7 D1            [10]  365 	pop	de
   04E8 C1            [10]  366 	pop	bc
   04E9 65            [ 4]  367 	ld	h, l
                            368 ;src/txt_scroll_hard.c:124: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
   04EA C5            [11]  369 	push	bc
   04EB D5            [11]  370 	push	de
   04EC C5            [11]  371 	push	bc
   04ED D5            [11]  372 	push	de
   04EE E5            [11]  373 	push	hl
   04EF 33            [ 6]  374 	inc	sp
   04F0 3E 02         [ 7]  375 	ld	a, #0x02
   04F2 F5            [11]  376 	push	af
   04F3 33            [ 6]  377 	inc	sp
   04F4 CD 48 03      [17]  378 	call	_draw_char
   04F7 F1            [10]  379 	pop	af
   04F8 F1            [10]  380 	pop	af
   04F9 F1            [10]  381 	pop	af
   04FA D1            [10]  382 	pop	de
   04FB C1            [10]  383 	pop	bc
   04FC 65            [ 4]  384 	ld	h, l
                            385 ;src/txt_scroll_hard.c:125: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
   04FD C5            [11]  386 	push	bc
   04FE D5            [11]  387 	push	de
   04FF E5            [11]  388 	push	hl
   0500 33            [ 6]  389 	inc	sp
   0501 3E 03         [ 7]  390 	ld	a, #0x03
   0503 F5            [11]  391 	push	af
   0504 33            [ 6]  392 	inc	sp
   0505 CD 48 03      [17]  393 	call	_draw_char
   0508 F1            [10]  394 	pop	af
   0509 F1            [10]  395 	pop	af
   050A F1            [10]  396 	pop	af
                            397 ;src/txt_scroll_hard.c:126: if (ce2==4) {
   050B 7D            [ 4]  398 	ld	a, l
   050C D6 04         [ 7]  399 	sub	a, #0x04
   050E 20 0D         [12]  400 	jr	NZ,00105$
                            401 ;src/txt_scroll_hard.c:128: plot_screen2=0x8000;
   0510 21 00 80      [10]  402 	ld	hl, #0x8000
   0513 22 2F 4D      [16]  403 	ld	(_plot_screen2), hl
                            404 ;src/txt_scroll_hard.c:129: c_screen3=4;
   0516 21 31 4D      [10]  405 	ld	hl,#_c_screen3 + 0
   0519 36 04         [10]  406 	ld	(hl), #0x04
   051B 18 16         [12]  407 	jr	00107$
   051D                     408 00105$:
                            409 ;src/txt_scroll_hard.c:131: plot_screen2+=2;
   051D 21 2F 4D      [10]  410 	ld	hl, #_plot_screen2
   0520 7E            [ 7]  411 	ld	a, (hl)
   0521 C6 02         [ 7]  412 	add	a, #0x02
   0523 77            [ 7]  413 	ld	(hl), a
   0524 23            [ 6]  414 	inc	hl
   0525 7E            [ 7]  415 	ld	a, (hl)
   0526 CE 00         [ 7]  416 	adc	a, #0x00
   0528 77            [ 7]  417 	ld	(hl), a
                            418 ;src/txt_scroll_hard.c:132: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
   0529 2A 2F 4D      [16]  419 	ld	hl, (_plot_screen2)
   052C 7C            [ 4]  420 	ld	a, h
   052D E6 87         [ 7]  421 	and	a, #0x87
   052F 67            [ 4]  422 	ld	h, a
   0530 22 2F 4D      [16]  423 	ld	(_plot_screen2), hl
   0533                     424 00107$:
   0533 DD F9         [10]  425 	ld	sp, ix
   0535 DD E1         [14]  426 	pop	ix
   0537 C9            [10]  427 	ret
   0538                     428 _texte:
   0538 57 45 20 57 49 53   429 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0574 41 4E 44 20 41 20   430 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   05B0 44 46 47 20 20 20   431 	.ascii "DFG     "
        20 20
   05B8 00                  432 	.db 0x00
   05B9 00                  433 	.db 0x00
                            434 	.area _CODE
                            435 	.area _INITIALIZER
   4D3E                     436 __xinit__firstPlotScreen2:
   4D3E 01                  437 	.db #0x01	; 1
                            438 	.area _CABS (ABS)
