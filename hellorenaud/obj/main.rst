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
   2507                      47 _myInterruptHandler_i_1_81:
   2507                      48 	.ds 1
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
   034B                      77 _myInterruptHandler::
                             78 ;src/main.c:47: cpct_setBorder(i+1);
   034B 21 07 25      [10]   79 	ld	hl,#_myInterruptHandler_i_1_81 + 0
   034E 46            [ 7]   80 	ld	b, (hl)
   034F 04            [ 4]   81 	inc	b
   0350 C5            [11]   82 	push	bc
   0351 33            [ 6]   83 	inc	sp
   0352 3E 10         [ 7]   84 	ld	a, #0x10
   0354 F5            [11]   85 	push	af
   0355 33            [ 6]   86 	inc	sp
   0356 CD 0A 21      [17]   87 	call	_cpct_setPALColour
                             88 ;src/main.c:48: if (++i > 5) i=0;
   0359 FD 21 07 25   [14]   89 	ld	iy, #_myInterruptHandler_i_1_81
   035D FD 34 00      [23]   90 	inc	0 (iy)
   0360 3E 05         [ 7]   91 	ld	a, #0x05
   0362 FD 96 00      [19]   92 	sub	a, 0 (iy)
   0365 30 04         [12]   93 	jr	NC,00102$
   0367 FD 36 00 00   [19]   94 	ld	0 (iy), #0x00
   036B                      95 00102$:
                             96 ;src/main.c:51: if (i==2) {
   036B 3A 07 25      [13]   97 	ld	a,(#_myInterruptHandler_i_1_81 + 0)
   036E D6 02         [ 7]   98 	sub	a, #0x02
   0370 C0            [11]   99 	ret	NZ
                            100 ;src/main.c:52: akp_musicPlay();
   0371 CD 0B 03      [17]  101 	call	_akp_musicPlay
   0374 C9            [10]  102 	ret
   0375                     103 _g_items_0:
   0375 05                  104 	.db #0x05	; 5
   0376 0F                  105 	.db #0x0f	; 15
   0377 0F                  106 	.db #0x0f	; 15
   0378 00                  107 	.db #0x00	; 0
   0379 0F                  108 	.db #0x0f	; 15
   037A 0F                  109 	.db #0x0f	; 15
   037B 0F                  110 	.db #0x0f	; 15
   037C 0A                  111 	.db #0x0a	; 10
   037D 0F                  112 	.db #0x0f	; 15
   037E 0A                  113 	.db #0x0a	; 10
   037F 05                  114 	.db #0x05	; 5
   0380 00                  115 	.db #0x00	; 0
   0381 0F                  116 	.db #0x0f	; 15
   0382 0A                  117 	.db #0x0a	; 10
   0383 05                  118 	.db #0x05	; 5
   0384 00                  119 	.db #0x00	; 0
   0385 05                  120 	.db #0x05	; 5
   0386 0F                  121 	.db #0x0f	; 15
   0387 0A                  122 	.db #0x0a	; 10
   0388 0A                  123 	.db #0x0a	; 10
   0389 00                  124 	.db #0x00	; 0
   038A 0F                  125 	.db #0x0f	; 15
   038B 0F                  126 	.db #0x0f	; 15
   038C 0A                  127 	.db #0x0a	; 10
   038D 00                  128 	.db #0x00	; 0
   038E 0A                  129 	.db #0x0a	; 10
   038F 0A                  130 	.db #0x0a	; 10
   0390 0A                  131 	.db #0x0a	; 10
   0391 00                  132 	.db #0x00	; 0
   0392 00                  133 	.db #0x00	; 0
   0393 00                  134 	.db #0x00	; 0
   0394 00                  135 	.db #0x00	; 0
                            136 ;src/main.c:57: void main(void) {
                            137 ;	---------------------------------
                            138 ; Function main
                            139 ; ---------------------------------
   0395                     140 _main::
                            141 ;src/main.c:60: u8* sprite=g_items_0;
                            142 ;src/main.c:69: cpct_disableFirmware();
   0395 CD 7F 23      [17]  143 	call	_cpct_disableFirmware
                            144 ;src/main.c:73: bank4_4000();
   0398 CD 81 05      [17]  145 	call	_bank4_4000
                            146 ;src/main.c:74: bank0123();
   039B CD 75 05      [17]  147 	call	_bank0123
                            148 ;src/main.c:75: calqueC000();
   039E CD 54 05      [17]  149 	call	_calqueC000
                            150 ;src/main.c:78: cpct_setVideoMode(0);
   03A1 2E 00         [ 7]  151 	ld	l, #0x00
   03A3 CD 38 23      [17]  152 	call	_cpct_setVideoMode
                            153 ;src/main.c:81: cpct_setBorder(HW_BLACK);
   03A6 21 10 14      [10]  154 	ld	hl, #0x1410
   03A9 E5            [11]  155 	push	hl
   03AA CD 0A 21      [17]  156 	call	_cpct_setPALColour
                            157 ;src/main.c:82: cpct_setPalette(g_tile_palette, 6);
   03AD 21 06 00      [10]  158 	ld	hl, #0x0006
   03B0 E5            [11]  159 	push	hl
   03B1 21 EB 05      [10]  160 	ld	hl, #_g_tile_palette
   03B4 E5            [11]  161 	push	hl
   03B5 CD 7D 20      [17]  162 	call	_cpct_setPalette
                            163 ;src/main.c:83: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   03B8 21 00 40      [10]  164 	ld	hl, #0x4000
   03BB E5            [11]  165 	push	hl
   03BC AF            [ 4]  166 	xor	a, a
   03BD F5            [11]  167 	push	af
   03BE 33            [ 6]  168 	inc	sp
   03BF 26 C0         [ 7]  169 	ld	h, #0xc0
   03C1 E5            [11]  170 	push	hl
   03C2 CD 62 23      [17]  171 	call	_cpct_memset
                            172 ;src/main.c:86: cpct_setVideoMemoryOffset(3);
   03C5 2E 03         [ 7]  173 	ld	l, #0x03
   03C7 CD 16 21      [17]  174 	call	_cpct_setVideoMemoryOffset
                            175 ;src/main.c:89: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   03CA 21 0F 0F      [10]  176 	ld	hl, #0x0f0f
   03CD E5            [11]  177 	push	hl
   03CE 21 00 C0      [10]  178 	ld	hl, #0xc000
   03D1 E5            [11]  179 	push	hl
   03D2 CD 61 24      [17]  180 	call	_cpct_getScreenPtr
                            181 ;src/main.c:90: cpct_drawSprite(sprite, p, 4, 8);
   03D5 E5            [11]  182 	push	hl
   03D6 01 04 08      [10]  183 	ld	bc, #0x0804
   03D9 C5            [11]  184 	push	bc
   03DA E5            [11]  185 	push	hl
   03DB 01 75 03      [10]  186 	ld	bc, #_g_items_0
   03DE C5            [11]  187 	push	bc
   03DF CD 1F 21      [17]  188 	call	_cpct_drawSprite
   03E2 01 00 20      [10]  189 	ld	bc, #0x2000
   03E5 C5            [11]  190 	push	bc
   03E6 01 FF FF      [10]  191 	ld	bc, #0xffff
   03E9 C5            [11]  192 	push	bc
   03EA 01 00 C0      [10]  193 	ld	bc, #0xc000
   03ED C5            [11]  194 	push	bc
   03EE CD 88 22      [17]  195 	call	_cpct_memset_f64
   03F1 01 75 03      [10]  196 	ld	bc, #_g_items_0
   03F4 C5            [11]  197 	push	bc
   03F5 01 04 08      [10]  198 	ld	bc, #0x0804
   03F8 C5            [11]  199 	push	bc
   03F9 CD F4 22      [17]  200 	call	_cpct_hflipSpriteM0
   03FC E1            [10]  201 	pop	hl
                            202 ;src/main.c:98: cpct_drawSprite(sprite, p, 4, 8);
   03FD 01 04 08      [10]  203 	ld	bc, #0x0804
   0400 C5            [11]  204 	push	bc
   0401 E5            [11]  205 	push	hl
   0402 21 75 03      [10]  206 	ld	hl, #_g_items_0
   0405 E5            [11]  207 	push	hl
   0406 CD 1F 21      [17]  208 	call	_cpct_drawSprite
                            209 ;src/main.c:100: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   0409 21 0F 1F      [10]  210 	ld	hl, #0x1f0f
   040C E5            [11]  211 	push	hl
   040D 21 00 C0      [10]  212 	ld	hl, #0xc000
   0410 E5            [11]  213 	push	hl
   0411 CD 61 24      [17]  214 	call	_cpct_getScreenPtr
                            215 ;src/main.c:102: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0414 E5            [11]  216 	push	hl
   0415 21 02 03      [10]  217 	ld	hl, #0x0302
   0418 E5            [11]  218 	push	hl
   0419 CD 46 23      [17]  219 	call	_cpct_px2byteM0
   041C 55            [ 4]  220 	ld	d, l
   041D C1            [10]  221 	pop	bc
   041E 21 0A 14      [10]  222 	ld	hl, #0x140a
   0421 E5            [11]  223 	push	hl
   0422 D5            [11]  224 	push	de
   0423 33            [ 6]  225 	inc	sp
   0424 C5            [11]  226 	push	bc
   0425 CD 8F 23      [17]  227 	call	_cpct_drawSolidBox
   0428 F1            [10]  228 	pop	af
                            229 ;src/main.c:105: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   0429 33            [ 6]  230 	inc	sp
   042A 21 09 4F      [10]  231 	ld	hl,#0x4f09
   042D E3            [19]  232 	ex	(sp),hl
   042E 21 00 C0      [10]  233 	ld	hl, #0xc000
   0431 E5            [11]  234 	push	hl
   0432 CD 61 24      [17]  235 	call	_cpct_getScreenPtr
                            236 ;src/main.c:106: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   0435 01 F1 05      [10]  237 	ld	bc, #_g_tile_schtroumpf+0
   0438 11 10 20      [10]  238 	ld	de, #0x2010
   043B D5            [11]  239 	push	de
   043C E5            [11]  240 	push	hl
   043D C5            [11]  241 	push	bc
   043E CD 59 22      [17]  242 	call	_cpct_drawSpriteMasked
                            243 ;src/main.c:108: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,120-1);
   0441 21 09 77      [10]  244 	ld	hl, #0x7709
   0444 E5            [11]  245 	push	hl
   0445 21 00 C0      [10]  246 	ld	hl, #0xc000
   0448 E5            [11]  247 	push	hl
   0449 CD 61 24      [17]  248 	call	_cpct_getScreenPtr
                            249 ;src/main.c:109: cpct_drawSprite(g_tile_fontmap20x22_00, p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   044C 01 25 0A      [10]  250 	ld	bc, #_g_tile_fontmap20x22_00+0
   044F 11 0A 16      [10]  251 	ld	de, #0x160a
   0452 D5            [11]  252 	push	de
   0453 E5            [11]  253 	push	hl
   0454 C5            [11]  254 	push	bc
   0455 CD 1F 21      [17]  255 	call	_cpct_drawSprite
                            256 ;src/main.c:120: cpct_srand(77);
   0458 21 4D 00      [10]  257 	ld	hl,#0x004d
   045B 11 00 00      [10]  258 	ld	de,#0x0000
   045E CD 26 22      [17]  259 	call	_cpct_setSeed_mxor
   0461 CD 2E 22      [17]  260 	call	_cpct_restoreState_mxor_u8
                            261 ;src/main.c:124: cpct_scanKeyboard_f();
   0464 CD A0 20      [17]  262 	call	_cpct_scanKeyboard_f
                            263 ;src/main.c:125: t=0;
   0467 01 00 00      [10]  264 	ld	bc, #0x0000
                            265 ;src/main.c:126: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   046A                     266 00104$:
   046A C5            [11]  267 	push	bc
   046B 21 00 40      [10]  268 	ld	hl, #0x4000
   046E CD 94 20      [17]  269 	call	_cpct_isKeyPressed
   0471 C1            [10]  270 	pop	bc
   0472 7D            [ 4]  271 	ld	a, l
   0473 B7            [ 4]  272 	or	a, a
   0474 20 32         [12]  273 	jr	NZ,00106$
   0476 C5            [11]  274 	push	bc
   0477 21 02 04      [10]  275 	ld	hl, #0x0402
   047A CD 94 20      [17]  276 	call	_cpct_isKeyPressed
   047D C1            [10]  277 	pop	bc
   047E 7D            [ 4]  278 	ld	a, l
   047F B7            [ 4]  279 	or	a, a
   0480 20 26         [12]  280 	jr	NZ,00106$
                            281 ;src/main.c:127: scroll(" ABRUTI ", 8, t);
   0482 C5            [11]  282 	push	bc
   0483 C5            [11]  283 	push	bc
   0484 21 08 00      [10]  284 	ld	hl, #0x0008
   0487 E5            [11]  285 	push	hl
   0488 21 CB 04      [10]  286 	ld	hl, #___str_0
   048B E5            [11]  287 	push	hl
   048C CD 38 01      [17]  288 	call	_scroll
   048F 21 06 00      [10]  289 	ld	hl, #6
   0492 39            [11]  290 	add	hl, sp
   0493 F9            [ 6]  291 	ld	sp, hl
   0494 C1            [10]  292 	pop	bc
                            293 ;src/main.c:128: t=t+1;
   0495 03            [ 6]  294 	inc	bc
                            295 ;src/main.c:129: if (t>160) {t=0;}
   0496 3E A0         [ 7]  296 	ld	a, #0xa0
   0498 B9            [ 4]  297 	cp	a, c
   0499 3E 00         [ 7]  298 	ld	a, #0x00
   049B 98            [ 4]  299 	sbc	a, b
   049C 30 03         [12]  300 	jr	NC,00102$
   049E 01 00 00      [10]  301 	ld	bc, #0x0000
   04A1                     302 00102$:
                            303 ;src/main.c:130: cpct_scanKeyboard_f();
   04A1 C5            [11]  304 	push	bc
   04A2 CD A0 20      [17]  305 	call	_cpct_scanKeyboard_f
   04A5 C1            [10]  306 	pop	bc
   04A6 18 C2         [12]  307 	jr	00104$
   04A8                     308 00106$:
                            309 ;src/main.c:134: akp_musicInit();
   04A8 CD 60 02      [17]  310 	call	_akp_musicInit
                            311 ;src/main.c:138: cpct_setVideoMemoryOffset(0);
   04AB 2E 00         [ 7]  312 	ld	l, #0x00
   04AD CD 16 21      [17]  313 	call	_cpct_setVideoMemoryOffset
                            314 ;src/main.c:139: calque4000();
   04B0 CD 5F 05      [17]  315 	call	_calque4000
                            316 ;src/main.c:141: cpct_setInterruptHandler(myInterruptHandler);
   04B3 21 4B 03      [10]  317 	ld	hl, #_myInterruptHandler
   04B6 CD 81 24      [17]  318 	call	_cpct_setInterruptHandler
                            319 ;src/main.c:142: while (1) {
   04B9                     320 00110$:
                            321 ;src/main.c:143: cpct_scanKeyboard_f();
   04B9 CD A0 20      [17]  322 	call	_cpct_scanKeyboard_f
                            323 ;src/main.c:144: if (cpct_isKeyPressed(Key_Space)) {
   04BC 21 05 80      [10]  324 	ld	hl, #0x8005
   04BF CD 94 20      [17]  325 	call	_cpct_isKeyPressed
   04C2 7D            [ 4]  326 	ld	a, l
   04C3 B7            [ 4]  327 	or	a, a
   04C4 28 F3         [12]  328 	jr	Z,00110$
                            329 ;src/main.c:145: akp_sfxPlay();
   04C6 CD 2B 03      [17]  330 	call	_akp_sfxPlay
   04C9 18 EE         [12]  331 	jr	00110$
   04CB                     332 ___str_0:
   04CB 20 41 42 52 55 54   333 	.ascii " ABRUTI "
        49 20
   04D3 00                  334 	.db 0x00
                            335 	.area _CODE
                            336 	.area _INITIALIZER
                            337 	.area _CABS (ABS)
