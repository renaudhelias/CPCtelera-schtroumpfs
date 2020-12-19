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
                             37 	.globl _cpct_memcpy
                             38 	.globl _cpct_memset_f64
                             39 	.globl _cpct_memset
                             40 	.globl _cpct_setInterruptHandler
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
   262A                      55 _intCounter::
   262A                      56 	.ds 1
   262B                      57 _hScroll::
   262B                      58 	.ds 1
                             59 ;--------------------------------------------------------
                             60 ; absolute external ram data
                             61 ;--------------------------------------------------------
                             62 	.area _DABS (ABS)
                             63 ;--------------------------------------------------------
                             64 ; global & static initialisations
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _GSINIT
                             68 	.area _GSFINAL
                             69 	.area _GSINIT
                             70 ;--------------------------------------------------------
                             71 ; Home
                             72 ;--------------------------------------------------------
                             73 	.area _HOME
                             74 	.area _HOME
                             75 ;--------------------------------------------------------
                             76 ; code
                             77 ;--------------------------------------------------------
                             78 	.area _CODE
                             79 ;src/main.c:49: void monterDerniereColonne() {
                             80 ;	---------------------------------
                             81 ; Function monterDerniereColonne
                             82 ; ---------------------------------
   0373                      83 _monterDerniereColonne::
   0373 DD E5         [15]   84 	push	ix
   0375 DD 21 00 00   [14]   85 	ld	ix,#0
   0379 DD 39         [15]   86 	add	ix,sp
   037B F5            [11]   87 	push	af
                             88 ;src/main.c:55: for (c=0;c<4;c++) {// caractères hauteur
   037C 01 00 00      [10]   89 	ld	bc, #0x0000
                             90 ;src/main.c:56: for (l=0;l<8;l++) {
   037F                      91 00109$:
   037F 69            [ 4]   92 	ld	l, c
   0380 60            [ 4]   93 	ld	h, b
   0381 29            [11]   94 	add	hl, hl
   0382 29            [11]   95 	add	hl, hl
   0383 09            [11]   96 	add	hl, bc
   0384 29            [11]   97 	add	hl, hl
   0385 29            [11]   98 	add	hl, hl
   0386 29            [11]   99 	add	hl, hl
   0387 29            [11]  100 	add	hl, hl
   0388 11 4F 40      [10]  101 	ld	de, #0x404f
   038B 19            [11]  102 	add	hl, de
   038C E3            [19]  103 	ex	(sp), hl
   038D 11 00 00      [10]  104 	ld	de, #0x0000
   0390                     105 00103$:
                            106 ;src/main.c:58: plot_column=0x4000 + l*0x800 + 80*c+79;
   0390 7B            [ 4]  107 	ld	a, e
   0391 07            [ 4]  108 	rlca
   0392 07            [ 4]  109 	rlca
   0393 07            [ 4]  110 	rlca
   0394 E6 F8         [ 7]  111 	and	a, #0xf8
   0396 67            [ 4]  112 	ld	h, a
   0397 2E 00         [ 7]  113 	ld	l, #0x00
   0399 DD 7E FE      [19]  114 	ld	a, -2 (ix)
   039C 85            [ 4]  115 	add	a, l
   039D 6F            [ 4]  116 	ld	l, a
   039E DD 7E FF      [19]  117 	ld	a, -1 (ix)
   03A1 8C            [ 4]  118 	adc	a, h
   03A2 67            [ 4]  119 	ld	h, a
                            120 ;src/main.c:59: cpct_memcpy(plot_column,plot_column,1);
   03A3 E5            [11]  121 	push	hl
   03A4 FD E1         [14]  122 	pop	iy
   03A6 C5            [11]  123 	push	bc
   03A7 D5            [11]  124 	push	de
   03A8 21 01 00      [10]  125 	ld	hl, #0x0001
   03AB E5            [11]  126 	push	hl
   03AC FD E5         [15]  127 	push	iy
   03AE FD E5         [15]  128 	push	iy
   03B0 CD 49 24      [17]  129 	call	_cpct_memcpy
   03B3 D1            [10]  130 	pop	de
   03B4 C1            [10]  131 	pop	bc
                            132 ;src/main.c:56: for (l=0;l<8;l++) {
   03B5 13            [ 6]  133 	inc	de
   03B6 7B            [ 4]  134 	ld	a, e
   03B7 D6 08         [ 7]  135 	sub	a, #0x08
   03B9 7A            [ 4]  136 	ld	a, d
   03BA DE 00         [ 7]  137 	sbc	a, #0x00
   03BC 38 D2         [12]  138 	jr	C,00103$
                            139 ;src/main.c:55: for (c=0;c<4;c++) {// caractères hauteur
   03BE 03            [ 6]  140 	inc	bc
   03BF 79            [ 4]  141 	ld	a, c
   03C0 D6 04         [ 7]  142 	sub	a, #0x04
   03C2 78            [ 4]  143 	ld	a, b
   03C3 DE 00         [ 7]  144 	sbc	a, #0x00
   03C5 38 B8         [12]  145 	jr	C,00109$
   03C7 DD F9         [10]  146 	ld	sp, ix
   03C9 DD E1         [14]  147 	pop	ix
   03CB C9            [10]  148 	ret
   03CC                     149 _g_items_0:
   03CC 05                  150 	.db #0x05	; 5
   03CD 0F                  151 	.db #0x0f	; 15
   03CE 0F                  152 	.db #0x0f	; 15
   03CF 00                  153 	.db #0x00	; 0
   03D0 0F                  154 	.db #0x0f	; 15
   03D1 0F                  155 	.db #0x0f	; 15
   03D2 0F                  156 	.db #0x0f	; 15
   03D3 0A                  157 	.db #0x0a	; 10
   03D4 0F                  158 	.db #0x0f	; 15
   03D5 0A                  159 	.db #0x0a	; 10
   03D6 05                  160 	.db #0x05	; 5
   03D7 00                  161 	.db #0x00	; 0
   03D8 0F                  162 	.db #0x0f	; 15
   03D9 0A                  163 	.db #0x0a	; 10
   03DA 05                  164 	.db #0x05	; 5
   03DB 00                  165 	.db #0x00	; 0
   03DC 05                  166 	.db #0x05	; 5
   03DD 0F                  167 	.db #0x0f	; 15
   03DE 0A                  168 	.db #0x0a	; 10
   03DF 0A                  169 	.db #0x0a	; 10
   03E0 00                  170 	.db #0x00	; 0
   03E1 0F                  171 	.db #0x0f	; 15
   03E2 0F                  172 	.db #0x0f	; 15
   03E3 0A                  173 	.db #0x0a	; 10
   03E4 00                  174 	.db #0x00	; 0
   03E5 0A                  175 	.db #0x0a	; 10
   03E6 0A                  176 	.db #0x0a	; 10
   03E7 0A                  177 	.db #0x0a	; 10
   03E8 00                  178 	.db #0x00	; 0
   03E9 00                  179 	.db #0x00	; 0
   03EA 00                  180 	.db #0x00	; 0
   03EB 00                  181 	.db #0x00	; 0
                            182 ;src/main.c:67: void myInterruptHandler() {
                            183 ;	---------------------------------
                            184 ; Function myInterruptHandler
                            185 ; ---------------------------------
   03EC                     186 _myInterruptHandler::
                            187 ;src/main.c:68: intCounter=intCounter+1;
   03EC FD 21 2A 26   [14]  188 	ld	iy, #_intCounter
   03F0 FD 34 00      [23]  189 	inc	0 (iy)
                            190 ;src/main.c:69: if (intCounter == 6) intCounter=0;
   03F3 FD 7E 00      [19]  191 	ld	a, 0 (iy)
   03F6 D6 06         [ 7]  192 	sub	a, #0x06
   03F8 20 04         [12]  193 	jr	NZ,00102$
   03FA FD 36 00 00   [19]  194 	ld	0 (iy), #0x00
   03FE                     195 00102$:
                            196 ;src/main.c:71: if (intCounter == 2) {
   03FE 3A 2A 26      [13]  197 	ld	a,(#_intCounter + 0)
   0401 D6 02         [ 7]  198 	sub	a, #0x02
   0403 20 09         [12]  199 	jr	NZ,00104$
                            200 ;src/main.c:72: cpct_setBorder(2);
   0405 21 10 02      [10]  201 	ld	hl, #0x0210
   0408 E5            [11]  202 	push	hl
   0409 CD 49 22      [17]  203 	call	_cpct_setPALColour
   040C 18 07         [12]  204 	jr	00105$
   040E                     205 00104$:
                            206 ;src/main.c:74: cpct_setBorder(3);
   040E 21 10 03      [10]  207 	ld	hl, #0x0310
   0411 E5            [11]  208 	push	hl
   0412 CD 49 22      [17]  209 	call	_cpct_setPALColour
   0415                     210 00105$:
                            211 ;src/main.c:83: if (intCounter==5) {
   0415 3A 2A 26      [13]  212 	ld	a,(#_intCounter + 0)
   0418 D6 05         [ 7]  213 	sub	a, #0x05
   041A 20 2A         [12]  214 	jr	NZ,00109$
                            215 ;src/main.c:84: calque4000();
   041C CD 9E 06      [17]  216 	call	_calque4000
                            217 ;src/main.c:86: hScroll+=1;
   041F FD 21 2B 26   [14]  218 	ld	iy, #_hScroll
   0423 FD 34 00      [23]  219 	inc	0 (iy)
                            220 ;src/main.c:91: if (hScroll==240) {hScroll=0;}
   0426 FD 7E 00      [19]  221 	ld	a, 0 (iy)
   0429 D6 F0         [ 7]  222 	sub	a, #0xf0
   042B 20 04         [12]  223 	jr	NZ,00107$
   042D FD 36 00 00   [19]  224 	ld	0 (iy), #0x00
   0431                     225 00107$:
                            226 ;src/main.c:93: cpct_setVideoMemoryOffset(hScroll);
   0431 FD 21 2B 26   [14]  227 	ld	iy, #_hScroll
   0435 FD 6E 00      [19]  228 	ld	l, 0 (iy)
   0438 CD 55 22      [17]  229 	call	_cpct_setVideoMemoryOffset
                            230 ;src/main.c:94: killVBL();
   043B CD F6 01      [17]  231 	call	_killVBL
                            232 ;src/main.c:95: rupture(19-1);
   043E 3E 12         [ 7]  233 	ld	a, #0x12
   0440 F5            [11]  234 	push	af
   0441 33            [ 6]  235 	inc	sp
   0442 CD 13 02      [17]  236 	call	_rupture
   0445 33            [ 6]  237 	inc	sp
   0446                     238 00109$:
                            239 ;src/main.c:98: if (intCounter==2) {
   0446 3A 2A 26      [13]  240 	ld	a,(#_intCounter + 0)
   0449 D6 02         [ 7]  241 	sub	a, #0x02
   044B 20 10         [12]  242 	jr	NZ,00111$
                            243 ;src/main.c:99: calqueC000();
   044D CD 93 06      [17]  244 	call	_calqueC000
                            245 ;src/main.c:100: cpct_setVideoMemoryOffset(0);
   0450 2E 00         [ 7]  246 	ld	l, #0x00
   0452 CD 55 22      [17]  247 	call	_cpct_setVideoMemoryOffset
                            248 ;src/main.c:101: rupture(7);
   0455 3E 07         [ 7]  249 	ld	a, #0x07
   0457 F5            [11]  250 	push	af
   0458 33            [ 6]  251 	inc	sp
   0459 CD 13 02      [17]  252 	call	_rupture
   045C 33            [ 6]  253 	inc	sp
   045D                     254 00111$:
                            255 ;src/main.c:104: if (intCounter==3) {
   045D 3A 2A 26      [13]  256 	ld	a,(#_intCounter + 0)
   0460 D6 03         [ 7]  257 	sub	a, #0x03
   0462 C0            [11]  258 	ret	NZ
                            259 ;src/main.c:105: calqueC000();
   0463 CD 93 06      [17]  260 	call	_calqueC000
                            261 ;src/main.c:106: cpct_setVideoMemoryOffset(0);
   0466 2E 00         [ 7]  262 	ld	l, #0x00
   0468 CD 55 22      [17]  263 	call	_cpct_setVideoMemoryOffset
                            264 ;src/main.c:107: restoreVBL();
   046B CD 07 02      [17]  265 	call	_restoreVBL
                            266 ;src/main.c:108: rupture(39-19-7+1);
   046E 3E 0E         [ 7]  267 	ld	a, #0x0e
   0470 F5            [11]  268 	push	af
   0471 33            [ 6]  269 	inc	sp
   0472 CD 13 02      [17]  270 	call	_rupture
   0475 33            [ 6]  271 	inc	sp
   0476 C9            [10]  272 	ret
                            273 ;src/main.c:113: void main(void) {
                            274 ;	---------------------------------
                            275 ; Function main
                            276 ; ---------------------------------
   0477                     277 _main::
                            278 ;src/main.c:116: u8* sprite=g_items_0;
                            279 ;src/main.c:132: cpct_setInterruptHandler(myInterruptHandler);
   0477 21 EC 03      [10]  280 	ld	hl, #_myInterruptHandler
   047A CD 60 25      [17]  281 	call	_cpct_setInterruptHandler
                            282 ;src/main.c:136: bank4_4000();
   047D CD C0 06      [17]  283 	call	_bank4_4000
                            284 ;src/main.c:137: bank0123();
   0480 CD B4 06      [17]  285 	call	_bank0123
                            286 ;src/main.c:138: calqueC000();
   0483 CD 93 06      [17]  287 	call	_calqueC000
                            288 ;src/main.c:141: cpct_setVideoMode(0);
   0486 2E 00         [ 7]  289 	ld	l, #0x00
   0488 CD 1F 24      [17]  290 	call	_cpct_setVideoMode
                            291 ;src/main.c:144: cpct_setBorder(HW_BLACK);
   048B 21 10 14      [10]  292 	ld	hl, #0x1410
   048E E5            [11]  293 	push	hl
   048F CD 49 22      [17]  294 	call	_cpct_setPALColour
                            295 ;src/main.c:145: cpct_setPalette(g_tile_palette, 6);
   0492 21 06 00      [10]  296 	ld	hl, #0x0006
   0495 E5            [11]  297 	push	hl
   0496 21 2A 07      [10]  298 	ld	hl, #_g_tile_palette
   0499 E5            [11]  299 	push	hl
   049A CD BC 21      [17]  300 	call	_cpct_setPalette
                            301 ;src/main.c:146: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   049D 21 00 40      [10]  302 	ld	hl, #0x4000
   04A0 E5            [11]  303 	push	hl
   04A1 AF            [ 4]  304 	xor	a, a
   04A2 F5            [11]  305 	push	af
   04A3 33            [ 6]  306 	inc	sp
   04A4 26 C0         [ 7]  307 	ld	h, #0xc0
   04A6 E5            [11]  308 	push	hl
   04A7 CD 51 24      [17]  309 	call	_cpct_memset
                            310 ;src/main.c:151: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   04AA 21 0F 0F      [10]  311 	ld	hl, #0x0f0f
   04AD E5            [11]  312 	push	hl
   04AE 21 00 C0      [10]  313 	ld	hl, #0xc000
   04B1 E5            [11]  314 	push	hl
   04B2 CD 40 25      [17]  315 	call	_cpct_getScreenPtr
                            316 ;src/main.c:152: cpct_drawSprite(sprite, p, 4, 8);
   04B5 E5            [11]  317 	push	hl
   04B6 01 04 08      [10]  318 	ld	bc, #0x0804
   04B9 C5            [11]  319 	push	bc
   04BA E5            [11]  320 	push	hl
   04BB 01 CC 03      [10]  321 	ld	bc, #_g_items_0
   04BE C5            [11]  322 	push	bc
   04BF CD 5E 22      [17]  323 	call	_cpct_drawSprite
   04C2 01 00 20      [10]  324 	ld	bc, #0x2000
   04C5 C5            [11]  325 	push	bc
   04C6 01 FF FF      [10]  326 	ld	bc, #0xffff
   04C9 C5            [11]  327 	push	bc
   04CA 01 00 C0      [10]  328 	ld	bc, #0xc000
   04CD C5            [11]  329 	push	bc
   04CE CD 6F 23      [17]  330 	call	_cpct_memset_f64
   04D1 01 CC 03      [10]  331 	ld	bc, #_g_items_0
   04D4 C5            [11]  332 	push	bc
   04D5 01 04 08      [10]  333 	ld	bc, #0x0804
   04D8 C5            [11]  334 	push	bc
   04D9 CD DB 23      [17]  335 	call	_cpct_hflipSpriteM0
   04DC E1            [10]  336 	pop	hl
                            337 ;src/main.c:160: cpct_drawSprite(sprite, p, 4, 8);
   04DD 01 04 08      [10]  338 	ld	bc, #0x0804
   04E0 C5            [11]  339 	push	bc
   04E1 E5            [11]  340 	push	hl
   04E2 21 CC 03      [10]  341 	ld	hl, #_g_items_0
   04E5 E5            [11]  342 	push	hl
   04E6 CD 5E 22      [17]  343 	call	_cpct_drawSprite
                            344 ;src/main.c:162: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   04E9 21 0F 1F      [10]  345 	ld	hl, #0x1f0f
   04EC E5            [11]  346 	push	hl
   04ED 21 00 C0      [10]  347 	ld	hl, #0xc000
   04F0 E5            [11]  348 	push	hl
   04F1 CD 40 25      [17]  349 	call	_cpct_getScreenPtr
                            350 ;src/main.c:164: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   04F4 E5            [11]  351 	push	hl
   04F5 21 02 03      [10]  352 	ld	hl, #0x0302
   04F8 E5            [11]  353 	push	hl
   04F9 CD 2D 24      [17]  354 	call	_cpct_px2byteM0
   04FC 55            [ 4]  355 	ld	d, l
   04FD C1            [10]  356 	pop	bc
   04FE 21 0A 14      [10]  357 	ld	hl, #0x140a
   0501 E5            [11]  358 	push	hl
   0502 D5            [11]  359 	push	de
   0503 33            [ 6]  360 	inc	sp
   0504 C5            [11]  361 	push	bc
   0505 CD 6E 24      [17]  362 	call	_cpct_drawSolidBox
   0508 F1            [10]  363 	pop	af
                            364 ;src/main.c:167: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   0509 33            [ 6]  365 	inc	sp
   050A 21 09 4F      [10]  366 	ld	hl,#0x4f09
   050D E3            [19]  367 	ex	(sp),hl
   050E 21 00 C0      [10]  368 	ld	hl, #0xc000
   0511 E5            [11]  369 	push	hl
   0512 CD 40 25      [17]  370 	call	_cpct_getScreenPtr
                            371 ;src/main.c:168: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   0515 01 30 07      [10]  372 	ld	bc, #_g_tile_schtroumpf+0
   0518 11 10 20      [10]  373 	ld	de, #0x2010
   051B D5            [11]  374 	push	de
   051C E5            [11]  375 	push	hl
   051D C5            [11]  376 	push	bc
   051E CD 40 23      [17]  377 	call	_cpct_drawSpriteMasked
                            378 ;src/main.c:182: cpct_srand(77);
   0521 21 4D 00      [10]  379 	ld	hl,#0x004d
   0524 11 00 00      [10]  380 	ld	de,#0x0000
   0527 CD 0D 23      [17]  381 	call	_cpct_setSeed_mxor
   052A CD 15 23      [17]  382 	call	_cpct_restoreState_mxor_u8
                            383 ;src/main.c:186: cpct_scanKeyboard_f();
   052D CD DF 21      [17]  384 	call	_cpct_scanKeyboard_f
                            385 ;src/main.c:187: t=0;
   0530 01 00 00      [10]  386 	ld	bc, #0x0000
                            387 ;src/main.c:188: while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
   0533                     388 00107$:
   0533 C5            [11]  389 	push	bc
   0534 21 80 00      [10]  390 	ld	hl, #0x0080
   0537 E5            [11]  391 	push	hl
   0538 C5            [11]  392 	push	bc
   0539 CD 33 25      [17]  393 	call	__modsint
   053C F1            [10]  394 	pop	af
   053D F1            [10]  395 	pop	af
   053E C1            [10]  396 	pop	bc
   053F 7C            [ 4]  397 	ld	a, h
   0540 B5            [ 4]  398 	or	a,l
   0541 20 18         [12]  399 	jr	NZ,00108$
   0543 C5            [11]  400 	push	bc
   0544 21 00 40      [10]  401 	ld	hl, #0x4000
   0547 CD D3 21      [17]  402 	call	_cpct_isKeyPressed
   054A C1            [10]  403 	pop	bc
   054B 7D            [ 4]  404 	ld	a, l
   054C B7            [ 4]  405 	or	a, a
   054D 20 48         [12]  406 	jr	NZ,00109$
   054F C5            [11]  407 	push	bc
   0550 21 02 04      [10]  408 	ld	hl, #0x0402
   0553 CD D3 21      [17]  409 	call	_cpct_isKeyPressed
   0556 C1            [10]  410 	pop	bc
   0557 7D            [ 4]  411 	ld	a, l
   0558 B7            [ 4]  412 	or	a, a
   0559 20 3C         [12]  413 	jr	NZ,00109$
   055B                     414 00108$:
                            415 ;src/main.c:189: scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
   055B C5            [11]  416 	push	bc
   055C C5            [11]  417 	push	bc
   055D 21 6E 00      [10]  418 	ld	hl, #0x006e
   0560 E5            [11]  419 	push	hl
   0561 21 A4 05      [10]  420 	ld	hl, #___str_0
   0564 E5            [11]  421 	push	hl
   0565 CD 38 01      [17]  422 	call	_scroll
   0568 21 06 00      [10]  423 	ld	hl, #6
   056B 39            [11]  424 	add	hl, sp
   056C F9            [ 6]  425 	ld	sp, hl
   056D C1            [10]  426 	pop	bc
                            427 ;src/main.c:190: t=t+1;
   056E 03            [ 6]  428 	inc	bc
                            429 ;src/main.c:191: if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
   056F 3E EC         [ 7]  430 	ld	a, #0xec
   0571 B9            [ 4]  431 	cp	a, c
   0572 3E 04         [ 7]  432 	ld	a, #0x04
   0574 98            [ 4]  433 	sbc	a, b
   0575 E2 7A 05      [10]  434 	jp	PO, 00139$
   0578 EE 80         [ 7]  435 	xor	a, #0x80
   057A                     436 00139$:
   057A F2 80 05      [10]  437 	jp	P, 00102$
   057D 01 00 00      [10]  438 	ld	bc, #0x0000
   0580                     439 00102$:
                            440 ;src/main.c:192: if (t%128==0) {
   0580 C5            [11]  441 	push	bc
   0581 21 80 00      [10]  442 	ld	hl, #0x0080
   0584 E5            [11]  443 	push	hl
   0585 C5            [11]  444 	push	bc
   0586 CD 33 25      [17]  445 	call	__modsint
   0589 F1            [10]  446 	pop	af
   058A F1            [10]  447 	pop	af
   058B C1            [10]  448 	pop	bc
   058C 7C            [ 4]  449 	ld	a, h
   058D B5            [ 4]  450 	or	a,l
   058E 20 A3         [12]  451 	jr	NZ,00107$
                            452 ;src/main.c:193: cpct_scanKeyboard_f();
   0590 C5            [11]  453 	push	bc
   0591 CD DF 21      [17]  454 	call	_cpct_scanKeyboard_f
   0594 C1            [10]  455 	pop	bc
   0595 18 9C         [12]  456 	jr	00107$
   0597                     457 00109$:
                            458 ;src/main.c:199: cpct_setVideoMemoryOffset(0);
   0597 2E 00         [ 7]  459 	ld	l, #0x00
   0599 CD 55 22      [17]  460 	call	_cpct_setVideoMemoryOffset
                            461 ;src/main.c:200: calque4000();
   059C CD 9E 06      [17]  462 	call	_calque4000
                            463 ;src/main.c:202: while (1) {
   059F                     464 00111$:
                            465 ;src/main.c:203: vsync();
   059F CD 13 06      [17]  466 	call	_vsync
   05A2 18 FB         [12]  467 	jr	00111$
   05A4                     468 ___str_0:
   05A4 57 45 20 57 49 53   469 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   05E0 57 45 20 57 49 53   470 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   0612 00                  471 	.db 0x00
                            472 	.area _CODE
                            473 	.area _INITIALIZER
   2632                     474 __xinit__intCounter:
   2632 00                  475 	.db #0x00	; 0
   2633                     476 __xinit__hScroll:
   2633 00                  477 	.db #0x00	; 0
                            478 	.area _CABS (ABS)
