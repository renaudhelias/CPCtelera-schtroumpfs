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
                             14 	.globl _monter
                             15 	.globl _bank4_4000
                             16 	.globl _bank0123
                             17 	.globl _calque4000
                             18 	.globl _calqueC000
                             19 	.globl _vsync
                             20 	.globl _rupture
                             21 	.globl _restoreVBL
                             22 	.globl _killVBL
                             23 	.globl _scroll
                             24 	.globl _cpct_restoreState_mxor_u8
                             25 	.globl _cpct_setSeed_mxor
                             26 	.globl _cpct_getScreenPtr
                             27 	.globl _cpct_setVideoMemoryOffset
                             28 	.globl _cpct_setPALColour
                             29 	.globl _cpct_setPalette
                             30 	.globl _cpct_setVideoMode
                             31 	.globl _cpct_hflipSpriteM0
                             32 	.globl _cpct_drawSolidBox
                             33 	.globl _cpct_drawSpriteMasked
                             34 	.globl _cpct_drawSprite
                             35 	.globl _cpct_px2byteM0
                             36 	.globl _cpct_isKeyPressed
                             37 	.globl _cpct_scanKeyboard_f
                             38 	.globl _cpct_memset_f64
                             39 	.globl _cpct_memset
                             40 	.globl _cpct_setInterruptHandler
                             41 	.globl _slow
                             42 	.globl _hScroll
                             43 	.globl _intCounter
                             44 	.globl _g_items_0
                             45 ;--------------------------------------------------------
                             46 ; special function registers
                             47 ;--------------------------------------------------------
                             48 ;--------------------------------------------------------
                             49 ; ram data
                             50 ;--------------------------------------------------------
                             51 	.area _DATA
                             52 ;--------------------------------------------------------
                             53 ; ram data
                             54 ;--------------------------------------------------------
                             55 	.area _INITIALIZED
   269E                      56 _intCounter::
   269E                      57 	.ds 1
   269F                      58 _hScroll::
   269F                      59 	.ds 2
   26A1                      60 _slow::
   26A1                      61 	.ds 1
                             62 ;--------------------------------------------------------
                             63 ; absolute external ram data
                             64 ;--------------------------------------------------------
                             65 	.area _DABS (ABS)
                             66 ;--------------------------------------------------------
                             67 ; global & static initialisations
                             68 ;--------------------------------------------------------
                             69 	.area _HOME
                             70 	.area _GSINIT
                             71 	.area _GSFINAL
                             72 	.area _GSINIT
                             73 ;--------------------------------------------------------
                             74 ; Home
                             75 ;--------------------------------------------------------
                             76 	.area _HOME
                             77 	.area _HOME
                             78 ;--------------------------------------------------------
                             79 ; code
                             80 ;--------------------------------------------------------
                             81 	.area _CODE
                             82 ;src/main.c:49: void monter(unsigned int c,u16 hScroll) {
                             83 ;	---------------------------------
                             84 ; Function monter
                             85 ; ---------------------------------
   0373                      86 _monter::
   0373 DD E5         [15]   87 	push	ix
   0375 DD 21 00 00   [14]   88 	ld	ix,#0
   0379 DD 39         [15]   89 	add	ix,sp
   037B F5            [11]   90 	push	af
   037C F5            [11]   91 	push	af
                             92 ;src/main.c:52: for (l=0;l<8;l++) {
   037D DD 4E 04      [19]   93 	ld	c,4 (ix)
   0380 DD 46 05      [19]   94 	ld	b,5 (ix)
   0383 69            [ 4]   95 	ld	l, c
   0384 60            [ 4]   96 	ld	h, b
   0385 29            [11]   97 	add	hl, hl
   0386 29            [11]   98 	add	hl, hl
   0387 09            [11]   99 	add	hl, bc
   0388 29            [11]  100 	add	hl, hl
   0389 29            [11]  101 	add	hl, hl
   038A 29            [11]  102 	add	hl, hl
   038B 29            [11]  103 	add	hl, hl
   038C DD 75 FE      [19]  104 	ld	-2 (ix), l
   038F DD 74 FF      [19]  105 	ld	-1 (ix), h
   0392 DD 4E 06      [19]  106 	ld	c,6 (ix)
   0395 DD 46 07      [19]  107 	ld	b,7 (ix)
   0398 CB 38         [ 8]  108 	srl	b
   039A CB 19         [ 8]  109 	rr	c
   039C 21 50 00      [10]  110 	ld	hl, #0x0050
   039F E5            [11]  111 	push	hl
   03A0 C5            [11]  112 	push	bc
   03A1 CD EA 25      [17]  113 	call	__moduint
   03A4 F1            [10]  114 	pop	af
   03A5 F1            [10]  115 	pop	af
   03A6 DD 74 FD      [19]  116 	ld	-3 (ix), h
   03A9 DD 75 FC      [19]  117 	ld	-4 (ix), l
   03AC 01 00 00      [10]  118 	ld	bc, #0x0000
   03AF                     119 00102$:
                            120 ;src/main.c:54: plot_column=(u8 *)(0x4000 + l*0x800 + 80*c+(hScroll/2)%80);
   03AF 79            [ 4]  121 	ld	a, c
   03B0 07            [ 4]  122 	rlca
   03B1 07            [ 4]  123 	rlca
   03B2 07            [ 4]  124 	rlca
   03B3 E6 F8         [ 7]  125 	and	a, #0xf8
   03B5 57            [ 4]  126 	ld	d, a
   03B6 1E 00         [ 7]  127 	ld	e, #0x00
   03B8 21 00 40      [10]  128 	ld	hl, #0x4000
   03BB 19            [11]  129 	add	hl, de
   03BC DD 5E FE      [19]  130 	ld	e,-2 (ix)
   03BF DD 56 FF      [19]  131 	ld	d,-1 (ix)
   03C2 19            [11]  132 	add	hl, de
   03C3 D1            [10]  133 	pop	de
   03C4 D5            [11]  134 	push	de
   03C5 19            [11]  135 	add	hl, de
   03C6 EB            [ 4]  136 	ex	de,hl
                            137 ;src/main.c:56: *plot_column=*plot_column+0X33;
   03C7 1A            [ 7]  138 	ld	a, (de)
   03C8 C6 33         [ 7]  139 	add	a, #0x33
   03CA 12            [ 7]  140 	ld	(de), a
                            141 ;src/main.c:58: plot_column=plot_column-1;
   03CB 1B            [ 6]  142 	dec	de
                            143 ;src/main.c:59: *plot_column=*plot_column+0X33;
   03CC 1A            [ 7]  144 	ld	a, (de)
   03CD C6 33         [ 7]  145 	add	a, #0x33
   03CF 12            [ 7]  146 	ld	(de), a
                            147 ;src/main.c:52: for (l=0;l<8;l++) {
   03D0 03            [ 6]  148 	inc	bc
   03D1 79            [ 4]  149 	ld	a, c
   03D2 D6 08         [ 7]  150 	sub	a, #0x08
   03D4 78            [ 4]  151 	ld	a, b
   03D5 DE 00         [ 7]  152 	sbc	a, #0x00
   03D7 38 D6         [12]  153 	jr	C,00102$
   03D9 DD F9         [10]  154 	ld	sp, ix
   03DB DD E1         [14]  155 	pop	ix
   03DD C9            [10]  156 	ret
   03DE                     157 _g_items_0:
   03DE 05                  158 	.db #0x05	; 5
   03DF 0F                  159 	.db #0x0f	; 15
   03E0 0F                  160 	.db #0x0f	; 15
   03E1 00                  161 	.db #0x00	; 0
   03E2 0F                  162 	.db #0x0f	; 15
   03E3 0F                  163 	.db #0x0f	; 15
   03E4 0F                  164 	.db #0x0f	; 15
   03E5 0A                  165 	.db #0x0a	; 10
   03E6 0F                  166 	.db #0x0f	; 15
   03E7 0A                  167 	.db #0x0a	; 10
   03E8 05                  168 	.db #0x05	; 5
   03E9 00                  169 	.db #0x00	; 0
   03EA 0F                  170 	.db #0x0f	; 15
   03EB 0A                  171 	.db #0x0a	; 10
   03EC 05                  172 	.db #0x05	; 5
   03ED 00                  173 	.db #0x00	; 0
   03EE 05                  174 	.db #0x05	; 5
   03EF 0F                  175 	.db #0x0f	; 15
   03F0 0A                  176 	.db #0x0a	; 10
   03F1 0A                  177 	.db #0x0a	; 10
   03F2 00                  178 	.db #0x00	; 0
   03F3 0F                  179 	.db #0x0f	; 15
   03F4 0F                  180 	.db #0x0f	; 15
   03F5 0A                  181 	.db #0x0a	; 10
   03F6 00                  182 	.db #0x00	; 0
   03F7 0A                  183 	.db #0x0a	; 10
   03F8 0A                  184 	.db #0x0a	; 10
   03F9 0A                  185 	.db #0x0a	; 10
   03FA 00                  186 	.db #0x00	; 0
   03FB 00                  187 	.db #0x00	; 0
   03FC 00                  188 	.db #0x00	; 0
   03FD 00                  189 	.db #0x00	; 0
                            190 ;src/main.c:63: void monterDerniereColonne(u16 hScroll) {
                            191 ;	---------------------------------
                            192 ; Function monterDerniereColonne
                            193 ; ---------------------------------
   03FE                     194 _monterDerniereColonne::
                            195 ;src/main.c:64: if (hScroll/80==0) {
   03FE 21 50 00      [10]  196 	ld	hl, #0x0050
   0401 E5            [11]  197 	push	hl
   0402 21 04 00      [10]  198 	ld	hl, #4
   0405 39            [11]  199 	add	hl, sp
   0406 4E            [ 7]  200 	ld	c, (hl)
   0407 23            [ 6]  201 	inc	hl
   0408 46            [ 7]  202 	ld	b, (hl)
   0409 C5            [11]  203 	push	bc
   040A CD 21 22      [17]  204 	call	__divuint
   040D F1            [10]  205 	pop	af
   040E F1            [10]  206 	pop	af
   040F 7C            [ 4]  207 	ld	a, h
   0410 B5            [ 4]  208 	or	a,l
   0411 20 0F         [12]  209 	jr	NZ,00104$
                            210 ;src/main.c:65: monter(4,hScroll);
   0413 C1            [10]  211 	pop	bc
   0414 E1            [10]  212 	pop	hl
   0415 E5            [11]  213 	push	hl
   0416 C5            [11]  214 	push	bc
   0417 E5            [11]  215 	push	hl
   0418 21 04 00      [10]  216 	ld	hl, #0x0004
   041B E5            [11]  217 	push	hl
   041C CD 73 03      [17]  218 	call	_monter
   041F F1            [10]  219 	pop	af
   0420 F1            [10]  220 	pop	af
   0421 C9            [10]  221 	ret
   0422                     222 00104$:
                            223 ;src/main.c:66: } else if (hScroll/80==1) {
   0422 7D            [ 4]  224 	ld	a, l
   0423 3D            [ 4]  225 	dec	a
   0424 B4            [ 4]  226 	or	a, h
   0425 C0            [11]  227 	ret	NZ
                            228 ;src/main.c:67: monter(3,hScroll);
   0426 C1            [10]  229 	pop	bc
   0427 E1            [10]  230 	pop	hl
   0428 E5            [11]  231 	push	hl
   0429 C5            [11]  232 	push	bc
   042A E5            [11]  233 	push	hl
   042B 21 03 00      [10]  234 	ld	hl, #0x0003
   042E E5            [11]  235 	push	hl
   042F CD 73 03      [17]  236 	call	_monter
   0432 F1            [10]  237 	pop	af
   0433 F1            [10]  238 	pop	af
   0434 C9            [10]  239 	ret
                            240 ;src/main.c:75: void myInterruptHandler() {
                            241 ;	---------------------------------
                            242 ; Function myInterruptHandler
                            243 ; ---------------------------------
   0435                     244 _myInterruptHandler::
                            245 ;src/main.c:76: intCounter=intCounter+1;
   0435 FD 21 9E 26   [14]  246 	ld	iy, #_intCounter
   0439 FD 34 00      [23]  247 	inc	0 (iy)
                            248 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   043C FD 7E 00      [19]  249 	ld	a, 0 (iy)
   043F D6 06         [ 7]  250 	sub	a, #0x06
   0441 20 04         [12]  251 	jr	NZ,00102$
   0443 FD 36 00 00   [19]  252 	ld	0 (iy), #0x00
   0447                     253 00102$:
                            254 ;src/main.c:79: if (intCounter == 2) {
   0447 3A 9E 26      [13]  255 	ld	a,(#_intCounter + 0)
   044A D6 02         [ 7]  256 	sub	a, #0x02
   044C 20 09         [12]  257 	jr	NZ,00104$
                            258 ;src/main.c:80: cpct_setBorder(2);
   044E 21 10 02      [10]  259 	ld	hl, #0x0210
   0451 E5            [11]  260 	push	hl
   0452 CD EF 22      [17]  261 	call	_cpct_setPALColour
   0455 18 07         [12]  262 	jr	00105$
   0457                     263 00104$:
                            264 ;src/main.c:82: cpct_setBorder(3);
   0457 21 10 03      [10]  265 	ld	hl, #0x0310
   045A E5            [11]  266 	push	hl
   045B CD EF 22      [17]  267 	call	_cpct_setPALColour
   045E                     268 00105$:
                            269 ;src/main.c:91: if (intCounter==5) {
   045E 3A 9E 26      [13]  270 	ld	a,(#_intCounter + 0)
   0461 D6 05         [ 7]  271 	sub	a, #0x05
   0463 20 46         [12]  272 	jr	NZ,00109$
                            273 ;src/main.c:92: calque4000();
   0465 CD 03 07      [17]  274 	call	_calque4000
                            275 ;src/main.c:94: hScroll+=1;
   0468 FD 21 9F 26   [14]  276 	ld	iy, #_hScroll
   046C FD 34 00      [23]  277 	inc	0 (iy)
   046F 20 03         [12]  278 	jr	NZ,00146$
   0471 FD 34 01      [23]  279 	inc	1 (iy)
   0474                     280 00146$:
                            281 ;src/main.c:95: if (hScroll==160) {hScroll=0;}
   0474 FD 7E 00      [19]  282 	ld	a, 0 (iy)
   0477 D6 A0         [ 7]  283 	sub	a, #0xa0
   0479 FD B6 01      [19]  284 	or	a, 1 (iy)
   047C 20 06         [12]  285 	jr	NZ,00107$
   047E 21 00 00      [10]  286 	ld	hl, #0x0000
   0481 22 9F 26      [16]  287 	ld	(_hScroll), hl
   0484                     288 00107$:
                            289 ;src/main.c:96: monterDerniereColonne(hScroll);
   0484 2A 9F 26      [16]  290 	ld	hl, (_hScroll)
   0487 E5            [11]  291 	push	hl
   0488 CD FE 03      [17]  292 	call	_monterDerniereColonne
   048B F1            [10]  293 	pop	af
                            294 ;src/main.c:97: cpct_setVideoMemoryOffset((hScroll/2)%80);
   048C 2A 9F 26      [16]  295 	ld	hl, (_hScroll)
   048F CB 3C         [ 8]  296 	srl	h
   0491 CB 1D         [ 8]  297 	rr	l
   0493 01 50 00      [10]  298 	ld	bc, #0x0050
   0496 C5            [11]  299 	push	bc
   0497 E5            [11]  300 	push	hl
   0498 CD EA 25      [17]  301 	call	__moduint
   049B F1            [10]  302 	pop	af
   049C F1            [10]  303 	pop	af
   049D CD FB 22      [17]  304 	call	_cpct_setVideoMemoryOffset
                            305 ;src/main.c:98: killVBL();
   04A0 CD F6 01      [17]  306 	call	_killVBL
                            307 ;src/main.c:99: rupture(19-1);
   04A3 3E 12         [ 7]  308 	ld	a, #0x12
   04A5 F5            [11]  309 	push	af
   04A6 33            [ 6]  310 	inc	sp
   04A7 CD 13 02      [17]  311 	call	_rupture
   04AA 33            [ 6]  312 	inc	sp
   04AB                     313 00109$:
                            314 ;src/main.c:102: if (intCounter==2) {
   04AB 3A 9E 26      [13]  315 	ld	a,(#_intCounter + 0)
   04AE D6 02         [ 7]  316 	sub	a, #0x02
   04B0 20 10         [12]  317 	jr	NZ,00111$
                            318 ;src/main.c:103: calqueC000();
   04B2 CD F8 06      [17]  319 	call	_calqueC000
                            320 ;src/main.c:104: cpct_setVideoMemoryOffset(0);
   04B5 2E 00         [ 7]  321 	ld	l, #0x00
   04B7 CD FB 22      [17]  322 	call	_cpct_setVideoMemoryOffset
                            323 ;src/main.c:105: rupture(7);
   04BA 3E 07         [ 7]  324 	ld	a, #0x07
   04BC F5            [11]  325 	push	af
   04BD 33            [ 6]  326 	inc	sp
   04BE CD 13 02      [17]  327 	call	_rupture
   04C1 33            [ 6]  328 	inc	sp
   04C2                     329 00111$:
                            330 ;src/main.c:108: if (intCounter==3) {
   04C2 3A 9E 26      [13]  331 	ld	a,(#_intCounter + 0)
   04C5 D6 03         [ 7]  332 	sub	a, #0x03
   04C7 C0            [11]  333 	ret	NZ
                            334 ;src/main.c:109: calqueC000();
   04C8 CD F8 06      [17]  335 	call	_calqueC000
                            336 ;src/main.c:110: cpct_setVideoMemoryOffset(0);
   04CB 2E 00         [ 7]  337 	ld	l, #0x00
   04CD CD FB 22      [17]  338 	call	_cpct_setVideoMemoryOffset
                            339 ;src/main.c:111: restoreVBL();
   04D0 CD 07 02      [17]  340 	call	_restoreVBL
                            341 ;src/main.c:112: rupture(39-19-7+1);
   04D3 3E 0E         [ 7]  342 	ld	a, #0x0e
   04D5 F5            [11]  343 	push	af
   04D6 33            [ 6]  344 	inc	sp
   04D7 CD 13 02      [17]  345 	call	_rupture
   04DA 33            [ 6]  346 	inc	sp
   04DB C9            [10]  347 	ret
                            348 ;src/main.c:117: void main(void) {
                            349 ;	---------------------------------
                            350 ; Function main
                            351 ; ---------------------------------
   04DC                     352 _main::
                            353 ;src/main.c:120: u8* sprite=g_items_0;
                            354 ;src/main.c:136: cpct_setInterruptHandler(myInterruptHandler);
   04DC 21 35 04      [10]  355 	ld	hl, #_myInterruptHandler
   04DF CD 15 26      [17]  356 	call	_cpct_setInterruptHandler
                            357 ;src/main.c:140: bank4_4000();
   04E2 CD 25 07      [17]  358 	call	_bank4_4000
                            359 ;src/main.c:141: bank0123();
   04E5 CD 19 07      [17]  360 	call	_bank0123
                            361 ;src/main.c:142: calqueC000();
   04E8 CD F8 06      [17]  362 	call	_calqueC000
                            363 ;src/main.c:145: cpct_setVideoMode(0);
   04EB 2E 00         [ 7]  364 	ld	l, #0x00
   04ED CD C5 24      [17]  365 	call	_cpct_setVideoMode
                            366 ;src/main.c:148: cpct_setBorder(HW_BLACK);
   04F0 21 10 14      [10]  367 	ld	hl, #0x1410
   04F3 E5            [11]  368 	push	hl
   04F4 CD EF 22      [17]  369 	call	_cpct_setPALColour
                            370 ;src/main.c:149: cpct_setPalette(g_tile_palette, 6);
   04F7 21 06 00      [10]  371 	ld	hl, #0x0006
   04FA E5            [11]  372 	push	hl
   04FB 21 8F 07      [10]  373 	ld	hl, #_g_tile_palette
   04FE E5            [11]  374 	push	hl
   04FF CD 62 22      [17]  375 	call	_cpct_setPalette
                            376 ;src/main.c:150: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   0502 21 00 40      [10]  377 	ld	hl, #0x4000
   0505 E5            [11]  378 	push	hl
   0506 AF            [ 4]  379 	xor	a, a
   0507 F5            [11]  380 	push	af
   0508 33            [ 6]  381 	inc	sp
   0509 26 C0         [ 7]  382 	ld	h, #0xc0
   050B E5            [11]  383 	push	hl
   050C CD EF 24      [17]  384 	call	_cpct_memset
                            385 ;src/main.c:155: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   050F 21 0F 0F      [10]  386 	ld	hl, #0x0f0f
   0512 E5            [11]  387 	push	hl
   0513 21 00 C0      [10]  388 	ld	hl, #0xc000
   0516 E5            [11]  389 	push	hl
   0517 CD F5 25      [17]  390 	call	_cpct_getScreenPtr
                            391 ;src/main.c:156: cpct_drawSprite(sprite, p, 4, 8);
   051A E5            [11]  392 	push	hl
   051B 01 04 08      [10]  393 	ld	bc, #0x0804
   051E C5            [11]  394 	push	bc
   051F E5            [11]  395 	push	hl
   0520 01 DE 03      [10]  396 	ld	bc, #_g_items_0
   0523 C5            [11]  397 	push	bc
   0524 CD 04 23      [17]  398 	call	_cpct_drawSprite
   0527 01 00 20      [10]  399 	ld	bc, #0x2000
   052A C5            [11]  400 	push	bc
   052B 01 FF FF      [10]  401 	ld	bc, #0xffff
   052E C5            [11]  402 	push	bc
   052F 01 00 C0      [10]  403 	ld	bc, #0xc000
   0532 C5            [11]  404 	push	bc
   0533 CD 15 24      [17]  405 	call	_cpct_memset_f64
   0536 01 DE 03      [10]  406 	ld	bc, #_g_items_0
   0539 C5            [11]  407 	push	bc
   053A 01 04 08      [10]  408 	ld	bc, #0x0804
   053D C5            [11]  409 	push	bc
   053E CD 81 24      [17]  410 	call	_cpct_hflipSpriteM0
   0541 E1            [10]  411 	pop	hl
                            412 ;src/main.c:164: cpct_drawSprite(sprite, p, 4, 8);
   0542 01 04 08      [10]  413 	ld	bc, #0x0804
   0545 C5            [11]  414 	push	bc
   0546 E5            [11]  415 	push	hl
   0547 21 DE 03      [10]  416 	ld	hl, #_g_items_0
   054A E5            [11]  417 	push	hl
   054B CD 04 23      [17]  418 	call	_cpct_drawSprite
                            419 ;src/main.c:166: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   054E 21 0F 1F      [10]  420 	ld	hl, #0x1f0f
   0551 E5            [11]  421 	push	hl
   0552 21 00 C0      [10]  422 	ld	hl, #0xc000
   0555 E5            [11]  423 	push	hl
   0556 CD F5 25      [17]  424 	call	_cpct_getScreenPtr
                            425 ;src/main.c:168: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0559 E5            [11]  426 	push	hl
   055A 21 02 03      [10]  427 	ld	hl, #0x0302
   055D E5            [11]  428 	push	hl
   055E CD D3 24      [17]  429 	call	_cpct_px2byteM0
   0561 55            [ 4]  430 	ld	d, l
   0562 C1            [10]  431 	pop	bc
   0563 21 0A 14      [10]  432 	ld	hl, #0x140a
   0566 E5            [11]  433 	push	hl
   0567 D5            [11]  434 	push	de
   0568 33            [ 6]  435 	inc	sp
   0569 C5            [11]  436 	push	bc
   056A CD 0C 25      [17]  437 	call	_cpct_drawSolidBox
   056D F1            [10]  438 	pop	af
                            439 ;src/main.c:171: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   056E 33            [ 6]  440 	inc	sp
   056F 21 09 4F      [10]  441 	ld	hl,#0x4f09
   0572 E3            [19]  442 	ex	(sp),hl
   0573 21 00 C0      [10]  443 	ld	hl, #0xc000
   0576 E5            [11]  444 	push	hl
   0577 CD F5 25      [17]  445 	call	_cpct_getScreenPtr
                            446 ;src/main.c:172: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   057A 01 95 07      [10]  447 	ld	bc, #_g_tile_schtroumpf+0
   057D 11 10 20      [10]  448 	ld	de, #0x2010
   0580 D5            [11]  449 	push	de
   0581 E5            [11]  450 	push	hl
   0582 C5            [11]  451 	push	bc
   0583 CD E6 23      [17]  452 	call	_cpct_drawSpriteMasked
                            453 ;src/main.c:186: cpct_srand(77);
   0586 21 4D 00      [10]  454 	ld	hl,#0x004d
   0589 11 00 00      [10]  455 	ld	de,#0x0000
   058C CD B3 23      [17]  456 	call	_cpct_setSeed_mxor
   058F CD BB 23      [17]  457 	call	_cpct_restoreState_mxor_u8
                            458 ;src/main.c:190: cpct_scanKeyboard_f();
   0592 CD 85 22      [17]  459 	call	_cpct_scanKeyboard_f
                            460 ;src/main.c:191: t=0;
   0595 01 00 00      [10]  461 	ld	bc, #0x0000
                            462 ;src/main.c:192: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
   0598                     463 00107$:
   0598 C5            [11]  464 	push	bc
   0599 21 80 00      [10]  465 	ld	hl, #0x0080
   059C E5            [11]  466 	push	hl
   059D C5            [11]  467 	push	bc
   059E CD D1 25      [17]  468 	call	__modsint
   05A1 F1            [10]  469 	pop	af
   05A2 F1            [10]  470 	pop	af
   05A3 C1            [10]  471 	pop	bc
   05A4 7C            [ 4]  472 	ld	a, h
   05A5 B5            [ 4]  473 	or	a,l
   05A6 20 18         [12]  474 	jr	NZ,00108$
   05A8 C5            [11]  475 	push	bc
   05A9 21 00 40      [10]  476 	ld	hl, #0x4000
   05AC CD 79 22      [17]  477 	call	_cpct_isKeyPressed
   05AF C1            [10]  478 	pop	bc
   05B0 7D            [ 4]  479 	ld	a, l
   05B1 B7            [ 4]  480 	or	a, a
   05B2 20 48         [12]  481 	jr	NZ,00109$
   05B4 C5            [11]  482 	push	bc
   05B5 21 02 04      [10]  483 	ld	hl, #0x0402
   05B8 CD 79 22      [17]  484 	call	_cpct_isKeyPressed
   05BB C1            [10]  485 	pop	bc
   05BC 7D            [ 4]  486 	ld	a, l
   05BD B7            [ 4]  487 	or	a, a
   05BE 20 3C         [12]  488 	jr	NZ,00109$
   05C0                     489 00108$:
                            490 ;src/main.c:193: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
   05C0 C5            [11]  491 	push	bc
   05C1 C5            [11]  492 	push	bc
   05C2 21 6E 00      [10]  493 	ld	hl, #0x006e
   05C5 E5            [11]  494 	push	hl
   05C6 21 09 06      [10]  495 	ld	hl, #___str_0
   05C9 E5            [11]  496 	push	hl
   05CA CD 38 01      [17]  497 	call	_scroll
   05CD 21 06 00      [10]  498 	ld	hl, #6
   05D0 39            [11]  499 	add	hl, sp
   05D1 F9            [ 6]  500 	ld	sp, hl
   05D2 C1            [10]  501 	pop	bc
                            502 ;src/main.c:194: t=t+1;
   05D3 03            [ 6]  503 	inc	bc
                            504 ;src/main.c:195: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   05D4 3E EC         [ 7]  505 	ld	a, #0xec
   05D6 B9            [ 4]  506 	cp	a, c
   05D7 3E 04         [ 7]  507 	ld	a, #0x04
   05D9 98            [ 4]  508 	sbc	a, b
   05DA E2 DF 05      [10]  509 	jp	PO, 00139$
   05DD EE 80         [ 7]  510 	xor	a, #0x80
   05DF                     511 00139$:
   05DF F2 E5 05      [10]  512 	jp	P, 00102$
   05E2 01 00 00      [10]  513 	ld	bc, #0x0000
   05E5                     514 00102$:
                            515 ;src/main.c:196: if (t%128==0) {
   05E5 C5            [11]  516 	push	bc
   05E6 21 80 00      [10]  517 	ld	hl, #0x0080
   05E9 E5            [11]  518 	push	hl
   05EA C5            [11]  519 	push	bc
   05EB CD D1 25      [17]  520 	call	__modsint
   05EE F1            [10]  521 	pop	af
   05EF F1            [10]  522 	pop	af
   05F0 C1            [10]  523 	pop	bc
   05F1 7C            [ 4]  524 	ld	a, h
   05F2 B5            [ 4]  525 	or	a,l
   05F3 20 A3         [12]  526 	jr	NZ,00107$
                            527 ;src/main.c:197: cpct_scanKeyboard_f();
   05F5 C5            [11]  528 	push	bc
   05F6 CD 85 22      [17]  529 	call	_cpct_scanKeyboard_f
   05F9 C1            [10]  530 	pop	bc
   05FA 18 9C         [12]  531 	jr	00107$
   05FC                     532 00109$:
                            533 ;src/main.c:203: cpct_setVideoMemoryOffset(0);
   05FC 2E 00         [ 7]  534 	ld	l, #0x00
   05FE CD FB 22      [17]  535 	call	_cpct_setVideoMemoryOffset
                            536 ;src/main.c:204: calque4000();
   0601 CD 03 07      [17]  537 	call	_calque4000
                            538 ;src/main.c:206: while (1) {
   0604                     539 00111$:
                            540 ;src/main.c:207: vsync();
   0604 CD 78 06      [17]  541 	call	_vsync
   0607 18 FB         [12]  542 	jr	00111$
   0609                     543 ___str_0:
   0609 57 45 20 57 49 53   544 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0645 57 45 20 57 49 53   545 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   0677 00                  546 	.db 0x00
                            547 	.area _CODE
                            548 	.area _INITIALIZER
   26A8                     549 __xinit__intCounter:
   26A8 00                  550 	.db #0x00	; 0
   26A9                     551 __xinit__hScroll:
   26A9 00 00               552 	.dw #0x0000
   26AB                     553 __xinit__slow:
   26AB 00                  554 	.db #0x00	; 0
                            555 	.area _CABS (ABS)
