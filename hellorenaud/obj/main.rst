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
                             38 	.globl _cpct_disableFirmware
                             39 	.globl _g_items_0
                             40 ;--------------------------------------------------------
                             41 ; special function registers
                             42 ;--------------------------------------------------------
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DATA
   2515                      47 _myInterruptHandler_i_1_81:
   2515                      48 	.ds 1
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
                             53 ;--------------------------------------------------------
                             54 ; absolute external ram data
                             55 ;--------------------------------------------------------
                             56 	.area _DABS (ABS)
                             57 ;--------------------------------------------------------
                             58 ; global & static initialisations
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _GSINIT
                             62 	.area _GSFINAL
                             63 	.area _GSINIT
                             64 ;--------------------------------------------------------
                             65 ; Home
                             66 ;--------------------------------------------------------
                             67 	.area _HOME
                             68 	.area _HOME
                             69 ;--------------------------------------------------------
                             70 ; code
                             71 ;--------------------------------------------------------
                             72 	.area _CODE
                             73 ;src/main.c:43: void myInterruptHandler() {
                             74 ;	---------------------------------
                             75 ; Function myInterruptHandler
                             76 ; ---------------------------------
   0336                      77 _myInterruptHandler::
                             78 ;src/main.c:47: cpct_setBorder(i+1);
   0336 21 15 25      [10]   79 	ld	hl,#_myInterruptHandler_i_1_81 + 0
   0339 46            [ 7]   80 	ld	b, (hl)
   033A 04            [ 4]   81 	inc	b
   033B C5            [11]   82 	push	bc
   033C 33            [ 6]   83 	inc	sp
   033D 3E 10         [ 7]   84 	ld	a, #0x10
   033F F5            [11]   85 	push	af
   0340 33            [ 6]   86 	inc	sp
   0341 CD 2F 21      [17]   87 	call	_cpct_setPALColour
                             88 ;src/main.c:48: if (++i > 5) i=0;
   0344 FD 21 15 25   [14]   89 	ld	iy, #_myInterruptHandler_i_1_81
   0348 FD 34 00      [23]   90 	inc	0 (iy)
   034B 3E 05         [ 7]   91 	ld	a, #0x05
   034D FD 96 00      [19]   92 	sub	a, 0 (iy)
   0350 30 04         [12]   93 	jr	NC,00102$
   0352 FD 36 00 00   [19]   94 	ld	0 (iy), #0x00
   0356                      95 00102$:
                             96 ;src/main.c:51: if (i==2) {
   0356 3A 15 25      [13]   97 	ld	a,(#_myInterruptHandler_i_1_81 + 0)
   0359 D6 02         [ 7]   98 	sub	a, #0x02
   035B C0            [11]   99 	ret	NZ
                            100 ;src/main.c:52: akp_musicPlay();
   035C CD F6 02      [17]  101 	call	_akp_musicPlay
   035F C9            [10]  102 	ret
   0360                     103 _g_items_0:
   0360 05                  104 	.db #0x05	; 5
   0361 0F                  105 	.db #0x0f	; 15
   0362 0F                  106 	.db #0x0f	; 15
   0363 00                  107 	.db #0x00	; 0
   0364 0F                  108 	.db #0x0f	; 15
   0365 0F                  109 	.db #0x0f	; 15
   0366 0F                  110 	.db #0x0f	; 15
   0367 0A                  111 	.db #0x0a	; 10
   0368 0F                  112 	.db #0x0f	; 15
   0369 0A                  113 	.db #0x0a	; 10
   036A 05                  114 	.db #0x05	; 5
   036B 00                  115 	.db #0x00	; 0
   036C 0F                  116 	.db #0x0f	; 15
   036D 0A                  117 	.db #0x0a	; 10
   036E 05                  118 	.db #0x05	; 5
   036F 00                  119 	.db #0x00	; 0
   0370 05                  120 	.db #0x05	; 5
   0371 0F                  121 	.db #0x0f	; 15
   0372 0A                  122 	.db #0x0a	; 10
   0373 0A                  123 	.db #0x0a	; 10
   0374 00                  124 	.db #0x00	; 0
   0375 0F                  125 	.db #0x0f	; 15
   0376 0F                  126 	.db #0x0f	; 15
   0377 0A                  127 	.db #0x0a	; 10
   0378 00                  128 	.db #0x00	; 0
   0379 0A                  129 	.db #0x0a	; 10
   037A 0A                  130 	.db #0x0a	; 10
   037B 0A                  131 	.db #0x0a	; 10
   037C 00                  132 	.db #0x00	; 0
   037D 00                  133 	.db #0x00	; 0
   037E 00                  134 	.db #0x00	; 0
   037F 00                  135 	.db #0x00	; 0
                            136 ;src/main.c:57: void main(void) {
                            137 ;	---------------------------------
                            138 ; Function main
                            139 ; ---------------------------------
   0380                     140 _main::
                            141 ;src/main.c:60: u8* sprite=g_items_0;
                            142 ;src/main.c:69: cpct_disableFirmware();
   0380 CD 4C 23      [17]  143 	call	_cpct_disableFirmware
                            144 ;src/main.c:73: bank4_4000();
   0383 CD A6 05      [17]  145 	call	_bank4_4000
                            146 ;src/main.c:74: bank0123();
   0386 CD 9A 05      [17]  147 	call	_bank0123
                            148 ;src/main.c:75: calqueC000();
   0389 CD 79 05      [17]  149 	call	_calqueC000
                            150 ;src/main.c:78: cpct_setVideoMode(0);
   038C 2E 00         [ 7]  151 	ld	l, #0x00
   038E CD 05 23      [17]  152 	call	_cpct_setVideoMode
                            153 ;src/main.c:81: cpct_setBorder(HW_BLACK);
   0391 21 10 14      [10]  154 	ld	hl, #0x1410
   0394 E5            [11]  155 	push	hl
   0395 CD 2F 21      [17]  156 	call	_cpct_setPALColour
                            157 ;src/main.c:82: cpct_setPalette(g_tile_palette, 6);
   0398 21 06 00      [10]  158 	ld	hl, #0x0006
   039B E5            [11]  159 	push	hl
   039C 21 10 06      [10]  160 	ld	hl, #_g_tile_palette
   039F E5            [11]  161 	push	hl
   03A0 CD A2 20      [17]  162 	call	_cpct_setPalette
                            163 ;src/main.c:83: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   03A3 21 00 40      [10]  164 	ld	hl, #0x4000
   03A6 E5            [11]  165 	push	hl
   03A7 AF            [ 4]  166 	xor	a, a
   03A8 F5            [11]  167 	push	af
   03A9 33            [ 6]  168 	inc	sp
   03AA 26 C0         [ 7]  169 	ld	h, #0xc0
   03AC E5            [11]  170 	push	hl
   03AD CD 2F 23      [17]  171 	call	_cpct_memset
                            172 ;src/main.c:89: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   03B0 21 0F 0F      [10]  173 	ld	hl, #0x0f0f
   03B3 E5            [11]  174 	push	hl
   03B4 21 00 C0      [10]  175 	ld	hl, #0xc000
   03B7 E5            [11]  176 	push	hl
   03B8 CD 2E 24      [17]  177 	call	_cpct_getScreenPtr
                            178 ;src/main.c:90: cpct_drawSprite(sprite, p, 4, 8);
   03BB E5            [11]  179 	push	hl
   03BC 01 04 08      [10]  180 	ld	bc, #0x0804
   03BF C5            [11]  181 	push	bc
   03C0 E5            [11]  182 	push	hl
   03C1 01 60 03      [10]  183 	ld	bc, #_g_items_0
   03C4 C5            [11]  184 	push	bc
   03C5 CD 44 21      [17]  185 	call	_cpct_drawSprite
   03C8 01 00 20      [10]  186 	ld	bc, #0x2000
   03CB C5            [11]  187 	push	bc
   03CC 01 FF FF      [10]  188 	ld	bc, #0xffff
   03CF C5            [11]  189 	push	bc
   03D0 01 00 C0      [10]  190 	ld	bc, #0xc000
   03D3 C5            [11]  191 	push	bc
   03D4 CD 55 22      [17]  192 	call	_cpct_memset_f64
   03D7 01 60 03      [10]  193 	ld	bc, #_g_items_0
   03DA C5            [11]  194 	push	bc
   03DB 01 04 08      [10]  195 	ld	bc, #0x0804
   03DE C5            [11]  196 	push	bc
   03DF CD C1 22      [17]  197 	call	_cpct_hflipSpriteM0
   03E2 E1            [10]  198 	pop	hl
                            199 ;src/main.c:98: cpct_drawSprite(sprite, p, 4, 8);
   03E3 01 04 08      [10]  200 	ld	bc, #0x0804
   03E6 C5            [11]  201 	push	bc
   03E7 E5            [11]  202 	push	hl
   03E8 21 60 03      [10]  203 	ld	hl, #_g_items_0
   03EB E5            [11]  204 	push	hl
   03EC CD 44 21      [17]  205 	call	_cpct_drawSprite
                            206 ;src/main.c:100: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   03EF 21 0F 1F      [10]  207 	ld	hl, #0x1f0f
   03F2 E5            [11]  208 	push	hl
   03F3 21 00 C0      [10]  209 	ld	hl, #0xc000
   03F6 E5            [11]  210 	push	hl
   03F7 CD 2E 24      [17]  211 	call	_cpct_getScreenPtr
                            212 ;src/main.c:102: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   03FA E5            [11]  213 	push	hl
   03FB 21 02 03      [10]  214 	ld	hl, #0x0302
   03FE E5            [11]  215 	push	hl
   03FF CD 13 23      [17]  216 	call	_cpct_px2byteM0
   0402 55            [ 4]  217 	ld	d, l
   0403 C1            [10]  218 	pop	bc
   0404 21 0A 14      [10]  219 	ld	hl, #0x140a
   0407 E5            [11]  220 	push	hl
   0408 D5            [11]  221 	push	de
   0409 33            [ 6]  222 	inc	sp
   040A C5            [11]  223 	push	bc
   040B CD 5C 23      [17]  224 	call	_cpct_drawSolidBox
   040E F1            [10]  225 	pop	af
                            226 ;src/main.c:105: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   040F 33            [ 6]  227 	inc	sp
   0410 21 09 4F      [10]  228 	ld	hl,#0x4f09
   0413 E3            [19]  229 	ex	(sp),hl
   0414 21 00 C0      [10]  230 	ld	hl, #0xc000
   0417 E5            [11]  231 	push	hl
   0418 CD 2E 24      [17]  232 	call	_cpct_getScreenPtr
                            233 ;src/main.c:106: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   041B 01 16 06      [10]  234 	ld	bc, #_g_tile_schtroumpf+0
   041E 11 10 20      [10]  235 	ld	de, #0x2010
   0421 D5            [11]  236 	push	de
   0422 E5            [11]  237 	push	hl
   0423 C5            [11]  238 	push	bc
   0424 CD 26 22      [17]  239 	call	_cpct_drawSpriteMasked
                            240 ;src/main.c:120: cpct_srand(77);
   0427 21 4D 00      [10]  241 	ld	hl,#0x004d
   042A 11 00 00      [10]  242 	ld	de,#0x0000
   042D CD F3 21      [17]  243 	call	_cpct_setSeed_mxor
   0430 CD FB 21      [17]  244 	call	_cpct_restoreState_mxor_u8
                            245 ;src/main.c:124: cpct_scanKeyboard_f();
   0433 CD C5 20      [17]  246 	call	_cpct_scanKeyboard_f
                            247 ;src/main.c:125: t=0;
   0436 01 00 00      [10]  248 	ld	bc, #0x0000
                            249 ;src/main.c:126: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   0439                     250 00104$:
   0439 C5            [11]  251 	push	bc
   043A 21 00 40      [10]  252 	ld	hl, #0x4000
   043D CD B9 20      [17]  253 	call	_cpct_isKeyPressed
   0440 C1            [10]  254 	pop	bc
   0441 7D            [ 4]  255 	ld	a, l
   0442 B7            [ 4]  256 	or	a, a
   0443 20 38         [12]  257 	jr	NZ,00106$
   0445 C5            [11]  258 	push	bc
   0446 21 02 04      [10]  259 	ld	hl, #0x0402
   0449 CD B9 20      [17]  260 	call	_cpct_isKeyPressed
   044C C1            [10]  261 	pop	bc
   044D 7D            [ 4]  262 	ld	a, l
   044E B7            [ 4]  263 	or	a, a
   044F 20 2C         [12]  264 	jr	NZ,00106$
                            265 ;src/main.c:127: scroll("WEWISHYOUAMERRYCHRISTMASWEWISHYOUAMERRYCHRISTMASWEWISHYOUAMERRYCHRISTMASANDAHAPPYNEWYEAR", 88, t);
   0451 C5            [11]  266 	push	bc
   0452 C5            [11]  267 	push	bc
   0453 21 58 00      [10]  268 	ld	hl, #0x0058
   0456 E5            [11]  269 	push	hl
   0457 21 A0 04      [10]  270 	ld	hl, #___str_0
   045A E5            [11]  271 	push	hl
   045B CD 38 01      [17]  272 	call	_scroll
   045E 21 06 00      [10]  273 	ld	hl, #6
   0461 39            [11]  274 	add	hl, sp
   0462 F9            [ 6]  275 	ld	sp, hl
   0463 C1            [10]  276 	pop	bc
                            277 ;src/main.c:128: t=t+1;
   0464 03            [ 6]  278 	inc	bc
                            279 ;src/main.c:129: if (t>88*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   0465 3E 10         [ 7]  280 	ld	a, #0x10
   0467 B9            [ 4]  281 	cp	a, c
   0468 3E 04         [ 7]  282 	ld	a, #0x04
   046A 98            [ 4]  283 	sbc	a, b
   046B E2 70 04      [10]  284 	jp	PO, 00138$
   046E EE 80         [ 7]  285 	xor	a, #0x80
   0470                     286 00138$:
   0470 F2 76 04      [10]  287 	jp	P, 00102$
   0473 01 00 00      [10]  288 	ld	bc, #0x0000
   0476                     289 00102$:
                            290 ;src/main.c:130: cpct_scanKeyboard_f();
   0476 C5            [11]  291 	push	bc
   0477 CD C5 20      [17]  292 	call	_cpct_scanKeyboard_f
   047A C1            [10]  293 	pop	bc
   047B 18 BC         [12]  294 	jr	00104$
   047D                     295 00106$:
                            296 ;src/main.c:134: akp_musicInit();
   047D CD 4B 02      [17]  297 	call	_akp_musicInit
                            298 ;src/main.c:138: cpct_setVideoMemoryOffset(0);
   0480 2E 00         [ 7]  299 	ld	l, #0x00
   0482 CD 3B 21      [17]  300 	call	_cpct_setVideoMemoryOffset
                            301 ;src/main.c:139: calque4000();
   0485 CD 84 05      [17]  302 	call	_calque4000
                            303 ;src/main.c:141: cpct_setInterruptHandler(myInterruptHandler);
   0488 21 36 03      [10]  304 	ld	hl, #_myInterruptHandler
   048B CD 4E 24      [17]  305 	call	_cpct_setInterruptHandler
                            306 ;src/main.c:142: while (1) {
   048E                     307 00110$:
                            308 ;src/main.c:143: cpct_scanKeyboard_f();
   048E CD C5 20      [17]  309 	call	_cpct_scanKeyboard_f
                            310 ;src/main.c:144: if (cpct_isKeyPressed(Key_Space)) {
   0491 21 05 80      [10]  311 	ld	hl, #0x8005
   0494 CD B9 20      [17]  312 	call	_cpct_isKeyPressed
   0497 7D            [ 4]  313 	ld	a, l
   0498 B7            [ 4]  314 	or	a, a
   0499 28 F3         [12]  315 	jr	Z,00110$
                            316 ;src/main.c:145: akp_sfxPlay();
   049B CD 16 03      [17]  317 	call	_akp_sfxPlay
   049E 18 EE         [12]  318 	jr	00110$
   04A0                     319 ___str_0:
   04A0 57 45 57 49 53 48   320 	.ascii "WEWISHYOUAMERRYCHRISTMASWEWISHYOUAMERRYCHRISTMASWEWISHYOUAME"
        59 4F 55 41 4D 45
        52 52 59 43 48 52
        49 53 54 4D 41 53
        57 45 57 49 53 48
        59 4F 55 41 4D 45
        52 52 59 43 48 52
        49 53 54 4D 41 53
        57 45 57 49 53 48
        59 4F 55 41 4D 45
   04DC 52 52 59 43 48 52   321 	.ascii "RRYCHRISTMASANDAHAPPYNEWYEAR"
        49 53 54 4D 41 53
        41 4E 44 41 48 41
        50 50 59 4E 45 57
        59 45 41 52
   04F8 00                  322 	.db 0x00
                            323 	.area _CODE
                            324 	.area _INITIALIZER
                            325 	.area _CABS (ABS)
