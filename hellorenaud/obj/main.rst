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
   259D                      54 _intCounter::
   259D                      55 	.ds 1
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
   0373 FD 21 9D 25   [14]   82 	ld	iy, #_intCounter
   0377 FD 34 00      [23]   83 	inc	0 (iy)
                             84 ;src/main.c:47: if (intCounter == 6) intCounter=0;
   037A FD 7E 00      [19]   85 	ld	a, 0 (iy)
   037D D6 06         [ 7]   86 	sub	a, #0x06
   037F 20 04         [12]   87 	jr	NZ,00102$
   0381 FD 36 00 00   [19]   88 	ld	0 (iy), #0x00
   0385                      89 00102$:
                             90 ;src/main.c:49: if (intCounter == 2) {
   0385 3A 9D 25      [13]   91 	ld	a,(#_intCounter + 0)
   0388 D6 02         [ 7]   92 	sub	a, #0x02
   038A 20 09         [12]   93 	jr	NZ,00104$
                             94 ;src/main.c:50: cpct_setBorder(2);
   038C 21 10 02      [10]   95 	ld	hl, #0x0210
   038F E5            [11]   96 	push	hl
   0390 CD C4 21      [17]   97 	call	_cpct_setPALColour
   0393 18 07         [12]   98 	jr	00105$
   0395                      99 00104$:
                            100 ;src/main.c:52: cpct_setBorder(3);
   0395 21 10 03      [10]  101 	ld	hl, #0x0310
   0398 E5            [11]  102 	push	hl
   0399 CD C4 21      [17]  103 	call	_cpct_setPALColour
   039C                     104 00105$:
                            105 ;src/main.c:56: if (intCounter==2) {
   039C 3A 9D 25      [13]  106 	ld	a,(#_intCounter + 0)
   039F D6 02         [ 7]  107 	sub	a, #0x02
   03A1 20 03         [12]  108 	jr	NZ,00107$
                            109 ;src/main.c:57: akp_musicPlay();
   03A3 CD 33 03      [17]  110 	call	_akp_musicPlay
   03A6                     111 00107$:
                            112 ;src/main.c:61: if (intCounter==5) {
   03A6 3A 9D 25      [13]  113 	ld	a,(#_intCounter + 0)
   03A9 D6 05         [ 7]  114 	sub	a, #0x05
   03AB 20 0B         [12]  115 	jr	NZ,00109$
                            116 ;src/main.c:62: killVBL();
   03AD CD F6 01      [17]  117 	call	_killVBL
                            118 ;src/main.c:63: rupture(19);
   03B0 3E 13         [ 7]  119 	ld	a, #0x13
   03B2 F5            [11]  120 	push	af
   03B3 33            [ 6]  121 	inc	sp
   03B4 CD 13 02      [17]  122 	call	_rupture
   03B7 33            [ 6]  123 	inc	sp
   03B8                     124 00109$:
                            125 ;src/main.c:66: if (intCounter==2) {
   03B8 3A 9D 25      [13]  126 	ld	a,(#_intCounter + 0)
   03BB D6 02         [ 7]  127 	sub	a, #0x02
   03BD C0            [11]  128 	ret	NZ
                            129 ;src/main.c:67: restoreVBL();
   03BE CD 07 02      [17]  130 	call	_restoreVBL
                            131 ;src/main.c:68: rupture(39-19);
   03C1 3E 14         [ 7]  132 	ld	a, #0x14
   03C3 F5            [11]  133 	push	af
   03C4 33            [ 6]  134 	inc	sp
   03C5 CD 13 02      [17]  135 	call	_rupture
   03C8 33            [ 6]  136 	inc	sp
   03C9 C9            [10]  137 	ret
   03CA                     138 _g_items_0:
   03CA 05                  139 	.db #0x05	; 5
   03CB 0F                  140 	.db #0x0f	; 15
   03CC 0F                  141 	.db #0x0f	; 15
   03CD 00                  142 	.db #0x00	; 0
   03CE 0F                  143 	.db #0x0f	; 15
   03CF 0F                  144 	.db #0x0f	; 15
   03D0 0F                  145 	.db #0x0f	; 15
   03D1 0A                  146 	.db #0x0a	; 10
   03D2 0F                  147 	.db #0x0f	; 15
   03D3 0A                  148 	.db #0x0a	; 10
   03D4 05                  149 	.db #0x05	; 5
   03D5 00                  150 	.db #0x00	; 0
   03D6 0F                  151 	.db #0x0f	; 15
   03D7 0A                  152 	.db #0x0a	; 10
   03D8 05                  153 	.db #0x05	; 5
   03D9 00                  154 	.db #0x00	; 0
   03DA 05                  155 	.db #0x05	; 5
   03DB 0F                  156 	.db #0x0f	; 15
   03DC 0A                  157 	.db #0x0a	; 10
   03DD 0A                  158 	.db #0x0a	; 10
   03DE 00                  159 	.db #0x00	; 0
   03DF 0F                  160 	.db #0x0f	; 15
   03E0 0F                  161 	.db #0x0f	; 15
   03E1 0A                  162 	.db #0x0a	; 10
   03E2 00                  163 	.db #0x00	; 0
   03E3 0A                  164 	.db #0x0a	; 10
   03E4 0A                  165 	.db #0x0a	; 10
   03E5 0A                  166 	.db #0x0a	; 10
   03E6 00                  167 	.db #0x00	; 0
   03E7 00                  168 	.db #0x00	; 0
   03E8 00                  169 	.db #0x00	; 0
   03E9 00                  170 	.db #0x00	; 0
                            171 ;src/main.c:73: void main(void) {
                            172 ;	---------------------------------
                            173 ; Function main
                            174 ; ---------------------------------
   03EA                     175 _main::
                            176 ;src/main.c:76: u8* sprite=g_items_0;
                            177 ;src/main.c:87: akp_musicInit();
   03EA CD 88 02      [17]  178 	call	_akp_musicInit
                            179 ;src/main.c:92: cpct_setInterruptHandler(myInterruptHandler);
   03ED 21 73 03      [10]  180 	ld	hl, #_myInterruptHandler
   03F0 CD D3 24      [17]  181 	call	_cpct_setInterruptHandler
                            182 ;src/main.c:96: bank4_4000();
   03F3 CD 3B 06      [17]  183 	call	_bank4_4000
                            184 ;src/main.c:97: bank0123();
   03F6 CD 2F 06      [17]  185 	call	_bank0123
                            186 ;src/main.c:98: calqueC000();
   03F9 CD 0E 06      [17]  187 	call	_calqueC000
                            188 ;src/main.c:101: cpct_setVideoMode(0);
   03FC 2E 00         [ 7]  189 	ld	l, #0x00
   03FE CD 9A 23      [17]  190 	call	_cpct_setVideoMode
                            191 ;src/main.c:104: cpct_setBorder(HW_BLACK);
   0401 21 10 14      [10]  192 	ld	hl, #0x1410
   0404 E5            [11]  193 	push	hl
   0405 CD C4 21      [17]  194 	call	_cpct_setPALColour
                            195 ;src/main.c:105: cpct_setPalette(g_tile_palette, 6);
   0408 21 06 00      [10]  196 	ld	hl, #0x0006
   040B E5            [11]  197 	push	hl
   040C 21 A5 06      [10]  198 	ld	hl, #_g_tile_palette
   040F E5            [11]  199 	push	hl
   0410 CD 37 21      [17]  200 	call	_cpct_setPalette
                            201 ;src/main.c:106: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   0413 21 00 40      [10]  202 	ld	hl, #0x4000
   0416 E5            [11]  203 	push	hl
   0417 AF            [ 4]  204 	xor	a, a
   0418 F5            [11]  205 	push	af
   0419 33            [ 6]  206 	inc	sp
   041A 26 C0         [ 7]  207 	ld	h, #0xc0
   041C E5            [11]  208 	push	hl
   041D CD C4 23      [17]  209 	call	_cpct_memset
                            210 ;src/main.c:112: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   0420 21 0F 0F      [10]  211 	ld	hl, #0x0f0f
   0423 E5            [11]  212 	push	hl
   0424 21 00 C0      [10]  213 	ld	hl, #0xc000
   0427 E5            [11]  214 	push	hl
   0428 CD B3 24      [17]  215 	call	_cpct_getScreenPtr
                            216 ;src/main.c:113: cpct_drawSprite(sprite, p, 4, 8);
   042B E5            [11]  217 	push	hl
   042C 01 04 08      [10]  218 	ld	bc, #0x0804
   042F C5            [11]  219 	push	bc
   0430 E5            [11]  220 	push	hl
   0431 01 CA 03      [10]  221 	ld	bc, #_g_items_0
   0434 C5            [11]  222 	push	bc
   0435 CD D9 21      [17]  223 	call	_cpct_drawSprite
   0438 01 00 20      [10]  224 	ld	bc, #0x2000
   043B C5            [11]  225 	push	bc
   043C 01 FF FF      [10]  226 	ld	bc, #0xffff
   043F C5            [11]  227 	push	bc
   0440 01 00 C0      [10]  228 	ld	bc, #0xc000
   0443 C5            [11]  229 	push	bc
   0444 CD EA 22      [17]  230 	call	_cpct_memset_f64
   0447 01 CA 03      [10]  231 	ld	bc, #_g_items_0
   044A C5            [11]  232 	push	bc
   044B 01 04 08      [10]  233 	ld	bc, #0x0804
   044E C5            [11]  234 	push	bc
   044F CD 56 23      [17]  235 	call	_cpct_hflipSpriteM0
   0452 E1            [10]  236 	pop	hl
                            237 ;src/main.c:121: cpct_drawSprite(sprite, p, 4, 8);
   0453 01 04 08      [10]  238 	ld	bc, #0x0804
   0456 C5            [11]  239 	push	bc
   0457 E5            [11]  240 	push	hl
   0458 21 CA 03      [10]  241 	ld	hl, #_g_items_0
   045B E5            [11]  242 	push	hl
   045C CD D9 21      [17]  243 	call	_cpct_drawSprite
                            244 ;src/main.c:123: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   045F 21 0F 1F      [10]  245 	ld	hl, #0x1f0f
   0462 E5            [11]  246 	push	hl
   0463 21 00 C0      [10]  247 	ld	hl, #0xc000
   0466 E5            [11]  248 	push	hl
   0467 CD B3 24      [17]  249 	call	_cpct_getScreenPtr
                            250 ;src/main.c:125: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   046A E5            [11]  251 	push	hl
   046B 21 02 03      [10]  252 	ld	hl, #0x0302
   046E E5            [11]  253 	push	hl
   046F CD A8 23      [17]  254 	call	_cpct_px2byteM0
   0472 55            [ 4]  255 	ld	d, l
   0473 C1            [10]  256 	pop	bc
   0474 21 0A 14      [10]  257 	ld	hl, #0x140a
   0477 E5            [11]  258 	push	hl
   0478 D5            [11]  259 	push	de
   0479 33            [ 6]  260 	inc	sp
   047A C5            [11]  261 	push	bc
   047B CD E1 23      [17]  262 	call	_cpct_drawSolidBox
   047E F1            [10]  263 	pop	af
                            264 ;src/main.c:128: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   047F 33            [ 6]  265 	inc	sp
   0480 21 09 4F      [10]  266 	ld	hl,#0x4f09
   0483 E3            [19]  267 	ex	(sp),hl
   0484 21 00 C0      [10]  268 	ld	hl, #0xc000
   0487 E5            [11]  269 	push	hl
   0488 CD B3 24      [17]  270 	call	_cpct_getScreenPtr
                            271 ;src/main.c:129: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   048B 01 AB 06      [10]  272 	ld	bc, #_g_tile_schtroumpf+0
   048E 11 10 20      [10]  273 	ld	de, #0x2010
   0491 D5            [11]  274 	push	de
   0492 E5            [11]  275 	push	hl
   0493 C5            [11]  276 	push	bc
   0494 CD BB 22      [17]  277 	call	_cpct_drawSpriteMasked
                            278 ;src/main.c:143: cpct_srand(77);
   0497 21 4D 00      [10]  279 	ld	hl,#0x004d
   049A 11 00 00      [10]  280 	ld	de,#0x0000
   049D CD 88 22      [17]  281 	call	_cpct_setSeed_mxor
   04A0 CD 90 22      [17]  282 	call	_cpct_restoreState_mxor_u8
                            283 ;src/main.c:147: cpct_scanKeyboard_f();
   04A3 CD 5A 21      [17]  284 	call	_cpct_scanKeyboard_f
                            285 ;src/main.c:148: t=0;
   04A6 01 00 00      [10]  286 	ld	bc, #0x0000
                            287 ;src/main.c:149: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
   04A9                     288 00107$:
   04A9 C5            [11]  289 	push	bc
   04AA 21 80 00      [10]  290 	ld	hl, #0x0080
   04AD E5            [11]  291 	push	hl
   04AE C5            [11]  292 	push	bc
   04AF CD A6 24      [17]  293 	call	__modsint
   04B2 F1            [10]  294 	pop	af
   04B3 F1            [10]  295 	pop	af
   04B4 C1            [10]  296 	pop	bc
   04B5 7C            [ 4]  297 	ld	a, h
   04B6 B5            [ 4]  298 	or	a,l
   04B7 20 18         [12]  299 	jr	NZ,00108$
   04B9 C5            [11]  300 	push	bc
   04BA 21 00 40      [10]  301 	ld	hl, #0x4000
   04BD CD 4E 21      [17]  302 	call	_cpct_isKeyPressed
   04C0 C1            [10]  303 	pop	bc
   04C1 7D            [ 4]  304 	ld	a, l
   04C2 B7            [ 4]  305 	or	a, a
   04C3 20 48         [12]  306 	jr	NZ,00109$
   04C5 C5            [11]  307 	push	bc
   04C6 21 02 04      [10]  308 	ld	hl, #0x0402
   04C9 CD 4E 21      [17]  309 	call	_cpct_isKeyPressed
   04CC C1            [10]  310 	pop	bc
   04CD 7D            [ 4]  311 	ld	a, l
   04CE B7            [ 4]  312 	or	a, a
   04CF 20 3C         [12]  313 	jr	NZ,00109$
   04D1                     314 00108$:
                            315 ;src/main.c:150: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
   04D1 C5            [11]  316 	push	bc
   04D2 C5            [11]  317 	push	bc
   04D3 21 6E 00      [10]  318 	ld	hl, #0x006e
   04D6 E5            [11]  319 	push	hl
   04D7 21 1F 05      [10]  320 	ld	hl, #___str_0
   04DA E5            [11]  321 	push	hl
   04DB CD 38 01      [17]  322 	call	_scroll
   04DE 21 06 00      [10]  323 	ld	hl, #6
   04E1 39            [11]  324 	add	hl, sp
   04E2 F9            [ 6]  325 	ld	sp, hl
   04E3 C1            [10]  326 	pop	bc
                            327 ;src/main.c:151: t=t+1;
   04E4 03            [ 6]  328 	inc	bc
                            329 ;src/main.c:152: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   04E5 3E EC         [ 7]  330 	ld	a, #0xec
   04E7 B9            [ 4]  331 	cp	a, c
   04E8 3E 04         [ 7]  332 	ld	a, #0x04
   04EA 98            [ 4]  333 	sbc	a, b
   04EB E2 F0 04      [10]  334 	jp	PO, 00139$
   04EE EE 80         [ 7]  335 	xor	a, #0x80
   04F0                     336 00139$:
   04F0 F2 F6 04      [10]  337 	jp	P, 00102$
   04F3 01 00 00      [10]  338 	ld	bc, #0x0000
   04F6                     339 00102$:
                            340 ;src/main.c:153: if (t%128==0) {
   04F6 C5            [11]  341 	push	bc
   04F7 21 80 00      [10]  342 	ld	hl, #0x0080
   04FA E5            [11]  343 	push	hl
   04FB C5            [11]  344 	push	bc
   04FC CD A6 24      [17]  345 	call	__modsint
   04FF F1            [10]  346 	pop	af
   0500 F1            [10]  347 	pop	af
   0501 C1            [10]  348 	pop	bc
   0502 7C            [ 4]  349 	ld	a, h
   0503 B5            [ 4]  350 	or	a,l
   0504 20 A3         [12]  351 	jr	NZ,00107$
                            352 ;src/main.c:154: cpct_scanKeyboard_f();
   0506 C5            [11]  353 	push	bc
   0507 CD 5A 21      [17]  354 	call	_cpct_scanKeyboard_f
   050A C1            [10]  355 	pop	bc
   050B 18 9C         [12]  356 	jr	00107$
   050D                     357 00109$:
                            358 ;src/main.c:160: cpct_setVideoMemoryOffset(0);
   050D 2E 00         [ 7]  359 	ld	l, #0x00
   050F CD D0 21      [17]  360 	call	_cpct_setVideoMemoryOffset
                            361 ;src/main.c:161: calque4000();
   0512 CD 19 06      [17]  362 	call	_calque4000
                            363 ;src/main.c:163: while (1) {
   0515                     364 00111$:
                            365 ;src/main.c:164: vsync();
   0515 CD 8E 05      [17]  366 	call	_vsync
                            367 ;src/main.c:165: intCounter=0;
   0518 21 9D 25      [10]  368 	ld	hl,#_intCounter + 0
   051B 36 00         [10]  369 	ld	(hl), #0x00
   051D 18 F6         [12]  370 	jr	00111$
   051F                     371 ___str_0:
   051F 57 45 20 57 49 53   372 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   055B 57 45 20 57 49 53   373 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   058D 00                  374 	.db 0x00
                            375 	.area _CODE
                            376 	.area _INITIALIZER
   25A4                     377 __xinit__intCounter:
   25A4 00                  378 	.db #0x00	; 0
                            379 	.area _CABS (ABS)
