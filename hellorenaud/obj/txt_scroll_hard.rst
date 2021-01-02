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
   4D36                      27 _plot_screen2::
   4D36                      28 	.ds 2
   4D38                      29 _c_screen3::
   4D38                      30 	.ds 1
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
   4D3D                      35 _firstPlotScreen2::
   4D3D                      36 	.ds 1
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
   0389 D2 42 04      [10]  106 	jp	NC, 00122$
                            107 ;src/txt_scroll_hard.c:29: c_screen3=c;
   038C DD 46 04      [19]  108 	ld	b, 4 (ix)
                            109 ;src/txt_scroll_hard.c:28: if (c<c_screen3) {
   038F 21 38 4D      [10]  110 	ld	hl, #_c_screen3
   0392 DD 7E 04      [19]  111 	ld	a, 4 (ix)
   0395 96            [ 7]  112 	sub	a, (hl)
   0396 30 0A         [12]  113 	jr	NC,00102$
                            114 ;src/txt_scroll_hard.c:29: c_screen3=c;
   0398 21 38 4D      [10]  115 	ld	hl,#_c_screen3 + 0
   039B 70            [ 7]  116 	ld	(hl), b
                            117 ;src/txt_scroll_hard.c:30: plot_screen2=0x8000;
   039C 21 00 80      [10]  118 	ld	hl, #0x8000
   039F 22 36 4D      [16]  119 	ld	(_plot_screen2), hl
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
   03B8 ED 4B 36 4D   [20]  138 	ld	bc, (_plot_screen2)
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
   03C8 CD 90 4C      [17]  149 	call	_cpct_getScreenPtr
   03CB D1            [10]  150 	pop	de
   03CC C1            [10]  151 	pop	bc
                            152 ;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
   03CD DD 7E 04      [19]  153 	ld	a, 4 (ix)
   03D0 D6 03         [ 7]  154 	sub	a, #0x03
   03D2 20 04         [12]  155 	jr	NZ,00170$
   03D4 3E 01         [ 7]  156 	ld	a,#0x01
   03D6 18 01         [12]  157 	jr	00171$
   03D8                     158 00170$:
   03D8 AF            [ 4]  159 	xor	a,a
   03D9                     160 00171$:
   03D9 47            [ 4]  161 	ld	b, a
                            162 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
                            163 ;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
   03DA 79            [ 4]  164 	ld	a, c
   03DB D6 03         [ 7]  165 	sub	a,#0x03
   03DD 20 0D         [12]  166 	jr	NZ,00118$
   03DF B0            [ 4]  167 	or	a,b
   03E0 28 0A         [12]  168 	jr	Z,00118$
                            169 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   03E2 C5            [11]  170 	push	bc
   03E3 E5            [11]  171 	push	hl
   03E4 D5            [11]  172 	push	de
   03E5 CD B0 4C      [17]  173 	call	_cpct_drawTileAligned2x8_f
   03E8 C1            [10]  174 	pop	bc
   03E9 C3 6A 04      [10]  175 	jp	00123$
   03EC                     176 00118$:
                            177 ;src/txt_scroll_hard.c:54: } else if (c_screen2==2 && c==2) { // le "suivant" en bas, donc 0 1
   03EC 79            [ 4]  178 	ld	a, c
   03ED D6 02         [ 7]  179 	sub	a, #0x02
   03EF 20 04         [12]  180 	jr	NZ,00174$
   03F1 3E 01         [ 7]  181 	ld	a,#0x01
   03F3 18 01         [12]  182 	jr	00175$
   03F5                     183 00174$:
   03F5 AF            [ 4]  184 	xor	a,a
   03F6                     185 00175$:
   03F6 DD 77 FE      [19]  186 	ld	-2 (ix), a
   03F9 B7            [ 4]  187 	or	a, a
   03FA 28 10         [12]  188 	jr	Z,00114$
   03FC DD 7E 04      [19]  189 	ld	a, 4 (ix)
   03FF D6 02         [ 7]  190 	sub	a, #0x02
   0401 20 09         [12]  191 	jr	NZ,00114$
                            192 ;src/txt_scroll_hard.c:57: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0403 C5            [11]  193 	push	bc
   0404 E5            [11]  194 	push	hl
   0405 D5            [11]  195 	push	de
   0406 CD B0 4C      [17]  196 	call	_cpct_drawTileAligned2x8_f
   0409 C1            [10]  197 	pop	bc
   040A 18 5E         [12]  198 	jr	00123$
   040C                     199 00114$:
                            200 ;src/txt_scroll_hard.c:58: } else if (c_screen2==2 && c==3) { // le "suivant" en bas, donc 0 1
   040C DD 7E FE      [19]  201 	ld	a, -2 (ix)
   040F B7            [ 4]  202 	or	a, a
   0410 28 0D         [12]  203 	jr	Z,00110$
   0412 78            [ 4]  204 	ld	a, b
   0413 B7            [ 4]  205 	or	a, a
   0414 28 09         [12]  206 	jr	Z,00110$
                            207 ;src/txt_scroll_hard.c:61: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0416 C5            [11]  208 	push	bc
   0417 E5            [11]  209 	push	hl
   0418 D5            [11]  210 	push	de
   0419 CD B0 4C      [17]  211 	call	_cpct_drawTileAligned2x8_f
   041C C1            [10]  212 	pop	bc
   041D 18 4B         [12]  213 	jr	00123$
   041F                     214 00110$:
                            215 ;src/txt_scroll_hard.c:62: } else if (c_screen2==1 && c==3) { // le "suivant" en bas, donc 0 1
   041F 79            [ 4]  216 	ld	a, c
   0420 3D            [ 4]  217 	dec	a
   0421 20 0D         [12]  218 	jr	NZ,00106$
   0423 78            [ 4]  219 	ld	a, b
   0424 B7            [ 4]  220 	or	a, a
   0425 28 09         [12]  221 	jr	Z,00106$
                            222 ;src/txt_scroll_hard.c:63: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0427 C5            [11]  223 	push	bc
   0428 E5            [11]  224 	push	hl
   0429 D5            [11]  225 	push	de
   042A CD B0 4C      [17]  226 	call	_cpct_drawTileAligned2x8_f
   042D C1            [10]  227 	pop	bc
   042E 18 3A         [12]  228 	jr	00123$
   0430                     229 00106$:
                            230 ;src/txt_scroll_hard.c:65: cpct_drawSolidBox(p,c_screen2,2,8);
   0430 C5            [11]  231 	push	bc
   0431 11 02 08      [10]  232 	ld	de, #0x0802
   0434 D5            [11]  233 	push	de
   0435 79            [ 4]  234 	ld	a, c
   0436 F5            [11]  235 	push	af
   0437 33            [ 6]  236 	inc	sp
   0438 E5            [11]  237 	push	hl
   0439 CD C0 4B      [17]  238 	call	_cpct_drawSolidBox
   043C F1            [10]  239 	pop	af
   043D F1            [10]  240 	pop	af
   043E 33            [ 6]  241 	inc	sp
   043F C1            [10]  242 	pop	bc
   0440 18 28         [12]  243 	jr	00123$
   0442                     244 00122$:
                            245 ;src/txt_scroll_hard.c:87: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
   0442 DD 7E 04      [19]  246 	ld	a, 4 (ix)
   0445 07            [ 4]  247 	rlca
   0446 07            [ 4]  248 	rlca
   0447 07            [ 4]  249 	rlca
   0448 E6 F8         [ 7]  250 	and	a, #0xf8
   044A 67            [ 4]  251 	ld	h, a
   044B DD 7E 08      [19]  252 	ld	a, 8 (ix)
   044E C6 00         [ 7]  253 	add	a, #0x00
   0450 6F            [ 4]  254 	ld	l, a
   0451 DD 7E 09      [19]  255 	ld	a, 9 (ix)
   0454 CE 40         [ 7]  256 	adc	a, #0x40
   0456 47            [ 4]  257 	ld	b, a
   0457 C5            [11]  258 	push	bc
   0458 D5            [11]  259 	push	de
   0459 E5            [11]  260 	push	hl
   045A 33            [ 6]  261 	inc	sp
   045B AF            [ 4]  262 	xor	a, a
   045C F5            [11]  263 	push	af
   045D 33            [ 6]  264 	inc	sp
   045E 60            [ 4]  265 	ld	h, b
   045F E5            [11]  266 	push	hl
   0460 CD 90 4C      [17]  267 	call	_cpct_getScreenPtr
   0463 D1            [10]  268 	pop	de
   0464 E5            [11]  269 	push	hl
   0465 D5            [11]  270 	push	de
   0466 CD B0 4C      [17]  271 	call	_cpct_drawTileAligned2x8_f
   0469 C1            [10]  272 	pop	bc
   046A                     273 00123$:
                            274 ;src/txt_scroll_hard.c:90: return c_screen2;
   046A 69            [ 4]  275 	ld	l, c
   046B DD F9         [10]  276 	ld	sp, ix
   046D DD E1         [14]  277 	pop	ix
   046F C9            [10]  278 	ret
                            279 ;src/txt_scroll_hard.c:101: void scroll_hard(u16 step, u8* screen_plot_address) {
                            280 ;	---------------------------------
                            281 ; Function scroll_hard
                            282 ; ---------------------------------
   0470                     283 _scroll_hard::
   0470 DD E5         [15]  284 	push	ix
   0472 DD 21 00 00   [14]  285 	ld	ix,#0
   0476 DD 39         [15]  286 	add	ix,sp
   0478 F5            [11]  287 	push	af
                            288 ;src/txt_scroll_hard.c:108: u8* plot=screen_plot_address;
   0479 DD 4E 06      [19]  289 	ld	c,6 (ix)
   047C DD 46 07      [19]  290 	ld	b,7 (ix)
                            291 ;src/txt_scroll_hard.c:112: div=step/8;
   047F DD 5E 04      [19]  292 	ld	e,4 (ix)
   0482 DD 56 05      [19]  293 	ld	d,5 (ix)
   0485 CB 3A         [ 8]  294 	srl	d
   0487 CB 1B         [ 8]  295 	rr	e
   0489 CB 3A         [ 8]  296 	srl	d
   048B CB 1B         [ 8]  297 	rr	e
   048D CB 3A         [ 8]  298 	srl	d
   048F CB 1B         [ 8]  299 	rr	e
                            300 ;src/txt_scroll_hard.c:113: mod=step%8;
   0491 DD 7E 04      [19]  301 	ld	a, 4 (ix)
   0494 E6 07         [ 7]  302 	and	a, #0x07
   0496 DD 77 FE      [19]  303 	ld	-2 (ix), a
   0499 DD 36 FF 00   [19]  304 	ld	-1 (ix), #0x00
                            305 ;src/txt_scroll_hard.c:114: div=div%128;
   049D CB BB         [ 8]  306 	res	7, e
   049F 16 00         [ 7]  307 	ld	d, #0x00
                            308 ;src/txt_scroll_hard.c:115: if (texte[div]==' ') {
   04A1 21 3F 05      [10]  309 	ld	hl, #_texte+0
   04A4 19            [11]  310 	add	hl, de
   04A5 5E            [ 7]  311 	ld	e, (hl)
   04A6 7B            [ 4]  312 	ld	a, e
   04A7 D6 20         [ 7]  313 	sub	a, #0x20
   04A9 20 05         [12]  314 	jr	NZ,00102$
                            315 ;src/txt_scroll_hard.c:116: o=0;
   04AB 11 00 00      [10]  316 	ld	de, #0x0000
   04AE 18 09         [12]  317 	jr	00103$
   04B0                     318 00102$:
                            319 ;src/txt_scroll_hard.c:118: o=texte[div]-'?';
   04B0 16 00         [ 7]  320 	ld	d, #0x00
   04B2 7B            [ 4]  321 	ld	a, e
   04B3 C6 C1         [ 7]  322 	add	a, #0xc1
   04B5 5F            [ 4]  323 	ld	e, a
   04B6 7A            [ 4]  324 	ld	a, d
   04B7 CE FF         [ 7]  325 	adc	a, #0xff
   04B9                     326 00103$:
                            327 ;src/txt_scroll_hard.c:121: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   04B9 21 C1 05      [10]  328 	ld	hl, #_g_tile_fontmap32x32plat_000
   04BC 7B            [ 4]  329 	ld	a, e
   04BD 87            [ 4]  330 	add	a, a
   04BE 57            [ 4]  331 	ld	d, a
   04BF 1E 00         [ 7]  332 	ld	e, #0x00
   04C1 19            [11]  333 	add	hl,de
   04C2 EB            [ 4]  334 	ex	de,hl
   04C3 E1            [10]  335 	pop	hl
   04C4 E5            [11]  336 	push	hl
   04C5 29            [11]  337 	add	hl, hl
   04C6 29            [11]  338 	add	hl, hl
   04C7 29            [11]  339 	add	hl, hl
   04C8 29            [11]  340 	add	hl, hl
   04C9 29            [11]  341 	add	hl, hl
   04CA 29            [11]  342 	add	hl, hl
   04CB 19            [11]  343 	add	hl,de
   04CC EB            [ 4]  344 	ex	de,hl
                            345 ;src/txt_scroll_hard.c:125: ce2=draw_char(0,4,(u8*)pointeur, plot);
   04CD C5            [11]  346 	push	bc
   04CE D5            [11]  347 	push	de
   04CF C5            [11]  348 	push	bc
   04D0 D5            [11]  349 	push	de
   04D1 21 00 04      [10]  350 	ld	hl, #0x0400
   04D4 E5            [11]  351 	push	hl
   04D5 CD 48 03      [17]  352 	call	_draw_char
   04D8 F1            [10]  353 	pop	af
   04D9 F1            [10]  354 	pop	af
   04DA F1            [10]  355 	pop	af
   04DB D1            [10]  356 	pop	de
   04DC C1            [10]  357 	pop	bc
   04DD 65            [ 4]  358 	ld	h, l
                            359 ;src/txt_scroll_hard.c:126: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
   04DE C5            [11]  360 	push	bc
   04DF D5            [11]  361 	push	de
   04E0 C5            [11]  362 	push	bc
   04E1 D5            [11]  363 	push	de
   04E2 E5            [11]  364 	push	hl
   04E3 33            [ 6]  365 	inc	sp
   04E4 3E 01         [ 7]  366 	ld	a, #0x01
   04E6 F5            [11]  367 	push	af
   04E7 33            [ 6]  368 	inc	sp
   04E8 CD 48 03      [17]  369 	call	_draw_char
   04EB F1            [10]  370 	pop	af
   04EC F1            [10]  371 	pop	af
   04ED F1            [10]  372 	pop	af
   04EE D1            [10]  373 	pop	de
   04EF C1            [10]  374 	pop	bc
   04F0 65            [ 4]  375 	ld	h, l
                            376 ;src/txt_scroll_hard.c:127: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
   04F1 C5            [11]  377 	push	bc
   04F2 D5            [11]  378 	push	de
   04F3 C5            [11]  379 	push	bc
   04F4 D5            [11]  380 	push	de
   04F5 E5            [11]  381 	push	hl
   04F6 33            [ 6]  382 	inc	sp
   04F7 3E 02         [ 7]  383 	ld	a, #0x02
   04F9 F5            [11]  384 	push	af
   04FA 33            [ 6]  385 	inc	sp
   04FB CD 48 03      [17]  386 	call	_draw_char
   04FE F1            [10]  387 	pop	af
   04FF F1            [10]  388 	pop	af
   0500 F1            [10]  389 	pop	af
   0501 D1            [10]  390 	pop	de
   0502 C1            [10]  391 	pop	bc
   0503 65            [ 4]  392 	ld	h, l
                            393 ;src/txt_scroll_hard.c:128: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
   0504 C5            [11]  394 	push	bc
   0505 D5            [11]  395 	push	de
   0506 E5            [11]  396 	push	hl
   0507 33            [ 6]  397 	inc	sp
   0508 3E 03         [ 7]  398 	ld	a, #0x03
   050A F5            [11]  399 	push	af
   050B 33            [ 6]  400 	inc	sp
   050C CD 48 03      [17]  401 	call	_draw_char
   050F F1            [10]  402 	pop	af
   0510 F1            [10]  403 	pop	af
   0511 F1            [10]  404 	pop	af
                            405 ;src/txt_scroll_hard.c:129: if (ce2==4) {
   0512 7D            [ 4]  406 	ld	a, l
   0513 D6 04         [ 7]  407 	sub	a, #0x04
   0515 20 0D         [12]  408 	jr	NZ,00105$
                            409 ;src/txt_scroll_hard.c:131: plot_screen2=0x8000;
   0517 21 00 80      [10]  410 	ld	hl, #0x8000
   051A 22 36 4D      [16]  411 	ld	(_plot_screen2), hl
                            412 ;src/txt_scroll_hard.c:132: c_screen3=4;
   051D 21 38 4D      [10]  413 	ld	hl,#_c_screen3 + 0
   0520 36 04         [10]  414 	ld	(hl), #0x04
   0522 18 16         [12]  415 	jr	00107$
   0524                     416 00105$:
                            417 ;src/txt_scroll_hard.c:134: plot_screen2+=2;
   0524 21 36 4D      [10]  418 	ld	hl, #_plot_screen2
   0527 7E            [ 7]  419 	ld	a, (hl)
   0528 C6 02         [ 7]  420 	add	a, #0x02
   052A 77            [ 7]  421 	ld	(hl), a
   052B 23            [ 6]  422 	inc	hl
   052C 7E            [ 7]  423 	ld	a, (hl)
   052D CE 00         [ 7]  424 	adc	a, #0x00
   052F 77            [ 7]  425 	ld	(hl), a
                            426 ;src/txt_scroll_hard.c:135: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
   0530 2A 36 4D      [16]  427 	ld	hl, (_plot_screen2)
   0533 7C            [ 4]  428 	ld	a, h
   0534 E6 87         [ 7]  429 	and	a, #0x87
   0536 67            [ 4]  430 	ld	h, a
   0537 22 36 4D      [16]  431 	ld	(_plot_screen2), hl
   053A                     432 00107$:
   053A DD F9         [10]  433 	ld	sp, ix
   053C DD E1         [14]  434 	pop	ix
   053E C9            [10]  435 	ret
   053F                     436 _texte:
   053F 57 45 20 57 49 53   437 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   057B 41 4E 44 20 41 20   438 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   05B7 44 46 47 20 20 20   439 	.ascii "DFG     "
        20 20
   05BF 00                  440 	.db 0x00
   05C0 00                  441 	.db 0x00
                            442 	.area _CODE
                            443 	.area _INITIALIZER
   4D45                     444 __xinit__firstPlotScreen2:
   4D45 01                  445 	.db #0x01	; 1
                            446 	.area _CABS (ABS)
