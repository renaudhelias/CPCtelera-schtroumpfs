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
                             13 	.globl _monterDerniereColonne
                             14 	.globl _bank4_4000
                             15 	.globl _bank0123
                             16 	.globl _calque4000
                             17 	.globl _calqueC000
                             18 	.globl _vsync
                             19 	.globl _rupture
                             20 	.globl _restoreVBL
                             21 	.globl _killVBL
                             22 	.globl _scroll
                             23 	.globl _cpct_restoreState_mxor_u8
                             24 	.globl _cpct_setSeed_mxor
                             25 	.globl _cpct_getScreenPtr
                             26 	.globl _cpct_setVideoMemoryOffset
                             27 	.globl _cpct_setPALColour
                             28 	.globl _cpct_setPalette
                             29 	.globl _cpct_setVideoMode
                             30 	.globl _cpct_hflipSpriteM0
                             31 	.globl _cpct_drawSolidBox
                             32 	.globl _cpct_drawSpriteMasked
                             33 	.globl _cpct_drawSprite
                             34 	.globl _cpct_px2byteM0
                             35 	.globl _cpct_isKeyPressed
                             36 	.globl _cpct_scanKeyboard_f
                             37 	.globl _cpct_memset_f64
                             38 	.globl _cpct_memset
                             39 	.globl _cpct_setInterruptHandler
                             40 	.globl _slow
                             41 	.globl _hScroll
                             42 	.globl _intCounter
                             43 	.globl _g_items_0
                             44 ;--------------------------------------------------------
                             45 ; special function registers
                             46 ;--------------------------------------------------------
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DATA
                             51 ;--------------------------------------------------------
                             52 ; ram data
                             53 ;--------------------------------------------------------
                             54 	.area _INITIALIZED
   264E                      55 _intCounter::
   264E                      56 	.ds 1
   264F                      57 _hScroll::
   264F                      58 	.ds 1
   2650                      59 _slow::
   2650                      60 	.ds 1
                             61 ;--------------------------------------------------------
                             62 ; absolute external ram data
                             63 ;--------------------------------------------------------
                             64 	.area _DABS (ABS)
                             65 ;--------------------------------------------------------
                             66 ; global & static initialisations
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _GSINIT
                             70 	.area _GSFINAL
                             71 	.area _GSINIT
                             72 ;--------------------------------------------------------
                             73 ; Home
                             74 ;--------------------------------------------------------
                             75 	.area _HOME
                             76 	.area _HOME
                             77 ;--------------------------------------------------------
                             78 ; code
                             79 ;--------------------------------------------------------
                             80 	.area _CODE
                             81 ;src/main.c:49: void monterDerniereColonne(u8 hScroll) {
                             82 ;	---------------------------------
                             83 ; Function monterDerniereColonne
                             84 ; ---------------------------------
   0373                      85 _monterDerniereColonne::
   0373 DD E5         [15]   86 	push	ix
   0375 DD 21 00 00   [14]   87 	ld	ix,#0
   0379 DD 39         [15]   88 	add	ix,sp
   037B F5            [11]   89 	push	af
                             90 ;src/main.c:58: for (l=0;l<8;l++) {
   037C 3E 50         [ 7]   91 	ld	a, #0x50
   037E F5            [11]   92 	push	af
   037F 33            [ 6]   93 	inc	sp
   0380 DD 7E 04      [19]   94 	ld	a, 4 (ix)
   0383 F5            [11]   95 	push	af
   0384 33            [ 6]   96 	inc	sp
   0385 CD 37 23      [17]   97 	call	__divuchar
   0388 F1            [10]   98 	pop	af
   0389 DD 75 FF      [19]   99 	ld	-1 (ix), l
   038C 3E 50         [ 7]  100 	ld	a, #0x50
   038E F5            [11]  101 	push	af
   038F 33            [ 6]  102 	inc	sp
   0390 DD 7E 04      [19]  103 	ld	a, 4 (ix)
   0393 F5            [11]  104 	push	af
   0394 33            [ 6]  105 	inc	sp
   0395 CD 18 23      [17]  106 	call	__moduchar
   0398 F1            [10]  107 	pop	af
   0399 DD 75 FE      [19]  108 	ld	-2 (ix), l
   039C 01 00 00      [10]  109 	ld	bc, #0x0000
   039F                     110 00102$:
                            111 ;src/main.c:60: plot_column=(u8 *)(0x4000 + l*0x800 + 80*(c+hScroll/80)+hScroll%80);
   039F 79            [ 4]  112 	ld	a, c
   03A0 07            [ 4]  113 	rlca
   03A1 07            [ 4]  114 	rlca
   03A2 07            [ 4]  115 	rlca
   03A3 E6 F8         [ 7]  116 	and	a, #0xf8
   03A5 57            [ 4]  117 	ld	d, a
   03A6 1E 00         [ 7]  118 	ld	e, #0x00
   03A8 21 00 40      [10]  119 	ld	hl, #0x4000
   03AB 19            [11]  120 	add	hl,de
   03AC EB            [ 4]  121 	ex	de,hl
   03AD DD 6E FF      [19]  122 	ld	l, -1 (ix)
   03B0 26 00         [ 7]  123 	ld	h, #0x00
   03B2 23            [ 6]  124 	inc	hl
   03B3 23            [ 6]  125 	inc	hl
   03B4 23            [ 6]  126 	inc	hl
   03B5 23            [ 6]  127 	inc	hl
   03B6 D5            [11]  128 	push	de
   03B7 5D            [ 4]  129 	ld	e, l
   03B8 54            [ 4]  130 	ld	d, h
   03B9 29            [11]  131 	add	hl, hl
   03BA 29            [11]  132 	add	hl, hl
   03BB 19            [11]  133 	add	hl, de
   03BC 29            [11]  134 	add	hl, hl
   03BD 29            [11]  135 	add	hl, hl
   03BE 29            [11]  136 	add	hl, hl
   03BF 29            [11]  137 	add	hl, hl
   03C0 D1            [10]  138 	pop	de
   03C1 19            [11]  139 	add	hl, de
   03C2 DD 5E FE      [19]  140 	ld	e, -2 (ix)
   03C5 16 00         [ 7]  141 	ld	d, #0x00
   03C7 19            [11]  142 	add	hl, de
                            143 ;src/main.c:62: *plot_column=0x33;
   03C8 36 33         [10]  144 	ld	(hl), #0x33
                            145 ;src/main.c:58: for (l=0;l<8;l++) {
   03CA 03            [ 6]  146 	inc	bc
   03CB 79            [ 4]  147 	ld	a, c
   03CC D6 08         [ 7]  148 	sub	a, #0x08
   03CE 78            [ 4]  149 	ld	a, b
   03CF DE 00         [ 7]  150 	sbc	a, #0x00
   03D1 38 CC         [12]  151 	jr	C,00102$
   03D3 DD F9         [10]  152 	ld	sp, ix
   03D5 DD E1         [14]  153 	pop	ix
   03D7 C9            [10]  154 	ret
   03D8                     155 _g_items_0:
   03D8 05                  156 	.db #0x05	; 5
   03D9 0F                  157 	.db #0x0f	; 15
   03DA 0F                  158 	.db #0x0f	; 15
   03DB 00                  159 	.db #0x00	; 0
   03DC 0F                  160 	.db #0x0f	; 15
   03DD 0F                  161 	.db #0x0f	; 15
   03DE 0F                  162 	.db #0x0f	; 15
   03DF 0A                  163 	.db #0x0a	; 10
   03E0 0F                  164 	.db #0x0f	; 15
   03E1 0A                  165 	.db #0x0a	; 10
   03E2 05                  166 	.db #0x05	; 5
   03E3 00                  167 	.db #0x00	; 0
   03E4 0F                  168 	.db #0x0f	; 15
   03E5 0A                  169 	.db #0x0a	; 10
   03E6 05                  170 	.db #0x05	; 5
   03E7 00                  171 	.db #0x00	; 0
   03E8 05                  172 	.db #0x05	; 5
   03E9 0F                  173 	.db #0x0f	; 15
   03EA 0A                  174 	.db #0x0a	; 10
   03EB 0A                  175 	.db #0x0a	; 10
   03EC 00                  176 	.db #0x00	; 0
   03ED 0F                  177 	.db #0x0f	; 15
   03EE 0F                  178 	.db #0x0f	; 15
   03EF 0A                  179 	.db #0x0a	; 10
   03F0 00                  180 	.db #0x00	; 0
   03F1 0A                  181 	.db #0x0a	; 10
   03F2 0A                  182 	.db #0x0a	; 10
   03F3 0A                  183 	.db #0x0a	; 10
   03F4 00                  184 	.db #0x00	; 0
   03F5 00                  185 	.db #0x00	; 0
   03F6 00                  186 	.db #0x00	; 0
   03F7 00                  187 	.db #0x00	; 0
                            188 ;src/main.c:71: void myInterruptHandler() {
                            189 ;	---------------------------------
                            190 ; Function myInterruptHandler
                            191 ; ---------------------------------
   03F8                     192 _myInterruptHandler::
                            193 ;src/main.c:72: intCounter=intCounter+1;
   03F8 FD 21 4E 26   [14]  194 	ld	iy, #_intCounter
   03FC FD 34 00      [23]  195 	inc	0 (iy)
                            196 ;src/main.c:73: if (intCounter == 6) intCounter=0;
   03FF FD 7E 00      [19]  197 	ld	a, 0 (iy)
   0402 D6 06         [ 7]  198 	sub	a, #0x06
   0404 20 04         [12]  199 	jr	NZ,00102$
   0406 FD 36 00 00   [19]  200 	ld	0 (iy), #0x00
   040A                     201 00102$:
                            202 ;src/main.c:75: if (intCounter == 2) {
   040A 3A 4E 26      [13]  203 	ld	a,(#_intCounter + 0)
   040D D6 02         [ 7]  204 	sub	a, #0x02
   040F 20 09         [12]  205 	jr	NZ,00104$
                            206 ;src/main.c:76: cpct_setBorder(2);
   0411 21 10 02      [10]  207 	ld	hl, #0x0210
   0414 E5            [11]  208 	push	hl
   0415 CD 5E 22      [17]  209 	call	_cpct_setPALColour
   0418 18 07         [12]  210 	jr	00105$
   041A                     211 00104$:
                            212 ;src/main.c:78: cpct_setBorder(3);
   041A 21 10 03      [10]  213 	ld	hl, #0x0310
   041D E5            [11]  214 	push	hl
   041E CD 5E 22      [17]  215 	call	_cpct_setPALColour
   0421                     216 00105$:
                            217 ;src/main.c:87: if (intCounter==5) {
   0421 3A 4E 26      [13]  218 	ld	a,(#_intCounter + 0)
   0424 D6 05         [ 7]  219 	sub	a, #0x05
   0426 20 33         [12]  220 	jr	NZ,00109$
                            221 ;src/main.c:88: calque4000();
   0428 CD B3 06      [17]  222 	call	_calque4000
                            223 ;src/main.c:92: hScroll+=1;
   042B FD 21 4F 26   [14]  224 	ld	iy, #_hScroll
   042F FD 34 00      [23]  225 	inc	0 (iy)
                            226 ;src/main.c:96: if (hScroll==240) {hScroll=0;}
   0432 FD 7E 00      [19]  227 	ld	a, 0 (iy)
   0435 D6 F0         [ 7]  228 	sub	a, #0xf0
   0437 20 04         [12]  229 	jr	NZ,00107$
   0439 FD 36 00 00   [19]  230 	ld	0 (iy), #0x00
   043D                     231 00107$:
                            232 ;src/main.c:97: monterDerniereColonne(hScroll);
   043D 3A 4F 26      [13]  233 	ld	a, (_hScroll)
   0440 F5            [11]  234 	push	af
   0441 33            [ 6]  235 	inc	sp
   0442 CD 73 03      [17]  236 	call	_monterDerniereColonne
   0445 33            [ 6]  237 	inc	sp
                            238 ;src/main.c:99: cpct_setVideoMemoryOffset(hScroll);
   0446 FD 21 4F 26   [14]  239 	ld	iy, #_hScroll
   044A FD 6E 00      [19]  240 	ld	l, 0 (iy)
   044D CD 6A 22      [17]  241 	call	_cpct_setVideoMemoryOffset
                            242 ;src/main.c:100: killVBL();
   0450 CD F6 01      [17]  243 	call	_killVBL
                            244 ;src/main.c:101: rupture(19-1);
   0453 3E 12         [ 7]  245 	ld	a, #0x12
   0455 F5            [11]  246 	push	af
   0456 33            [ 6]  247 	inc	sp
   0457 CD 13 02      [17]  248 	call	_rupture
   045A 33            [ 6]  249 	inc	sp
   045B                     250 00109$:
                            251 ;src/main.c:104: if (intCounter==2) {
   045B 3A 4E 26      [13]  252 	ld	a,(#_intCounter + 0)
   045E D6 02         [ 7]  253 	sub	a, #0x02
   0460 20 10         [12]  254 	jr	NZ,00111$
                            255 ;src/main.c:105: calqueC000();
   0462 CD A8 06      [17]  256 	call	_calqueC000
                            257 ;src/main.c:106: cpct_setVideoMemoryOffset(0);
   0465 2E 00         [ 7]  258 	ld	l, #0x00
   0467 CD 6A 22      [17]  259 	call	_cpct_setVideoMemoryOffset
                            260 ;src/main.c:107: rupture(7);
   046A 3E 07         [ 7]  261 	ld	a, #0x07
   046C F5            [11]  262 	push	af
   046D 33            [ 6]  263 	inc	sp
   046E CD 13 02      [17]  264 	call	_rupture
   0471 33            [ 6]  265 	inc	sp
   0472                     266 00111$:
                            267 ;src/main.c:110: if (intCounter==3) {
   0472 3A 4E 26      [13]  268 	ld	a,(#_intCounter + 0)
   0475 D6 03         [ 7]  269 	sub	a, #0x03
   0477 C0            [11]  270 	ret	NZ
                            271 ;src/main.c:111: calqueC000();
   0478 CD A8 06      [17]  272 	call	_calqueC000
                            273 ;src/main.c:112: cpct_setVideoMemoryOffset(0);
   047B 2E 00         [ 7]  274 	ld	l, #0x00
   047D CD 6A 22      [17]  275 	call	_cpct_setVideoMemoryOffset
                            276 ;src/main.c:113: restoreVBL();
   0480 CD 07 02      [17]  277 	call	_restoreVBL
                            278 ;src/main.c:114: rupture(39-19-7+1);
   0483 3E 0E         [ 7]  279 	ld	a, #0x0e
   0485 F5            [11]  280 	push	af
   0486 33            [ 6]  281 	inc	sp
   0487 CD 13 02      [17]  282 	call	_rupture
   048A 33            [ 6]  283 	inc	sp
   048B C9            [10]  284 	ret
                            285 ;src/main.c:119: void main(void) {
                            286 ;	---------------------------------
                            287 ; Function main
                            288 ; ---------------------------------
   048C                     289 _main::
                            290 ;src/main.c:122: u8* sprite=g_items_0;
                            291 ;src/main.c:138: cpct_setInterruptHandler(myInterruptHandler);
   048C 21 F8 03      [10]  292 	ld	hl, #_myInterruptHandler
   048F CD C5 25      [17]  293 	call	_cpct_setInterruptHandler
                            294 ;src/main.c:142: bank4_4000();
   0492 CD D5 06      [17]  295 	call	_bank4_4000
                            296 ;src/main.c:143: bank0123();
   0495 CD C9 06      [17]  297 	call	_bank0123
                            298 ;src/main.c:144: calqueC000();
   0498 CD A8 06      [17]  299 	call	_calqueC000
                            300 ;src/main.c:147: cpct_setVideoMode(0);
   049B 2E 00         [ 7]  301 	ld	l, #0x00
   049D CD 8C 24      [17]  302 	call	_cpct_setVideoMode
                            303 ;src/main.c:150: cpct_setBorder(HW_BLACK);
   04A0 21 10 14      [10]  304 	ld	hl, #0x1410
   04A3 E5            [11]  305 	push	hl
   04A4 CD 5E 22      [17]  306 	call	_cpct_setPALColour
                            307 ;src/main.c:151: cpct_setPalette(g_tile_palette, 6);
   04A7 21 06 00      [10]  308 	ld	hl, #0x0006
   04AA E5            [11]  309 	push	hl
   04AB 21 3F 07      [10]  310 	ld	hl, #_g_tile_palette
   04AE E5            [11]  311 	push	hl
   04AF CD D1 21      [17]  312 	call	_cpct_setPalette
                            313 ;src/main.c:152: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   04B2 21 00 40      [10]  314 	ld	hl, #0x4000
   04B5 E5            [11]  315 	push	hl
   04B6 AF            [ 4]  316 	xor	a, a
   04B7 F5            [11]  317 	push	af
   04B8 33            [ 6]  318 	inc	sp
   04B9 26 C0         [ 7]  319 	ld	h, #0xc0
   04BB E5            [11]  320 	push	hl
   04BC CD B6 24      [17]  321 	call	_cpct_memset
                            322 ;src/main.c:157: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   04BF 21 0F 0F      [10]  323 	ld	hl, #0x0f0f
   04C2 E5            [11]  324 	push	hl
   04C3 21 00 C0      [10]  325 	ld	hl, #0xc000
   04C6 E5            [11]  326 	push	hl
   04C7 CD A5 25      [17]  327 	call	_cpct_getScreenPtr
                            328 ;src/main.c:158: cpct_drawSprite(sprite, p, 4, 8);
   04CA E5            [11]  329 	push	hl
   04CB 01 04 08      [10]  330 	ld	bc, #0x0804
   04CE C5            [11]  331 	push	bc
   04CF E5            [11]  332 	push	hl
   04D0 01 D8 03      [10]  333 	ld	bc, #_g_items_0
   04D3 C5            [11]  334 	push	bc
   04D4 CD 73 22      [17]  335 	call	_cpct_drawSprite
   04D7 01 00 20      [10]  336 	ld	bc, #0x2000
   04DA C5            [11]  337 	push	bc
   04DB 01 FF FF      [10]  338 	ld	bc, #0xffff
   04DE C5            [11]  339 	push	bc
   04DF 01 00 C0      [10]  340 	ld	bc, #0xc000
   04E2 C5            [11]  341 	push	bc
   04E3 CD DC 23      [17]  342 	call	_cpct_memset_f64
   04E6 01 D8 03      [10]  343 	ld	bc, #_g_items_0
   04E9 C5            [11]  344 	push	bc
   04EA 01 04 08      [10]  345 	ld	bc, #0x0804
   04ED C5            [11]  346 	push	bc
   04EE CD 48 24      [17]  347 	call	_cpct_hflipSpriteM0
   04F1 E1            [10]  348 	pop	hl
                            349 ;src/main.c:166: cpct_drawSprite(sprite, p, 4, 8);
   04F2 01 04 08      [10]  350 	ld	bc, #0x0804
   04F5 C5            [11]  351 	push	bc
   04F6 E5            [11]  352 	push	hl
   04F7 21 D8 03      [10]  353 	ld	hl, #_g_items_0
   04FA E5            [11]  354 	push	hl
   04FB CD 73 22      [17]  355 	call	_cpct_drawSprite
                            356 ;src/main.c:168: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   04FE 21 0F 1F      [10]  357 	ld	hl, #0x1f0f
   0501 E5            [11]  358 	push	hl
   0502 21 00 C0      [10]  359 	ld	hl, #0xc000
   0505 E5            [11]  360 	push	hl
   0506 CD A5 25      [17]  361 	call	_cpct_getScreenPtr
                            362 ;src/main.c:170: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0509 E5            [11]  363 	push	hl
   050A 21 02 03      [10]  364 	ld	hl, #0x0302
   050D E5            [11]  365 	push	hl
   050E CD 9A 24      [17]  366 	call	_cpct_px2byteM0
   0511 55            [ 4]  367 	ld	d, l
   0512 C1            [10]  368 	pop	bc
   0513 21 0A 14      [10]  369 	ld	hl, #0x140a
   0516 E5            [11]  370 	push	hl
   0517 D5            [11]  371 	push	de
   0518 33            [ 6]  372 	inc	sp
   0519 C5            [11]  373 	push	bc
   051A CD D3 24      [17]  374 	call	_cpct_drawSolidBox
   051D F1            [10]  375 	pop	af
                            376 ;src/main.c:173: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   051E 33            [ 6]  377 	inc	sp
   051F 21 09 4F      [10]  378 	ld	hl,#0x4f09
   0522 E3            [19]  379 	ex	(sp),hl
   0523 21 00 C0      [10]  380 	ld	hl, #0xc000
   0526 E5            [11]  381 	push	hl
   0527 CD A5 25      [17]  382 	call	_cpct_getScreenPtr
                            383 ;src/main.c:174: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   052A 01 45 07      [10]  384 	ld	bc, #_g_tile_schtroumpf+0
   052D 11 10 20      [10]  385 	ld	de, #0x2010
   0530 D5            [11]  386 	push	de
   0531 E5            [11]  387 	push	hl
   0532 C5            [11]  388 	push	bc
   0533 CD AD 23      [17]  389 	call	_cpct_drawSpriteMasked
                            390 ;src/main.c:188: cpct_srand(77);
   0536 21 4D 00      [10]  391 	ld	hl,#0x004d
   0539 11 00 00      [10]  392 	ld	de,#0x0000
   053C CD 7A 23      [17]  393 	call	_cpct_setSeed_mxor
   053F CD 82 23      [17]  394 	call	_cpct_restoreState_mxor_u8
                            395 ;src/main.c:192: cpct_scanKeyboard_f();
   0542 CD F4 21      [17]  396 	call	_cpct_scanKeyboard_f
                            397 ;src/main.c:193: t=0;
   0545 01 00 00      [10]  398 	ld	bc, #0x0000
                            399 ;src/main.c:194: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
   0548                     400 00107$:
   0548 C5            [11]  401 	push	bc
   0549 21 80 00      [10]  402 	ld	hl, #0x0080
   054C E5            [11]  403 	push	hl
   054D C5            [11]  404 	push	bc
   054E CD 98 25      [17]  405 	call	__modsint
   0551 F1            [10]  406 	pop	af
   0552 F1            [10]  407 	pop	af
   0553 C1            [10]  408 	pop	bc
   0554 7C            [ 4]  409 	ld	a, h
   0555 B5            [ 4]  410 	or	a,l
   0556 20 18         [12]  411 	jr	NZ,00108$
   0558 C5            [11]  412 	push	bc
   0559 21 00 40      [10]  413 	ld	hl, #0x4000
   055C CD E8 21      [17]  414 	call	_cpct_isKeyPressed
   055F C1            [10]  415 	pop	bc
   0560 7D            [ 4]  416 	ld	a, l
   0561 B7            [ 4]  417 	or	a, a
   0562 20 48         [12]  418 	jr	NZ,00109$
   0564 C5            [11]  419 	push	bc
   0565 21 02 04      [10]  420 	ld	hl, #0x0402
   0568 CD E8 21      [17]  421 	call	_cpct_isKeyPressed
   056B C1            [10]  422 	pop	bc
   056C 7D            [ 4]  423 	ld	a, l
   056D B7            [ 4]  424 	or	a, a
   056E 20 3C         [12]  425 	jr	NZ,00109$
   0570                     426 00108$:
                            427 ;src/main.c:195: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
   0570 C5            [11]  428 	push	bc
   0571 C5            [11]  429 	push	bc
   0572 21 6E 00      [10]  430 	ld	hl, #0x006e
   0575 E5            [11]  431 	push	hl
   0576 21 B9 05      [10]  432 	ld	hl, #___str_0
   0579 E5            [11]  433 	push	hl
   057A CD 38 01      [17]  434 	call	_scroll
   057D 21 06 00      [10]  435 	ld	hl, #6
   0580 39            [11]  436 	add	hl, sp
   0581 F9            [ 6]  437 	ld	sp, hl
   0582 C1            [10]  438 	pop	bc
                            439 ;src/main.c:196: t=t+1;
   0583 03            [ 6]  440 	inc	bc
                            441 ;src/main.c:197: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   0584 3E EC         [ 7]  442 	ld	a, #0xec
   0586 B9            [ 4]  443 	cp	a, c
   0587 3E 04         [ 7]  444 	ld	a, #0x04
   0589 98            [ 4]  445 	sbc	a, b
   058A E2 8F 05      [10]  446 	jp	PO, 00139$
   058D EE 80         [ 7]  447 	xor	a, #0x80
   058F                     448 00139$:
   058F F2 95 05      [10]  449 	jp	P, 00102$
   0592 01 00 00      [10]  450 	ld	bc, #0x0000
   0595                     451 00102$:
                            452 ;src/main.c:198: if (t%128==0) {
   0595 C5            [11]  453 	push	bc
   0596 21 80 00      [10]  454 	ld	hl, #0x0080
   0599 E5            [11]  455 	push	hl
   059A C5            [11]  456 	push	bc
   059B CD 98 25      [17]  457 	call	__modsint
   059E F1            [10]  458 	pop	af
   059F F1            [10]  459 	pop	af
   05A0 C1            [10]  460 	pop	bc
   05A1 7C            [ 4]  461 	ld	a, h
   05A2 B5            [ 4]  462 	or	a,l
   05A3 20 A3         [12]  463 	jr	NZ,00107$
                            464 ;src/main.c:199: cpct_scanKeyboard_f();
   05A5 C5            [11]  465 	push	bc
   05A6 CD F4 21      [17]  466 	call	_cpct_scanKeyboard_f
   05A9 C1            [10]  467 	pop	bc
   05AA 18 9C         [12]  468 	jr	00107$
   05AC                     469 00109$:
                            470 ;src/main.c:205: cpct_setVideoMemoryOffset(0);
   05AC 2E 00         [ 7]  471 	ld	l, #0x00
   05AE CD 6A 22      [17]  472 	call	_cpct_setVideoMemoryOffset
                            473 ;src/main.c:206: calque4000();
   05B1 CD B3 06      [17]  474 	call	_calque4000
                            475 ;src/main.c:208: while (1) {
   05B4                     476 00111$:
                            477 ;src/main.c:209: vsync();
   05B4 CD 28 06      [17]  478 	call	_vsync
   05B7 18 FB         [12]  479 	jr	00111$
   05B9                     480 ___str_0:
   05B9 57 45 20 57 49 53   481 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   05F5 57 45 20 57 49 53   482 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   0627 00                  483 	.db 0x00
                            484 	.area _CODE
                            485 	.area _INITIALIZER
   2657                     486 __xinit__intCounter:
   2657 00                  487 	.db #0x00	; 0
   2658                     488 __xinit__hScroll:
   2658 00                  489 	.db #0x00	; 0
   2659                     490 __xinit__slow:
   2659 00                  491 	.db #0x00	; 0
                            492 	.area _CABS (ABS)
