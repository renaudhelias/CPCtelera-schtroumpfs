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
                             17 	.globl _akp_sfxPlay
                             18 	.globl _akp_musicPlay
                             19 	.globl _akp_musicInit
                             20 	.globl _scroll
                             21 	.globl _cpct_restoreState_mxor_u8
                             22 	.globl _cpct_setSeed_mxor
                             23 	.globl _cpct_getScreenPtr
                             24 	.globl _cpct_setVideoMemoryOffset
                             25 	.globl _cpct_setPALColour
                             26 	.globl _cpct_setPalette
                             27 	.globl _cpct_setVideoMode
                             28 	.globl _cpct_hflipSpriteM0
                             29 	.globl _cpct_drawSolidBox
                             30 	.globl _cpct_drawSpriteMasked
                             31 	.globl _cpct_drawSprite
                             32 	.globl _cpct_px2byteM0
                             33 	.globl _cpct_isKeyPressed
                             34 	.globl _cpct_scanKeyboard_f
                             35 	.globl _cpct_memset_f64
                             36 	.globl _cpct_memset
                             37 	.globl _cpct_setInterruptHandler
                             38 	.globl _g_items_0
                             39 ;--------------------------------------------------------
                             40 ; special function registers
                             41 ;--------------------------------------------------------
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DATA
   2538                      46 _myInterruptHandler_i_1_81:
   2538                      47 	.ds 1
                             48 ;--------------------------------------------------------
                             49 ; ram data
                             50 ;--------------------------------------------------------
                             51 	.area _INITIALIZED
                             52 ;--------------------------------------------------------
                             53 ; absolute external ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DABS (ABS)
                             56 ;--------------------------------------------------------
                             57 ; global & static initialisations
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _GSINIT
                             61 	.area _GSFINAL
                             62 	.area _GSINIT
                             63 ;--------------------------------------------------------
                             64 ; Home
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _HOME
                             68 ;--------------------------------------------------------
                             69 ; code
                             70 ;--------------------------------------------------------
                             71 	.area _CODE
                             72 ;src/main.c:43: void myInterruptHandler() {
                             73 ;	---------------------------------
                             74 ; Function myInterruptHandler
                             75 ; ---------------------------------
   0336                      76 _myInterruptHandler::
                             77 ;src/main.c:47: cpct_setBorder(i+1);
   0336 21 38 25      [10]   78 	ld	hl,#_myInterruptHandler_i_1_81 + 0
   0339 46            [ 7]   79 	ld	b, (hl)
   033A 04            [ 4]   80 	inc	b
   033B C5            [11]   81 	push	bc
   033C 33            [ 6]   82 	inc	sp
   033D 3E 10         [ 7]   83 	ld	a, #0x10
   033F F5            [11]   84 	push	af
   0340 33            [ 6]   85 	inc	sp
   0341 CD 62 21      [17]   86 	call	_cpct_setPALColour
                             87 ;src/main.c:48: if (++i > 5) i=0;
   0344 FD 21 38 25   [14]   88 	ld	iy, #_myInterruptHandler_i_1_81
   0348 FD 34 00      [23]   89 	inc	0 (iy)
   034B 3E 05         [ 7]   90 	ld	a, #0x05
   034D FD 96 00      [19]   91 	sub	a, 0 (iy)
   0350 30 04         [12]   92 	jr	NC,00102$
   0352 FD 36 00 00   [19]   93 	ld	0 (iy), #0x00
   0356                      94 00102$:
                             95 ;src/main.c:51: if (i==2) {
   0356 3A 38 25      [13]   96 	ld	a,(#_myInterruptHandler_i_1_81 + 0)
   0359 D6 02         [ 7]   97 	sub	a, #0x02
   035B C0            [11]   98 	ret	NZ
                             99 ;src/main.c:52: akp_musicPlay();
   035C CD F6 02      [17]  100 	call	_akp_musicPlay
   035F C9            [10]  101 	ret
   0360                     102 _g_items_0:
   0360 05                  103 	.db #0x05	; 5
   0361 0F                  104 	.db #0x0f	; 15
   0362 0F                  105 	.db #0x0f	; 15
   0363 00                  106 	.db #0x00	; 0
   0364 0F                  107 	.db #0x0f	; 15
   0365 0F                  108 	.db #0x0f	; 15
   0366 0F                  109 	.db #0x0f	; 15
   0367 0A                  110 	.db #0x0a	; 10
   0368 0F                  111 	.db #0x0f	; 15
   0369 0A                  112 	.db #0x0a	; 10
   036A 05                  113 	.db #0x05	; 5
   036B 00                  114 	.db #0x00	; 0
   036C 0F                  115 	.db #0x0f	; 15
   036D 0A                  116 	.db #0x0a	; 10
   036E 05                  117 	.db #0x05	; 5
   036F 00                  118 	.db #0x00	; 0
   0370 05                  119 	.db #0x05	; 5
   0371 0F                  120 	.db #0x0f	; 15
   0372 0A                  121 	.db #0x0a	; 10
   0373 0A                  122 	.db #0x0a	; 10
   0374 00                  123 	.db #0x00	; 0
   0375 0F                  124 	.db #0x0f	; 15
   0376 0F                  125 	.db #0x0f	; 15
   0377 0A                  126 	.db #0x0a	; 10
   0378 00                  127 	.db #0x00	; 0
   0379 0A                  128 	.db #0x0a	; 10
   037A 0A                  129 	.db #0x0a	; 10
   037B 0A                  130 	.db #0x0a	; 10
   037C 00                  131 	.db #0x00	; 0
   037D 00                  132 	.db #0x00	; 0
   037E 00                  133 	.db #0x00	; 0
   037F 00                  134 	.db #0x00	; 0
                            135 ;src/main.c:57: void main(void) {
                            136 ;	---------------------------------
                            137 ; Function main
                            138 ; ---------------------------------
   0380                     139 _main::
                            140 ;src/main.c:60: u8* sprite=g_items_0;
                            141 ;src/main.c:71: akp_musicInit();
   0380 CD 4B 02      [17]  142 	call	_akp_musicInit
                            143 ;src/main.c:76: cpct_setInterruptHandler(myInterruptHandler);
   0383 21 36 03      [10]  144 	ld	hl, #_myInterruptHandler
   0386 CD 71 24      [17]  145 	call	_cpct_setInterruptHandler
                            146 ;src/main.c:80: bank4_4000();
   0389 CD D9 05      [17]  147 	call	_bank4_4000
                            148 ;src/main.c:81: bank0123();
   038C CD CD 05      [17]  149 	call	_bank0123
                            150 ;src/main.c:82: calqueC000();
   038F CD AC 05      [17]  151 	call	_calqueC000
                            152 ;src/main.c:85: cpct_setVideoMode(0);
   0392 2E 00         [ 7]  153 	ld	l, #0x00
   0394 CD 38 23      [17]  154 	call	_cpct_setVideoMode
                            155 ;src/main.c:88: cpct_setBorder(HW_BLACK);
   0397 21 10 14      [10]  156 	ld	hl, #0x1410
   039A E5            [11]  157 	push	hl
   039B CD 62 21      [17]  158 	call	_cpct_setPALColour
                            159 ;src/main.c:89: cpct_setPalette(g_tile_palette, 6);
   039E 21 06 00      [10]  160 	ld	hl, #0x0006
   03A1 E5            [11]  161 	push	hl
   03A2 21 43 06      [10]  162 	ld	hl, #_g_tile_palette
   03A5 E5            [11]  163 	push	hl
   03A6 CD D5 20      [17]  164 	call	_cpct_setPalette
                            165 ;src/main.c:90: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   03A9 21 00 40      [10]  166 	ld	hl, #0x4000
   03AC E5            [11]  167 	push	hl
   03AD AF            [ 4]  168 	xor	a, a
   03AE F5            [11]  169 	push	af
   03AF 33            [ 6]  170 	inc	sp
   03B0 26 C0         [ 7]  171 	ld	h, #0xc0
   03B2 E5            [11]  172 	push	hl
   03B3 CD 62 23      [17]  173 	call	_cpct_memset
                            174 ;src/main.c:96: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   03B6 21 0F 0F      [10]  175 	ld	hl, #0x0f0f
   03B9 E5            [11]  176 	push	hl
   03BA 21 00 C0      [10]  177 	ld	hl, #0xc000
   03BD E5            [11]  178 	push	hl
   03BE CD 51 24      [17]  179 	call	_cpct_getScreenPtr
                            180 ;src/main.c:97: cpct_drawSprite(sprite, p, 4, 8);
   03C1 E5            [11]  181 	push	hl
   03C2 01 04 08      [10]  182 	ld	bc, #0x0804
   03C5 C5            [11]  183 	push	bc
   03C6 E5            [11]  184 	push	hl
   03C7 01 60 03      [10]  185 	ld	bc, #_g_items_0
   03CA C5            [11]  186 	push	bc
   03CB CD 77 21      [17]  187 	call	_cpct_drawSprite
   03CE 01 00 20      [10]  188 	ld	bc, #0x2000
   03D1 C5            [11]  189 	push	bc
   03D2 01 FF FF      [10]  190 	ld	bc, #0xffff
   03D5 C5            [11]  191 	push	bc
   03D6 01 00 C0      [10]  192 	ld	bc, #0xc000
   03D9 C5            [11]  193 	push	bc
   03DA CD 88 22      [17]  194 	call	_cpct_memset_f64
   03DD 01 60 03      [10]  195 	ld	bc, #_g_items_0
   03E0 C5            [11]  196 	push	bc
   03E1 01 04 08      [10]  197 	ld	bc, #0x0804
   03E4 C5            [11]  198 	push	bc
   03E5 CD F4 22      [17]  199 	call	_cpct_hflipSpriteM0
   03E8 E1            [10]  200 	pop	hl
                            201 ;src/main.c:105: cpct_drawSprite(sprite, p, 4, 8);
   03E9 01 04 08      [10]  202 	ld	bc, #0x0804
   03EC C5            [11]  203 	push	bc
   03ED E5            [11]  204 	push	hl
   03EE 21 60 03      [10]  205 	ld	hl, #_g_items_0
   03F1 E5            [11]  206 	push	hl
   03F2 CD 77 21      [17]  207 	call	_cpct_drawSprite
                            208 ;src/main.c:107: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   03F5 21 0F 1F      [10]  209 	ld	hl, #0x1f0f
   03F8 E5            [11]  210 	push	hl
   03F9 21 00 C0      [10]  211 	ld	hl, #0xc000
   03FC E5            [11]  212 	push	hl
   03FD CD 51 24      [17]  213 	call	_cpct_getScreenPtr
                            214 ;src/main.c:109: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0400 E5            [11]  215 	push	hl
   0401 21 02 03      [10]  216 	ld	hl, #0x0302
   0404 E5            [11]  217 	push	hl
   0405 CD 46 23      [17]  218 	call	_cpct_px2byteM0
   0408 55            [ 4]  219 	ld	d, l
   0409 C1            [10]  220 	pop	bc
   040A 21 0A 14      [10]  221 	ld	hl, #0x140a
   040D E5            [11]  222 	push	hl
   040E D5            [11]  223 	push	de
   040F 33            [ 6]  224 	inc	sp
   0410 C5            [11]  225 	push	bc
   0411 CD 7F 23      [17]  226 	call	_cpct_drawSolidBox
   0414 F1            [10]  227 	pop	af
                            228 ;src/main.c:112: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   0415 33            [ 6]  229 	inc	sp
   0416 21 09 4F      [10]  230 	ld	hl,#0x4f09
   0419 E3            [19]  231 	ex	(sp),hl
   041A 21 00 C0      [10]  232 	ld	hl, #0xc000
   041D E5            [11]  233 	push	hl
   041E CD 51 24      [17]  234 	call	_cpct_getScreenPtr
                            235 ;src/main.c:113: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   0421 01 49 06      [10]  236 	ld	bc, #_g_tile_schtroumpf+0
   0424 11 10 20      [10]  237 	ld	de, #0x2010
   0427 D5            [11]  238 	push	de
   0428 E5            [11]  239 	push	hl
   0429 C5            [11]  240 	push	bc
   042A CD 59 22      [17]  241 	call	_cpct_drawSpriteMasked
                            242 ;src/main.c:127: cpct_srand(77);
   042D 21 4D 00      [10]  243 	ld	hl,#0x004d
   0430 11 00 00      [10]  244 	ld	de,#0x0000
   0433 CD 26 22      [17]  245 	call	_cpct_setSeed_mxor
   0436 CD 2E 22      [17]  246 	call	_cpct_restoreState_mxor_u8
                            247 ;src/main.c:131: cpct_scanKeyboard_f();
   0439 CD F8 20      [17]  248 	call	_cpct_scanKeyboard_f
                            249 ;src/main.c:132: t=0;
   043C 01 00 00      [10]  250 	ld	bc, #0x0000
                            251 ;src/main.c:133: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
   043F                     252 00107$:
   043F C5            [11]  253 	push	bc
   0440 21 80 00      [10]  254 	ld	hl, #0x0080
   0443 E5            [11]  255 	push	hl
   0444 C5            [11]  256 	push	bc
   0445 CD 44 24      [17]  257 	call	__modsint
   0448 F1            [10]  258 	pop	af
   0449 F1            [10]  259 	pop	af
   044A C1            [10]  260 	pop	bc
   044B 7C            [ 4]  261 	ld	a, h
   044C B5            [ 4]  262 	or	a,l
   044D 20 18         [12]  263 	jr	NZ,00108$
   044F C5            [11]  264 	push	bc
   0450 21 00 40      [10]  265 	ld	hl, #0x4000
   0453 CD EC 20      [17]  266 	call	_cpct_isKeyPressed
   0456 C1            [10]  267 	pop	bc
   0457 7D            [ 4]  268 	ld	a, l
   0458 B7            [ 4]  269 	or	a, a
   0459 20 48         [12]  270 	jr	NZ,00109$
   045B C5            [11]  271 	push	bc
   045C 21 02 04      [10]  272 	ld	hl, #0x0402
   045F CD EC 20      [17]  273 	call	_cpct_isKeyPressed
   0462 C1            [10]  274 	pop	bc
   0463 7D            [ 4]  275 	ld	a, l
   0464 B7            [ 4]  276 	or	a, a
   0465 20 3C         [12]  277 	jr	NZ,00109$
   0467                     278 00108$:
                            279 ;src/main.c:134: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
   0467 C5            [11]  280 	push	bc
   0468 C5            [11]  281 	push	bc
   0469 21 6E 00      [10]  282 	ld	hl, #0x006e
   046C E5            [11]  283 	push	hl
   046D 21 BD 04      [10]  284 	ld	hl, #___str_0
   0470 E5            [11]  285 	push	hl
   0471 CD 38 01      [17]  286 	call	_scroll
   0474 21 06 00      [10]  287 	ld	hl, #6
   0477 39            [11]  288 	add	hl, sp
   0478 F9            [ 6]  289 	ld	sp, hl
   0479 C1            [10]  290 	pop	bc
                            291 ;src/main.c:135: t=t+1;
   047A 03            [ 6]  292 	inc	bc
                            293 ;src/main.c:136: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   047B 3E EC         [ 7]  294 	ld	a, #0xec
   047D B9            [ 4]  295 	cp	a, c
   047E 3E 04         [ 7]  296 	ld	a, #0x04
   0480 98            [ 4]  297 	sbc	a, b
   0481 E2 86 04      [10]  298 	jp	PO, 00145$
   0484 EE 80         [ 7]  299 	xor	a, #0x80
   0486                     300 00145$:
   0486 F2 8C 04      [10]  301 	jp	P, 00102$
   0489 01 00 00      [10]  302 	ld	bc, #0x0000
   048C                     303 00102$:
                            304 ;src/main.c:137: if (t%128==0) {
   048C C5            [11]  305 	push	bc
   048D 21 80 00      [10]  306 	ld	hl, #0x0080
   0490 E5            [11]  307 	push	hl
   0491 C5            [11]  308 	push	bc
   0492 CD 44 24      [17]  309 	call	__modsint
   0495 F1            [10]  310 	pop	af
   0496 F1            [10]  311 	pop	af
   0497 C1            [10]  312 	pop	bc
   0498 7C            [ 4]  313 	ld	a, h
   0499 B5            [ 4]  314 	or	a,l
   049A 20 A3         [12]  315 	jr	NZ,00107$
                            316 ;src/main.c:138: cpct_scanKeyboard_f();
   049C C5            [11]  317 	push	bc
   049D CD F8 20      [17]  318 	call	_cpct_scanKeyboard_f
   04A0 C1            [10]  319 	pop	bc
   04A1 18 9C         [12]  320 	jr	00107$
   04A3                     321 00109$:
                            322 ;src/main.c:144: cpct_setVideoMemoryOffset(0);
   04A3 2E 00         [ 7]  323 	ld	l, #0x00
   04A5 CD 6E 21      [17]  324 	call	_cpct_setVideoMemoryOffset
                            325 ;src/main.c:145: calque4000();
   04A8 CD B7 05      [17]  326 	call	_calque4000
                            327 ;src/main.c:147: while (1) {
   04AB                     328 00113$:
                            329 ;src/main.c:148: cpct_scanKeyboard_f();
   04AB CD F8 20      [17]  330 	call	_cpct_scanKeyboard_f
                            331 ;src/main.c:149: if (cpct_isKeyPressed(Key_Space)) {
   04AE 21 05 80      [10]  332 	ld	hl, #0x8005
   04B1 CD EC 20      [17]  333 	call	_cpct_isKeyPressed
   04B4 7D            [ 4]  334 	ld	a, l
   04B5 B7            [ 4]  335 	or	a, a
   04B6 28 F3         [12]  336 	jr	Z,00113$
                            337 ;src/main.c:150: akp_sfxPlay();
   04B8 CD 16 03      [17]  338 	call	_akp_sfxPlay
   04BB 18 EE         [12]  339 	jr	00113$
   04BD                     340 ___str_0:
   04BD 57 45 20 57 49 53   341 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   04F9 57 45 20 57 49 53   342 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   052B 00                  343 	.db 0x00
                            344 	.area _CODE
                            345 	.area _INITIALIZER
                            346 	.area _CABS (ABS)
