                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _myInterruptHandler
                             13 	.globl _bank4_4000
                             14 	.globl _bank0123
                             15 	.globl _calque4000
                             16 	.globl _calqueC000
                             17 	.globl _vsync
                             18 	.globl _rupture
                             19 	.globl _restoreVBL
                             20 	.globl _killVBL
                             21 	.globl _scroll
                             22 	.globl _cpct_restoreState_mxor_u8
                             23 	.globl _cpct_setSeed_mxor
                             24 	.globl _cpct_getScreenPtr
                             25 	.globl _cpct_setVideoMemoryOffset
                             26 	.globl _cpct_setPALColour
                             27 	.globl _cpct_setPalette
                             28 	.globl _cpct_setVideoMode
                             29 	.globl _cpct_hflipSpriteM0
                             30 	.globl _cpct_drawSolidBox
                             31 	.globl _cpct_drawSpriteMasked
                             32 	.globl _cpct_drawSprite
                             33 	.globl _cpct_px2byteM0
                             34 	.globl _cpct_isKeyPressed
                             35 	.globl _cpct_scanKeyboard_f
                             36 	.globl _cpct_memset_f64
                             37 	.globl _cpct_memset
                             38 	.globl _cpct_setInterruptHandler
                             39 	.globl _hScroll
                             40 	.globl _intCounter
                             41 	.globl _g_items_0
                             42 ;--------------------------------------------------------
                             43 ; special function registers
                             44 ;--------------------------------------------------------
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DATA
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
   25C9                      53 _intCounter::
   25C9                      54 	.ds 1
   25CA                      55 _hScroll::
   25CA                      56 	.ds 1
                             57 ;--------------------------------------------------------
                             58 ; absolute external ram data
                             59 ;--------------------------------------------------------
                             60 	.area _DABS (ABS)
                             61 ;--------------------------------------------------------
                             62 ; global & static initialisations
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _GSINIT
                             66 	.area _GSFINAL
                             67 	.area _GSINIT
                             68 ;--------------------------------------------------------
                             69 ; Home
                             70 ;--------------------------------------------------------
                             71 	.area _HOME
                             72 	.area _HOME
                             73 ;--------------------------------------------------------
                             74 ; code
                             75 ;--------------------------------------------------------
                             76 	.area _CODE
                             77 ;src/main.c:46: void myInterruptHandler() {
                             78 ;	---------------------------------
                             79 ; Function myInterruptHandler
                             80 ; ---------------------------------
   0373                      81 _myInterruptHandler::
                             82 ;src/main.c:47: intCounter=intCounter+1;
   0373 FD 21 C9 25   [14]   83 	ld	iy, #_intCounter
   0377 FD 34 00      [23]   84 	inc	0 (iy)
                             85 ;src/main.c:48: if (intCounter == 6) intCounter=0;
   037A FD 7E 00      [19]   86 	ld	a, 0 (iy)
   037D D6 06         [ 7]   87 	sub	a, #0x06
   037F 20 04         [12]   88 	jr	NZ,00102$
   0381 FD 36 00 00   [19]   89 	ld	0 (iy), #0x00
   0385                      90 00102$:
                             91 ;src/main.c:50: if (intCounter == 2) {
   0385 3A C9 25      [13]   92 	ld	a,(#_intCounter + 0)
   0388 D6 02         [ 7]   93 	sub	a, #0x02
   038A 20 09         [12]   94 	jr	NZ,00104$
                             95 ;src/main.c:51: cpct_setBorder(2);
   038C 21 10 02      [10]   96 	ld	hl, #0x0210
   038F E5            [11]   97 	push	hl
   0390 CD F0 21      [17]   98 	call	_cpct_setPALColour
   0393 18 07         [12]   99 	jr	00105$
   0395                     100 00104$:
                            101 ;src/main.c:53: cpct_setBorder(3);
   0395 21 10 03      [10]  102 	ld	hl, #0x0310
   0398 E5            [11]  103 	push	hl
   0399 CD F0 21      [17]  104 	call	_cpct_setPALColour
   039C                     105 00105$:
                            106 ;src/main.c:62: if (intCounter==5) {
   039C 3A C9 25      [13]  107 	ld	a,(#_intCounter + 0)
   039F D6 05         [ 7]  108 	sub	a, #0x05
   03A1 20 2A         [12]  109 	jr	NZ,00109$
                            110 ;src/main.c:63: calque4000();
   03A3 CD 45 06      [17]  111 	call	_calque4000
                            112 ;src/main.c:65: hScroll+=1;
   03A6 FD 21 CA 25   [14]  113 	ld	iy, #_hScroll
   03AA FD 34 00      [23]  114 	inc	0 (iy)
                            115 ;src/main.c:66: if (hScroll==160/2) {hScroll=0;}
   03AD FD 7E 00      [19]  116 	ld	a, 0 (iy)
   03B0 D6 50         [ 7]  117 	sub	a, #0x50
   03B2 20 04         [12]  118 	jr	NZ,00107$
   03B4 FD 36 00 00   [19]  119 	ld	0 (iy), #0x00
   03B8                     120 00107$:
                            121 ;src/main.c:67: cpct_setVideoMemoryOffset(hScroll);
   03B8 FD 21 CA 25   [14]  122 	ld	iy, #_hScroll
   03BC FD 6E 00      [19]  123 	ld	l, 0 (iy)
   03BF CD FC 21      [17]  124 	call	_cpct_setVideoMemoryOffset
                            125 ;src/main.c:68: killVBL();
   03C2 CD F6 01      [17]  126 	call	_killVBL
                            127 ;src/main.c:69: rupture(19-1);
   03C5 3E 12         [ 7]  128 	ld	a, #0x12
   03C7 F5            [11]  129 	push	af
   03C8 33            [ 6]  130 	inc	sp
   03C9 CD 13 02      [17]  131 	call	_rupture
   03CC 33            [ 6]  132 	inc	sp
   03CD                     133 00109$:
                            134 ;src/main.c:72: if (intCounter==2) {
   03CD 3A C9 25      [13]  135 	ld	a,(#_intCounter + 0)
   03D0 D6 02         [ 7]  136 	sub	a, #0x02
   03D2 20 10         [12]  137 	jr	NZ,00111$
                            138 ;src/main.c:73: calqueC000();
   03D4 CD 3A 06      [17]  139 	call	_calqueC000
                            140 ;src/main.c:74: cpct_setVideoMemoryOffset(0);
   03D7 2E 00         [ 7]  141 	ld	l, #0x00
   03D9 CD FC 21      [17]  142 	call	_cpct_setVideoMemoryOffset
                            143 ;src/main.c:75: rupture(7);
   03DC 3E 07         [ 7]  144 	ld	a, #0x07
   03DE F5            [11]  145 	push	af
   03DF 33            [ 6]  146 	inc	sp
   03E0 CD 13 02      [17]  147 	call	_rupture
   03E3 33            [ 6]  148 	inc	sp
   03E4                     149 00111$:
                            150 ;src/main.c:78: if (intCounter==3) {
   03E4 3A C9 25      [13]  151 	ld	a,(#_intCounter + 0)
   03E7 D6 03         [ 7]  152 	sub	a, #0x03
   03E9 C0            [11]  153 	ret	NZ
                            154 ;src/main.c:79: calqueC000();
   03EA CD 3A 06      [17]  155 	call	_calqueC000
                            156 ;src/main.c:80: cpct_setVideoMemoryOffset(0);
   03ED 2E 00         [ 7]  157 	ld	l, #0x00
   03EF CD FC 21      [17]  158 	call	_cpct_setVideoMemoryOffset
                            159 ;src/main.c:81: restoreVBL();
   03F2 CD 07 02      [17]  160 	call	_restoreVBL
                            161 ;src/main.c:82: rupture(39-19-7+1);
   03F5 3E 0E         [ 7]  162 	ld	a, #0x0e
   03F7 F5            [11]  163 	push	af
   03F8 33            [ 6]  164 	inc	sp
   03F9 CD 13 02      [17]  165 	call	_rupture
   03FC 33            [ 6]  166 	inc	sp
   03FD C9            [10]  167 	ret
   03FE                     168 _g_items_0:
   03FE 05                  169 	.db #0x05	; 5
   03FF 0F                  170 	.db #0x0f	; 15
   0400 0F                  171 	.db #0x0f	; 15
   0401 00                  172 	.db #0x00	; 0
   0402 0F                  173 	.db #0x0f	; 15
   0403 0F                  174 	.db #0x0f	; 15
   0404 0F                  175 	.db #0x0f	; 15
   0405 0A                  176 	.db #0x0a	; 10
   0406 0F                  177 	.db #0x0f	; 15
   0407 0A                  178 	.db #0x0a	; 10
   0408 05                  179 	.db #0x05	; 5
   0409 00                  180 	.db #0x00	; 0
   040A 0F                  181 	.db #0x0f	; 15
   040B 0A                  182 	.db #0x0a	; 10
   040C 05                  183 	.db #0x05	; 5
   040D 00                  184 	.db #0x00	; 0
   040E 05                  185 	.db #0x05	; 5
   040F 0F                  186 	.db #0x0f	; 15
   0410 0A                  187 	.db #0x0a	; 10
   0411 0A                  188 	.db #0x0a	; 10
   0412 00                  189 	.db #0x00	; 0
   0413 0F                  190 	.db #0x0f	; 15
   0414 0F                  191 	.db #0x0f	; 15
   0415 0A                  192 	.db #0x0a	; 10
   0416 00                  193 	.db #0x00	; 0
   0417 0A                  194 	.db #0x0a	; 10
   0418 0A                  195 	.db #0x0a	; 10
   0419 0A                  196 	.db #0x0a	; 10
   041A 00                  197 	.db #0x00	; 0
   041B 00                  198 	.db #0x00	; 0
   041C 00                  199 	.db #0x00	; 0
   041D 00                  200 	.db #0x00	; 0
                            201 ;src/main.c:87: void main(void) {
                            202 ;	---------------------------------
                            203 ; Function main
                            204 ; ---------------------------------
   041E                     205 _main::
                            206 ;src/main.c:90: u8* sprite=g_items_0;
                            207 ;src/main.c:106: cpct_setInterruptHandler(myInterruptHandler);
   041E 21 73 03      [10]  208 	ld	hl, #_myInterruptHandler
   0421 CD FF 24      [17]  209 	call	_cpct_setInterruptHandler
                            210 ;src/main.c:110: bank4_4000();
   0424 CD 67 06      [17]  211 	call	_bank4_4000
                            212 ;src/main.c:111: bank0123();
   0427 CD 5B 06      [17]  213 	call	_bank0123
                            214 ;src/main.c:112: calqueC000();
   042A CD 3A 06      [17]  215 	call	_calqueC000
                            216 ;src/main.c:115: cpct_setVideoMode(0);
   042D 2E 00         [ 7]  217 	ld	l, #0x00
   042F CD C6 23      [17]  218 	call	_cpct_setVideoMode
                            219 ;src/main.c:118: cpct_setBorder(HW_BLACK);
   0432 21 10 14      [10]  220 	ld	hl, #0x1410
   0435 E5            [11]  221 	push	hl
   0436 CD F0 21      [17]  222 	call	_cpct_setPALColour
                            223 ;src/main.c:119: cpct_setPalette(g_tile_palette, 6);
   0439 21 06 00      [10]  224 	ld	hl, #0x0006
   043C E5            [11]  225 	push	hl
   043D 21 D1 06      [10]  226 	ld	hl, #_g_tile_palette
   0440 E5            [11]  227 	push	hl
   0441 CD 63 21      [17]  228 	call	_cpct_setPalette
                            229 ;src/main.c:120: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   0444 21 00 40      [10]  230 	ld	hl, #0x4000
   0447 E5            [11]  231 	push	hl
   0448 AF            [ 4]  232 	xor	a, a
   0449 F5            [11]  233 	push	af
   044A 33            [ 6]  234 	inc	sp
   044B 26 C0         [ 7]  235 	ld	h, #0xc0
   044D E5            [11]  236 	push	hl
   044E CD F0 23      [17]  237 	call	_cpct_memset
                            238 ;src/main.c:125: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   0451 21 0F 0F      [10]  239 	ld	hl, #0x0f0f
   0454 E5            [11]  240 	push	hl
   0455 21 00 C0      [10]  241 	ld	hl, #0xc000
   0458 E5            [11]  242 	push	hl
   0459 CD DF 24      [17]  243 	call	_cpct_getScreenPtr
                            244 ;src/main.c:126: cpct_drawSprite(sprite, p, 4, 8);
   045C E5            [11]  245 	push	hl
   045D 01 04 08      [10]  246 	ld	bc, #0x0804
   0460 C5            [11]  247 	push	bc
   0461 E5            [11]  248 	push	hl
   0462 01 FE 03      [10]  249 	ld	bc, #_g_items_0
   0465 C5            [11]  250 	push	bc
   0466 CD 05 22      [17]  251 	call	_cpct_drawSprite
   0469 01 00 20      [10]  252 	ld	bc, #0x2000
   046C C5            [11]  253 	push	bc
   046D 01 FF FF      [10]  254 	ld	bc, #0xffff
   0470 C5            [11]  255 	push	bc
   0471 01 00 C0      [10]  256 	ld	bc, #0xc000
   0474 C5            [11]  257 	push	bc
   0475 CD 16 23      [17]  258 	call	_cpct_memset_f64
   0478 01 FE 03      [10]  259 	ld	bc, #_g_items_0
   047B C5            [11]  260 	push	bc
   047C 01 04 08      [10]  261 	ld	bc, #0x0804
   047F C5            [11]  262 	push	bc
   0480 CD 82 23      [17]  263 	call	_cpct_hflipSpriteM0
   0483 E1            [10]  264 	pop	hl
                            265 ;src/main.c:134: cpct_drawSprite(sprite, p, 4, 8);
   0484 01 04 08      [10]  266 	ld	bc, #0x0804
   0487 C5            [11]  267 	push	bc
   0488 E5            [11]  268 	push	hl
   0489 21 FE 03      [10]  269 	ld	hl, #_g_items_0
   048C E5            [11]  270 	push	hl
   048D CD 05 22      [17]  271 	call	_cpct_drawSprite
                            272 ;src/main.c:136: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   0490 21 0F 1F      [10]  273 	ld	hl, #0x1f0f
   0493 E5            [11]  274 	push	hl
   0494 21 00 C0      [10]  275 	ld	hl, #0xc000
   0497 E5            [11]  276 	push	hl
   0498 CD DF 24      [17]  277 	call	_cpct_getScreenPtr
                            278 ;src/main.c:138: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   049B E5            [11]  279 	push	hl
   049C 21 02 03      [10]  280 	ld	hl, #0x0302
   049F E5            [11]  281 	push	hl
   04A0 CD D4 23      [17]  282 	call	_cpct_px2byteM0
   04A3 55            [ 4]  283 	ld	d, l
   04A4 C1            [10]  284 	pop	bc
   04A5 21 0A 14      [10]  285 	ld	hl, #0x140a
   04A8 E5            [11]  286 	push	hl
   04A9 D5            [11]  287 	push	de
   04AA 33            [ 6]  288 	inc	sp
   04AB C5            [11]  289 	push	bc
   04AC CD 0D 24      [17]  290 	call	_cpct_drawSolidBox
   04AF F1            [10]  291 	pop	af
                            292 ;src/main.c:141: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   04B0 33            [ 6]  293 	inc	sp
   04B1 21 09 4F      [10]  294 	ld	hl,#0x4f09
   04B4 E3            [19]  295 	ex	(sp),hl
   04B5 21 00 C0      [10]  296 	ld	hl, #0xc000
   04B8 E5            [11]  297 	push	hl
   04B9 CD DF 24      [17]  298 	call	_cpct_getScreenPtr
                            299 ;src/main.c:142: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   04BC 01 D7 06      [10]  300 	ld	bc, #_g_tile_schtroumpf+0
   04BF 11 10 20      [10]  301 	ld	de, #0x2010
   04C2 D5            [11]  302 	push	de
   04C3 E5            [11]  303 	push	hl
   04C4 C5            [11]  304 	push	bc
   04C5 CD E7 22      [17]  305 	call	_cpct_drawSpriteMasked
                            306 ;src/main.c:156: cpct_srand(77);
   04C8 21 4D 00      [10]  307 	ld	hl,#0x004d
   04CB 11 00 00      [10]  308 	ld	de,#0x0000
   04CE CD B4 22      [17]  309 	call	_cpct_setSeed_mxor
   04D1 CD BC 22      [17]  310 	call	_cpct_restoreState_mxor_u8
                            311 ;src/main.c:160: cpct_scanKeyboard_f();
   04D4 CD 86 21      [17]  312 	call	_cpct_scanKeyboard_f
                            313 ;src/main.c:161: t=0;
   04D7 01 00 00      [10]  314 	ld	bc, #0x0000
                            315 ;src/main.c:162: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
   04DA                     316 00107$:
   04DA C5            [11]  317 	push	bc
   04DB 21 80 00      [10]  318 	ld	hl, #0x0080
   04DE E5            [11]  319 	push	hl
   04DF C5            [11]  320 	push	bc
   04E0 CD D2 24      [17]  321 	call	__modsint
   04E3 F1            [10]  322 	pop	af
   04E4 F1            [10]  323 	pop	af
   04E5 C1            [10]  324 	pop	bc
   04E6 7C            [ 4]  325 	ld	a, h
   04E7 B5            [ 4]  326 	or	a,l
   04E8 20 18         [12]  327 	jr	NZ,00108$
   04EA C5            [11]  328 	push	bc
   04EB 21 00 40      [10]  329 	ld	hl, #0x4000
   04EE CD 7A 21      [17]  330 	call	_cpct_isKeyPressed
   04F1 C1            [10]  331 	pop	bc
   04F2 7D            [ 4]  332 	ld	a, l
   04F3 B7            [ 4]  333 	or	a, a
   04F4 20 48         [12]  334 	jr	NZ,00109$
   04F6 C5            [11]  335 	push	bc
   04F7 21 02 04      [10]  336 	ld	hl, #0x0402
   04FA CD 7A 21      [17]  337 	call	_cpct_isKeyPressed
   04FD C1            [10]  338 	pop	bc
   04FE 7D            [ 4]  339 	ld	a, l
   04FF B7            [ 4]  340 	or	a, a
   0500 20 3C         [12]  341 	jr	NZ,00109$
   0502                     342 00108$:
                            343 ;src/main.c:163: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
   0502 C5            [11]  344 	push	bc
   0503 C5            [11]  345 	push	bc
   0504 21 6E 00      [10]  346 	ld	hl, #0x006e
   0507 E5            [11]  347 	push	hl
   0508 21 4B 05      [10]  348 	ld	hl, #___str_0
   050B E5            [11]  349 	push	hl
   050C CD 38 01      [17]  350 	call	_scroll
   050F 21 06 00      [10]  351 	ld	hl, #6
   0512 39            [11]  352 	add	hl, sp
   0513 F9            [ 6]  353 	ld	sp, hl
   0514 C1            [10]  354 	pop	bc
                            355 ;src/main.c:164: t=t+1;
   0515 03            [ 6]  356 	inc	bc
                            357 ;src/main.c:165: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   0516 3E EC         [ 7]  358 	ld	a, #0xec
   0518 B9            [ 4]  359 	cp	a, c
   0519 3E 04         [ 7]  360 	ld	a, #0x04
   051B 98            [ 4]  361 	sbc	a, b
   051C E2 21 05      [10]  362 	jp	PO, 00139$
   051F EE 80         [ 7]  363 	xor	a, #0x80
   0521                     364 00139$:
   0521 F2 27 05      [10]  365 	jp	P, 00102$
   0524 01 00 00      [10]  366 	ld	bc, #0x0000
   0527                     367 00102$:
                            368 ;src/main.c:166: if (t%128==0) {
   0527 C5            [11]  369 	push	bc
   0528 21 80 00      [10]  370 	ld	hl, #0x0080
   052B E5            [11]  371 	push	hl
   052C C5            [11]  372 	push	bc
   052D CD D2 24      [17]  373 	call	__modsint
   0530 F1            [10]  374 	pop	af
   0531 F1            [10]  375 	pop	af
   0532 C1            [10]  376 	pop	bc
   0533 7C            [ 4]  377 	ld	a, h
   0534 B5            [ 4]  378 	or	a,l
   0535 20 A3         [12]  379 	jr	NZ,00107$
                            380 ;src/main.c:167: cpct_scanKeyboard_f();
   0537 C5            [11]  381 	push	bc
   0538 CD 86 21      [17]  382 	call	_cpct_scanKeyboard_f
   053B C1            [10]  383 	pop	bc
   053C 18 9C         [12]  384 	jr	00107$
   053E                     385 00109$:
                            386 ;src/main.c:173: cpct_setVideoMemoryOffset(0);
   053E 2E 00         [ 7]  387 	ld	l, #0x00
   0540 CD FC 21      [17]  388 	call	_cpct_setVideoMemoryOffset
                            389 ;src/main.c:174: calque4000();
   0543 CD 45 06      [17]  390 	call	_calque4000
                            391 ;src/main.c:176: while (1) {
   0546                     392 00111$:
                            393 ;src/main.c:177: vsync();
   0546 CD BA 05      [17]  394 	call	_vsync
   0549 18 FB         [12]  395 	jr	00111$
   054B                     396 ___str_0:
   054B 57 45 20 57 49 53   397 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0587 57 45 20 57 49 53   398 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   05B9 00                  399 	.db 0x00
                            400 	.area _CODE
                            401 	.area _INITIALIZER
   25D1                     402 __xinit__intCounter:
   25D1 00                  403 	.db #0x00	; 0
   25D2                     404 __xinit__hScroll:
   25D2 00                  405 	.db #0x00	; 0
                            406 	.area _CABS (ABS)
