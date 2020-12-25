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
                             12 	.globl _draw
                             13 	.globl _myInterruptHandler
                             14 	.globl _crtc
                             15 	.globl _wait_frame_flyback
                             16 	.globl _bank0123
                             17 	.globl _calque8000
                             18 	.globl _calqueC000
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
   6507                      49 _screen_location::
   6507                      50 	.ds 2
   6509                      51 _screen_plot_address::
   6509                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   650B                      57 _intCounter::
   650B                      58 	.ds 1
   650C                      59 _hOffset::
   650C                      60 	.ds 2
   650E                      61 _slow::
   650E                      62 	.ds 1
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
                             83 ;src/main.c:67: void wait_frame_flyback() {
                             84 ;	---------------------------------
                             85 ; Function wait_frame_flyback
                             86 ; ---------------------------------
   42D1                      87 _wait_frame_flyback::
                             88 ;src/main.c:73: __endasm;
   42D1 06 F5         [ 7]   89 	ld	b,#0xf5 ;wait frame flyback
   42D3                      90 	l1:
   42D3 ED 78         [12]   91 	in a,(c)
   42D5 1F            [ 4]   92 	rra
   42D6 30 FB         [12]   93 	jr	nc,l1
   42D8 C9            [10]   94 	ret
   42D9                      95 _g_items_0:
   42D9 05                   96 	.db #0x05	; 5
   42DA 0F                   97 	.db #0x0f	; 15
   42DB 0F                   98 	.db #0x0f	; 15
   42DC 00                   99 	.db #0x00	; 0
   42DD 0F                  100 	.db #0x0f	; 15
   42DE 0F                  101 	.db #0x0f	; 15
   42DF 0F                  102 	.db #0x0f	; 15
   42E0 0A                  103 	.db #0x0a	; 10
   42E1 0F                  104 	.db #0x0f	; 15
   42E2 0A                  105 	.db #0x0a	; 10
   42E3 05                  106 	.db #0x05	; 5
   42E4 00                  107 	.db #0x00	; 0
   42E5 0F                  108 	.db #0x0f	; 15
   42E6 0A                  109 	.db #0x0a	; 10
   42E7 05                  110 	.db #0x05	; 5
   42E8 00                  111 	.db #0x00	; 0
   42E9 05                  112 	.db #0x05	; 5
   42EA 0F                  113 	.db #0x0f	; 15
   42EB 0A                  114 	.db #0x0a	; 10
   42EC 0A                  115 	.db #0x0a	; 10
   42ED 00                  116 	.db #0x00	; 0
   42EE 0F                  117 	.db #0x0f	; 15
   42EF 0F                  118 	.db #0x0f	; 15
   42F0 0A                  119 	.db #0x0a	; 10
   42F1 00                  120 	.db #0x00	; 0
   42F2 0A                  121 	.db #0x0a	; 10
   42F3 0A                  122 	.db #0x0a	; 10
   42F4 0A                  123 	.db #0x0a	; 10
   42F5 00                  124 	.db #0x00	; 0
   42F6 00                  125 	.db #0x00	; 0
   42F7 00                  126 	.db #0x00	; 0
   42F8 00                  127 	.db #0x00	; 0
                            128 ;src/main.c:76: void crtc(u8* R12R13) {
                            129 ;	---------------------------------
                            130 ; Function crtc
                            131 ; ---------------------------------
   42F9                     132 _crtc::
                            133 ;src/main.c:93: __endasm;
   42F9 DD E5         [15]  134 	push	ix
   42FB DD 21 00 00   [14]  135 	ld	ix,#0
   42FF DD 39         [15]  136 	add	ix,sp
   4301 DD 66 05      [19]  137 	ld	h, 5 (ix)
   4304 DD 6E 04      [19]  138 	ld	l, 4 (ix)
   4307 01 0C BC      [10]  139 	ld	bc,#0xbc00+12
   430A ED 49         [12]  140 	out	(c),c
   430C 04            [ 4]  141 	inc	b
   430D ED 61         [12]  142 	out	(c),h
   430F 05            [ 4]  143 	dec	b
   4310 0C            [ 4]  144 	inc	c
   4311 ED 49         [12]  145 	out	(c),c
   4313 04            [ 4]  146 	inc	b
   4314 ED 69         [12]  147 	out	(c),l
   4316 DD E1         [14]  148 	pop	ix
   4318 C9            [10]  149 	ret
                            150 ;src/main.c:106: void myInterruptHandler() {
                            151 ;	---------------------------------
                            152 ; Function myInterruptHandler
                            153 ; ---------------------------------
   4319                     154 _myInterruptHandler::
                            155 ;src/main.c:109: intCounter=intCounter+1;
   4319 FD 21 0B 65   [14]  156 	ld	iy, #_intCounter
   431D FD 34 00      [23]  157 	inc	0 (iy)
                            158 ;src/main.c:110: if (intCounter == 6) intCounter=0;
   4320 FD 7E 00      [19]  159 	ld	a, 0 (iy)
   4323 D6 06         [ 7]  160 	sub	a, #0x06
   4325 20 04         [12]  161 	jr	NZ,00102$
   4327 FD 36 00 00   [19]  162 	ld	0 (iy), #0x00
   432B                     163 00102$:
                            164 ;src/main.c:112: if (intCounter == 2) {
   432B 3A 0B 65      [13]  165 	ld	a,(#_intCounter + 0)
   432E D6 02         [ 7]  166 	sub	a, #0x02
   4330 20 09         [12]  167 	jr	NZ,00104$
                            168 ;src/main.c:113: cpct_setBorder(2);
   4332 21 10 02      [10]  169 	ld	hl, #0x0210
   4335 E5            [11]  170 	push	hl
   4336 CD BE 61      [17]  171 	call	_cpct_setPALColour
   4339 18 07         [12]  172 	jr	00105$
   433B                     173 00104$:
                            174 ;src/main.c:115: cpct_setBorder(3);
   433B 21 10 03      [10]  175 	ld	hl, #0x0310
   433E E5            [11]  176 	push	hl
   433F CD BE 61      [17]  177 	call	_cpct_setPALColour
   4342                     178 00105$:
                            179 ;src/main.c:124: if (intCounter==5) {
   4342 FD 21 0B 65   [14]  180 	ld	iy, #_intCounter
   4346 FD 7E 00      [19]  181 	ld	a, 0 (iy)
   4349 D6 05         [ 7]  182 	sub	a, #0x05
   434B 20 5B         [12]  183 	jr	NZ,00107$
                            184 ;src/main.c:154: __endasm;
   434D 01 06 BC      [10]  185 	ld	bc,#0xbc06
   4350 ED 49         [12]  186 	out	(c),c
   4352 01 04 BD      [10]  187 	ld	bc,#0xbd04
   4355 ED 49         [12]  188 	out	(c),c
                            189 ;src/main.c:156: screen_location++;
   4357 FD 21 07 65   [14]  190 	ld	iy, #_screen_location
   435B FD 34 00      [23]  191 	inc	0 (iy)
   435E 20 03         [12]  192 	jr	NZ,00140$
   4360 FD 34 01      [23]  193 	inc	1 (iy)
   4363                     194 00140$:
                            195 ;src/main.c:157: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4363 2A 07 65      [16]  196 	ld	hl, (_screen_location)
   4366 7C            [ 4]  197 	ld	a, h
   4367 E6 23         [ 7]  198 	and	a, #0x23
   4369 67            [ 4]  199 	ld	h, a
   436A 22 07 65      [16]  200 	ld	(_screen_location), hl
                            201 ;src/main.c:158: crtc(screen_location);
   436D 2A 07 65      [16]  202 	ld	hl, (_screen_location)
   4370 E5            [11]  203 	push	hl
   4371 CD F9 42      [17]  204 	call	_crtc
   4374 F1            [10]  205 	pop	af
                            206 ;src/main.c:160: screen_plot_address++;
   4375 FD 21 09 65   [14]  207 	ld	iy, #_screen_plot_address
   4379 FD 34 00      [23]  208 	inc	0 (iy)
   437C 20 03         [12]  209 	jr	NZ,00141$
   437E FD 34 01      [23]  210 	inc	1 (iy)
   4381                     211 00141$:
                            212 ;src/main.c:161: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4381 2A 09 65      [16]  213 	ld	hl, (_screen_plot_address)
   4384 7C            [ 4]  214 	ld	a, h
   4385 E6 87         [ 7]  215 	and	a, #0x87
   4387 67            [ 4]  216 	ld	h, a
   4388 22 09 65      [16]  217 	ld	(_screen_plot_address), hl
                            218 ;src/main.c:162: screen_plot_address++;
   438B FD 34 00      [23]  219 	inc	0 (iy)
   438E 20 03         [12]  220 	jr	NZ,00142$
   4390 FD 34 01      [23]  221 	inc	1 (iy)
   4393                     222 00142$:
                            223 ;src/main.c:163: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4393 2A 09 65      [16]  224 	ld	hl, (_screen_plot_address)
   4396 7C            [ 4]  225 	ld	a, h
   4397 E6 87         [ 7]  226 	and	a, #0x87
   4399 67            [ 4]  227 	ld	h, a
   439A 22 09 65      [16]  228 	ld	(_screen_plot_address), hl
                            229 ;src/main.c:166: killVBL();
   439D CD D8 46      [17]  230 	call	_killVBL
                            231 ;src/main.c:167: rupture(19-1);
   43A0 3E 12         [ 7]  232 	ld	a, #0x12
   43A2 F5            [11]  233 	push	af
   43A3 33            [ 6]  234 	inc	sp
   43A4 CD F5 46      [17]  235 	call	_rupture
   43A7 33            [ 6]  236 	inc	sp
   43A8                     237 00107$:
                            238 ;src/main.c:172: if (intCounter==2) {
   43A8 FD 21 0B 65   [14]  239 	ld	iy, #_intCounter
   43AC FD 7E 00      [19]  240 	ld	a, 0 (iy)
   43AF D6 02         [ 7]  241 	sub	a, #0x02
   43B1 20 1A         [12]  242 	jr	NZ,00109$
                            243 ;src/main.c:178: __endasm;
   43B3 01 06 BC      [10]  244 	ld	bc,#0xbc06
   43B6 ED 49         [12]  245 	out	(c),c
   43B8 01 19 BD      [10]  246 	ld	bc,#0xbd19
   43BB ED 49         [12]  247 	out	(c),c
                            248 ;src/main.c:179: calqueC000();
   43BD CD 36 46      [17]  249 	call	_calqueC000
                            250 ;src/main.c:180: cpct_setVideoMemoryOffset(0);
   43C0 2E 00         [ 7]  251 	ld	l, #0x00
   43C2 CD CA 61      [17]  252 	call	_cpct_setVideoMemoryOffset
                            253 ;src/main.c:181: rupture(7);
   43C5 3E 07         [ 7]  254 	ld	a, #0x07
   43C7 F5            [11]  255 	push	af
   43C8 33            [ 6]  256 	inc	sp
   43C9 CD F5 46      [17]  257 	call	_rupture
   43CC 33            [ 6]  258 	inc	sp
   43CD                     259 00109$:
                            260 ;src/main.c:184: if (intCounter==3) {
   43CD 3A 0B 65      [13]  261 	ld	a,(#_intCounter + 0)
   43D0 D6 03         [ 7]  262 	sub	a, #0x03
   43D2 C0            [11]  263 	ret	NZ
                            264 ;src/main.c:185: calqueC000();
   43D3 CD 36 46      [17]  265 	call	_calqueC000
                            266 ;src/main.c:186: cpct_setVideoMemoryOffset(0);
   43D6 2E 00         [ 7]  267 	ld	l, #0x00
   43D8 CD CA 61      [17]  268 	call	_cpct_setVideoMemoryOffset
                            269 ;src/main.c:187: restoreVBL();
   43DB CD E9 46      [17]  270 	call	_restoreVBL
                            271 ;src/main.c:188: rupture(39-19-7+1);
   43DE 3E 0E         [ 7]  272 	ld	a, #0x0e
   43E0 F5            [11]  273 	push	af
   43E1 33            [ 6]  274 	inc	sp
   43E2 CD F5 46      [17]  275 	call	_rupture
   43E5 33            [ 6]  276 	inc	sp
   43E6 C9            [10]  277 	ret
                            278 ;src/main.c:193: void draw(char * texte, int texte_cur, int offset) {
                            279 ;	---------------------------------
                            280 ; Function draw
                            281 ; ---------------------------------
   43E7                     282 _draw::
   43E7 DD E5         [15]  283 	push	ix
   43E9 DD 21 00 00   [14]  284 	ld	ix,#0
   43ED DD 39         [15]  285 	add	ix,sp
                            286 ;src/main.c:194: u16 pointeur=(u16)g_tile_fontmap32x32plat_000;
   43EF 01 E6 05      [10]  287 	ld	bc, #_g_tile_fontmap32x32plat_000+0
                            288 ;src/main.c:195: pointeur = pointeur+(texte[texte_cur]-'A')*(32*2)+2*(32*2);
   43F2 DD 7E 04      [19]  289 	ld	a, 4 (ix)
   43F5 DD 86 06      [19]  290 	add	a, 6 (ix)
   43F8 6F            [ 4]  291 	ld	l, a
   43F9 DD 7E 05      [19]  292 	ld	a, 5 (ix)
   43FC DD 8E 07      [19]  293 	adc	a, 7 (ix)
   43FF 67            [ 4]  294 	ld	h, a
   4400 5E            [ 7]  295 	ld	e, (hl)
   4401 16 00         [ 7]  296 	ld	d, #0x00
   4403 7B            [ 4]  297 	ld	a, e
   4404 C6 BF         [ 7]  298 	add	a, #0xbf
   4406 6F            [ 4]  299 	ld	l, a
   4407 7A            [ 4]  300 	ld	a, d
   4408 CE FF         [ 7]  301 	adc	a, #0xff
   440A 67            [ 4]  302 	ld	h, a
   440B 29            [11]  303 	add	hl, hl
   440C 29            [11]  304 	add	hl, hl
   440D 29            [11]  305 	add	hl, hl
   440E 29            [11]  306 	add	hl, hl
   440F 29            [11]  307 	add	hl, hl
   4410 29            [11]  308 	add	hl, hl
   4411 09            [11]  309 	add	hl,bc
   4412 01 80 00      [10]  310 	ld	bc,#0x0080
   4415 09            [11]  311 	add	hl,bc
   4416 EB            [ 4]  312 	ex	de,hl
                            313 ;src/main.c:196: cpct_drawSprite(pointeur+offset*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
   4417 ED 4B 09 65   [20]  314 	ld	bc, (_screen_plot_address)
   441B DD 6E 08      [19]  315 	ld	l,8 (ix)
   441E DD 66 09      [19]  316 	ld	h,9 (ix)
   4421 29            [11]  317 	add	hl, hl
   4422 29            [11]  318 	add	hl, hl
   4423 29            [11]  319 	add	hl, hl
   4424 29            [11]  320 	add	hl, hl
   4425 29            [11]  321 	add	hl, hl
   4426 29            [11]  322 	add	hl, hl
   4427 19            [11]  323 	add	hl, de
   4428 11 02 20      [10]  324 	ld	de, #0x2002
   442B D5            [11]  325 	push	de
   442C C5            [11]  326 	push	bc
   442D E5            [11]  327 	push	hl
   442E CD D3 61      [17]  328 	call	_cpct_drawSprite
   4431 DD E1         [14]  329 	pop	ix
   4433 C9            [10]  330 	ret
                            331 ;src/main.c:199: void main(void) {
                            332 ;	---------------------------------
                            333 ; Function main
                            334 ; ---------------------------------
   4434                     335 _main::
   4434 DD E5         [15]  336 	push	ix
   4436 DD 21 00 00   [14]  337 	ld	ix,#0
   443A DD 39         [15]  338 	add	ix,sp
   443C F5            [11]  339 	push	af
                            340 ;src/main.c:201: int s=0;
   443D 01 00 00      [10]  341 	ld	bc, #0x0000
                            342 ;src/main.c:203: u8* sprite=g_items_0;
                            343 ;src/main.c:206: int texte_cur=0;
   4440 21 00 00      [10]  344 	ld	hl, #0x0000
   4443 E3            [19]  345 	ex	(sp), hl
                            346 ;src/main.c:222: cpct_disableFirmware();
   4444 C5            [11]  347 	push	bc
   4445 CD 6A 63      [17]  348 	call	_cpct_disableFirmware
   4448 21 00 10      [10]  349 	ld	hl, #0x1000
   444B E5            [11]  350 	push	hl
   444C 26 80         [ 7]  351 	ld	h, #0x80
   444E E5            [11]  352 	push	hl
   444F 26 70         [ 7]  353 	ld	h, #0x70
   4451 E5            [11]  354 	push	hl
   4452 CD 62 63      [17]  355 	call	_cpct_memcpy
   4455 21 00 70      [10]  356 	ld	hl, #0x7000
   4458 CD EF 62      [17]  357 	call	_cpct_setStackLocation
   445B 21 00 40      [10]  358 	ld	hl, #0x4000
   445E E5            [11]  359 	push	hl
   445F 26 00         [ 7]  360 	ld	h, #0x00
   4461 E5            [11]  361 	push	hl
   4462 26 80         [ 7]  362 	ld	h, #0x80
   4464 E5            [11]  363 	push	hl
   4465 CD A7 62      [17]  364 	call	_cpct_memset_f64
   4468 CD 62 46      [17]  365 	call	_bank0123
   446B 2E 00         [ 7]  366 	ld	l, #0x00
   446D CD 38 63      [17]  367 	call	_cpct_setVideoMode
   4470 21 10 14      [10]  368 	ld	hl, #0x1410
   4473 E5            [11]  369 	push	hl
   4474 CD BE 61      [17]  370 	call	_cpct_setPALColour
   4477 21 06 00      [10]  371 	ld	hl, #0x0006
   447A E5            [11]  372 	push	hl
   447B 21 15 47      [10]  373 	ld	hl, #_g_tile_palette
   447E E5            [11]  374 	push	hl
   447F CD A7 61      [17]  375 	call	_cpct_setPalette
   4482 21 0F 0F      [10]  376 	ld	hl, #0x0f0f
   4485 E5            [11]  377 	push	hl
   4486 21 00 C0      [10]  378 	ld	hl, #0xc000
   4489 E5            [11]  379 	push	hl
   448A CD 4C 64      [17]  380 	call	_cpct_getScreenPtr
   448D C1            [10]  381 	pop	bc
                            382 ;src/main.c:252: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
   448E E5            [11]  383 	push	hl
   448F C5            [11]  384 	push	bc
   4490 11 00 20      [10]  385 	ld	de, #0x2000
   4493 D5            [11]  386 	push	de
   4494 11 FF FF      [10]  387 	ld	de, #0xffff
   4497 D5            [11]  388 	push	de
   4498 11 00 C0      [10]  389 	ld	de, #0xc000
   449B D5            [11]  390 	push	de
   449C CD A7 62      [17]  391 	call	_cpct_memset_f64
   449F 11 D9 42      [10]  392 	ld	de, #_g_items_0
   44A2 D5            [11]  393 	push	de
   44A3 11 04 08      [10]  394 	ld	de, #0x0804
   44A6 D5            [11]  395 	push	de
   44A7 CD F4 62      [17]  396 	call	_cpct_hflipSpriteM0
   44AA C1            [10]  397 	pop	bc
   44AB E1            [10]  398 	pop	hl
                            399 ;src/main.c:256: cpct_drawSprite(sprite, p, 4, 8);
   44AC C5            [11]  400 	push	bc
   44AD 11 04 08      [10]  401 	ld	de, #0x0804
   44B0 D5            [11]  402 	push	de
   44B1 E5            [11]  403 	push	hl
   44B2 21 D9 42      [10]  404 	ld	hl, #_g_items_0
   44B5 E5            [11]  405 	push	hl
   44B6 CD D3 61      [17]  406 	call	_cpct_drawSprite
   44B9 21 0F 1F      [10]  407 	ld	hl, #0x1f0f
   44BC E5            [11]  408 	push	hl
   44BD 21 00 C0      [10]  409 	ld	hl, #0xc000
   44C0 E5            [11]  410 	push	hl
   44C1 CD 4C 64      [17]  411 	call	_cpct_getScreenPtr
   44C4 C1            [10]  412 	pop	bc
                            413 ;src/main.c:260: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   44C5 E5            [11]  414 	push	hl
   44C6 C5            [11]  415 	push	bc
   44C7 11 02 03      [10]  416 	ld	de, #0x0302
   44CA D5            [11]  417 	push	de
   44CB CD 46 63      [17]  418 	call	_cpct_px2byteM0
   44CE 55            [ 4]  419 	ld	d, l
   44CF C1            [10]  420 	pop	bc
   44D0 FD E1         [14]  421 	pop	iy
   44D2 C5            [11]  422 	push	bc
   44D3 21 0A 14      [10]  423 	ld	hl, #0x140a
   44D6 E5            [11]  424 	push	hl
   44D7 D5            [11]  425 	push	de
   44D8 33            [ 6]  426 	inc	sp
   44D9 FD E5         [15]  427 	push	iy
   44DB CD 7A 63      [17]  428 	call	_cpct_drawSolidBox
   44DE F1            [10]  429 	pop	af
   44DF F1            [10]  430 	pop	af
   44E0 33            [ 6]  431 	inc	sp
   44E1 21 09 4F      [10]  432 	ld	hl, #0x4f09
   44E4 E5            [11]  433 	push	hl
   44E5 21 00 C0      [10]  434 	ld	hl, #0xc000
   44E8 E5            [11]  435 	push	hl
   44E9 CD 4C 64      [17]  436 	call	_cpct_getScreenPtr
   44EC EB            [ 4]  437 	ex	de,hl
   44ED 21 10 20      [10]  438 	ld	hl, #0x2010
   44F0 E5            [11]  439 	push	hl
   44F1 D5            [11]  440 	push	de
   44F2 21 1B 47      [10]  441 	ld	hl, #_g_tile_schtroumpf
   44F5 E5            [11]  442 	push	hl
   44F6 CD 78 62      [17]  443 	call	_cpct_drawSpriteMasked
   44F9 CD 36 46      [17]  444 	call	_calqueC000
   44FC CD 41 46      [17]  445 	call	_calque8000
   44FF C1            [10]  446 	pop	bc
                            447 ;src/main.c:314: screen_location=(u8 *)(0x2000);
   4500 21 00 20      [10]  448 	ld	hl, #0x2000
   4503 22 07 65      [16]  449 	ld	(_screen_location), hl
                            450 ;src/main.c:315: screen_plot_address=(u8 *)(0x8000+80-2);
   4506 21 4E 80      [10]  451 	ld	hl, #0x804e
   4509 22 09 65      [16]  452 	ld	(_screen_plot_address), hl
                            453 ;src/main.c:317: while (1) {
   450C                     454 00108$:
                            455 ;src/main.c:320: wait_frame_flyback();
   450C C5            [11]  456 	push	bc
   450D CD D1 42      [17]  457 	call	_wait_frame_flyback
   4510 C1            [10]  458 	pop	bc
                            459 ;src/main.c:324: screen_location++;
   4511 FD 21 07 65   [14]  460 	ld	iy, #_screen_location
   4515 FD 34 00      [23]  461 	inc	0 (iy)
   4518 20 03         [12]  462 	jr	NZ,00128$
   451A FD 34 01      [23]  463 	inc	1 (iy)
   451D                     464 00128$:
                            465 ;src/main.c:325: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   451D 2A 07 65      [16]  466 	ld	hl, (_screen_location)
   4520 7C            [ 4]  467 	ld	a, h
   4521 E6 23         [ 7]  468 	and	a, #0x23
   4523 67            [ 4]  469 	ld	h, a
   4524 22 07 65      [16]  470 	ld	(_screen_location), hl
                            471 ;src/main.c:326: crtc(screen_location);
   4527 C5            [11]  472 	push	bc
   4528 2A 07 65      [16]  473 	ld	hl, (_screen_location)
   452B E5            [11]  474 	push	hl
   452C CD F9 42      [17]  475 	call	_crtc
   452F F1            [10]  476 	pop	af
   4530 C1            [10]  477 	pop	bc
                            478 ;src/main.c:328: screen_plot_address++;
   4531 FD 21 09 65   [14]  479 	ld	iy, #_screen_plot_address
   4535 FD 34 00      [23]  480 	inc	0 (iy)
   4538 20 03         [12]  481 	jr	NZ,00129$
   453A FD 34 01      [23]  482 	inc	1 (iy)
   453D                     483 00129$:
                            484 ;src/main.c:329: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   453D 2A 09 65      [16]  485 	ld	hl, (_screen_plot_address)
   4540 7C            [ 4]  486 	ld	a, h
   4541 E6 87         [ 7]  487 	and	a, #0x87
   4543 67            [ 4]  488 	ld	h, a
   4544 22 09 65      [16]  489 	ld	(_screen_plot_address), hl
                            490 ;src/main.c:330: screen_plot_address++;
   4547 FD 34 00      [23]  491 	inc	0 (iy)
   454A 20 03         [12]  492 	jr	NZ,00130$
   454C FD 34 01      [23]  493 	inc	1 (iy)
   454F                     494 00130$:
                            495 ;src/main.c:331: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   454F 2A 09 65      [16]  496 	ld	hl, (_screen_plot_address)
   4552 7C            [ 4]  497 	ld	a, h
   4553 E6 87         [ 7]  498 	and	a, #0x87
   4555 67            [ 4]  499 	ld	h, a
   4556 22 09 65      [16]  500 	ld	(_screen_plot_address), hl
                            501 ;src/main.c:335: s=s+1;
   4559 03            [ 6]  502 	inc	bc
                            503 ;src/main.c:336: if (s==8) {s=0;}
   455A 79            [ 4]  504 	ld	a, c
   455B D6 08         [ 7]  505 	sub	a, #0x08
   455D B0            [ 4]  506 	or	a, b
   455E 20 03         [12]  507 	jr	NZ,00102$
   4560 01 00 00      [10]  508 	ld	bc, #0x0000
   4563                     509 00102$:
                            510 ;src/main.c:337: if (s==0) {texte_cur=texte_cur+1; if (texte_cur==texte_length) {texte_cur=0;}}
   4563 78            [ 4]  511 	ld	a, b
   4564 B1            [ 4]  512 	or	a,c
   4565 20 16         [12]  513 	jr	NZ,00106$
   4567 DD 34 FE      [23]  514 	inc	-2 (ix)
   456A 20 03         [12]  515 	jr	NZ,00133$
   456C DD 34 FF      [23]  516 	inc	-1 (ix)
   456F                     517 00133$:
   456F DD 7E FE      [19]  518 	ld	a, -2 (ix)
   4572 D6 10         [ 7]  519 	sub	a, #0x10
   4574 DD B6 FF      [19]  520 	or	a, -1 (ix)
   4577 20 04         [12]  521 	jr	NZ,00106$
   4579 21 00 00      [10]  522 	ld	hl, #0x0000
   457C E3            [19]  523 	ex	(sp), hl
   457D                     524 00106$:
                            525 ;src/main.c:345: draw("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE",texte_cur,s);
   457D C5            [11]  526 	push	bc
   457E C5            [11]  527 	push	bc
   457F DD 6E FE      [19]  528 	ld	l,-2 (ix)
   4582 DD 66 FF      [19]  529 	ld	h,-1 (ix)
   4585 E5            [11]  530 	push	hl
   4586 21 96 45      [10]  531 	ld	hl, #___str_0
   4589 E5            [11]  532 	push	hl
   458A CD E7 43      [17]  533 	call	_draw
   458D 21 06 00      [10]  534 	ld	hl, #6
   4590 39            [11]  535 	add	hl, sp
   4591 F9            [ 6]  536 	ld	sp, hl
   4592 C1            [10]  537 	pop	bc
   4593 C3 0C 45      [10]  538 	jp	00108$
   4596                     539 ___str_0:
   4596 45 45 45 45 45 45   540 	.ascii "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
        45 45 45 45 45 45
        45 45 45 45 45 45
        45 45 45 45 45 45
        45 45 45 45 45 45
        45
   45B5 00                  541 	.db 0x00
                            542 	.area _CODE
                            543 	.area _INITIALIZER
   6514                     544 __xinit__intCounter:
   6514 00                  545 	.db #0x00	; 0
   6515                     546 __xinit__hOffset:
   6515 00 00               547 	.dw #0x0000
   6517                     548 __xinit__slow:
   6517 00                  549 	.db #0x00	; 0
                            550 	.area _CABS (ABS)
