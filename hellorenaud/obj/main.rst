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
                             18 	.globl _rupture
                             19 	.globl _restoreVBL
                             20 	.globl _killVBL
                             21 	.globl _cpct_getScreenPtr
                             22 	.globl _cpct_setVideoMemoryOffset
                             23 	.globl _cpct_setPALColour
                             24 	.globl _cpct_setPalette
                             25 	.globl _cpct_setVideoMode
                             26 	.globl _cpct_hflipSpriteM0
                             27 	.globl _cpct_drawSolidBox
                             28 	.globl _cpct_drawSpriteMasked
                             29 	.globl _cpct_drawSprite
                             30 	.globl _cpct_px2byteM0
                             31 	.globl _cpct_setStackLocation
                             32 	.globl _cpct_memcpy
                             33 	.globl _cpct_memset_f64
                             34 	.globl _cpct_disableFirmware
                             35 	.globl _slow
                             36 	.globl _hOffset
                             37 	.globl _intCounter
                             38 	.globl _screen_plot_address
                             39 	.globl _screen_location
                             40 	.globl _g_items_0
                             41 ;--------------------------------------------------------
                             42 ; special function registers
                             43 ;--------------------------------------------------------
                             44 ;--------------------------------------------------------
                             45 ; ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DATA
   64C2                      48 _screen_location::
   64C2                      49 	.ds 2
   64C4                      50 _screen_plot_address::
   64C4                      51 	.ds 2
                             52 ;--------------------------------------------------------
                             53 ; ram data
                             54 ;--------------------------------------------------------
                             55 	.area _INITIALIZED
   64C6                      56 _intCounter::
   64C6                      57 	.ds 1
   64C7                      58 _hOffset::
   64C7                      59 	.ds 2
   64C9                      60 _slow::
   64C9                      61 	.ds 1
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
                             82 ;src/main.c:67: void wait_frame_flyback() {
                             83 ;	---------------------------------
                             84 ; Function wait_frame_flyback
                             85 ; ---------------------------------
   42D1                      86 _wait_frame_flyback::
                             87 ;src/main.c:73: __endasm;
   42D1 06 F5         [ 7]   88 	ld	b,#0xf5 ;wait frame flyback
   42D3                      89 	l1:
   42D3 ED 78         [12]   90 	in a,(c)
   42D5 1F            [ 4]   91 	rra
   42D6 30 FB         [12]   92 	jr	nc,l1
   42D8 C9            [10]   93 	ret
   42D9                      94 _g_items_0:
   42D9 05                   95 	.db #0x05	; 5
   42DA 0F                   96 	.db #0x0f	; 15
   42DB 0F                   97 	.db #0x0f	; 15
   42DC 00                   98 	.db #0x00	; 0
   42DD 0F                   99 	.db #0x0f	; 15
   42DE 0F                  100 	.db #0x0f	; 15
   42DF 0F                  101 	.db #0x0f	; 15
   42E0 0A                  102 	.db #0x0a	; 10
   42E1 0F                  103 	.db #0x0f	; 15
   42E2 0A                  104 	.db #0x0a	; 10
   42E3 05                  105 	.db #0x05	; 5
   42E4 00                  106 	.db #0x00	; 0
   42E5 0F                  107 	.db #0x0f	; 15
   42E6 0A                  108 	.db #0x0a	; 10
   42E7 05                  109 	.db #0x05	; 5
   42E8 00                  110 	.db #0x00	; 0
   42E9 05                  111 	.db #0x05	; 5
   42EA 0F                  112 	.db #0x0f	; 15
   42EB 0A                  113 	.db #0x0a	; 10
   42EC 0A                  114 	.db #0x0a	; 10
   42ED 00                  115 	.db #0x00	; 0
   42EE 0F                  116 	.db #0x0f	; 15
   42EF 0F                  117 	.db #0x0f	; 15
   42F0 0A                  118 	.db #0x0a	; 10
   42F1 00                  119 	.db #0x00	; 0
   42F2 0A                  120 	.db #0x0a	; 10
   42F3 0A                  121 	.db #0x0a	; 10
   42F4 0A                  122 	.db #0x0a	; 10
   42F5 00                  123 	.db #0x00	; 0
   42F6 00                  124 	.db #0x00	; 0
   42F7 00                  125 	.db #0x00	; 0
   42F8 00                  126 	.db #0x00	; 0
                            127 ;src/main.c:76: void crtc(u8* R12R13) {
                            128 ;	---------------------------------
                            129 ; Function crtc
                            130 ; ---------------------------------
   42F9                     131 _crtc::
                            132 ;src/main.c:93: __endasm;
   42F9 DD E5         [15]  133 	push	ix
   42FB DD 21 00 00   [14]  134 	ld	ix,#0
   42FF DD 39         [15]  135 	add	ix,sp
   4301 DD 66 05      [19]  136 	ld	h, 5 (ix)
   4304 DD 6E 04      [19]  137 	ld	l, 4 (ix)
   4307 01 0C BC      [10]  138 	ld	bc,#0xbc00+12
   430A ED 49         [12]  139 	out	(c),c
   430C 04            [ 4]  140 	inc	b
   430D ED 61         [12]  141 	out	(c),h
   430F 05            [ 4]  142 	dec	b
   4310 0C            [ 4]  143 	inc	c
   4311 ED 49         [12]  144 	out	(c),c
   4313 04            [ 4]  145 	inc	b
   4314 ED 69         [12]  146 	out	(c),l
   4316 DD E1         [14]  147 	pop	ix
   4318 C9            [10]  148 	ret
                            149 ;src/main.c:106: void myInterruptHandler() {
                            150 ;	---------------------------------
                            151 ; Function myInterruptHandler
                            152 ; ---------------------------------
   4319                     153 _myInterruptHandler::
                            154 ;src/main.c:109: intCounter=intCounter+1;
   4319 FD 21 C6 64   [14]  155 	ld	iy, #_intCounter
   431D FD 34 00      [23]  156 	inc	0 (iy)
                            157 ;src/main.c:110: if (intCounter == 6) intCounter=0;
   4320 FD 7E 00      [19]  158 	ld	a, 0 (iy)
   4323 D6 06         [ 7]  159 	sub	a, #0x06
   4325 20 04         [12]  160 	jr	NZ,00102$
   4327 FD 36 00 00   [19]  161 	ld	0 (iy), #0x00
   432B                     162 00102$:
                            163 ;src/main.c:112: if (intCounter == 2) {
   432B 3A C6 64      [13]  164 	ld	a,(#_intCounter + 0)
   432E D6 02         [ 7]  165 	sub	a, #0x02
   4330 20 09         [12]  166 	jr	NZ,00104$
                            167 ;src/main.c:113: cpct_setBorder(2);
   4332 21 10 02      [10]  168 	ld	hl, #0x0210
   4335 E5            [11]  169 	push	hl
   4336 CD 79 61      [17]  170 	call	_cpct_setPALColour
   4339 18 07         [12]  171 	jr	00105$
   433B                     172 00104$:
                            173 ;src/main.c:115: cpct_setBorder(3);
   433B 21 10 03      [10]  174 	ld	hl, #0x0310
   433E E5            [11]  175 	push	hl
   433F CD 79 61      [17]  176 	call	_cpct_setPALColour
   4342                     177 00105$:
                            178 ;src/main.c:124: if (intCounter==5) {
   4342 FD 21 C6 64   [14]  179 	ld	iy, #_intCounter
   4346 FD 7E 00      [19]  180 	ld	a, 0 (iy)
   4349 D6 05         [ 7]  181 	sub	a, #0x05
   434B 20 5B         [12]  182 	jr	NZ,00107$
                            183 ;src/main.c:154: __endasm;
   434D 01 06 BC      [10]  184 	ld	bc,#0xbc06
   4350 ED 49         [12]  185 	out	(c),c
   4352 01 04 BD      [10]  186 	ld	bc,#0xbd04
   4355 ED 49         [12]  187 	out	(c),c
                            188 ;src/main.c:156: screen_location++;
   4357 FD 21 C2 64   [14]  189 	ld	iy, #_screen_location
   435B FD 34 00      [23]  190 	inc	0 (iy)
   435E 20 03         [12]  191 	jr	NZ,00140$
   4360 FD 34 01      [23]  192 	inc	1 (iy)
   4363                     193 00140$:
                            194 ;src/main.c:157: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4363 2A C2 64      [16]  195 	ld	hl, (_screen_location)
   4366 7C            [ 4]  196 	ld	a, h
   4367 E6 23         [ 7]  197 	and	a, #0x23
   4369 67            [ 4]  198 	ld	h, a
   436A 22 C2 64      [16]  199 	ld	(_screen_location), hl
                            200 ;src/main.c:158: crtc(screen_location);
   436D 2A C2 64      [16]  201 	ld	hl, (_screen_location)
   4370 E5            [11]  202 	push	hl
   4371 CD F9 42      [17]  203 	call	_crtc
   4374 F1            [10]  204 	pop	af
                            205 ;src/main.c:160: screen_plot_address++;
   4375 FD 21 C4 64   [14]  206 	ld	iy, #_screen_plot_address
   4379 FD 34 00      [23]  207 	inc	0 (iy)
   437C 20 03         [12]  208 	jr	NZ,00141$
   437E FD 34 01      [23]  209 	inc	1 (iy)
   4381                     210 00141$:
                            211 ;src/main.c:161: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4381 2A C4 64      [16]  212 	ld	hl, (_screen_plot_address)
   4384 7C            [ 4]  213 	ld	a, h
   4385 E6 87         [ 7]  214 	and	a, #0x87
   4387 67            [ 4]  215 	ld	h, a
   4388 22 C4 64      [16]  216 	ld	(_screen_plot_address), hl
                            217 ;src/main.c:162: screen_plot_address++;
   438B FD 34 00      [23]  218 	inc	0 (iy)
   438E 20 03         [12]  219 	jr	NZ,00142$
   4390 FD 34 01      [23]  220 	inc	1 (iy)
   4393                     221 00142$:
                            222 ;src/main.c:163: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4393 2A C4 64      [16]  223 	ld	hl, (_screen_plot_address)
   4396 7C            [ 4]  224 	ld	a, h
   4397 E6 87         [ 7]  225 	and	a, #0x87
   4399 67            [ 4]  226 	ld	h, a
   439A 22 C4 64      [16]  227 	ld	(_screen_plot_address), hl
                            228 ;src/main.c:166: killVBL();
   439D CD 93 46      [17]  229 	call	_killVBL
                            230 ;src/main.c:167: rupture(19-1);
   43A0 3E 12         [ 7]  231 	ld	a, #0x12
   43A2 F5            [11]  232 	push	af
   43A3 33            [ 6]  233 	inc	sp
   43A4 CD B0 46      [17]  234 	call	_rupture
   43A7 33            [ 6]  235 	inc	sp
   43A8                     236 00107$:
                            237 ;src/main.c:172: if (intCounter==2) {
   43A8 FD 21 C6 64   [14]  238 	ld	iy, #_intCounter
   43AC FD 7E 00      [19]  239 	ld	a, 0 (iy)
   43AF D6 02         [ 7]  240 	sub	a, #0x02
   43B1 20 1A         [12]  241 	jr	NZ,00109$
                            242 ;src/main.c:178: __endasm;
   43B3 01 06 BC      [10]  243 	ld	bc,#0xbc06
   43B6 ED 49         [12]  244 	out	(c),c
   43B8 01 19 BD      [10]  245 	ld	bc,#0xbd19
   43BB ED 49         [12]  246 	out	(c),c
                            247 ;src/main.c:179: calqueC000();
   43BD CD F1 45      [17]  248 	call	_calqueC000
                            249 ;src/main.c:180: cpct_setVideoMemoryOffset(0);
   43C0 2E 00         [ 7]  250 	ld	l, #0x00
   43C2 CD 85 61      [17]  251 	call	_cpct_setVideoMemoryOffset
                            252 ;src/main.c:181: rupture(7);
   43C5 3E 07         [ 7]  253 	ld	a, #0x07
   43C7 F5            [11]  254 	push	af
   43C8 33            [ 6]  255 	inc	sp
   43C9 CD B0 46      [17]  256 	call	_rupture
   43CC 33            [ 6]  257 	inc	sp
   43CD                     258 00109$:
                            259 ;src/main.c:184: if (intCounter==3) {
   43CD 3A C6 64      [13]  260 	ld	a,(#_intCounter + 0)
   43D0 D6 03         [ 7]  261 	sub	a, #0x03
   43D2 C0            [11]  262 	ret	NZ
                            263 ;src/main.c:185: calqueC000();
   43D3 CD F1 45      [17]  264 	call	_calqueC000
                            265 ;src/main.c:186: cpct_setVideoMemoryOffset(0);
   43D6 2E 00         [ 7]  266 	ld	l, #0x00
   43D8 CD 85 61      [17]  267 	call	_cpct_setVideoMemoryOffset
                            268 ;src/main.c:187: restoreVBL();
   43DB CD A4 46      [17]  269 	call	_restoreVBL
                            270 ;src/main.c:188: rupture(39-19-7+1);
   43DE 3E 0E         [ 7]  271 	ld	a, #0x0e
   43E0 F5            [11]  272 	push	af
   43E1 33            [ 6]  273 	inc	sp
   43E2 CD B0 46      [17]  274 	call	_rupture
   43E5 33            [ 6]  275 	inc	sp
   43E6 C9            [10]  276 	ret
                            277 ;src/main.c:193: void main(void) {
                            278 ;	---------------------------------
                            279 ; Function main
                            280 ; ---------------------------------
   43E7                     281 _main::
   43E7 DD E5         [15]  282 	push	ix
   43E9 DD 21 00 00   [14]  283 	ld	ix,#0
   43ED DD 39         [15]  284 	add	ix,sp
   43EF F5            [11]  285 	push	af
                            286 ;src/main.c:195: int s=0;
   43F0 01 00 00      [10]  287 	ld	bc, #0x0000
                            288 ;src/main.c:197: u8* sprite=g_items_0;
                            289 ;src/main.c:201: int o=0;
   43F3 21 00 00      [10]  290 	ld	hl, #0x0000
   43F6 E3            [19]  291 	ex	(sp), hl
                            292 ;src/main.c:216: cpct_disableFirmware();
   43F7 C5            [11]  293 	push	bc
   43F8 CD 25 63      [17]  294 	call	_cpct_disableFirmware
   43FB 21 00 10      [10]  295 	ld	hl, #0x1000
   43FE E5            [11]  296 	push	hl
   43FF 26 80         [ 7]  297 	ld	h, #0x80
   4401 E5            [11]  298 	push	hl
   4402 26 70         [ 7]  299 	ld	h, #0x70
   4404 E5            [11]  300 	push	hl
   4405 CD 1D 63      [17]  301 	call	_cpct_memcpy
   4408 21 00 70      [10]  302 	ld	hl, #0x7000
   440B CD AA 62      [17]  303 	call	_cpct_setStackLocation
   440E 21 00 40      [10]  304 	ld	hl, #0x4000
   4411 E5            [11]  305 	push	hl
   4412 26 00         [ 7]  306 	ld	h, #0x00
   4414 E5            [11]  307 	push	hl
   4415 26 80         [ 7]  308 	ld	h, #0x80
   4417 E5            [11]  309 	push	hl
   4418 CD 62 62      [17]  310 	call	_cpct_memset_f64
   441B CD 1D 46      [17]  311 	call	_bank0123
   441E 2E 00         [ 7]  312 	ld	l, #0x00
   4420 CD F3 62      [17]  313 	call	_cpct_setVideoMode
   4423 21 10 14      [10]  314 	ld	hl, #0x1410
   4426 E5            [11]  315 	push	hl
   4427 CD 79 61      [17]  316 	call	_cpct_setPALColour
   442A 21 06 00      [10]  317 	ld	hl, #0x0006
   442D E5            [11]  318 	push	hl
   442E 21 D0 46      [10]  319 	ld	hl, #_g_tile_palette
   4431 E5            [11]  320 	push	hl
   4432 CD 62 61      [17]  321 	call	_cpct_setPalette
   4435 21 0F 0F      [10]  322 	ld	hl, #0x0f0f
   4438 E5            [11]  323 	push	hl
   4439 21 00 C0      [10]  324 	ld	hl, #0xc000
   443C E5            [11]  325 	push	hl
   443D CD 07 64      [17]  326 	call	_cpct_getScreenPtr
   4440 C1            [10]  327 	pop	bc
                            328 ;src/main.c:246: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
   4441 E5            [11]  329 	push	hl
   4442 C5            [11]  330 	push	bc
   4443 11 00 20      [10]  331 	ld	de, #0x2000
   4446 D5            [11]  332 	push	de
   4447 11 FF FF      [10]  333 	ld	de, #0xffff
   444A D5            [11]  334 	push	de
   444B 11 00 C0      [10]  335 	ld	de, #0xc000
   444E D5            [11]  336 	push	de
   444F CD 62 62      [17]  337 	call	_cpct_memset_f64
   4452 11 D9 42      [10]  338 	ld	de, #_g_items_0
   4455 D5            [11]  339 	push	de
   4456 11 04 08      [10]  340 	ld	de, #0x0804
   4459 D5            [11]  341 	push	de
   445A CD AF 62      [17]  342 	call	_cpct_hflipSpriteM0
   445D C1            [10]  343 	pop	bc
   445E E1            [10]  344 	pop	hl
                            345 ;src/main.c:250: cpct_drawSprite(sprite, p, 4, 8);
   445F C5            [11]  346 	push	bc
   4460 11 04 08      [10]  347 	ld	de, #0x0804
   4463 D5            [11]  348 	push	de
   4464 E5            [11]  349 	push	hl
   4465 21 D9 42      [10]  350 	ld	hl, #_g_items_0
   4468 E5            [11]  351 	push	hl
   4469 CD 8E 61      [17]  352 	call	_cpct_drawSprite
   446C 21 0F 1F      [10]  353 	ld	hl, #0x1f0f
   446F E5            [11]  354 	push	hl
   4470 21 00 C0      [10]  355 	ld	hl, #0xc000
   4473 E5            [11]  356 	push	hl
   4474 CD 07 64      [17]  357 	call	_cpct_getScreenPtr
   4477 C1            [10]  358 	pop	bc
                            359 ;src/main.c:254: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   4478 E5            [11]  360 	push	hl
   4479 C5            [11]  361 	push	bc
   447A 11 02 03      [10]  362 	ld	de, #0x0302
   447D D5            [11]  363 	push	de
   447E CD 01 63      [17]  364 	call	_cpct_px2byteM0
   4481 55            [ 4]  365 	ld	d, l
   4482 C1            [10]  366 	pop	bc
   4483 FD E1         [14]  367 	pop	iy
   4485 C5            [11]  368 	push	bc
   4486 21 0A 14      [10]  369 	ld	hl, #0x140a
   4489 E5            [11]  370 	push	hl
   448A D5            [11]  371 	push	de
   448B 33            [ 6]  372 	inc	sp
   448C FD E5         [15]  373 	push	iy
   448E CD 35 63      [17]  374 	call	_cpct_drawSolidBox
   4491 F1            [10]  375 	pop	af
   4492 F1            [10]  376 	pop	af
   4493 33            [ 6]  377 	inc	sp
   4494 21 09 4F      [10]  378 	ld	hl, #0x4f09
   4497 E5            [11]  379 	push	hl
   4498 21 00 C0      [10]  380 	ld	hl, #0xc000
   449B E5            [11]  381 	push	hl
   449C CD 07 64      [17]  382 	call	_cpct_getScreenPtr
   449F EB            [ 4]  383 	ex	de,hl
   44A0 21 10 20      [10]  384 	ld	hl, #0x2010
   44A3 E5            [11]  385 	push	hl
   44A4 D5            [11]  386 	push	de
   44A5 21 D6 46      [10]  387 	ld	hl, #_g_tile_schtroumpf
   44A8 E5            [11]  388 	push	hl
   44A9 CD 33 62      [17]  389 	call	_cpct_drawSpriteMasked
   44AC CD F1 45      [17]  390 	call	_calqueC000
   44AF CD FC 45      [17]  391 	call	_calque8000
   44B2 C1            [10]  392 	pop	bc
                            393 ;src/main.c:308: screen_location=(u8 *)(0x2000);
   44B3 21 00 20      [10]  394 	ld	hl, #0x2000
   44B6 22 C2 64      [16]  395 	ld	(_screen_location), hl
                            396 ;src/main.c:309: screen_plot_address=(u8 *)(0x8000+80-2);
   44B9 21 4E 80      [10]  397 	ld	hl, #0x804e
   44BC 22 C4 64      [16]  398 	ld	(_screen_plot_address), hl
                            399 ;src/main.c:311: while (1) {
   44BF                     400 00107$:
                            401 ;src/main.c:314: wait_frame_flyback();
   44BF C5            [11]  402 	push	bc
   44C0 CD D1 42      [17]  403 	call	_wait_frame_flyback
   44C3 C1            [10]  404 	pop	bc
                            405 ;src/main.c:318: screen_location++;
   44C4 FD 21 C2 64   [14]  406 	ld	iy, #_screen_location
   44C8 FD 34 00      [23]  407 	inc	0 (iy)
   44CB 20 03         [12]  408 	jr	NZ,00135$
   44CD FD 34 01      [23]  409 	inc	1 (iy)
   44D0                     410 00135$:
                            411 ;src/main.c:319: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   44D0 2A C2 64      [16]  412 	ld	hl, (_screen_location)
   44D3 7C            [ 4]  413 	ld	a, h
   44D4 E6 23         [ 7]  414 	and	a, #0x23
   44D6 67            [ 4]  415 	ld	h, a
   44D7 22 C2 64      [16]  416 	ld	(_screen_location), hl
                            417 ;src/main.c:320: crtc(screen_location);
   44DA C5            [11]  418 	push	bc
   44DB 2A C2 64      [16]  419 	ld	hl, (_screen_location)
   44DE E5            [11]  420 	push	hl
   44DF CD F9 42      [17]  421 	call	_crtc
   44E2 F1            [10]  422 	pop	af
   44E3 C1            [10]  423 	pop	bc
                            424 ;src/main.c:322: screen_plot_address++;
   44E4 FD 21 C4 64   [14]  425 	ld	iy, #_screen_plot_address
   44E8 FD 34 00      [23]  426 	inc	0 (iy)
   44EB 20 03         [12]  427 	jr	NZ,00136$
   44ED FD 34 01      [23]  428 	inc	1 (iy)
   44F0                     429 00136$:
                            430 ;src/main.c:323: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   44F0 2A C4 64      [16]  431 	ld	hl, (_screen_plot_address)
   44F3 7C            [ 4]  432 	ld	a, h
   44F4 E6 87         [ 7]  433 	and	a, #0x87
   44F6 67            [ 4]  434 	ld	h, a
   44F7 22 C4 64      [16]  435 	ld	(_screen_plot_address), hl
                            436 ;src/main.c:324: screen_plot_address++;
   44FA FD 34 00      [23]  437 	inc	0 (iy)
   44FD 20 03         [12]  438 	jr	NZ,00137$
   44FF FD 34 01      [23]  439 	inc	1 (iy)
   4502                     440 00137$:
                            441 ;src/main.c:325: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4502 2A C4 64      [16]  442 	ld	hl, (_screen_plot_address)
   4505 7C            [ 4]  443 	ld	a, h
   4506 E6 87         [ 7]  444 	and	a, #0x87
   4508 67            [ 4]  445 	ld	h, a
   4509 22 C4 64      [16]  446 	ld	(_screen_plot_address), hl
                            447 ;src/main.c:329: s=s+1;
   450C 03            [ 6]  448 	inc	bc
                            449 ;src/main.c:330: if (s==8) {s=0;}
   450D 79            [ 4]  450 	ld	a, c
   450E D6 08         [ 7]  451 	sub	a, #0x08
   4510 B0            [ 4]  452 	or	a, b
   4511 20 03         [12]  453 	jr	NZ,00102$
   4513 01 00 00      [10]  454 	ld	bc, #0x0000
   4516                     455 00102$:
                            456 ;src/main.c:336: o=o+1;//(texte[texte_cur]-'?')*8+s;
   4516 DD 34 FE      [23]  457 	inc	-2 (ix)
   4519 20 03         [12]  458 	jr	NZ,00140$
   451B DD 34 FF      [23]  459 	inc	-1 (ix)
   451E                     460 00140$:
                            461 ;src/main.c:337: if (o==8) {o=0;}
   451E DD 7E FE      [19]  462 	ld	a, -2 (ix)
   4521 D6 08         [ 7]  463 	sub	a, #0x08
   4523 DD B6 FF      [19]  464 	or	a, -1 (ix)
   4526 20 04         [12]  465 	jr	NZ,00104$
   4528 21 00 00      [10]  466 	ld	hl, #0x0000
   452B E3            [19]  467 	ex	(sp), hl
   452C                     468 00104$:
                            469 ;src/main.c:339: pointeur=(u8 *)g_tile_fontmap32x32plat_000;
                            470 ;src/main.c:340: pointeur=pointeur+8*(32*2);
   452C 11 E6 07      [10]  471 	ld	de, #_g_tile_fontmap32x32plat_000 + 512
                            472 ;src/main.c:341: for (oc=0;oc<o;oc++) {
   452F 21 00 00      [10]  473 	ld	hl, #0x0000
   4532                     474 00110$:
   4532 7D            [ 4]  475 	ld	a, l
   4533 DD 96 FE      [19]  476 	sub	a, -2 (ix)
   4536 7C            [ 4]  477 	ld	a, h
   4537 DD 9E FF      [19]  478 	sbc	a, -1 (ix)
   453A E2 3F 45      [10]  479 	jp	PO, 00143$
   453D EE 80         [ 7]  480 	xor	a, #0x80
   453F                     481 00143$:
   453F F2 4D 45      [10]  482 	jp	P, 00119$
                            483 ;src/main.c:342: pointeur=pointeur+(32*2);
   4542 7B            [ 4]  484 	ld	a, e
   4543 C6 40         [ 7]  485 	add	a, #0x40
   4545 5F            [ 4]  486 	ld	e, a
   4546 7A            [ 4]  487 	ld	a, d
   4547 CE 00         [ 7]  488 	adc	a, #0x00
   4549 57            [ 4]  489 	ld	d, a
                            490 ;src/main.c:341: for (oc=0;oc<o;oc++) {
   454A 23            [ 6]  491 	inc	hl
   454B 18 E5         [12]  492 	jr	00110$
   454D                     493 00119$:
                            494 ;src/main.c:344: cpct_drawSprite(pointeur, screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   454D FD 2A C4 64   [20]  495 	ld	iy, (_screen_plot_address)
   4551 C5            [11]  496 	push	bc
   4552 21 02 20      [10]  497 	ld	hl, #0x2002
   4555 E5            [11]  498 	push	hl
   4556 FD E5         [15]  499 	push	iy
   4558 D5            [11]  500 	push	de
   4559 CD 8E 61      [17]  501 	call	_cpct_drawSprite
   455C C1            [10]  502 	pop	bc
   455D C3 BF 44      [10]  503 	jp	00107$
   4560                     504 ___str_0:
   4560 48 45 4C 4C 4F 40   505 	.ascii "HELLO@LES@AMIS@@"
        4C 45 53 40 41 4D
        49 53 40 40
   4570 00                  506 	.db 0x00
                            507 	.area _CODE
                            508 	.area _INITIALIZER
   64CF                     509 __xinit__intCounter:
   64CF 00                  510 	.db #0x00	; 0
   64D0                     511 __xinit__hOffset:
   64D0 00 00               512 	.dw #0x0000
   64D2                     513 __xinit__slow:
   64D2 00                  514 	.db #0x00	; 0
                            515 	.area _CABS (ABS)
