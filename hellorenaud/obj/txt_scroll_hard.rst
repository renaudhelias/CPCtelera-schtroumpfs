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
   4D0C                      27 _plot_screen2::
   4D0C                      28 	.ds 2
   4D0E                      29 _c_screen3::
   4D0E                      30 	.ds 1
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
   4D13                      35 _firstPlotScreen2::
   4D13                      36 	.ds 1
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
   0389 D2 18 04      [10]  106 	jp	NC, 00114$
                            107 ;src/txt_scroll_hard.c:29: c_screen3=c;
   038C DD 46 04      [19]  108 	ld	b, 4 (ix)
                            109 ;src/txt_scroll_hard.c:28: if (c<c_screen3) {
   038F 21 0E 4D      [10]  110 	ld	hl, #_c_screen3
   0392 DD 7E 04      [19]  111 	ld	a, 4 (ix)
   0395 96            [ 7]  112 	sub	a, (hl)
   0396 30 0A         [12]  113 	jr	NC,00102$
                            114 ;src/txt_scroll_hard.c:29: c_screen3=c;
   0398 21 0E 4D      [10]  115 	ld	hl,#_c_screen3 + 0
   039B 70            [ 7]  116 	ld	(hl), b
                            117 ;src/txt_scroll_hard.c:30: plot_screen2=0x8000;
   039C 21 00 80      [10]  118 	ld	hl, #0x8000
   039F 22 0C 4D      [16]  119 	ld	(_plot_screen2), hl
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
   03B8 ED 4B 0C 4D   [20]  138 	ld	bc, (_plot_screen2)
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
   03C8 CD 66 4C      [17]  149 	call	_cpct_getScreenPtr
   03CB D1            [10]  150 	pop	de
   03CC C1            [10]  151 	pop	bc
                            152 ;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
   03CD DD 7E 04      [19]  153 	ld	a, 4 (ix)
   03D0 D6 03         [ 7]  154 	sub	a, #0x03
   03D2 20 04         [12]  155 	jr	NZ,00146$
   03D4 3E 01         [ 7]  156 	ld	a,#0x01
   03D6 18 01         [12]  157 	jr	00147$
   03D8                     158 00146$:
   03D8 AF            [ 4]  159 	xor	a,a
   03D9                     160 00147$:
   03D9 47            [ 4]  161 	ld	b, a
                            162 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
                            163 ;src/txt_scroll_hard.c:52: if (c_screen2==3 && c==3) {
   03DA 79            [ 4]  164 	ld	a, c
   03DB D6 03         [ 7]  165 	sub	a,#0x03
   03DD 20 0C         [12]  166 	jr	NZ,00110$
   03DF B0            [ 4]  167 	or	a,b
   03E0 28 09         [12]  168 	jr	Z,00110$
                            169 ;src/txt_scroll_hard.c:53: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   03E2 C5            [11]  170 	push	bc
   03E3 E5            [11]  171 	push	hl
   03E4 D5            [11]  172 	push	de
   03E5 CD 86 4C      [17]  173 	call	_cpct_drawTileAligned2x8_f
   03E8 C1            [10]  174 	pop	bc
   03E9 18 55         [12]  175 	jr	00115$
   03EB                     176 00110$:
                            177 ;src/txt_scroll_hard.c:54: } else if (c_screen2==2 && c==3) { // le "suivant" en bas, donc 0 1
   03EB 79            [ 4]  178 	ld	a, c
   03EC D6 02         [ 7]  179 	sub	a,#0x02
   03EE 20 16         [12]  180 	jr	NZ,00106$
   03F0 B0            [ 4]  181 	or	a,b
   03F1 28 13         [12]  182 	jr	Z,00106$
                            183 ;src/txt_scroll_hard.c:56: cpct_drawSolidBox(p,0xFF,2,8);
   03F3 C5            [11]  184 	push	bc
   03F4 11 02 08      [10]  185 	ld	de, #0x0802
   03F7 D5            [11]  186 	push	de
   03F8 3E FF         [ 7]  187 	ld	a, #0xff
   03FA F5            [11]  188 	push	af
   03FB 33            [ 6]  189 	inc	sp
   03FC E5            [11]  190 	push	hl
   03FD CD 96 4B      [17]  191 	call	_cpct_drawSolidBox
   0400 F1            [10]  192 	pop	af
   0401 F1            [10]  193 	pop	af
   0402 33            [ 6]  194 	inc	sp
   0403 C1            [10]  195 	pop	bc
   0404 18 3A         [12]  196 	jr	00115$
   0406                     197 00106$:
                            198 ;src/txt_scroll_hard.c:58: cpct_drawSolidBox(p,c_screen2,2,8);
   0406 C5            [11]  199 	push	bc
   0407 11 02 08      [10]  200 	ld	de, #0x0802
   040A D5            [11]  201 	push	de
   040B 79            [ 4]  202 	ld	a, c
   040C F5            [11]  203 	push	af
   040D 33            [ 6]  204 	inc	sp
   040E E5            [11]  205 	push	hl
   040F CD 96 4B      [17]  206 	call	_cpct_drawSolidBox
   0412 F1            [10]  207 	pop	af
   0413 F1            [10]  208 	pop	af
   0414 33            [ 6]  209 	inc	sp
   0415 C1            [10]  210 	pop	bc
   0416 18 28         [12]  211 	jr	00115$
   0418                     212 00114$:
                            213 ;src/txt_scroll_hard.c:80: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
   0418 DD 7E 04      [19]  214 	ld	a, 4 (ix)
   041B 07            [ 4]  215 	rlca
   041C 07            [ 4]  216 	rlca
   041D 07            [ 4]  217 	rlca
   041E E6 F8         [ 7]  218 	and	a, #0xf8
   0420 67            [ 4]  219 	ld	h, a
   0421 DD 7E 08      [19]  220 	ld	a, 8 (ix)
   0424 C6 00         [ 7]  221 	add	a, #0x00
   0426 6F            [ 4]  222 	ld	l, a
   0427 DD 7E 09      [19]  223 	ld	a, 9 (ix)
   042A CE 40         [ 7]  224 	adc	a, #0x40
   042C 47            [ 4]  225 	ld	b, a
   042D C5            [11]  226 	push	bc
   042E D5            [11]  227 	push	de
   042F E5            [11]  228 	push	hl
   0430 33            [ 6]  229 	inc	sp
   0431 AF            [ 4]  230 	xor	a, a
   0432 F5            [11]  231 	push	af
   0433 33            [ 6]  232 	inc	sp
   0434 60            [ 4]  233 	ld	h, b
   0435 E5            [11]  234 	push	hl
   0436 CD 66 4C      [17]  235 	call	_cpct_getScreenPtr
   0439 D1            [10]  236 	pop	de
   043A E5            [11]  237 	push	hl
   043B D5            [11]  238 	push	de
   043C CD 86 4C      [17]  239 	call	_cpct_drawTileAligned2x8_f
   043F C1            [10]  240 	pop	bc
   0440                     241 00115$:
                            242 ;src/txt_scroll_hard.c:83: return c_screen2;
   0440 69            [ 4]  243 	ld	l, c
   0441 DD F9         [10]  244 	ld	sp, ix
   0443 DD E1         [14]  245 	pop	ix
   0445 C9            [10]  246 	ret
                            247 ;src/txt_scroll_hard.c:94: void scroll_hard(u16 step, u8* screen_plot_address) {
                            248 ;	---------------------------------
                            249 ; Function scroll_hard
                            250 ; ---------------------------------
   0446                     251 _scroll_hard::
   0446 DD E5         [15]  252 	push	ix
   0448 DD 21 00 00   [14]  253 	ld	ix,#0
   044C DD 39         [15]  254 	add	ix,sp
   044E F5            [11]  255 	push	af
                            256 ;src/txt_scroll_hard.c:101: u8* plot=screen_plot_address;
   044F DD 4E 06      [19]  257 	ld	c,6 (ix)
   0452 DD 46 07      [19]  258 	ld	b,7 (ix)
                            259 ;src/txt_scroll_hard.c:105: div=step/8;
   0455 DD 5E 04      [19]  260 	ld	e,4 (ix)
   0458 DD 56 05      [19]  261 	ld	d,5 (ix)
   045B CB 3A         [ 8]  262 	srl	d
   045D CB 1B         [ 8]  263 	rr	e
   045F CB 3A         [ 8]  264 	srl	d
   0461 CB 1B         [ 8]  265 	rr	e
   0463 CB 3A         [ 8]  266 	srl	d
   0465 CB 1B         [ 8]  267 	rr	e
                            268 ;src/txt_scroll_hard.c:106: mod=step%8;
   0467 DD 7E 04      [19]  269 	ld	a, 4 (ix)
   046A E6 07         [ 7]  270 	and	a, #0x07
   046C DD 77 FE      [19]  271 	ld	-2 (ix), a
   046F DD 36 FF 00   [19]  272 	ld	-1 (ix), #0x00
                            273 ;src/txt_scroll_hard.c:107: div=div%128;
   0473 CB BB         [ 8]  274 	res	7, e
   0475 16 00         [ 7]  275 	ld	d, #0x00
                            276 ;src/txt_scroll_hard.c:108: if (texte[div]==' ') {
   0477 21 15 05      [10]  277 	ld	hl, #_texte+0
   047A 19            [11]  278 	add	hl, de
   047B 5E            [ 7]  279 	ld	e, (hl)
   047C 7B            [ 4]  280 	ld	a, e
   047D D6 20         [ 7]  281 	sub	a, #0x20
   047F 20 05         [12]  282 	jr	NZ,00102$
                            283 ;src/txt_scroll_hard.c:109: o=0;
   0481 11 00 00      [10]  284 	ld	de, #0x0000
   0484 18 09         [12]  285 	jr	00103$
   0486                     286 00102$:
                            287 ;src/txt_scroll_hard.c:111: o=texte[div]-'?';
   0486 16 00         [ 7]  288 	ld	d, #0x00
   0488 7B            [ 4]  289 	ld	a, e
   0489 C6 C1         [ 7]  290 	add	a, #0xc1
   048B 5F            [ 4]  291 	ld	e, a
   048C 7A            [ 4]  292 	ld	a, d
   048D CE FF         [ 7]  293 	adc	a, #0xff
   048F                     294 00103$:
                            295 ;src/txt_scroll_hard.c:114: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   048F 21 97 05      [10]  296 	ld	hl, #_g_tile_fontmap32x32plat_000
   0492 7B            [ 4]  297 	ld	a, e
   0493 87            [ 4]  298 	add	a, a
   0494 57            [ 4]  299 	ld	d, a
   0495 1E 00         [ 7]  300 	ld	e, #0x00
   0497 19            [11]  301 	add	hl,de
   0498 EB            [ 4]  302 	ex	de,hl
   0499 E1            [10]  303 	pop	hl
   049A E5            [11]  304 	push	hl
   049B 29            [11]  305 	add	hl, hl
   049C 29            [11]  306 	add	hl, hl
   049D 29            [11]  307 	add	hl, hl
   049E 29            [11]  308 	add	hl, hl
   049F 29            [11]  309 	add	hl, hl
   04A0 29            [11]  310 	add	hl, hl
   04A1 19            [11]  311 	add	hl,de
   04A2 EB            [ 4]  312 	ex	de,hl
                            313 ;src/txt_scroll_hard.c:118: ce2=draw_char(0,4,(u8*)pointeur, plot);
   04A3 C5            [11]  314 	push	bc
   04A4 D5            [11]  315 	push	de
   04A5 C5            [11]  316 	push	bc
   04A6 D5            [11]  317 	push	de
   04A7 21 00 04      [10]  318 	ld	hl, #0x0400
   04AA E5            [11]  319 	push	hl
   04AB CD 48 03      [17]  320 	call	_draw_char
   04AE F1            [10]  321 	pop	af
   04AF F1            [10]  322 	pop	af
   04B0 F1            [10]  323 	pop	af
   04B1 D1            [10]  324 	pop	de
   04B2 C1            [10]  325 	pop	bc
   04B3 65            [ 4]  326 	ld	h, l
                            327 ;src/txt_scroll_hard.c:119: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
   04B4 C5            [11]  328 	push	bc
   04B5 D5            [11]  329 	push	de
   04B6 C5            [11]  330 	push	bc
   04B7 D5            [11]  331 	push	de
   04B8 E5            [11]  332 	push	hl
   04B9 33            [ 6]  333 	inc	sp
   04BA 3E 01         [ 7]  334 	ld	a, #0x01
   04BC F5            [11]  335 	push	af
   04BD 33            [ 6]  336 	inc	sp
   04BE CD 48 03      [17]  337 	call	_draw_char
   04C1 F1            [10]  338 	pop	af
   04C2 F1            [10]  339 	pop	af
   04C3 F1            [10]  340 	pop	af
   04C4 D1            [10]  341 	pop	de
   04C5 C1            [10]  342 	pop	bc
   04C6 65            [ 4]  343 	ld	h, l
                            344 ;src/txt_scroll_hard.c:120: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
   04C7 C5            [11]  345 	push	bc
   04C8 D5            [11]  346 	push	de
   04C9 C5            [11]  347 	push	bc
   04CA D5            [11]  348 	push	de
   04CB E5            [11]  349 	push	hl
   04CC 33            [ 6]  350 	inc	sp
   04CD 3E 02         [ 7]  351 	ld	a, #0x02
   04CF F5            [11]  352 	push	af
   04D0 33            [ 6]  353 	inc	sp
   04D1 CD 48 03      [17]  354 	call	_draw_char
   04D4 F1            [10]  355 	pop	af
   04D5 F1            [10]  356 	pop	af
   04D6 F1            [10]  357 	pop	af
   04D7 D1            [10]  358 	pop	de
   04D8 C1            [10]  359 	pop	bc
   04D9 65            [ 4]  360 	ld	h, l
                            361 ;src/txt_scroll_hard.c:121: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
   04DA C5            [11]  362 	push	bc
   04DB D5            [11]  363 	push	de
   04DC E5            [11]  364 	push	hl
   04DD 33            [ 6]  365 	inc	sp
   04DE 3E 03         [ 7]  366 	ld	a, #0x03
   04E0 F5            [11]  367 	push	af
   04E1 33            [ 6]  368 	inc	sp
   04E2 CD 48 03      [17]  369 	call	_draw_char
   04E5 F1            [10]  370 	pop	af
   04E6 F1            [10]  371 	pop	af
   04E7 F1            [10]  372 	pop	af
                            373 ;src/txt_scroll_hard.c:122: if (ce2==4) {
   04E8 7D            [ 4]  374 	ld	a, l
   04E9 D6 04         [ 7]  375 	sub	a, #0x04
   04EB 20 0D         [12]  376 	jr	NZ,00105$
                            377 ;src/txt_scroll_hard.c:124: plot_screen2=0x8000;
   04ED 21 00 80      [10]  378 	ld	hl, #0x8000
   04F0 22 0C 4D      [16]  379 	ld	(_plot_screen2), hl
                            380 ;src/txt_scroll_hard.c:125: c_screen3=4;
   04F3 21 0E 4D      [10]  381 	ld	hl,#_c_screen3 + 0
   04F6 36 04         [10]  382 	ld	(hl), #0x04
   04F8 18 16         [12]  383 	jr	00107$
   04FA                     384 00105$:
                            385 ;src/txt_scroll_hard.c:127: plot_screen2+=2;
   04FA 21 0C 4D      [10]  386 	ld	hl, #_plot_screen2
   04FD 7E            [ 7]  387 	ld	a, (hl)
   04FE C6 02         [ 7]  388 	add	a, #0x02
   0500 77            [ 7]  389 	ld	(hl), a
   0501 23            [ 6]  390 	inc	hl
   0502 7E            [ 7]  391 	ld	a, (hl)
   0503 CE 00         [ 7]  392 	adc	a, #0x00
   0505 77            [ 7]  393 	ld	(hl), a
                            394 ;src/txt_scroll_hard.c:128: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
   0506 2A 0C 4D      [16]  395 	ld	hl, (_plot_screen2)
   0509 7C            [ 4]  396 	ld	a, h
   050A E6 87         [ 7]  397 	and	a, #0x87
   050C 67            [ 4]  398 	ld	h, a
   050D 22 0C 4D      [16]  399 	ld	(_plot_screen2), hl
   0510                     400 00107$:
   0510 DD F9         [10]  401 	ld	sp, ix
   0512 DD E1         [14]  402 	pop	ix
   0514 C9            [10]  403 	ret
   0515                     404 _texte:
   0515 57 45 20 57 49 53   405 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0551 41 4E 44 20 41 20   406 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   058D 44 46 47 20 20 20   407 	.ascii "DFG     "
        20 20
   0595 00                  408 	.db 0x00
   0596 00                  409 	.db 0x00
                            410 	.area _CODE
                            411 	.area _INITIALIZER
   4D1B                     412 __xinit__firstPlotScreen2:
   4D1B 01                  413 	.db #0x01	; 1
                            414 	.area _CABS (ABS)
