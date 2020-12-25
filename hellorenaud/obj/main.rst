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
                             35 	.globl _cpct_setInterruptHandler
                             36 	.globl _cpct_disableFirmware
                             37 	.globl _slow
                             38 	.globl _hOffset
                             39 	.globl _intCounter
                             40 	.globl _screen_plot_address
                             41 	.globl _screen_location
                             42 	.globl _g_items_0
                             43 ;--------------------------------------------------------
                             44 ; special function registers
                             45 ;--------------------------------------------------------
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DATA
   6567                      50 _screen_location::
   6567                      51 	.ds 2
   6569                      52 _screen_plot_address::
   6569                      53 	.ds 2
                             54 ;--------------------------------------------------------
                             55 ; ram data
                             56 ;--------------------------------------------------------
                             57 	.area _INITIALIZED
   656B                      58 _intCounter::
   656B                      59 	.ds 1
   656C                      60 _hOffset::
   656C                      61 	.ds 2
   656E                      62 _slow::
   656E                      63 	.ds 1
                             64 ;--------------------------------------------------------
                             65 ; absolute external ram data
                             66 ;--------------------------------------------------------
                             67 	.area _DABS (ABS)
                             68 ;--------------------------------------------------------
                             69 ; global & static initialisations
                             70 ;--------------------------------------------------------
                             71 	.area _HOME
                             72 	.area _GSINIT
                             73 	.area _GSFINAL
                             74 	.area _GSINIT
                             75 ;--------------------------------------------------------
                             76 ; Home
                             77 ;--------------------------------------------------------
                             78 	.area _HOME
                             79 	.area _HOME
                             80 ;--------------------------------------------------------
                             81 ; code
                             82 ;--------------------------------------------------------
                             83 	.area _CODE
                             84 ;src/main.c:68: void wait_frame_flyback() {
                             85 ;	---------------------------------
                             86 ; Function wait_frame_flyback
                             87 ; ---------------------------------
   4374                      88 _wait_frame_flyback::
                             89 ;src/main.c:74: __endasm;
   4374 06 F5         [ 7]   90 	ld	b,#0xf5 ;wait frame flyback
   4376                      91 	l1:
   4376 ED 78         [12]   92 	in a,(c)
   4378 1F            [ 4]   93 	rra
   4379 30 FB         [12]   94 	jr	nc,l1
   437B C9            [10]   95 	ret
   437C                      96 _g_items_0:
   437C 05                   97 	.db #0x05	; 5
   437D 0F                   98 	.db #0x0f	; 15
   437E 0F                   99 	.db #0x0f	; 15
   437F 00                  100 	.db #0x00	; 0
   4380 0F                  101 	.db #0x0f	; 15
   4381 0F                  102 	.db #0x0f	; 15
   4382 0F                  103 	.db #0x0f	; 15
   4383 0A                  104 	.db #0x0a	; 10
   4384 0F                  105 	.db #0x0f	; 15
   4385 0A                  106 	.db #0x0a	; 10
   4386 05                  107 	.db #0x05	; 5
   4387 00                  108 	.db #0x00	; 0
   4388 0F                  109 	.db #0x0f	; 15
   4389 0A                  110 	.db #0x0a	; 10
   438A 05                  111 	.db #0x05	; 5
   438B 00                  112 	.db #0x00	; 0
   438C 05                  113 	.db #0x05	; 5
   438D 0F                  114 	.db #0x0f	; 15
   438E 0A                  115 	.db #0x0a	; 10
   438F 0A                  116 	.db #0x0a	; 10
   4390 00                  117 	.db #0x00	; 0
   4391 0F                  118 	.db #0x0f	; 15
   4392 0F                  119 	.db #0x0f	; 15
   4393 0A                  120 	.db #0x0a	; 10
   4394 00                  121 	.db #0x00	; 0
   4395 0A                  122 	.db #0x0a	; 10
   4396 0A                  123 	.db #0x0a	; 10
   4397 0A                  124 	.db #0x0a	; 10
   4398 00                  125 	.db #0x00	; 0
   4399 00                  126 	.db #0x00	; 0
   439A 00                  127 	.db #0x00	; 0
   439B 00                  128 	.db #0x00	; 0
                            129 ;src/main.c:77: void crtc(u8* R12R13) {
                            130 ;	---------------------------------
                            131 ; Function crtc
                            132 ; ---------------------------------
   439C                     133 _crtc::
                            134 ;src/main.c:94: __endasm;
   439C DD E5         [15]  135 	push	ix
   439E DD 21 00 00   [14]  136 	ld	ix,#0
   43A2 DD 39         [15]  137 	add	ix,sp
   43A4 DD 66 05      [19]  138 	ld	h, 5 (ix)
   43A7 DD 6E 04      [19]  139 	ld	l, 4 (ix)
   43AA 01 0C BC      [10]  140 	ld	bc,#0xbc00+12
   43AD ED 49         [12]  141 	out	(c),c
   43AF 04            [ 4]  142 	inc	b
   43B0 ED 61         [12]  143 	out	(c),h
   43B2 05            [ 4]  144 	dec	b
   43B3 0C            [ 4]  145 	inc	c
   43B4 ED 49         [12]  146 	out	(c),c
   43B6 04            [ 4]  147 	inc	b
   43B7 ED 69         [12]  148 	out	(c),l
   43B9 DD E1         [14]  149 	pop	ix
   43BB C9            [10]  150 	ret
                            151 ;src/main.c:107: void myInterruptHandler() {
                            152 ;	---------------------------------
                            153 ; Function myInterruptHandler
                            154 ; ---------------------------------
   43BC                     155 _myInterruptHandler::
                            156 ;src/main.c:110: intCounter=intCounter+1;
   43BC FD 21 6B 65   [14]  157 	ld	iy, #_intCounter
   43C0 FD 34 00      [23]  158 	inc	0 (iy)
                            159 ;src/main.c:111: if (intCounter == 6) intCounter=0;
   43C3 FD 7E 00      [19]  160 	ld	a, 0 (iy)
   43C6 D6 06         [ 7]  161 	sub	a, #0x06
   43C8 20 04         [12]  162 	jr	NZ,00102$
   43CA FD 36 00 00   [19]  163 	ld	0 (iy), #0x00
   43CE                     164 00102$:
                            165 ;src/main.c:113: if (intCounter == 2) {
   43CE 3A 6B 65      [13]  166 	ld	a,(#_intCounter + 0)
   43D1 D6 02         [ 7]  167 	sub	a, #0x02
   43D3 20 09         [12]  168 	jr	NZ,00104$
                            169 ;src/main.c:114: cpct_setBorder(2);
   43D5 21 10 02      [10]  170 	ld	hl, #0x0210
   43D8 E5            [11]  171 	push	hl
   43D9 CD F6 61      [17]  172 	call	_cpct_setPALColour
   43DC 18 07         [12]  173 	jr	00105$
   43DE                     174 00104$:
                            175 ;src/main.c:116: cpct_setBorder(3);
   43DE 21 10 03      [10]  176 	ld	hl, #0x0310
   43E1 E5            [11]  177 	push	hl
   43E2 CD F6 61      [17]  178 	call	_cpct_setPALColour
   43E5                     179 00105$:
                            180 ;src/main.c:125: if (intCounter==5) {
   43E5 FD 21 6B 65   [14]  181 	ld	iy, #_intCounter
   43E9 FD 7E 00      [19]  182 	ld	a, 0 (iy)
   43EC D6 05         [ 7]  183 	sub	a, #0x05
   43EE 20 5B         [12]  184 	jr	NZ,00107$
                            185 ;src/main.c:155: __endasm;
   43F0 01 06 BC      [10]  186 	ld	bc,#0xbc06
   43F3 ED 49         [12]  187 	out	(c),c
   43F5 01 04 BD      [10]  188 	ld	bc,#0xbd04
   43F8 ED 49         [12]  189 	out	(c),c
                            190 ;src/main.c:157: screen_location++;
   43FA FD 21 67 65   [14]  191 	ld	iy, #_screen_location
   43FE FD 34 00      [23]  192 	inc	0 (iy)
   4401 20 03         [12]  193 	jr	NZ,00140$
   4403 FD 34 01      [23]  194 	inc	1 (iy)
   4406                     195 00140$:
                            196 ;src/main.c:158: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4406 2A 67 65      [16]  197 	ld	hl, (_screen_location)
   4409 7C            [ 4]  198 	ld	a, h
   440A E6 23         [ 7]  199 	and	a, #0x23
   440C 67            [ 4]  200 	ld	h, a
   440D 22 67 65      [16]  201 	ld	(_screen_location), hl
                            202 ;src/main.c:159: crtc(screen_location);
   4410 2A 67 65      [16]  203 	ld	hl, (_screen_location)
   4413 E5            [11]  204 	push	hl
   4414 CD 9C 43      [17]  205 	call	_crtc
   4417 F1            [10]  206 	pop	af
                            207 ;src/main.c:161: screen_plot_address++;
   4418 FD 21 69 65   [14]  208 	ld	iy, #_screen_plot_address
   441C FD 34 00      [23]  209 	inc	0 (iy)
   441F 20 03         [12]  210 	jr	NZ,00141$
   4421 FD 34 01      [23]  211 	inc	1 (iy)
   4424                     212 00141$:
                            213 ;src/main.c:162: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4424 2A 69 65      [16]  214 	ld	hl, (_screen_plot_address)
   4427 7C            [ 4]  215 	ld	a, h
   4428 E6 87         [ 7]  216 	and	a, #0x87
   442A 67            [ 4]  217 	ld	h, a
   442B 22 69 65      [16]  218 	ld	(_screen_plot_address), hl
                            219 ;src/main.c:163: screen_plot_address++;
   442E FD 34 00      [23]  220 	inc	0 (iy)
   4431 20 03         [12]  221 	jr	NZ,00142$
   4433 FD 34 01      [23]  222 	inc	1 (iy)
   4436                     223 00142$:
                            224 ;src/main.c:164: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4436 2A 69 65      [16]  225 	ld	hl, (_screen_plot_address)
   4439 7C            [ 4]  226 	ld	a, h
   443A E6 87         [ 7]  227 	and	a, #0x87
   443C 67            [ 4]  228 	ld	h, a
   443D 22 69 65      [16]  229 	ld	(_screen_plot_address), hl
                            230 ;src/main.c:167: killVBL();
   4440 CD 10 47      [17]  231 	call	_killVBL
                            232 ;src/main.c:168: rupture(19-1);
   4443 3E 12         [ 7]  233 	ld	a, #0x12
   4445 F5            [11]  234 	push	af
   4446 33            [ 6]  235 	inc	sp
   4447 CD 2D 47      [17]  236 	call	_rupture
   444A 33            [ 6]  237 	inc	sp
   444B                     238 00107$:
                            239 ;src/main.c:173: if (intCounter==2) {
   444B FD 21 6B 65   [14]  240 	ld	iy, #_intCounter
   444F FD 7E 00      [19]  241 	ld	a, 0 (iy)
   4452 D6 02         [ 7]  242 	sub	a, #0x02
   4454 20 1A         [12]  243 	jr	NZ,00109$
                            244 ;src/main.c:179: __endasm;
   4456 01 06 BC      [10]  245 	ld	bc,#0xbc06
   4459 ED 49         [12]  246 	out	(c),c
   445B 01 19 BD      [10]  247 	ld	bc,#0xbd19
   445E ED 49         [12]  248 	out	(c),c
                            249 ;src/main.c:180: calqueC000();
   4460 CD 6E 46      [17]  250 	call	_calqueC000
                            251 ;src/main.c:181: cpct_setVideoMemoryOffset(0);
   4463 2E 00         [ 7]  252 	ld	l, #0x00
   4465 CD 02 62      [17]  253 	call	_cpct_setVideoMemoryOffset
                            254 ;src/main.c:182: rupture(7);
   4468 3E 07         [ 7]  255 	ld	a, #0x07
   446A F5            [11]  256 	push	af
   446B 33            [ 6]  257 	inc	sp
   446C CD 2D 47      [17]  258 	call	_rupture
   446F 33            [ 6]  259 	inc	sp
   4470                     260 00109$:
                            261 ;src/main.c:185: if (intCounter==3) {
   4470 3A 6B 65      [13]  262 	ld	a,(#_intCounter + 0)
   4473 D6 03         [ 7]  263 	sub	a, #0x03
   4475 C0            [11]  264 	ret	NZ
                            265 ;src/main.c:186: calqueC000();
   4476 CD 6E 46      [17]  266 	call	_calqueC000
                            267 ;src/main.c:187: cpct_setVideoMemoryOffset(0);
   4479 2E 00         [ 7]  268 	ld	l, #0x00
   447B CD 02 62      [17]  269 	call	_cpct_setVideoMemoryOffset
                            270 ;src/main.c:188: restoreVBL();
   447E CD 21 47      [17]  271 	call	_restoreVBL
                            272 ;src/main.c:189: rupture(39-19-7+1);
   4481 3E 0E         [ 7]  273 	ld	a, #0x0e
   4483 F5            [11]  274 	push	af
   4484 33            [ 6]  275 	inc	sp
   4485 CD 2D 47      [17]  276 	call	_rupture
   4488 33            [ 6]  277 	inc	sp
   4489 C9            [10]  278 	ret
                            279 ;src/main.c:195: void main(void) {
                            280 ;	---------------------------------
                            281 ; Function main
                            282 ; ---------------------------------
   448A                     283 _main::
                            284 ;src/main.c:199: u8* sprite=g_items_0;
                            285 ;src/main.c:218: cpct_disableFirmware();
   448A CD A2 63      [17]  286 	call	_cpct_disableFirmware
                            287 ;src/main.c:219: cpct_memcpy(0x7000,0x8000,0x1000);
   448D 21 00 10      [10]  288 	ld	hl, #0x1000
   4490 E5            [11]  289 	push	hl
   4491 26 80         [ 7]  290 	ld	h, #0x80
   4493 E5            [11]  291 	push	hl
   4494 26 70         [ 7]  292 	ld	h, #0x70
   4496 E5            [11]  293 	push	hl
   4497 CD 9A 63      [17]  294 	call	_cpct_memcpy
                            295 ;src/main.c:220: cpct_setStackLocation(0x7000);
   449A 21 00 70      [10]  296 	ld	hl, #0x7000
   449D CD 27 63      [17]  297 	call	_cpct_setStackLocation
                            298 ;src/main.c:221: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   44A0 21 00 40      [10]  299 	ld	hl, #0x4000
   44A3 E5            [11]  300 	push	hl
   44A4 26 00         [ 7]  301 	ld	h, #0x00
   44A6 E5            [11]  302 	push	hl
   44A7 26 80         [ 7]  303 	ld	h, #0x80
   44A9 E5            [11]  304 	push	hl
   44AA CD DF 62      [17]  305 	call	_cpct_memset_f64
                            306 ;src/main.c:223: cpct_setInterruptHandler(myInterruptHandler);
   44AD 21 BC 43      [10]  307 	ld	hl, #_myInterruptHandler
   44B0 CD A4 64      [17]  308 	call	_cpct_setInterruptHandler
                            309 ;src/main.c:228: bank0123();
   44B3 CD 9A 46      [17]  310 	call	_bank0123
                            311 ;src/main.c:233: cpct_setVideoMode(0);
   44B6 2E 00         [ 7]  312 	ld	l, #0x00
   44B8 CD 70 63      [17]  313 	call	_cpct_setVideoMode
                            314 ;src/main.c:235: cpct_setBorder(HW_BLACK);
   44BB 21 10 14      [10]  315 	ld	hl, #0x1410
   44BE E5            [11]  316 	push	hl
   44BF CD F6 61      [17]  317 	call	_cpct_setPALColour
                            318 ;src/main.c:237: cpct_setPalette(g_tile_palette, 6);
   44C2 21 06 00      [10]  319 	ld	hl, #0x0006
   44C5 E5            [11]  320 	push	hl
   44C6 21 4D 47      [10]  321 	ld	hl, #_g_tile_palette
   44C9 E5            [11]  322 	push	hl
   44CA CD DF 61      [17]  323 	call	_cpct_setPalette
                            324 ;src/main.c:243: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   44CD 21 0F 0F      [10]  325 	ld	hl, #0x0f0f
   44D0 E5            [11]  326 	push	hl
   44D1 21 00 C0      [10]  327 	ld	hl, #0xc000
   44D4 E5            [11]  328 	push	hl
   44D5 CD 84 64      [17]  329 	call	_cpct_getScreenPtr
                            330 ;src/main.c:248: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
   44D8 E5            [11]  331 	push	hl
   44D9 01 00 20      [10]  332 	ld	bc, #0x2000
   44DC C5            [11]  333 	push	bc
   44DD 01 FF FF      [10]  334 	ld	bc, #0xffff
   44E0 C5            [11]  335 	push	bc
   44E1 01 00 C0      [10]  336 	ld	bc, #0xc000
   44E4 C5            [11]  337 	push	bc
   44E5 CD DF 62      [17]  338 	call	_cpct_memset_f64
   44E8 E1            [10]  339 	pop	hl
                            340 ;src/main.c:251: cpct_hflipSpriteM0(4, 8, sprite);
   44E9 01 7C 43      [10]  341 	ld	bc, #_g_items_0
   44EC E5            [11]  342 	push	hl
   44ED C5            [11]  343 	push	bc
   44EE C5            [11]  344 	push	bc
   44EF 11 04 08      [10]  345 	ld	de, #0x0804
   44F2 D5            [11]  346 	push	de
   44F3 CD 2C 63      [17]  347 	call	_cpct_hflipSpriteM0
   44F6 C1            [10]  348 	pop	bc
   44F7 E1            [10]  349 	pop	hl
                            350 ;src/main.c:252: cpct_drawSprite(sprite, p, 4, 8);
   44F8 11 04 08      [10]  351 	ld	de, #0x0804
   44FB D5            [11]  352 	push	de
   44FC E5            [11]  353 	push	hl
   44FD C5            [11]  354 	push	bc
   44FE CD 0B 62      [17]  355 	call	_cpct_drawSprite
                            356 ;src/main.c:254: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   4501 21 0F 1F      [10]  357 	ld	hl, #0x1f0f
   4504 E5            [11]  358 	push	hl
   4505 21 00 C0      [10]  359 	ld	hl, #0xc000
   4508 E5            [11]  360 	push	hl
   4509 CD 84 64      [17]  361 	call	_cpct_getScreenPtr
                            362 ;src/main.c:256: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   450C E5            [11]  363 	push	hl
   450D 21 02 03      [10]  364 	ld	hl, #0x0302
   4510 E5            [11]  365 	push	hl
   4511 CD 7E 63      [17]  366 	call	_cpct_px2byteM0
   4514 55            [ 4]  367 	ld	d, l
   4515 C1            [10]  368 	pop	bc
   4516 21 0A 14      [10]  369 	ld	hl, #0x140a
   4519 E5            [11]  370 	push	hl
   451A D5            [11]  371 	push	de
   451B 33            [ 6]  372 	inc	sp
   451C C5            [11]  373 	push	bc
   451D CD B2 63      [17]  374 	call	_cpct_drawSolidBox
   4520 F1            [10]  375 	pop	af
   4521 F1            [10]  376 	pop	af
   4522 33            [ 6]  377 	inc	sp
                            378 ;src/main.c:259: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   4523 21 09 4F      [10]  379 	ld	hl, #0x4f09
   4526 E5            [11]  380 	push	hl
   4527 21 00 C0      [10]  381 	ld	hl, #0xc000
   452A E5            [11]  382 	push	hl
   452B CD 84 64      [17]  383 	call	_cpct_getScreenPtr
                            384 ;src/main.c:260: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   452E 01 53 47      [10]  385 	ld	bc, #_g_tile_schtroumpf+0
   4531 11 10 20      [10]  386 	ld	de, #0x2010
   4534 D5            [11]  387 	push	de
   4535 E5            [11]  388 	push	hl
   4536 C5            [11]  389 	push	bc
   4537 CD B0 62      [17]  390 	call	_cpct_drawSpriteMasked
                            391 ;src/main.c:299: calqueC000();
   453A CD 6E 46      [17]  392 	call	_calqueC000
                            393 ;src/main.c:308: calque8000(); // faut que le AND du début match
   453D CD 79 46      [17]  394 	call	_calque8000
                            395 ;src/main.c:310: screen_location=(u8 *)(0x2000);
   4540 21 00 20      [10]  396 	ld	hl, #0x2000
   4543 22 67 65      [16]  397 	ld	(_screen_location), hl
                            398 ;src/main.c:311: screen_plot_address=(u8 *)(0x8000+80-2);
   4546 21 4E 80      [10]  399 	ld	hl, #0x804e
   4549 22 69 65      [16]  400 	ld	(_screen_plot_address), hl
                            401 ;src/main.c:312: t=0;
   454C 01 00 00      [10]  402 	ld	bc, #0x0000
                            403 ;src/main.c:313: while (1) {
   454F                     404 00104$:
                            405 ;src/main.c:316: wait_frame_flyback();
   454F C5            [11]  406 	push	bc
   4550 CD 74 43      [17]  407 	call	_wait_frame_flyback
   4553 C1            [10]  408 	pop	bc
                            409 ;src/main.c:327: scroll_hard("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t,screen_plot_address);
   4554 C5            [11]  410 	push	bc
   4555 2A 69 65      [16]  411 	ld	hl, (_screen_plot_address)
   4558 E5            [11]  412 	push	hl
   4559 C5            [11]  413 	push	bc
   455A 21 6E 00      [10]  414 	ld	hl, #0x006e
   455D E5            [11]  415 	push	hl
   455E 21 7F 45      [10]  416 	ld	hl, #___str_0
   4561 E5            [11]  417 	push	hl
   4562 CD 06 04      [17]  418 	call	_scroll_hard
   4565 21 08 00      [10]  419 	ld	hl, #8
   4568 39            [11]  420 	add	hl, sp
   4569 F9            [ 6]  421 	ld	sp, hl
   456A C1            [10]  422 	pop	bc
                            423 ;src/main.c:328: t=t+1;
   456B 03            [ 6]  424 	inc	bc
                            425 ;src/main.c:329: if (t>110*G_TILE_FONTMAP32X32PLAT_000_W+160) {t=0;}
   456C 3E 7C         [ 7]  426 	ld	a, #0x7c
   456E B9            [ 4]  427 	cp	a, c
   456F 3E 01         [ 7]  428 	ld	a, #0x01
   4571 98            [ 4]  429 	sbc	a, b
   4572 E2 77 45      [10]  430 	jp	PO, 00116$
   4575 EE 80         [ 7]  431 	xor	a, #0x80
   4577                     432 00116$:
   4577 F2 4F 45      [10]  433 	jp	P, 00104$
   457A 01 00 00      [10]  434 	ld	bc, #0x0000
   457D 18 D0         [12]  435 	jr	00104$
   457F                     436 ___str_0:
   457F 57 45 20 57 49 53   437 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   45BB 57 45 20 57 49 53   438 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR"
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52
   45ED 00                  439 	.db 0x00
                            440 	.area _CODE
                            441 	.area _INITIALIZER
   6574                     442 __xinit__intCounter:
   6574 00                  443 	.db #0x00	; 0
   6575                     444 __xinit__hOffset:
   6575 00 00               445 	.dw #0x0000
   6577                     446 __xinit__slow:
   6577 00                  447 	.db #0x00	; 0
                            448 	.area _CABS (ABS)
