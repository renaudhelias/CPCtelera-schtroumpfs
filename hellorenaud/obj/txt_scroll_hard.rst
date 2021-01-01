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
                             17 	.globl _plot_screen2
                             18 	.globl _texte
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   4CE9                      26 _plot_screen2::
   4CE9                      27 	.ds 2
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
   4CEF                      32 _firstPlotScreen2::
   4CEF                      33 	.ds 1
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/txt_scroll_hard.c:16: u8 draw_char(u8 c, u8 ce2, u8* image, u8* plot) {
                             55 ;	---------------------------------
                             56 ; Function draw_char
                             57 ; ---------------------------------
   0348                      58 _draw_char::
   0348 DD E5         [15]   59 	push	ix
   034A DD 21 00 00   [14]   60 	ld	ix,#0
   034E DD 39         [15]   61 	add	ix,sp
   0350 F5            [11]   62 	push	af
                             63 ;src/txt_scroll_hard.c:24: u8 c_screen2=ce2;
   0351 DD 4E 05      [19]   64 	ld	c, 5 (ix)
                             65 ;src/txt_scroll_hard.c:25: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
   0354 DD 5E 04      [19]   66 	ld	e, 4 (ix)
   0357 16 00         [ 7]   67 	ld	d, #0x00
   0359 6B            [ 4]   68 	ld	l, e
   035A 62            [ 4]   69 	ld	h, d
   035B 29            [11]   70 	add	hl, hl
   035C 29            [11]   71 	add	hl, hl
   035D 19            [11]   72 	add	hl, de
   035E 29            [11]   73 	add	hl, hl
   035F 29            [11]   74 	add	hl, hl
   0360 29            [11]   75 	add	hl, hl
   0361 29            [11]   76 	add	hl, hl
   0362 EB            [ 4]   77 	ex	de,hl
   0363 21 01 78      [10]   78 	ld	hl, #0x7801
   0366 19            [11]   79 	add	hl,de
   0367 EB            [ 4]   80 	ex	de,hl
   0368 DD 6E 08      [19]   81 	ld	l,8 (ix)
   036B DD 66 09      [19]   82 	ld	h,9 (ix)
   036E 19            [11]   83 	add	hl, de
                             84 ;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
   036F 33            [ 6]   85 	inc	sp
   0370 33            [ 6]   86 	inc	sp
   0371 E5            [11]   87 	push	hl
                             88 ;src/txt_scroll_hard.c:49: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0372 DD 6E 04      [19]   89 	ld	l, 4 (ix)
   0375 26 00         [ 7]   90 	ld	h, #0x00
   0377 29            [11]   91 	add	hl, hl
   0378 29            [11]   92 	add	hl, hl
   0379 29            [11]   93 	add	hl, hl
   037A 29            [11]   94 	add	hl, hl
   037B EB            [ 4]   95 	ex	de,hl
   037C DD 6E 06      [19]   96 	ld	l,6 (ix)
   037F DD 66 07      [19]   97 	ld	h,7 (ix)
   0382 19            [11]   98 	add	hl, de
   0383 EB            [ 4]   99 	ex	de,hl
                            100 ;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
   0384 DD 7E FF      [19]  101 	ld	a, -1 (ix)
   0387 D6 40         [ 7]  102 	sub	a, #0x40
   0389 30 6F         [12]  103 	jr	NC,00112$
                            104 ;src/txt_scroll_hard.c:28: if (c<c_screen2) {
   038B DD 7E 04      [19]  105 	ld	a, 4 (ix)
   038E 91            [ 4]  106 	sub	a, c
   038F 30 03         [12]  107 	jr	NC,00102$
                            108 ;src/txt_scroll_hard.c:29: c_screen2=c;
   0391 DD 4E 04      [19]  109 	ld	c, 4 (ix)
   0394                     110 00102$:
                            111 ;src/txt_scroll_hard.c:47: p = cpct_getScreenPtr(plot_screen2+0x4000, 0,8*(c-c_screen2));
   0394 DD 7E 04      [19]  112 	ld	a, 4 (ix)
   0397 91            [ 4]  113 	sub	a, c
   0398 07            [ 4]  114 	rlca
   0399 07            [ 4]  115 	rlca
   039A 07            [ 4]  116 	rlca
   039B E6 F8         [ 7]  117 	and	a, #0xf8
   039D 47            [ 4]  118 	ld	b, a
   039E FD 21 00 40   [14]  119 	ld	iy, #0x4000
   03A2 C5            [11]  120 	push	bc
   03A3 ED 4B E9 4C   [20]  121 	ld	bc, (_plot_screen2)
   03A7 FD 09         [15]  122 	add	iy, bc
   03A9 C1            [10]  123 	pop	bc
   03AA C5            [11]  124 	push	bc
   03AB D5            [11]  125 	push	de
   03AC C5            [11]  126 	push	bc
   03AD 33            [ 6]  127 	inc	sp
   03AE AF            [ 4]  128 	xor	a, a
   03AF F5            [11]  129 	push	af
   03B0 33            [ 6]  130 	inc	sp
   03B1 FD E5         [15]  131 	push	iy
   03B3 CD 43 4C      [17]  132 	call	_cpct_getScreenPtr
   03B6 D1            [10]  133 	pop	de
   03B7 C1            [10]  134 	pop	bc
                            135 ;src/txt_scroll_hard.c:48: if (c_screen2==3 && c==3) {
   03B8 DD 7E 04      [19]  136 	ld	a, 4 (ix)
   03BB D6 03         [ 7]  137 	sub	a, #0x03
   03BD 20 04         [12]  138 	jr	NZ,00140$
   03BF 3E 01         [ 7]  139 	ld	a,#0x01
   03C1 18 01         [12]  140 	jr	00141$
   03C3                     141 00140$:
   03C3 AF            [ 4]  142 	xor	a,a
   03C4                     143 00141$:
   03C4 47            [ 4]  144 	ld	b, a
                            145 ;src/txt_scroll_hard.c:49: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
                            146 ;src/txt_scroll_hard.c:48: if (c_screen2==3 && c==3) {
   03C5 79            [ 4]  147 	ld	a, c
   03C6 D6 03         [ 7]  148 	sub	a,#0x03
   03C8 20 0C         [12]  149 	jr	NZ,00108$
   03CA B0            [ 4]  150 	or	a,b
   03CB 28 09         [12]  151 	jr	Z,00108$
                            152 ;src/txt_scroll_hard.c:49: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   03CD C5            [11]  153 	push	bc
   03CE E5            [11]  154 	push	hl
   03CF D5            [11]  155 	push	de
   03D0 CD 63 4C      [17]  156 	call	_cpct_drawTileAligned2x8_f
   03D3 C1            [10]  157 	pop	bc
   03D4 18 4C         [12]  158 	jr	00113$
   03D6                     159 00108$:
                            160 ;src/txt_scroll_hard.c:50: } else if (c_screen2==2 && c==3) { // le "suivant" en bas, donc 0 1
   03D6 79            [ 4]  161 	ld	a, c
   03D7 D6 02         [ 7]  162 	sub	a,#0x02
   03D9 20 16         [12]  163 	jr	NZ,00104$
   03DB B0            [ 4]  164 	or	a,b
   03DC 28 13         [12]  165 	jr	Z,00104$
                            166 ;src/txt_scroll_hard.c:52: cpct_drawSolidBox(p,0xFF,2,8);
   03DE C5            [11]  167 	push	bc
   03DF 11 02 08      [10]  168 	ld	de, #0x0802
   03E2 D5            [11]  169 	push	de
   03E3 3E FF         [ 7]  170 	ld	a, #0xff
   03E5 F5            [11]  171 	push	af
   03E6 33            [ 6]  172 	inc	sp
   03E7 E5            [11]  173 	push	hl
   03E8 CD 73 4B      [17]  174 	call	_cpct_drawSolidBox
   03EB F1            [10]  175 	pop	af
   03EC F1            [10]  176 	pop	af
   03ED 33            [ 6]  177 	inc	sp
   03EE C1            [10]  178 	pop	bc
   03EF 18 31         [12]  179 	jr	00113$
   03F1                     180 00104$:
                            181 ;src/txt_scroll_hard.c:55: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   03F1 C5            [11]  182 	push	bc
   03F2 E5            [11]  183 	push	hl
   03F3 D5            [11]  184 	push	de
   03F4 CD 63 4C      [17]  185 	call	_cpct_drawTileAligned2x8_f
   03F7 C1            [10]  186 	pop	bc
   03F8 18 28         [12]  187 	jr	00113$
   03FA                     188 00112$:
                            189 ;src/txt_scroll_hard.c:76: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
   03FA DD 7E 04      [19]  190 	ld	a, 4 (ix)
   03FD 07            [ 4]  191 	rlca
   03FE 07            [ 4]  192 	rlca
   03FF 07            [ 4]  193 	rlca
   0400 E6 F8         [ 7]  194 	and	a, #0xf8
   0402 67            [ 4]  195 	ld	h, a
   0403 DD 7E 08      [19]  196 	ld	a, 8 (ix)
   0406 C6 00         [ 7]  197 	add	a, #0x00
   0408 6F            [ 4]  198 	ld	l, a
   0409 DD 7E 09      [19]  199 	ld	a, 9 (ix)
   040C CE 40         [ 7]  200 	adc	a, #0x40
   040E 47            [ 4]  201 	ld	b, a
   040F C5            [11]  202 	push	bc
   0410 D5            [11]  203 	push	de
   0411 E5            [11]  204 	push	hl
   0412 33            [ 6]  205 	inc	sp
   0413 AF            [ 4]  206 	xor	a, a
   0414 F5            [11]  207 	push	af
   0415 33            [ 6]  208 	inc	sp
   0416 60            [ 4]  209 	ld	h, b
   0417 E5            [11]  210 	push	hl
   0418 CD 43 4C      [17]  211 	call	_cpct_getScreenPtr
   041B D1            [10]  212 	pop	de
   041C E5            [11]  213 	push	hl
   041D D5            [11]  214 	push	de
   041E CD 63 4C      [17]  215 	call	_cpct_drawTileAligned2x8_f
   0421 C1            [10]  216 	pop	bc
   0422                     217 00113$:
                            218 ;src/txt_scroll_hard.c:79: return c_screen2;
   0422 69            [ 4]  219 	ld	l, c
   0423 DD F9         [10]  220 	ld	sp, ix
   0425 DD E1         [14]  221 	pop	ix
   0427 C9            [10]  222 	ret
                            223 ;src/txt_scroll_hard.c:89: void scroll_hard(u16 step, u8* screen_plot_address) {
                            224 ;	---------------------------------
                            225 ; Function scroll_hard
                            226 ; ---------------------------------
   0428                     227 _scroll_hard::
   0428 DD E5         [15]  228 	push	ix
   042A DD 21 00 00   [14]  229 	ld	ix,#0
   042E DD 39         [15]  230 	add	ix,sp
   0430 F5            [11]  231 	push	af
                            232 ;src/txt_scroll_hard.c:96: u8* plot=screen_plot_address;
   0431 DD 4E 06      [19]  233 	ld	c,6 (ix)
   0434 DD 46 07      [19]  234 	ld	b,7 (ix)
                            235 ;src/txt_scroll_hard.c:100: div=step/8;
   0437 DD 5E 04      [19]  236 	ld	e,4 (ix)
   043A DD 56 05      [19]  237 	ld	d,5 (ix)
   043D CB 3A         [ 8]  238 	srl	d
   043F CB 1B         [ 8]  239 	rr	e
   0441 CB 3A         [ 8]  240 	srl	d
   0443 CB 1B         [ 8]  241 	rr	e
   0445 CB 3A         [ 8]  242 	srl	d
   0447 CB 1B         [ 8]  243 	rr	e
                            244 ;src/txt_scroll_hard.c:101: mod=step%8;
   0449 DD 7E 04      [19]  245 	ld	a, 4 (ix)
   044C E6 07         [ 7]  246 	and	a, #0x07
   044E DD 77 FE      [19]  247 	ld	-2 (ix), a
   0451 DD 36 FF 00   [19]  248 	ld	-1 (ix), #0x00
                            249 ;src/txt_scroll_hard.c:102: div=div%128;
   0455 CB BB         [ 8]  250 	res	7, e
   0457 16 00         [ 7]  251 	ld	d, #0x00
                            252 ;src/txt_scroll_hard.c:103: if (texte[div]==' ') {
   0459 21 F2 04      [10]  253 	ld	hl, #_texte+0
   045C 19            [11]  254 	add	hl, de
   045D 5E            [ 7]  255 	ld	e, (hl)
   045E 7B            [ 4]  256 	ld	a, e
   045F D6 20         [ 7]  257 	sub	a, #0x20
   0461 20 05         [12]  258 	jr	NZ,00102$
                            259 ;src/txt_scroll_hard.c:104: o=0;
   0463 11 00 00      [10]  260 	ld	de, #0x0000
   0466 18 09         [12]  261 	jr	00103$
   0468                     262 00102$:
                            263 ;src/txt_scroll_hard.c:106: o=texte[div]-'?';
   0468 16 00         [ 7]  264 	ld	d, #0x00
   046A 7B            [ 4]  265 	ld	a, e
   046B C6 C1         [ 7]  266 	add	a, #0xc1
   046D 5F            [ 4]  267 	ld	e, a
   046E 7A            [ 4]  268 	ld	a, d
   046F CE FF         [ 7]  269 	adc	a, #0xff
   0471                     270 00103$:
                            271 ;src/txt_scroll_hard.c:109: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   0471 21 74 05      [10]  272 	ld	hl, #_g_tile_fontmap32x32plat_000
   0474 7B            [ 4]  273 	ld	a, e
   0475 87            [ 4]  274 	add	a, a
   0476 57            [ 4]  275 	ld	d, a
   0477 1E 00         [ 7]  276 	ld	e, #0x00
   0479 19            [11]  277 	add	hl,de
   047A EB            [ 4]  278 	ex	de,hl
   047B E1            [10]  279 	pop	hl
   047C E5            [11]  280 	push	hl
   047D 29            [11]  281 	add	hl, hl
   047E 29            [11]  282 	add	hl, hl
   047F 29            [11]  283 	add	hl, hl
   0480 29            [11]  284 	add	hl, hl
   0481 29            [11]  285 	add	hl, hl
   0482 29            [11]  286 	add	hl, hl
   0483 19            [11]  287 	add	hl,de
   0484 EB            [ 4]  288 	ex	de,hl
                            289 ;src/txt_scroll_hard.c:113: ce2=draw_char(0,  4,(u8*)pointeur, plot);
   0485 C5            [11]  290 	push	bc
   0486 D5            [11]  291 	push	de
   0487 C5            [11]  292 	push	bc
   0488 D5            [11]  293 	push	de
   0489 21 00 04      [10]  294 	ld	hl, #0x0400
   048C E5            [11]  295 	push	hl
   048D CD 48 03      [17]  296 	call	_draw_char
   0490 F1            [10]  297 	pop	af
   0491 F1            [10]  298 	pop	af
   0492 F1            [10]  299 	pop	af
   0493 D1            [10]  300 	pop	de
   0494 C1            [10]  301 	pop	bc
   0495 65            [ 4]  302 	ld	h, l
                            303 ;src/txt_scroll_hard.c:114: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
   0496 C5            [11]  304 	push	bc
   0497 D5            [11]  305 	push	de
   0498 C5            [11]  306 	push	bc
   0499 D5            [11]  307 	push	de
   049A E5            [11]  308 	push	hl
   049B 33            [ 6]  309 	inc	sp
   049C 3E 01         [ 7]  310 	ld	a, #0x01
   049E F5            [11]  311 	push	af
   049F 33            [ 6]  312 	inc	sp
   04A0 CD 48 03      [17]  313 	call	_draw_char
   04A3 F1            [10]  314 	pop	af
   04A4 F1            [10]  315 	pop	af
   04A5 F1            [10]  316 	pop	af
   04A6 D1            [10]  317 	pop	de
   04A7 C1            [10]  318 	pop	bc
   04A8 65            [ 4]  319 	ld	h, l
                            320 ;src/txt_scroll_hard.c:115: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
   04A9 C5            [11]  321 	push	bc
   04AA D5            [11]  322 	push	de
   04AB C5            [11]  323 	push	bc
   04AC D5            [11]  324 	push	de
   04AD E5            [11]  325 	push	hl
   04AE 33            [ 6]  326 	inc	sp
   04AF 3E 02         [ 7]  327 	ld	a, #0x02
   04B1 F5            [11]  328 	push	af
   04B2 33            [ 6]  329 	inc	sp
   04B3 CD 48 03      [17]  330 	call	_draw_char
   04B6 F1            [10]  331 	pop	af
   04B7 F1            [10]  332 	pop	af
   04B8 F1            [10]  333 	pop	af
   04B9 D1            [10]  334 	pop	de
   04BA C1            [10]  335 	pop	bc
   04BB 65            [ 4]  336 	ld	h, l
                            337 ;src/txt_scroll_hard.c:116: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
   04BC C5            [11]  338 	push	bc
   04BD D5            [11]  339 	push	de
   04BE E5            [11]  340 	push	hl
   04BF 33            [ 6]  341 	inc	sp
   04C0 3E 03         [ 7]  342 	ld	a, #0x03
   04C2 F5            [11]  343 	push	af
   04C3 33            [ 6]  344 	inc	sp
   04C4 CD 48 03      [17]  345 	call	_draw_char
   04C7 F1            [10]  346 	pop	af
   04C8 F1            [10]  347 	pop	af
   04C9 F1            [10]  348 	pop	af
                            349 ;src/txt_scroll_hard.c:117: if (ce2==4) {
   04CA 7D            [ 4]  350 	ld	a, l
   04CB D6 04         [ 7]  351 	sub	a, #0x04
   04CD 20 08         [12]  352 	jr	NZ,00105$
                            353 ;src/txt_scroll_hard.c:119: plot_screen2=0x8000;
   04CF 21 00 80      [10]  354 	ld	hl, #0x8000
   04D2 22 E9 4C      [16]  355 	ld	(_plot_screen2), hl
   04D5 18 16         [12]  356 	jr	00107$
   04D7                     357 00105$:
                            358 ;src/txt_scroll_hard.c:121: plot_screen2+=2;
   04D7 21 E9 4C      [10]  359 	ld	hl, #_plot_screen2
   04DA 7E            [ 7]  360 	ld	a, (hl)
   04DB C6 02         [ 7]  361 	add	a, #0x02
   04DD 77            [ 7]  362 	ld	(hl), a
   04DE 23            [ 6]  363 	inc	hl
   04DF 7E            [ 7]  364 	ld	a, (hl)
   04E0 CE 00         [ 7]  365 	adc	a, #0x00
   04E2 77            [ 7]  366 	ld	(hl), a
                            367 ;src/txt_scroll_hard.c:122: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
   04E3 2A E9 4C      [16]  368 	ld	hl, (_plot_screen2)
   04E6 7C            [ 4]  369 	ld	a, h
   04E7 E6 87         [ 7]  370 	and	a, #0x87
   04E9 67            [ 4]  371 	ld	h, a
   04EA 22 E9 4C      [16]  372 	ld	(_plot_screen2), hl
   04ED                     373 00107$:
   04ED DD F9         [10]  374 	ld	sp, ix
   04EF DD E1         [14]  375 	pop	ix
   04F1 C9            [10]  376 	ret
   04F2                     377 _texte:
   04F2 57 45 20 57 49 53   378 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   052E 41 4E 44 20 41 20   379 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   056A 44 46 47 20 20 20   380 	.ascii "DFG     "
        20 20
   0572 00                  381 	.db 0x00
   0573 00                  382 	.db 0x00
                            383 	.area _CODE
                            384 	.area _INITIALIZER
   4CF7                     385 __xinit__firstPlotScreen2:
   4CF7 01                  386 	.db #0x01	; 1
                            387 	.area _CABS (ABS)
