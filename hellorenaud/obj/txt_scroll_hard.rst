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
                             15 	.globl _firstPlotScreen2
                             16 	.globl _c_screen3
                             17 	.globl _plot_screen2
                             18 	.globl _texte
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   4C00                      26 _plot_screen2::
   4C00                      27 	.ds 2
   4C02                      28 _c_screen3::
   4C02                      29 	.ds 1
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
   4C07                      34 _firstPlotScreen2::
   4C07                      35 	.ds 1
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/txt_scroll_hard.c:16: u8 draw_char(u8 c, u8 ce2, u8* image, u8* plot) {
                             57 ;	---------------------------------
                             58 ; Function draw_char
                             59 ; ---------------------------------
   0348                      60 _draw_char::
   0348 DD E5         [15]   61 	push	ix
   034A DD 21 00 00   [14]   62 	ld	ix,#0
   034E DD 39         [15]   63 	add	ix,sp
                             64 ;src/txt_scroll_hard.c:24: u8 c_screen2=ce2;
   0350 DD 4E 05      [19]   65 	ld	c, 5 (ix)
                             66 ;src/txt_scroll_hard.c:25: last_plot=plot +80u*c+ 0x3801;
   0353 DD 5E 04      [19]   67 	ld	e, 4 (ix)
   0356 16 00         [ 7]   68 	ld	d, #0x00
   0358 6B            [ 4]   69 	ld	l, e
   0359 62            [ 4]   70 	ld	h, d
   035A 29            [11]   71 	add	hl, hl
   035B 29            [11]   72 	add	hl, hl
   035C 19            [11]   73 	add	hl, de
   035D 29            [11]   74 	add	hl, hl
   035E 29            [11]   75 	add	hl, hl
   035F 29            [11]   76 	add	hl, hl
   0360 29            [11]   77 	add	hl, hl
   0361 EB            [ 4]   78 	ex	de,hl
   0362 DD 6E 08      [19]   79 	ld	l,8 (ix)
   0365 DD 66 09      [19]   80 	ld	h,9 (ix)
   0368 19            [11]   81 	add	hl, de
   0369 11 01 38      [10]   82 	ld	de, #0x3801
   036C 19            [11]   83 	add	hl, de
                             84 ;src/txt_scroll_hard.c:55: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   036D DD 5E 04      [19]   85 	ld	e, 4 (ix)
   0370 16 00         [ 7]   86 	ld	d, #0x00
   0372 CB 23         [ 8]   87 	sla	e
   0374 CB 12         [ 8]   88 	rl	d
   0376 CB 23         [ 8]   89 	sla	e
   0378 CB 12         [ 8]   90 	rl	d
   037A CB 23         [ 8]   91 	sla	e
   037C CB 12         [ 8]   92 	rl	d
   037E CB 23         [ 8]   93 	sla	e
   0380 CB 12         [ 8]   94 	rl	d
   0382 DD 7E 06      [19]   95 	ld	a, 6 (ix)
   0385 83            [ 4]   96 	add	a, e
   0386 5F            [ 4]   97 	ld	e, a
   0387 DD 7E 07      [19]   98 	ld	a, 7 (ix)
   038A 8A            [ 4]   99 	adc	a, d
   038B 57            [ 4]  100 	ld	d, a
                            101 ;src/txt_scroll_hard.c:27: if (last_plot>0xBFFF) {
   038C 3E FF         [ 7]  102 	ld	a, #0xff
   038E BD            [ 4]  103 	cp	a, l
   038F 3E BF         [ 7]  104 	ld	a, #0xbf
   0391 9C            [ 4]  105 	sbc	a, h
   0392 30 40         [12]  106 	jr	NC,00106$
                            107 ;src/txt_scroll_hard.c:29: c_screen3=c;
   0394 DD 46 04      [19]  108 	ld	b, 4 (ix)
                            109 ;src/txt_scroll_hard.c:28: if (c<c_screen3) {
   0397 21 02 4C      [10]  110 	ld	hl, #_c_screen3
   039A DD 7E 04      [19]  111 	ld	a, 4 (ix)
   039D 96            [ 7]  112 	sub	a, (hl)
   039E 30 0A         [12]  113 	jr	NC,00102$
                            114 ;src/txt_scroll_hard.c:29: c_screen3=c;
   03A0 21 02 4C      [10]  115 	ld	hl,#_c_screen3 + 0
   03A3 70            [ 7]  116 	ld	(hl), b
                            117 ;src/txt_scroll_hard.c:30: plot_screen2=0x8000;
   03A4 21 00 80      [10]  118 	ld	hl, #0x8000
   03A7 22 00 4C      [16]  119 	ld	(_plot_screen2), hl
   03AA                     120 00102$:
                            121 ;src/txt_scroll_hard.c:32: if (c<c_screen2) {
   03AA DD 7E 04      [19]  122 	ld	a, 4 (ix)
   03AD 91            [ 4]  123 	sub	a, c
   03AE 30 01         [12]  124 	jr	NC,00104$
                            125 ;src/txt_scroll_hard.c:33: c_screen2=c;
   03B0 48            [ 4]  126 	ld	c, b
   03B1                     127 00104$:
                            128 ;src/txt_scroll_hard.c:35: p = cpct_getScreenPtr(plot_screen2, 0,8*(c-c_screen2));
   03B1 DD 7E 04      [19]  129 	ld	a, 4 (ix)
   03B4 91            [ 4]  130 	sub	a, c
   03B5 07            [ 4]  131 	rlca
   03B6 07            [ 4]  132 	rlca
   03B7 07            [ 4]  133 	rlca
   03B8 E6 F8         [ 7]  134 	and	a, #0xf8
   03BA 47            [ 4]  135 	ld	b, a
   03BB FD 2A 00 4C   [20]  136 	ld	iy, (_plot_screen2)
   03BF C5            [11]  137 	push	bc
   03C0 D5            [11]  138 	push	de
   03C1 C5            [11]  139 	push	bc
   03C2 33            [ 6]  140 	inc	sp
   03C3 AF            [ 4]  141 	xor	a, a
   03C4 F5            [11]  142 	push	af
   03C5 33            [ 6]  143 	inc	sp
   03C6 FD E5         [15]  144 	push	iy
   03C8 CD 5A 4B      [17]  145 	call	_cpct_getScreenPtr
   03CB D1            [10]  146 	pop	de
   03CC E5            [11]  147 	push	hl
   03CD D5            [11]  148 	push	de
   03CE CD 7A 4B      [17]  149 	call	_cpct_drawTileAligned2x8_f
   03D1 C1            [10]  150 	pop	bc
   03D2 18 22         [12]  151 	jr	00107$
   03D4                     152 00106$:
                            153 ;src/txt_scroll_hard.c:76: p = cpct_getScreenPtr(plot, 0,8*c);
   03D4 DD 7E 04      [19]  154 	ld	a, 4 (ix)
   03D7 07            [ 4]  155 	rlca
   03D8 07            [ 4]  156 	rlca
   03D9 07            [ 4]  157 	rlca
   03DA E6 F8         [ 7]  158 	and	a, #0xf8
   03DC 67            [ 4]  159 	ld	h, a
   03DD DD 6E 08      [19]  160 	ld	l, 8 (ix)
   03E0 DD 46 09      [19]  161 	ld	b, 9 (ix)
   03E3 C5            [11]  162 	push	bc
   03E4 D5            [11]  163 	push	de
   03E5 E5            [11]  164 	push	hl
   03E6 33            [ 6]  165 	inc	sp
   03E7 AF            [ 4]  166 	xor	a, a
   03E8 F5            [11]  167 	push	af
   03E9 33            [ 6]  168 	inc	sp
   03EA 60            [ 4]  169 	ld	h, b
   03EB E5            [11]  170 	push	hl
   03EC CD 5A 4B      [17]  171 	call	_cpct_getScreenPtr
   03EF D1            [10]  172 	pop	de
   03F0 E5            [11]  173 	push	hl
   03F1 D5            [11]  174 	push	de
   03F2 CD 7A 4B      [17]  175 	call	_cpct_drawTileAligned2x8_f
   03F5 C1            [10]  176 	pop	bc
   03F6                     177 00107$:
                            178 ;src/txt_scroll_hard.c:79: return c_screen2;
   03F6 69            [ 4]  179 	ld	l, c
   03F7 DD E1         [14]  180 	pop	ix
   03F9 C9            [10]  181 	ret
                            182 ;src/txt_scroll_hard.c:90: void scroll_hard(u16 step, u8* screen_plot_address) {
                            183 ;	---------------------------------
                            184 ; Function scroll_hard
                            185 ; ---------------------------------
   03FA                     186 _scroll_hard::
   03FA DD E5         [15]  187 	push	ix
   03FC DD 21 00 00   [14]  188 	ld	ix,#0
   0400 DD 39         [15]  189 	add	ix,sp
   0402 F5            [11]  190 	push	af
                            191 ;src/txt_scroll_hard.c:97: u8* plot=screen_plot_address;
   0403 DD 4E 06      [19]  192 	ld	c,6 (ix)
   0406 DD 46 07      [19]  193 	ld	b,7 (ix)
                            194 ;src/txt_scroll_hard.c:101: div=step/8;
   0409 DD 5E 04      [19]  195 	ld	e,4 (ix)
   040C DD 56 05      [19]  196 	ld	d,5 (ix)
   040F CB 3A         [ 8]  197 	srl	d
   0411 CB 1B         [ 8]  198 	rr	e
   0413 CB 3A         [ 8]  199 	srl	d
   0415 CB 1B         [ 8]  200 	rr	e
   0417 CB 3A         [ 8]  201 	srl	d
   0419 CB 1B         [ 8]  202 	rr	e
                            203 ;src/txt_scroll_hard.c:102: mod=step%8;
   041B DD 7E 04      [19]  204 	ld	a, 4 (ix)
   041E E6 07         [ 7]  205 	and	a, #0x07
   0420 DD 77 FE      [19]  206 	ld	-2 (ix), a
   0423 DD 36 FF 00   [19]  207 	ld	-1 (ix), #0x00
                            208 ;src/txt_scroll_hard.c:103: div=div%128;
   0427 CB BB         [ 8]  209 	res	7, e
   0429 16 00         [ 7]  210 	ld	d, #0x00
                            211 ;src/txt_scroll_hard.c:104: if (texte[div]==' ') {
   042B 21 C9 04      [10]  212 	ld	hl, #_texte+0
   042E 19            [11]  213 	add	hl, de
   042F 5E            [ 7]  214 	ld	e, (hl)
   0430 7B            [ 4]  215 	ld	a, e
   0431 D6 20         [ 7]  216 	sub	a, #0x20
   0433 20 05         [12]  217 	jr	NZ,00102$
                            218 ;src/txt_scroll_hard.c:105: o=0;
   0435 11 00 00      [10]  219 	ld	de, #0x0000
   0438 18 09         [12]  220 	jr	00103$
   043A                     221 00102$:
                            222 ;src/txt_scroll_hard.c:107: o=texte[div]-'?';
   043A 16 00         [ 7]  223 	ld	d, #0x00
   043C 7B            [ 4]  224 	ld	a, e
   043D C6 C1         [ 7]  225 	add	a, #0xc1
   043F 5F            [ 4]  226 	ld	e, a
   0440 7A            [ 4]  227 	ld	a, d
   0441 CE FF         [ 7]  228 	adc	a, #0xff
   0443                     229 00103$:
                            230 ;src/txt_scroll_hard.c:110: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   0443 21 4B 05      [10]  231 	ld	hl, #_g_tile_fontmap32x32plat_000
   0446 7B            [ 4]  232 	ld	a, e
   0447 87            [ 4]  233 	add	a, a
   0448 57            [ 4]  234 	ld	d, a
   0449 1E 00         [ 7]  235 	ld	e, #0x00
   044B 19            [11]  236 	add	hl,de
   044C EB            [ 4]  237 	ex	de,hl
   044D E1            [10]  238 	pop	hl
   044E E5            [11]  239 	push	hl
   044F 29            [11]  240 	add	hl, hl
   0450 29            [11]  241 	add	hl, hl
   0451 29            [11]  242 	add	hl, hl
   0452 29            [11]  243 	add	hl, hl
   0453 29            [11]  244 	add	hl, hl
   0454 29            [11]  245 	add	hl, hl
   0455 19            [11]  246 	add	hl,de
   0456 EB            [ 4]  247 	ex	de,hl
                            248 ;src/txt_scroll_hard.c:112: ce2=draw_char(0,4,(u8*)pointeur, plot);
   0457 C5            [11]  249 	push	bc
   0458 D5            [11]  250 	push	de
   0459 C5            [11]  251 	push	bc
   045A D5            [11]  252 	push	de
   045B 21 00 04      [10]  253 	ld	hl, #0x0400
   045E E5            [11]  254 	push	hl
   045F CD 48 03      [17]  255 	call	_draw_char
   0462 F1            [10]  256 	pop	af
   0463 F1            [10]  257 	pop	af
   0464 F1            [10]  258 	pop	af
   0465 D1            [10]  259 	pop	de
   0466 C1            [10]  260 	pop	bc
   0467 65            [ 4]  261 	ld	h, l
                            262 ;src/txt_scroll_hard.c:113: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
   0468 C5            [11]  263 	push	bc
   0469 D5            [11]  264 	push	de
   046A C5            [11]  265 	push	bc
   046B D5            [11]  266 	push	de
   046C E5            [11]  267 	push	hl
   046D 33            [ 6]  268 	inc	sp
   046E 3E 01         [ 7]  269 	ld	a, #0x01
   0470 F5            [11]  270 	push	af
   0471 33            [ 6]  271 	inc	sp
   0472 CD 48 03      [17]  272 	call	_draw_char
   0475 F1            [10]  273 	pop	af
   0476 F1            [10]  274 	pop	af
   0477 F1            [10]  275 	pop	af
   0478 D1            [10]  276 	pop	de
   0479 C1            [10]  277 	pop	bc
   047A 65            [ 4]  278 	ld	h, l
                            279 ;src/txt_scroll_hard.c:114: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
   047B C5            [11]  280 	push	bc
   047C D5            [11]  281 	push	de
   047D C5            [11]  282 	push	bc
   047E D5            [11]  283 	push	de
   047F E5            [11]  284 	push	hl
   0480 33            [ 6]  285 	inc	sp
   0481 3E 02         [ 7]  286 	ld	a, #0x02
   0483 F5            [11]  287 	push	af
   0484 33            [ 6]  288 	inc	sp
   0485 CD 48 03      [17]  289 	call	_draw_char
   0488 F1            [10]  290 	pop	af
   0489 F1            [10]  291 	pop	af
   048A F1            [10]  292 	pop	af
   048B D1            [10]  293 	pop	de
   048C C1            [10]  294 	pop	bc
   048D 65            [ 4]  295 	ld	h, l
                            296 ;src/txt_scroll_hard.c:115: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
   048E C5            [11]  297 	push	bc
   048F D5            [11]  298 	push	de
   0490 E5            [11]  299 	push	hl
   0491 33            [ 6]  300 	inc	sp
   0492 3E 03         [ 7]  301 	ld	a, #0x03
   0494 F5            [11]  302 	push	af
   0495 33            [ 6]  303 	inc	sp
   0496 CD 48 03      [17]  304 	call	_draw_char
   0499 F1            [10]  305 	pop	af
   049A F1            [10]  306 	pop	af
   049B F1            [10]  307 	pop	af
                            308 ;src/txt_scroll_hard.c:116: if (ce2==4) {
   049C 7D            [ 4]  309 	ld	a, l
   049D D6 04         [ 7]  310 	sub	a, #0x04
   049F 20 0D         [12]  311 	jr	NZ,00105$
                            312 ;src/txt_scroll_hard.c:118: plot_screen2=0x8000;
   04A1 21 00 80      [10]  313 	ld	hl, #0x8000
   04A4 22 00 4C      [16]  314 	ld	(_plot_screen2), hl
                            315 ;src/txt_scroll_hard.c:119: c_screen3=4;
   04A7 21 02 4C      [10]  316 	ld	hl,#_c_screen3 + 0
   04AA 36 04         [10]  317 	ld	(hl), #0x04
   04AC 18 16         [12]  318 	jr	00107$
   04AE                     319 00105$:
                            320 ;src/txt_scroll_hard.c:121: plot_screen2+=2;
   04AE 21 00 4C      [10]  321 	ld	hl, #_plot_screen2
   04B1 7E            [ 7]  322 	ld	a, (hl)
   04B2 C6 02         [ 7]  323 	add	a, #0x02
   04B4 77            [ 7]  324 	ld	(hl), a
   04B5 23            [ 6]  325 	inc	hl
   04B6 7E            [ 7]  326 	ld	a, (hl)
   04B7 CE 00         [ 7]  327 	adc	a, #0x00
   04B9 77            [ 7]  328 	ld	(hl), a
                            329 ;src/txt_scroll_hard.c:122: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
   04BA 2A 00 4C      [16]  330 	ld	hl, (_plot_screen2)
   04BD 7C            [ 4]  331 	ld	a, h
   04BE E6 87         [ 7]  332 	and	a, #0x87
   04C0 67            [ 4]  333 	ld	h, a
   04C1 22 00 4C      [16]  334 	ld	(_plot_screen2), hl
   04C4                     335 00107$:
   04C4 DD F9         [10]  336 	ld	sp, ix
   04C6 DD E1         [14]  337 	pop	ix
   04C8 C9            [10]  338 	ret
   04C9                     339 _texte:
   04C9 57 45 20 57 49 53   340 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0505 41 4E 44 20 41 20   341 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   0541 44 46 47 20 20 20   342 	.ascii "DFG     "
        20 20
   0549 00                  343 	.db 0x00
   054A 00                  344 	.db 0x00
                            345 	.area _CODE
                            346 	.area _INITIALIZER
   4C0F                     347 __xinit__firstPlotScreen2:
   4C0F 01                  348 	.db #0x01	; 1
                            349 	.area _CABS (ABS)
