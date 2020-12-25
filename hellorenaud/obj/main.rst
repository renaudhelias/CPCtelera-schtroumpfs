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
                             13 	.globl _crtc
                             14 	.globl _wait_frame_flyback
                             15 	.globl _bank0123
                             16 	.globl _calque8000
                             17 	.globl _calqueC000
                             18 	.globl _scroll_hard
                             19 	.globl _rupture
                             20 	.globl _restoreVBL
                             21 	.globl _killVBL
                             22 	.globl _cpct_getScreenPtr
                             23 	.globl _cpct_setVideoMemoryOffset
                             24 	.globl _cpct_setPALColour
                             25 	.globl _cpct_setPalette
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_hflipSpriteM0
                             28 	.globl _cpct_drawSolidBox
                             29 	.globl _cpct_drawSpriteMasked
                             30 	.globl _cpct_drawSprite
                             31 	.globl _cpct_px2byteM0
                             32 	.globl _cpct_setStackLocation
                             33 	.globl _cpct_memcpy
                             34 	.globl _cpct_memset_f64
                             35 	.globl _cpct_disableFirmware
                             36 	.globl _slow
                             37 	.globl _hOffset
                             38 	.globl _intCounter
                             39 	.globl _screen_plot_address
                             40 	.globl _screen_location
                             41 	.globl _g_items_0
                             42 ;--------------------------------------------------------
                             43 ; special function registers
                             44 ;--------------------------------------------------------
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DATA
   65BE                      49 _screen_location::
   65BE                      50 	.ds 2
   65C0                      51 _screen_plot_address::
   65C0                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   65C2                      57 _intCounter::
   65C2                      58 	.ds 1
   65C3                      59 _hOffset::
   65C3                      60 	.ds 2
   65C5                      61 _slow::
   65C5                      62 	.ds 1
                             63 ;--------------------------------------------------------
                             64 ; absolute external ram data
                             65 ;--------------------------------------------------------
                             66 	.area _DABS (ABS)
                             67 ;--------------------------------------------------------
                             68 ; global & static initialisations
                             69 ;--------------------------------------------------------
                             70 	.area _HOME
                             71 	.area _GSINIT
                             72 	.area _GSFINAL
                             73 	.area _GSINIT
                             74 ;--------------------------------------------------------
                             75 ; Home
                             76 ;--------------------------------------------------------
                             77 	.area _HOME
                             78 	.area _HOME
                             79 ;--------------------------------------------------------
                             80 ; code
                             81 ;--------------------------------------------------------
                             82 	.area _CODE
                             83 ;src/main.c:68: void wait_frame_flyback() {
                             84 ;	---------------------------------
                             85 ; Function wait_frame_flyback
                             86 ; ---------------------------------
   436A                      87 _wait_frame_flyback::
                             88 ;src/main.c:74: __endasm;
   436A 06 F5         [ 7]   89 	ld	b,#0xf5 ;wait frame flyback
   436C                      90 	l1:
   436C ED 78         [12]   91 	in a,(c)
   436E 1F            [ 4]   92 	rra
   436F 30 FB         [12]   93 	jr	nc,l1
   4371 C9            [10]   94 	ret
   4372                      95 _g_items_0:
   4372 05                   96 	.db #0x05	; 5
   4373 0F                   97 	.db #0x0f	; 15
   4374 0F                   98 	.db #0x0f	; 15
   4375 00                   99 	.db #0x00	; 0
   4376 0F                  100 	.db #0x0f	; 15
   4377 0F                  101 	.db #0x0f	; 15
   4378 0F                  102 	.db #0x0f	; 15
   4379 0A                  103 	.db #0x0a	; 10
   437A 0F                  104 	.db #0x0f	; 15
   437B 0A                  105 	.db #0x0a	; 10
   437C 05                  106 	.db #0x05	; 5
   437D 00                  107 	.db #0x00	; 0
   437E 0F                  108 	.db #0x0f	; 15
   437F 0A                  109 	.db #0x0a	; 10
   4380 05                  110 	.db #0x05	; 5
   4381 00                  111 	.db #0x00	; 0
   4382 05                  112 	.db #0x05	; 5
   4383 0F                  113 	.db #0x0f	; 15
   4384 0A                  114 	.db #0x0a	; 10
   4385 0A                  115 	.db #0x0a	; 10
   4386 00                  116 	.db #0x00	; 0
   4387 0F                  117 	.db #0x0f	; 15
   4388 0F                  118 	.db #0x0f	; 15
   4389 0A                  119 	.db #0x0a	; 10
   438A 00                  120 	.db #0x00	; 0
   438B 0A                  121 	.db #0x0a	; 10
   438C 0A                  122 	.db #0x0a	; 10
   438D 0A                  123 	.db #0x0a	; 10
   438E 00                  124 	.db #0x00	; 0
   438F 00                  125 	.db #0x00	; 0
   4390 00                  126 	.db #0x00	; 0
   4391 00                  127 	.db #0x00	; 0
                            128 ;src/main.c:77: void crtc(u8* R12R13) {
                            129 ;	---------------------------------
                            130 ; Function crtc
                            131 ; ---------------------------------
   4392                     132 _crtc::
                            133 ;src/main.c:94: __endasm;
   4392 DD E5         [15]  134 	push	ix
   4394 DD 21 00 00   [14]  135 	ld	ix,#0
   4398 DD 39         [15]  136 	add	ix,sp
   439A DD 66 05      [19]  137 	ld	h, 5 (ix)
   439D DD 6E 04      [19]  138 	ld	l, 4 (ix)
   43A0 01 0C BC      [10]  139 	ld	bc,#0xbc00+12
   43A3 ED 49         [12]  140 	out	(c),c
   43A5 04            [ 4]  141 	inc	b
   43A6 ED 61         [12]  142 	out	(c),h
   43A8 05            [ 4]  143 	dec	b
   43A9 0C            [ 4]  144 	inc	c
   43AA ED 49         [12]  145 	out	(c),c
   43AC 04            [ 4]  146 	inc	b
   43AD ED 69         [12]  147 	out	(c),l
   43AF DD E1         [14]  148 	pop	ix
   43B1 C9            [10]  149 	ret
                            150 ;src/main.c:107: void myInterruptHandler() {
                            151 ;	---------------------------------
                            152 ; Function myInterruptHandler
                            153 ; ---------------------------------
   43B2                     154 _myInterruptHandler::
                            155 ;src/main.c:110: intCounter=intCounter+1;
   43B2 FD 21 C2 65   [14]  156 	ld	iy, #_intCounter
   43B6 FD 34 00      [23]  157 	inc	0 (iy)
                            158 ;src/main.c:111: if (intCounter == 6) intCounter=0;
   43B9 FD 7E 00      [19]  159 	ld	a, 0 (iy)
   43BC D6 06         [ 7]  160 	sub	a, #0x06
   43BE 20 04         [12]  161 	jr	NZ,00102$
   43C0 FD 36 00 00   [19]  162 	ld	0 (iy), #0x00
   43C4                     163 00102$:
                            164 ;src/main.c:113: if (intCounter == 2) {
   43C4 3A C2 65      [13]  165 	ld	a,(#_intCounter + 0)
   43C7 D6 02         [ 7]  166 	sub	a, #0x02
   43C9 20 09         [12]  167 	jr	NZ,00104$
                            168 ;src/main.c:114: cpct_setBorder(2);
   43CB 21 10 02      [10]  169 	ld	hl, #0x0210
   43CE E5            [11]  170 	push	hl
   43CF CD 75 62      [17]  171 	call	_cpct_setPALColour
   43D2 18 07         [12]  172 	jr	00105$
   43D4                     173 00104$:
                            174 ;src/main.c:116: cpct_setBorder(3);
   43D4 21 10 03      [10]  175 	ld	hl, #0x0310
   43D7 E5            [11]  176 	push	hl
   43D8 CD 75 62      [17]  177 	call	_cpct_setPALColour
   43DB                     178 00105$:
                            179 ;src/main.c:125: if (intCounter==5) {
   43DB FD 21 C2 65   [14]  180 	ld	iy, #_intCounter
   43DF FD 7E 00      [19]  181 	ld	a, 0 (iy)
   43E2 D6 05         [ 7]  182 	sub	a, #0x05
   43E4 20 5B         [12]  183 	jr	NZ,00107$
                            184 ;src/main.c:155: __endasm;
   43E6 01 06 BC      [10]  185 	ld	bc,#0xbc06
   43E9 ED 49         [12]  186 	out	(c),c
   43EB 01 04 BD      [10]  187 	ld	bc,#0xbd04
   43EE ED 49         [12]  188 	out	(c),c
                            189 ;src/main.c:157: screen_location++;
   43F0 FD 21 BE 65   [14]  190 	ld	iy, #_screen_location
   43F4 FD 34 00      [23]  191 	inc	0 (iy)
   43F7 20 03         [12]  192 	jr	NZ,00140$
   43F9 FD 34 01      [23]  193 	inc	1 (iy)
   43FC                     194 00140$:
                            195 ;src/main.c:158: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   43FC 2A BE 65      [16]  196 	ld	hl, (_screen_location)
   43FF 7C            [ 4]  197 	ld	a, h
   4400 E6 23         [ 7]  198 	and	a, #0x23
   4402 67            [ 4]  199 	ld	h, a
   4403 22 BE 65      [16]  200 	ld	(_screen_location), hl
                            201 ;src/main.c:159: crtc(screen_location);
   4406 2A BE 65      [16]  202 	ld	hl, (_screen_location)
   4409 E5            [11]  203 	push	hl
   440A CD 92 43      [17]  204 	call	_crtc
   440D F1            [10]  205 	pop	af
                            206 ;src/main.c:161: screen_plot_address++;
   440E FD 21 C0 65   [14]  207 	ld	iy, #_screen_plot_address
   4412 FD 34 00      [23]  208 	inc	0 (iy)
   4415 20 03         [12]  209 	jr	NZ,00141$
   4417 FD 34 01      [23]  210 	inc	1 (iy)
   441A                     211 00141$:
                            212 ;src/main.c:162: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   441A 2A C0 65      [16]  213 	ld	hl, (_screen_plot_address)
   441D 7C            [ 4]  214 	ld	a, h
   441E E6 87         [ 7]  215 	and	a, #0x87
   4420 67            [ 4]  216 	ld	h, a
   4421 22 C0 65      [16]  217 	ld	(_screen_plot_address), hl
                            218 ;src/main.c:163: screen_plot_address++;
   4424 FD 34 00      [23]  219 	inc	0 (iy)
   4427 20 03         [12]  220 	jr	NZ,00142$
   4429 FD 34 01      [23]  221 	inc	1 (iy)
   442C                     222 00142$:
                            223 ;src/main.c:164: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   442C 2A C0 65      [16]  224 	ld	hl, (_screen_plot_address)
   442F 7C            [ 4]  225 	ld	a, h
   4430 E6 87         [ 7]  226 	and	a, #0x87
   4432 67            [ 4]  227 	ld	h, a
   4433 22 C0 65      [16]  228 	ld	(_screen_plot_address), hl
                            229 ;src/main.c:167: killVBL();
   4436 CD 8F 47      [17]  230 	call	_killVBL
                            231 ;src/main.c:168: rupture(19-1);
   4439 3E 12         [ 7]  232 	ld	a, #0x12
   443B F5            [11]  233 	push	af
   443C 33            [ 6]  234 	inc	sp
   443D CD AC 47      [17]  235 	call	_rupture
   4440 33            [ 6]  236 	inc	sp
   4441                     237 00107$:
                            238 ;src/main.c:173: if (intCounter==2) {
   4441 FD 21 C2 65   [14]  239 	ld	iy, #_intCounter
   4445 FD 7E 00      [19]  240 	ld	a, 0 (iy)
   4448 D6 02         [ 7]  241 	sub	a, #0x02
   444A 20 1A         [12]  242 	jr	NZ,00109$
                            243 ;src/main.c:179: __endasm;
   444C 01 06 BC      [10]  244 	ld	bc,#0xbc06
   444F ED 49         [12]  245 	out	(c),c
   4451 01 19 BD      [10]  246 	ld	bc,#0xbd19
   4454 ED 49         [12]  247 	out	(c),c
                            248 ;src/main.c:180: calqueC000();
   4456 CD ED 46      [17]  249 	call	_calqueC000
                            250 ;src/main.c:181: cpct_setVideoMemoryOffset(0);
   4459 2E 00         [ 7]  251 	ld	l, #0x00
   445B CD 81 62      [17]  252 	call	_cpct_setVideoMemoryOffset
                            253 ;src/main.c:182: rupture(7);
   445E 3E 07         [ 7]  254 	ld	a, #0x07
   4460 F5            [11]  255 	push	af
   4461 33            [ 6]  256 	inc	sp
   4462 CD AC 47      [17]  257 	call	_rupture
   4465 33            [ 6]  258 	inc	sp
   4466                     259 00109$:
                            260 ;src/main.c:185: if (intCounter==3) {
   4466 3A C2 65      [13]  261 	ld	a,(#_intCounter + 0)
   4469 D6 03         [ 7]  262 	sub	a, #0x03
   446B C0            [11]  263 	ret	NZ
                            264 ;src/main.c:186: calqueC000();
   446C CD ED 46      [17]  265 	call	_calqueC000
                            266 ;src/main.c:187: cpct_setVideoMemoryOffset(0);
   446F 2E 00         [ 7]  267 	ld	l, #0x00
   4471 CD 81 62      [17]  268 	call	_cpct_setVideoMemoryOffset
                            269 ;src/main.c:188: restoreVBL();
   4474 CD A0 47      [17]  270 	call	_restoreVBL
                            271 ;src/main.c:189: rupture(39-19-7+1);
   4477 3E 0E         [ 7]  272 	ld	a, #0x0e
   4479 F5            [11]  273 	push	af
   447A 33            [ 6]  274 	inc	sp
   447B CD AC 47      [17]  275 	call	_rupture
   447E 33            [ 6]  276 	inc	sp
   447F C9            [10]  277 	ret
                            278 ;src/main.c:195: void main(void) {
                            279 ;	---------------------------------
                            280 ; Function main
                            281 ; ---------------------------------
   4480                     282 _main::
   4480 DD E5         [15]  283 	push	ix
   4482 DD 21 00 00   [14]  284 	ld	ix,#0
   4486 DD 39         [15]  285 	add	ix,sp
   4488 F5            [11]  286 	push	af
                            287 ;src/main.c:197: int s=0;
   4489 01 00 00      [10]  288 	ld	bc, #0x0000
                            289 ;src/main.c:199: u8* sprite=g_items_0;
                            290 ;src/main.c:202: int texte_cur=0;
   448C 21 00 00      [10]  291 	ld	hl, #0x0000
   448F E3            [19]  292 	ex	(sp), hl
                            293 ;src/main.c:218: cpct_disableFirmware();
   4490 C5            [11]  294 	push	bc
   4491 CD 21 64      [17]  295 	call	_cpct_disableFirmware
   4494 21 00 10      [10]  296 	ld	hl, #0x1000
   4497 E5            [11]  297 	push	hl
   4498 26 80         [ 7]  298 	ld	h, #0x80
   449A E5            [11]  299 	push	hl
   449B 26 70         [ 7]  300 	ld	h, #0x70
   449D E5            [11]  301 	push	hl
   449E CD 19 64      [17]  302 	call	_cpct_memcpy
   44A1 21 00 70      [10]  303 	ld	hl, #0x7000
   44A4 CD A6 63      [17]  304 	call	_cpct_setStackLocation
   44A7 21 00 40      [10]  305 	ld	hl, #0x4000
   44AA E5            [11]  306 	push	hl
   44AB 26 00         [ 7]  307 	ld	h, #0x00
   44AD E5            [11]  308 	push	hl
   44AE 26 80         [ 7]  309 	ld	h, #0x80
   44B0 E5            [11]  310 	push	hl
   44B1 CD 5E 63      [17]  311 	call	_cpct_memset_f64
   44B4 CD 19 47      [17]  312 	call	_bank0123
   44B7 2E 00         [ 7]  313 	ld	l, #0x00
   44B9 CD EF 63      [17]  314 	call	_cpct_setVideoMode
   44BC 21 10 14      [10]  315 	ld	hl, #0x1410
   44BF E5            [11]  316 	push	hl
   44C0 CD 75 62      [17]  317 	call	_cpct_setPALColour
   44C3 21 06 00      [10]  318 	ld	hl, #0x0006
   44C6 E5            [11]  319 	push	hl
   44C7 21 CC 47      [10]  320 	ld	hl, #_g_tile_palette
   44CA E5            [11]  321 	push	hl
   44CB CD 5E 62      [17]  322 	call	_cpct_setPalette
   44CE 21 0F 0F      [10]  323 	ld	hl, #0x0f0f
   44D1 E5            [11]  324 	push	hl
   44D2 21 00 C0      [10]  325 	ld	hl, #0xc000
   44D5 E5            [11]  326 	push	hl
   44D6 CD 03 65      [17]  327 	call	_cpct_getScreenPtr
   44D9 C1            [10]  328 	pop	bc
                            329 ;src/main.c:248: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
   44DA E5            [11]  330 	push	hl
   44DB C5            [11]  331 	push	bc
   44DC 11 00 20      [10]  332 	ld	de, #0x2000
   44DF D5            [11]  333 	push	de
   44E0 11 FF FF      [10]  334 	ld	de, #0xffff
   44E3 D5            [11]  335 	push	de
   44E4 11 00 C0      [10]  336 	ld	de, #0xc000
   44E7 D5            [11]  337 	push	de
   44E8 CD 5E 63      [17]  338 	call	_cpct_memset_f64
   44EB 11 72 43      [10]  339 	ld	de, #_g_items_0
   44EE D5            [11]  340 	push	de
   44EF 11 04 08      [10]  341 	ld	de, #0x0804
   44F2 D5            [11]  342 	push	de
   44F3 CD AB 63      [17]  343 	call	_cpct_hflipSpriteM0
   44F6 C1            [10]  344 	pop	bc
   44F7 E1            [10]  345 	pop	hl
                            346 ;src/main.c:252: cpct_drawSprite(sprite, p, 4, 8);
   44F8 C5            [11]  347 	push	bc
   44F9 11 04 08      [10]  348 	ld	de, #0x0804
   44FC D5            [11]  349 	push	de
   44FD E5            [11]  350 	push	hl
   44FE 21 72 43      [10]  351 	ld	hl, #_g_items_0
   4501 E5            [11]  352 	push	hl
   4502 CD 8A 62      [17]  353 	call	_cpct_drawSprite
   4505 21 0F 1F      [10]  354 	ld	hl, #0x1f0f
   4508 E5            [11]  355 	push	hl
   4509 21 00 C0      [10]  356 	ld	hl, #0xc000
   450C E5            [11]  357 	push	hl
   450D CD 03 65      [17]  358 	call	_cpct_getScreenPtr
   4510 C1            [10]  359 	pop	bc
                            360 ;src/main.c:256: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   4511 E5            [11]  361 	push	hl
   4512 C5            [11]  362 	push	bc
   4513 11 02 03      [10]  363 	ld	de, #0x0302
   4516 D5            [11]  364 	push	de
   4517 CD FD 63      [17]  365 	call	_cpct_px2byteM0
   451A 55            [ 4]  366 	ld	d, l
   451B C1            [10]  367 	pop	bc
   451C FD E1         [14]  368 	pop	iy
   451E C5            [11]  369 	push	bc
   451F 21 0A 14      [10]  370 	ld	hl, #0x140a
   4522 E5            [11]  371 	push	hl
   4523 D5            [11]  372 	push	de
   4524 33            [ 6]  373 	inc	sp
   4525 FD E5         [15]  374 	push	iy
   4527 CD 31 64      [17]  375 	call	_cpct_drawSolidBox
   452A F1            [10]  376 	pop	af
   452B F1            [10]  377 	pop	af
   452C 33            [ 6]  378 	inc	sp
   452D 21 09 4F      [10]  379 	ld	hl, #0x4f09
   4530 E5            [11]  380 	push	hl
   4531 21 00 C0      [10]  381 	ld	hl, #0xc000
   4534 E5            [11]  382 	push	hl
   4535 CD 03 65      [17]  383 	call	_cpct_getScreenPtr
   4538 EB            [ 4]  384 	ex	de,hl
   4539 21 10 20      [10]  385 	ld	hl, #0x2010
   453C E5            [11]  386 	push	hl
   453D D5            [11]  387 	push	de
   453E 21 D2 47      [10]  388 	ld	hl, #_g_tile_schtroumpf
   4541 E5            [11]  389 	push	hl
   4542 CD 2F 63      [17]  390 	call	_cpct_drawSpriteMasked
   4545 CD ED 46      [17]  391 	call	_calqueC000
   4548 CD F8 46      [17]  392 	call	_calque8000
   454B C1            [10]  393 	pop	bc
                            394 ;src/main.c:310: screen_location=(u8 *)(0x2000);
   454C 21 00 20      [10]  395 	ld	hl, #0x2000
   454F 22 BE 65      [16]  396 	ld	(_screen_location), hl
                            397 ;src/main.c:311: screen_plot_address=(u8 *)(0x8000+80-2);
   4552 21 4E 80      [10]  398 	ld	hl, #0x804e
   4555 22 C0 65      [16]  399 	ld	(_screen_plot_address), hl
                            400 ;src/main.c:312: t=0;
   4558 11 00 00      [10]  401 	ld	de, #0x0000
                            402 ;src/main.c:313: while (1) {
   455B                     403 00110$:
                            404 ;src/main.c:316: wait_frame_flyback();
   455B C5            [11]  405 	push	bc
   455C D5            [11]  406 	push	de
   455D CD 6A 43      [17]  407 	call	_wait_frame_flyback
   4560 D1            [10]  408 	pop	de
   4561 C1            [10]  409 	pop	bc
                            410 ;src/main.c:320: screen_location++;
   4562 FD 21 BE 65   [14]  411 	ld	iy, #_screen_location
   4566 FD 34 00      [23]  412 	inc	0 (iy)
   4569 20 03         [12]  413 	jr	NZ,00134$
   456B FD 34 01      [23]  414 	inc	1 (iy)
   456E                     415 00134$:
                            416 ;src/main.c:321: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   456E 2A BE 65      [16]  417 	ld	hl, (_screen_location)
   4571 7C            [ 4]  418 	ld	a, h
   4572 E6 23         [ 7]  419 	and	a, #0x23
   4574 67            [ 4]  420 	ld	h, a
   4575 22 BE 65      [16]  421 	ld	(_screen_location), hl
                            422 ;src/main.c:322: crtc(screen_location);
   4578 C5            [11]  423 	push	bc
   4579 D5            [11]  424 	push	de
   457A 2A BE 65      [16]  425 	ld	hl, (_screen_location)
   457D E5            [11]  426 	push	hl
   457E CD 92 43      [17]  427 	call	_crtc
   4581 F1            [10]  428 	pop	af
   4582 D1            [10]  429 	pop	de
   4583 C1            [10]  430 	pop	bc
                            431 ;src/main.c:324: screen_plot_address++;
   4584 FD 21 C0 65   [14]  432 	ld	iy, #_screen_plot_address
   4588 FD 34 00      [23]  433 	inc	0 (iy)
   458B 20 03         [12]  434 	jr	NZ,00135$
   458D FD 34 01      [23]  435 	inc	1 (iy)
   4590                     436 00135$:
                            437 ;src/main.c:325: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4590 2A C0 65      [16]  438 	ld	hl, (_screen_plot_address)
   4593 7C            [ 4]  439 	ld	a, h
   4594 E6 87         [ 7]  440 	and	a, #0x87
   4596 67            [ 4]  441 	ld	h, a
   4597 22 C0 65      [16]  442 	ld	(_screen_plot_address), hl
                            443 ;src/main.c:326: screen_plot_address++;
   459A FD 34 00      [23]  444 	inc	0 (iy)
   459D 20 03         [12]  445 	jr	NZ,00136$
   459F FD 34 01      [23]  446 	inc	1 (iy)
   45A2                     447 00136$:
                            448 ;src/main.c:327: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   45A2 2A C0 65      [16]  449 	ld	hl, (_screen_plot_address)
   45A5 7C            [ 4]  450 	ld	a, h
   45A6 E6 87         [ 7]  451 	and	a, #0x87
   45A8 67            [ 4]  452 	ld	h, a
   45A9 22 C0 65      [16]  453 	ld	(_screen_plot_address), hl
                            454 ;src/main.c:331: s=s+1;
   45AC 03            [ 6]  455 	inc	bc
                            456 ;src/main.c:332: if (s==8) {s=0;}
   45AD 79            [ 4]  457 	ld	a, c
   45AE D6 08         [ 7]  458 	sub	a, #0x08
   45B0 B0            [ 4]  459 	or	a, b
   45B1 20 03         [12]  460 	jr	NZ,00102$
   45B3 01 00 00      [10]  461 	ld	bc, #0x0000
   45B6                     462 00102$:
                            463 ;src/main.c:333: if (s==0) {texte_cur=texte_cur+1; if (texte_cur==texte_length) {texte_cur=0;}}
   45B6 78            [ 4]  464 	ld	a, b
   45B7 B1            [ 4]  465 	or	a,c
   45B8 20 16         [12]  466 	jr	NZ,00106$
   45BA DD 34 FE      [23]  467 	inc	-2 (ix)
   45BD 20 03         [12]  468 	jr	NZ,00139$
   45BF DD 34 FF      [23]  469 	inc	-1 (ix)
   45C2                     470 00139$:
   45C2 DD 7E FE      [19]  471 	ld	a, -2 (ix)
   45C5 D6 10         [ 7]  472 	sub	a, #0x10
   45C7 DD B6 FF      [19]  473 	or	a, -1 (ix)
   45CA 20 04         [12]  474 	jr	NZ,00106$
   45CC 21 00 00      [10]  475 	ld	hl, #0x0000
   45CF E3            [19]  476 	ex	(sp), hl
   45D0                     477 00106$:
                            478 ;src/main.c:342: scroll_hard("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t,screen_plot_address);
   45D0 C5            [11]  479 	push	bc
   45D1 D5            [11]  480 	push	de
   45D2 2A C0 65      [16]  481 	ld	hl, (_screen_plot_address)
   45D5 E5            [11]  482 	push	hl
   45D6 D5            [11]  483 	push	de
   45D7 21 6E 00      [10]  484 	ld	hl, #0x006e
   45DA E5            [11]  485 	push	hl
   45DB 21 FE 45      [10]  486 	ld	hl, #___str_0
   45DE E5            [11]  487 	push	hl
   45DF CD 06 04      [17]  488 	call	_scroll_hard
   45E2 21 08 00      [10]  489 	ld	hl, #8
   45E5 39            [11]  490 	add	hl, sp
   45E6 F9            [ 6]  491 	ld	sp, hl
   45E7 D1            [10]  492 	pop	de
   45E8 C1            [10]  493 	pop	bc
                            494 ;src/main.c:343: t=t+1;
   45E9 13            [ 6]  495 	inc	de
                            496 ;src/main.c:344: if (t>110*G_TILE_FONTMAP32X32PLAT_000_W+160) {t=0;}
   45EA 3E 7C         [ 7]  497 	ld	a, #0x7c
   45EC BB            [ 4]  498 	cp	a, e
   45ED 3E 01         [ 7]  499 	ld	a, #0x01
   45EF 9A            [ 4]  500 	sbc	a, d
   45F0 E2 F5 45      [10]  501 	jp	PO, 00142$
   45F3 EE 80         [ 7]  502 	xor	a, #0x80
   45F5                     503 00142$:
   45F5 F2 5B 45      [10]  504 	jp	P, 00110$
   45F8 11 00 00      [10]  505 	ld	de, #0x0000
   45FB C3 5B 45      [10]  506 	jp	00110$
   45FE                     507 ___str_0:
   45FE 57 45 20 57 49 53   508 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   463A 57 45 20 57 49 53   509 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   466C 00                  510 	.db 0x00
                            511 	.area _CODE
                            512 	.area _INITIALIZER
   65CB                     513 __xinit__intCounter:
   65CB 00                  514 	.db #0x00	; 0
   65CC                     515 __xinit__hOffset:
   65CC 00 00               516 	.dw #0x0000
   65CE                     517 __xinit__slow:
   65CE 00                  518 	.db #0x00	; 0
                            519 	.area _CABS (ABS)
