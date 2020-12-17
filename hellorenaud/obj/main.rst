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
                             18 	.globl _akp_musicPlay
                             19 	.globl _akp_musicInit
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
                             41 	.globl _intCounter
                             42 	.globl _g_items_0
                             43 ;--------------------------------------------------------
                             44 ; special function registers
                             45 ;--------------------------------------------------------
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DATA
                             50 ;--------------------------------------------------------
                             51 ; ram data
                             52 ;--------------------------------------------------------
                             53 	.area _INITIALIZED
   25A3                      54 _intCounter::
   25A3                      55 	.ds 1
                             56 ;--------------------------------------------------------
                             57 ; absolute external ram data
                             58 ;--------------------------------------------------------
                             59 	.area _DABS (ABS)
                             60 ;--------------------------------------------------------
                             61 ; global & static initialisations
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _GSINIT
                             65 	.area _GSFINAL
                             66 	.area _GSINIT
                             67 ;--------------------------------------------------------
                             68 ; Home
                             69 ;--------------------------------------------------------
                             70 	.area _HOME
                             71 	.area _HOME
                             72 ;--------------------------------------------------------
                             73 ; code
                             74 ;--------------------------------------------------------
                             75 	.area _CODE
                             76 ;src/main.c:45: void myInterruptHandler() {
                             77 ;	---------------------------------
                             78 ; Function myInterruptHandler
                             79 ; ---------------------------------
   0373                      80 _myInterruptHandler::
                             81 ;src/main.c:46: intCounter=intCounter+1;
   0373 FD 21 A3 25   [14]   82 	ld	iy, #_intCounter
   0377 FD 34 00      [23]   83 	inc	0 (iy)
                             84 ;src/main.c:47: if (intCounter == 6) intCounter=0;
   037A FD 7E 00      [19]   85 	ld	a, 0 (iy)
   037D D6 06         [ 7]   86 	sub	a, #0x06
   037F 20 04         [12]   87 	jr	NZ,00102$
   0381 FD 36 00 00   [19]   88 	ld	0 (iy), #0x00
   0385                      89 00102$:
                             90 ;src/main.c:49: if (intCounter == 2) {
   0385 3A A3 25      [13]   91 	ld	a,(#_intCounter + 0)
   0388 D6 02         [ 7]   92 	sub	a, #0x02
   038A 20 09         [12]   93 	jr	NZ,00104$
                             94 ;src/main.c:50: cpct_setBorder(2);
   038C 21 10 02      [10]   95 	ld	hl, #0x0210
   038F E5            [11]   96 	push	hl
   0390 CD CA 21      [17]   97 	call	_cpct_setPALColour
   0393 18 07         [12]   98 	jr	00105$
   0395                      99 00104$:
                            100 ;src/main.c:52: cpct_setBorder(3);
   0395 21 10 03      [10]  101 	ld	hl, #0x0310
   0398 E5            [11]  102 	push	hl
   0399 CD CA 21      [17]  103 	call	_cpct_setPALColour
   039C                     104 00105$:
                            105 ;src/main.c:56: if (intCounter==2) {
   039C 3A A3 25      [13]  106 	ld	a,(#_intCounter + 0)
   039F D6 02         [ 7]  107 	sub	a, #0x02
   03A1 20 03         [12]  108 	jr	NZ,00107$
                            109 ;src/main.c:57: akp_musicPlay();
   03A3 CD 33 03      [17]  110 	call	_akp_musicPlay
   03A6                     111 00107$:
                            112 ;src/main.c:61: if (intCounter==5) {
   03A6 3A A3 25      [13]  113 	ld	a,(#_intCounter + 0)
   03A9 D6 05         [ 7]  114 	sub	a, #0x05
   03AB 20 0E         [12]  115 	jr	NZ,00109$
                            116 ;src/main.c:62: calqueC000();
   03AD CD 14 06      [17]  117 	call	_calqueC000
                            118 ;src/main.c:63: killVBL();
   03B0 CD F6 01      [17]  119 	call	_killVBL
                            120 ;src/main.c:64: rupture(19-1);
   03B3 3E 12         [ 7]  121 	ld	a, #0x12
   03B5 F5            [11]  122 	push	af
   03B6 33            [ 6]  123 	inc	sp
   03B7 CD 13 02      [17]  124 	call	_rupture
   03BA 33            [ 6]  125 	inc	sp
   03BB                     126 00109$:
                            127 ;src/main.c:67: if (intCounter==2) {
   03BB 3A A3 25      [13]  128 	ld	a,(#_intCounter + 0)
   03BE D6 02         [ 7]  129 	sub	a, #0x02
   03C0 C0            [11]  130 	ret	NZ
                            131 ;src/main.c:68: calque4000();
   03C1 CD 1F 06      [17]  132 	call	_calque4000
                            133 ;src/main.c:69: restoreVBL();
   03C4 CD 07 02      [17]  134 	call	_restoreVBL
                            135 ;src/main.c:70: rupture(39-19+1);
   03C7 3E 15         [ 7]  136 	ld	a, #0x15
   03C9 F5            [11]  137 	push	af
   03CA 33            [ 6]  138 	inc	sp
   03CB CD 13 02      [17]  139 	call	_rupture
   03CE 33            [ 6]  140 	inc	sp
   03CF C9            [10]  141 	ret
   03D0                     142 _g_items_0:
   03D0 05                  143 	.db #0x05	; 5
   03D1 0F                  144 	.db #0x0f	; 15
   03D2 0F                  145 	.db #0x0f	; 15
   03D3 00                  146 	.db #0x00	; 0
   03D4 0F                  147 	.db #0x0f	; 15
   03D5 0F                  148 	.db #0x0f	; 15
   03D6 0F                  149 	.db #0x0f	; 15
   03D7 0A                  150 	.db #0x0a	; 10
   03D8 0F                  151 	.db #0x0f	; 15
   03D9 0A                  152 	.db #0x0a	; 10
   03DA 05                  153 	.db #0x05	; 5
   03DB 00                  154 	.db #0x00	; 0
   03DC 0F                  155 	.db #0x0f	; 15
   03DD 0A                  156 	.db #0x0a	; 10
   03DE 05                  157 	.db #0x05	; 5
   03DF 00                  158 	.db #0x00	; 0
   03E0 05                  159 	.db #0x05	; 5
   03E1 0F                  160 	.db #0x0f	; 15
   03E2 0A                  161 	.db #0x0a	; 10
   03E3 0A                  162 	.db #0x0a	; 10
   03E4 00                  163 	.db #0x00	; 0
   03E5 0F                  164 	.db #0x0f	; 15
   03E6 0F                  165 	.db #0x0f	; 15
   03E7 0A                  166 	.db #0x0a	; 10
   03E8 00                  167 	.db #0x00	; 0
   03E9 0A                  168 	.db #0x0a	; 10
   03EA 0A                  169 	.db #0x0a	; 10
   03EB 0A                  170 	.db #0x0a	; 10
   03EC 00                  171 	.db #0x00	; 0
   03ED 00                  172 	.db #0x00	; 0
   03EE 00                  173 	.db #0x00	; 0
   03EF 00                  174 	.db #0x00	; 0
                            175 ;src/main.c:75: void main(void) {
                            176 ;	---------------------------------
                            177 ; Function main
                            178 ; ---------------------------------
   03F0                     179 _main::
                            180 ;src/main.c:78: u8* sprite=g_items_0;
                            181 ;src/main.c:89: akp_musicInit();
   03F0 CD 88 02      [17]  182 	call	_akp_musicInit
                            183 ;src/main.c:94: cpct_setInterruptHandler(myInterruptHandler);
   03F3 21 73 03      [10]  184 	ld	hl, #_myInterruptHandler
   03F6 CD D9 24      [17]  185 	call	_cpct_setInterruptHandler
                            186 ;src/main.c:98: bank4_4000();
   03F9 CD 41 06      [17]  187 	call	_bank4_4000
                            188 ;src/main.c:99: bank0123();
   03FC CD 35 06      [17]  189 	call	_bank0123
                            190 ;src/main.c:100: calqueC000();
   03FF CD 14 06      [17]  191 	call	_calqueC000
                            192 ;src/main.c:103: cpct_setVideoMode(0);
   0402 2E 00         [ 7]  193 	ld	l, #0x00
   0404 CD A0 23      [17]  194 	call	_cpct_setVideoMode
                            195 ;src/main.c:106: cpct_setBorder(HW_BLACK);
   0407 21 10 14      [10]  196 	ld	hl, #0x1410
   040A E5            [11]  197 	push	hl
   040B CD CA 21      [17]  198 	call	_cpct_setPALColour
                            199 ;src/main.c:107: cpct_setPalette(g_tile_palette, 6);
   040E 21 06 00      [10]  200 	ld	hl, #0x0006
   0411 E5            [11]  201 	push	hl
   0412 21 AB 06      [10]  202 	ld	hl, #_g_tile_palette
   0415 E5            [11]  203 	push	hl
   0416 CD 3D 21      [17]  204 	call	_cpct_setPalette
                            205 ;src/main.c:108: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   0419 21 00 40      [10]  206 	ld	hl, #0x4000
   041C E5            [11]  207 	push	hl
   041D AF            [ 4]  208 	xor	a, a
   041E F5            [11]  209 	push	af
   041F 33            [ 6]  210 	inc	sp
   0420 26 C0         [ 7]  211 	ld	h, #0xc0
   0422 E5            [11]  212 	push	hl
   0423 CD CA 23      [17]  213 	call	_cpct_memset
                            214 ;src/main.c:114: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   0426 21 0F 0F      [10]  215 	ld	hl, #0x0f0f
   0429 E5            [11]  216 	push	hl
   042A 21 00 C0      [10]  217 	ld	hl, #0xc000
   042D E5            [11]  218 	push	hl
   042E CD B9 24      [17]  219 	call	_cpct_getScreenPtr
                            220 ;src/main.c:115: cpct_drawSprite(sprite, p, 4, 8);
   0431 E5            [11]  221 	push	hl
   0432 01 04 08      [10]  222 	ld	bc, #0x0804
   0435 C5            [11]  223 	push	bc
   0436 E5            [11]  224 	push	hl
   0437 01 D0 03      [10]  225 	ld	bc, #_g_items_0
   043A C5            [11]  226 	push	bc
   043B CD DF 21      [17]  227 	call	_cpct_drawSprite
   043E 01 00 20      [10]  228 	ld	bc, #0x2000
   0441 C5            [11]  229 	push	bc
   0442 01 FF FF      [10]  230 	ld	bc, #0xffff
   0445 C5            [11]  231 	push	bc
   0446 01 00 C0      [10]  232 	ld	bc, #0xc000
   0449 C5            [11]  233 	push	bc
   044A CD F0 22      [17]  234 	call	_cpct_memset_f64
   044D 01 D0 03      [10]  235 	ld	bc, #_g_items_0
   0450 C5            [11]  236 	push	bc
   0451 01 04 08      [10]  237 	ld	bc, #0x0804
   0454 C5            [11]  238 	push	bc
   0455 CD 5C 23      [17]  239 	call	_cpct_hflipSpriteM0
   0458 E1            [10]  240 	pop	hl
                            241 ;src/main.c:123: cpct_drawSprite(sprite, p, 4, 8);
   0459 01 04 08      [10]  242 	ld	bc, #0x0804
   045C C5            [11]  243 	push	bc
   045D E5            [11]  244 	push	hl
   045E 21 D0 03      [10]  245 	ld	hl, #_g_items_0
   0461 E5            [11]  246 	push	hl
   0462 CD DF 21      [17]  247 	call	_cpct_drawSprite
                            248 ;src/main.c:125: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   0465 21 0F 1F      [10]  249 	ld	hl, #0x1f0f
   0468 E5            [11]  250 	push	hl
   0469 21 00 C0      [10]  251 	ld	hl, #0xc000
   046C E5            [11]  252 	push	hl
   046D CD B9 24      [17]  253 	call	_cpct_getScreenPtr
                            254 ;src/main.c:127: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0470 E5            [11]  255 	push	hl
   0471 21 02 03      [10]  256 	ld	hl, #0x0302
   0474 E5            [11]  257 	push	hl
   0475 CD AE 23      [17]  258 	call	_cpct_px2byteM0
   0478 55            [ 4]  259 	ld	d, l
   0479 C1            [10]  260 	pop	bc
   047A 21 0A 14      [10]  261 	ld	hl, #0x140a
   047D E5            [11]  262 	push	hl
   047E D5            [11]  263 	push	de
   047F 33            [ 6]  264 	inc	sp
   0480 C5            [11]  265 	push	bc
   0481 CD E7 23      [17]  266 	call	_cpct_drawSolidBox
   0484 F1            [10]  267 	pop	af
                            268 ;src/main.c:130: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   0485 33            [ 6]  269 	inc	sp
   0486 21 09 4F      [10]  270 	ld	hl,#0x4f09
   0489 E3            [19]  271 	ex	(sp),hl
   048A 21 00 C0      [10]  272 	ld	hl, #0xc000
   048D E5            [11]  273 	push	hl
   048E CD B9 24      [17]  274 	call	_cpct_getScreenPtr
                            275 ;src/main.c:131: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   0491 01 B1 06      [10]  276 	ld	bc, #_g_tile_schtroumpf+0
   0494 11 10 20      [10]  277 	ld	de, #0x2010
   0497 D5            [11]  278 	push	de
   0498 E5            [11]  279 	push	hl
   0499 C5            [11]  280 	push	bc
   049A CD C1 22      [17]  281 	call	_cpct_drawSpriteMasked
                            282 ;src/main.c:145: cpct_srand(77);
   049D 21 4D 00      [10]  283 	ld	hl,#0x004d
   04A0 11 00 00      [10]  284 	ld	de,#0x0000
   04A3 CD 8E 22      [17]  285 	call	_cpct_setSeed_mxor
   04A6 CD 96 22      [17]  286 	call	_cpct_restoreState_mxor_u8
                            287 ;src/main.c:149: cpct_scanKeyboard_f();
   04A9 CD 60 21      [17]  288 	call	_cpct_scanKeyboard_f
                            289 ;src/main.c:150: t=0;
   04AC 01 00 00      [10]  290 	ld	bc, #0x0000
                            291 ;src/main.c:151: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
   04AF                     292 00107$:
   04AF C5            [11]  293 	push	bc
   04B0 21 80 00      [10]  294 	ld	hl, #0x0080
   04B3 E5            [11]  295 	push	hl
   04B4 C5            [11]  296 	push	bc
   04B5 CD AC 24      [17]  297 	call	__modsint
   04B8 F1            [10]  298 	pop	af
   04B9 F1            [10]  299 	pop	af
   04BA C1            [10]  300 	pop	bc
   04BB 7C            [ 4]  301 	ld	a, h
   04BC B5            [ 4]  302 	or	a,l
   04BD 20 18         [12]  303 	jr	NZ,00108$
   04BF C5            [11]  304 	push	bc
   04C0 21 00 40      [10]  305 	ld	hl, #0x4000
   04C3 CD 54 21      [17]  306 	call	_cpct_isKeyPressed
   04C6 C1            [10]  307 	pop	bc
   04C7 7D            [ 4]  308 	ld	a, l
   04C8 B7            [ 4]  309 	or	a, a
   04C9 20 48         [12]  310 	jr	NZ,00109$
   04CB C5            [11]  311 	push	bc
   04CC 21 02 04      [10]  312 	ld	hl, #0x0402
   04CF CD 54 21      [17]  313 	call	_cpct_isKeyPressed
   04D2 C1            [10]  314 	pop	bc
   04D3 7D            [ 4]  315 	ld	a, l
   04D4 B7            [ 4]  316 	or	a, a
   04D5 20 3C         [12]  317 	jr	NZ,00109$
   04D7                     318 00108$:
                            319 ;src/main.c:152: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
   04D7 C5            [11]  320 	push	bc
   04D8 C5            [11]  321 	push	bc
   04D9 21 6E 00      [10]  322 	ld	hl, #0x006e
   04DC E5            [11]  323 	push	hl
   04DD 21 25 05      [10]  324 	ld	hl, #___str_0
   04E0 E5            [11]  325 	push	hl
   04E1 CD 38 01      [17]  326 	call	_scroll
   04E4 21 06 00      [10]  327 	ld	hl, #6
   04E7 39            [11]  328 	add	hl, sp
   04E8 F9            [ 6]  329 	ld	sp, hl
   04E9 C1            [10]  330 	pop	bc
                            331 ;src/main.c:153: t=t+1;
   04EA 03            [ 6]  332 	inc	bc
                            333 ;src/main.c:154: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   04EB 3E EC         [ 7]  334 	ld	a, #0xec
   04ED B9            [ 4]  335 	cp	a, c
   04EE 3E 04         [ 7]  336 	ld	a, #0x04
   04F0 98            [ 4]  337 	sbc	a, b
   04F1 E2 F6 04      [10]  338 	jp	PO, 00139$
   04F4 EE 80         [ 7]  339 	xor	a, #0x80
   04F6                     340 00139$:
   04F6 F2 FC 04      [10]  341 	jp	P, 00102$
   04F9 01 00 00      [10]  342 	ld	bc, #0x0000
   04FC                     343 00102$:
                            344 ;src/main.c:155: if (t%128==0) {
   04FC C5            [11]  345 	push	bc
   04FD 21 80 00      [10]  346 	ld	hl, #0x0080
   0500 E5            [11]  347 	push	hl
   0501 C5            [11]  348 	push	bc
   0502 CD AC 24      [17]  349 	call	__modsint
   0505 F1            [10]  350 	pop	af
   0506 F1            [10]  351 	pop	af
   0507 C1            [10]  352 	pop	bc
   0508 7C            [ 4]  353 	ld	a, h
   0509 B5            [ 4]  354 	or	a,l
   050A 20 A3         [12]  355 	jr	NZ,00107$
                            356 ;src/main.c:156: cpct_scanKeyboard_f();
   050C C5            [11]  357 	push	bc
   050D CD 60 21      [17]  358 	call	_cpct_scanKeyboard_f
   0510 C1            [10]  359 	pop	bc
   0511 18 9C         [12]  360 	jr	00107$
   0513                     361 00109$:
                            362 ;src/main.c:162: cpct_setVideoMemoryOffset(0);
   0513 2E 00         [ 7]  363 	ld	l, #0x00
   0515 CD D6 21      [17]  364 	call	_cpct_setVideoMemoryOffset
                            365 ;src/main.c:163: calque4000();
   0518 CD 1F 06      [17]  366 	call	_calque4000
                            367 ;src/main.c:165: while (1) {
   051B                     368 00111$:
                            369 ;src/main.c:166: vsync();
   051B CD 94 05      [17]  370 	call	_vsync
                            371 ;src/main.c:167: intCounter=0;
   051E 21 A3 25      [10]  372 	ld	hl,#_intCounter + 0
   0521 36 00         [10]  373 	ld	(hl), #0x00
   0523 18 F6         [12]  374 	jr	00111$
   0525                     375 ___str_0:
   0525 57 45 20 57 49 53   376 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   0561 57 45 20 57 49 53   377 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   0593 00                  378 	.db 0x00
                            379 	.area _CODE
                            380 	.area _INITIALIZER
   25AA                     381 __xinit__intCounter:
   25AA 00                  382 	.db #0x00	; 0
                            383 	.area _CABS (ABS)
