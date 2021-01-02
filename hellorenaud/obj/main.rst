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
                             14 	.globl _bank7_C000
                             15 	.globl _bank0123
                             16 	.globl _calque8000
                             17 	.globl _akp_musicPlay
                             18 	.globl _akp_musicInit
                             19 	.globl _scroll_hard
                             20 	.globl _rupture
                             21 	.globl _restoreVBL
                             22 	.globl _killVBL
                             23 	.globl _cpct_getScreenPtr
                             24 	.globl _cpct_setVideoMemoryOffset
                             25 	.globl _cpct_setVideoMemoryPage
                             26 	.globl _cpct_setPALColour
                             27 	.globl _cpct_setPalette
                             28 	.globl _cpct_waitVSYNC
                             29 	.globl _cpct_setVideoMode
                             30 	.globl _cpct_hflipSpriteM0
                             31 	.globl _cpct_drawSpriteMasked
                             32 	.globl _cpct_drawSprite
                             33 	.globl _cpct_isAnyKeyPressed_f
                             34 	.globl _cpct_scanKeyboard_f
                             35 	.globl _cpct_setStackLocation
                             36 	.globl _cpct_memcpy
                             37 	.globl _cpct_memset_f64
                             38 	.globl _cpct_setInterruptHandler
                             39 	.globl _cpct_disableFirmware
                             40 	.globl _intCounter
                             41 	.globl _screen_plot_address
                             42 	.globl _screen_location
                             43 	.globl _g_items_0
                             44 ;--------------------------------------------------------
                             45 ; special function registers
                             46 ;--------------------------------------------------------
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DATA
   4C27                      51 _screen_location::
   4C27                      52 	.ds 2
   4C29                      53 _screen_plot_address::
   4C29                      54 	.ds 2
                             55 ;--------------------------------------------------------
                             56 ; ram data
                             57 ;--------------------------------------------------------
                             58 	.area _INITIALIZED
   4C2C                      59 _intCounter::
   4C2C                      60 	.ds 1
                             61 ;--------------------------------------------------------
                             62 ; absolute external ram data
                             63 ;--------------------------------------------------------
                             64 	.area _DABS (ABS)
                             65 ;--------------------------------------------------------
                             66 ; global & static initialisations
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _GSINIT
                             70 	.area _GSFINAL
                             71 	.area _GSINIT
                             72 ;--------------------------------------------------------
                             73 ; Home
                             74 ;--------------------------------------------------------
                             75 	.area _HOME
                             76 	.area _HOME
                             77 ;--------------------------------------------------------
                             78 ; code
                             79 ;--------------------------------------------------------
                             80 	.area _CODE
                             81 ;src/main.c:45: void crtc(u8* R12R13) {
                             82 ;	---------------------------------
                             83 ; Function crtc
                             84 ; ---------------------------------
   41AE                      85 _crtc::
                             86 ;src/main.c:62: __endasm;
   41AE DD E5         [15]   87 	push	ix
   41B0 DD 21 00 00   [14]   88 	ld	ix,#0
   41B4 DD 39         [15]   89 	add	ix,sp
   41B6 DD 66 05      [19]   90 	ld	h, 5 (ix)
   41B9 DD 6E 04      [19]   91 	ld	l, 4 (ix)
   41BC 01 0C BC      [10]   92 	ld	bc,#0xbc00+12
   41BF ED 49         [12]   93 	out	(c),c
   41C1 04            [ 4]   94 	inc	b
   41C2 ED 61         [12]   95 	out	(c),h
   41C4 05            [ 4]   96 	dec	b
   41C5 0C            [ 4]   97 	inc	c
   41C6 ED 49         [12]   98 	out	(c),c
   41C8 04            [ 4]   99 	inc	b
   41C9 ED 69         [12]  100 	out	(c),l
   41CB DD E1         [14]  101 	pop	ix
   41CD C9            [10]  102 	ret
   41CE                     103 _g_items_0:
   41CE 05                  104 	.db #0x05	; 5
   41CF 0F                  105 	.db #0x0f	; 15
   41D0 0F                  106 	.db #0x0f	; 15
   41D1 00                  107 	.db #0x00	; 0
   41D2 0F                  108 	.db #0x0f	; 15
   41D3 0F                  109 	.db #0x0f	; 15
   41D4 0F                  110 	.db #0x0f	; 15
   41D5 0A                  111 	.db #0x0a	; 10
   41D6 0F                  112 	.db #0x0f	; 15
   41D7 0A                  113 	.db #0x0a	; 10
   41D8 05                  114 	.db #0x05	; 5
   41D9 00                  115 	.db #0x00	; 0
   41DA 0F                  116 	.db #0x0f	; 15
   41DB 0A                  117 	.db #0x0a	; 10
   41DC 05                  118 	.db #0x05	; 5
   41DD 00                  119 	.db #0x00	; 0
   41DE 05                  120 	.db #0x05	; 5
   41DF 0F                  121 	.db #0x0f	; 15
   41E0 0A                  122 	.db #0x0a	; 10
   41E1 0A                  123 	.db #0x0a	; 10
   41E2 00                  124 	.db #0x00	; 0
   41E3 0F                  125 	.db #0x0f	; 15
   41E4 0F                  126 	.db #0x0f	; 15
   41E5 0A                  127 	.db #0x0a	; 10
   41E6 00                  128 	.db #0x00	; 0
   41E7 0A                  129 	.db #0x0a	; 10
   41E8 0A                  130 	.db #0x0a	; 10
   41E9 0A                  131 	.db #0x0a	; 10
   41EA 00                  132 	.db #0x00	; 0
   41EB 00                  133 	.db #0x00	; 0
   41EC 00                  134 	.db #0x00	; 0
   41ED 00                  135 	.db #0x00	; 0
                            136 ;src/main.c:73: void myInterruptHandler() {
                            137 ;	---------------------------------
                            138 ; Function myInterruptHandler
                            139 ; ---------------------------------
   41EE                     140 _myInterruptHandler::
                            141 ;src/main.c:76: intCounter=intCounter+1;
   41EE FD 21 2C 4C   [14]  142 	ld	iy, #_intCounter
   41F2 FD 34 00      [23]  143 	inc	0 (iy)
                            144 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   41F5 FD 7E 00      [19]  145 	ld	a, 0 (iy)
   41F8 D6 06         [ 7]  146 	sub	a, #0x06
   41FA 20 04         [12]  147 	jr	NZ,00102$
   41FC FD 36 00 00   [19]  148 	ld	0 (iy), #0x00
   4200                     149 00102$:
                            150 ;src/main.c:79: if (intCounter == 2) {
   4200 3A 2C 4C      [13]  151 	ld	a,(#_intCounter + 0)
   4203 D6 02         [ 7]  152 	sub	a, #0x02
   4205 20 09         [12]  153 	jr	NZ,00104$
                            154 ;src/main.c:80: cpct_setBorder(2);
   4207 21 10 02      [10]  155 	ld	hl, #0x0210
   420A E5            [11]  156 	push	hl
   420B CD 68 49      [17]  157 	call	_cpct_setPALColour
   420E 18 07         [12]  158 	jr	00105$
   4210                     159 00104$:
                            160 ;src/main.c:82: cpct_setBorder(3);
   4210 21 10 03      [10]  161 	ld	hl, #0x0310
   4213 E5            [11]  162 	push	hl
   4214 CD 68 49      [17]  163 	call	_cpct_setPALColour
   4217                     164 00105$:
                            165 ;src/main.c:85: if (intCounter==5) {
   4217 FD 21 2C 4C   [14]  166 	ld	iy, #_intCounter
   421B FD 7E 00      [19]  167 	ld	a, 0 (iy)
   421E D6 05         [ 7]  168 	sub	a, #0x05
   4220 20 1D         [12]  169 	jr	NZ,00107$
                            170 ;src/main.c:91: __endasm;
   4222 01 06 BC      [10]  171 	ld	bc,#0xbc06
   4225 ED 49         [12]  172 	out	(c),c
   4227 01 04 BD      [10]  173 	ld	bc,#0xbd04
   422A ED 49         [12]  174 	out	(c),c
                            175 ;src/main.c:93: crtc(screen_location);
   422C 2A 27 4C      [16]  176 	ld	hl, (_screen_location)
   422F E5            [11]  177 	push	hl
   4230 CD AE 41      [17]  178 	call	_crtc
   4233 F1            [10]  179 	pop	af
                            180 ;src/main.c:95: killVBL();
   4234 CD A4 44      [17]  181 	call	_killVBL
                            182 ;src/main.c:96: rupture(19-1);
   4237 3E 12         [ 7]  183 	ld	a, #0x12
   4239 F5            [11]  184 	push	af
   423A 33            [ 6]  185 	inc	sp
   423B CD C1 44      [17]  186 	call	_rupture
   423E 33            [ 6]  187 	inc	sp
   423F                     188 00107$:
                            189 ;src/main.c:100: if (intCounter==2) {
   423F FD 21 2C 4C   [14]  190 	ld	iy, #_intCounter
   4243 FD 7E 00      [19]  191 	ld	a, 0 (iy)
   4246 D6 02         [ 7]  192 	sub	a, #0x02
   4248 20 1C         [12]  193 	jr	NZ,00109$
                            194 ;src/main.c:106: __endasm;
   424A 01 06 BC      [10]  195 	ld	bc,#0xbc06
   424D ED 49         [12]  196 	out	(c),c
   424F 01 19 BD      [10]  197 	ld	bc,#0xbd19
   4252 ED 49         [12]  198 	out	(c),c
                            199 ;src/main.c:107: cpct_setVideoMemoryPage(cpct_pageC0);
   4254 2E 30         [ 7]  200 	ld	l, #0x30
   4256 CD 2C 4A      [17]  201 	call	_cpct_setVideoMemoryPage
                            202 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   4259 2E 00         [ 7]  203 	ld	l, #0x00
   425B CD 74 49      [17]  204 	call	_cpct_setVideoMemoryOffset
                            205 ;src/main.c:109: rupture(7);
   425E 3E 07         [ 7]  206 	ld	a, #0x07
   4260 F5            [11]  207 	push	af
   4261 33            [ 6]  208 	inc	sp
   4262 CD C1 44      [17]  209 	call	_rupture
   4265 33            [ 6]  210 	inc	sp
   4266                     211 00109$:
                            212 ;src/main.c:112: if (intCounter==3) {
   4266 3A 2C 4C      [13]  213 	ld	a,(#_intCounter + 0)
   4269 D6 03         [ 7]  214 	sub	a, #0x03
   426B 20 15         [12]  215 	jr	NZ,00111$
                            216 ;src/main.c:113: cpct_setVideoMemoryPage(cpct_pageC0);
   426D 2E 30         [ 7]  217 	ld	l, #0x30
   426F CD 2C 4A      [17]  218 	call	_cpct_setVideoMemoryPage
                            219 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   4272 2E 00         [ 7]  220 	ld	l, #0x00
   4274 CD 74 49      [17]  221 	call	_cpct_setVideoMemoryOffset
                            222 ;src/main.c:115: restoreVBL();
   4277 CD B5 44      [17]  223 	call	_restoreVBL
                            224 ;src/main.c:116: rupture(39-19-7+1);
   427A 3E 0E         [ 7]  225 	ld	a, #0x0e
   427C F5            [11]  226 	push	af
   427D 33            [ 6]  227 	inc	sp
   427E CD C1 44      [17]  228 	call	_rupture
   4281 33            [ 6]  229 	inc	sp
   4282                     230 00111$:
                            231 ;src/main.c:120: if (intCounter==4) {
   4282 3A 2C 4C      [13]  232 	ld	a,(#_intCounter + 0)
   4285 D6 04         [ 7]  233 	sub	a, #0x04
   4287 C0            [11]  234 	ret	NZ
                            235 ;src/main.c:121: bank7_C000();
   4288 CD 34 44      [17]  236 	call	_bank7_C000
                            237 ;src/main.c:122: akp_musicPlay();
   428B CD 6E 41      [17]  238 	call	_akp_musicPlay
                            239 ;src/main.c:123: bank0123();
   428E CD 2E 44      [17]  240 	call	_bank0123
   4291 C9            [10]  241 	ret
                            242 ;src/main.c:130: void main(void) {
                            243 ;	---------------------------------
                            244 ; Function main
                            245 ; ---------------------------------
   4292                     246 _main::
                            247 ;src/main.c:134: u8* sprite=g_items_0;
                            248 ;src/main.c:137: bank7_C000();
   4292 CD 34 44      [17]  249 	call	_bank7_C000
                            250 ;src/main.c:138: akp_musicInit();
   4295 CD 4B 41      [17]  251 	call	_akp_musicInit
                            252 ;src/main.c:139: bank0123();
   4298 CD 2E 44      [17]  253 	call	_bank0123
                            254 ;src/main.c:142: cpct_disableFirmware();
   429B CD 2E 4B      [17]  255 	call	_cpct_disableFirmware
                            256 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   429E 21 00 20      [10]  257 	ld	hl, #0x2000
   42A1 E5            [11]  258 	push	hl
   42A2 26 80         [ 7]  259 	ld	h, #0x80
   42A4 E5            [11]  260 	push	hl
   42A5 26 60         [ 7]  261 	ld	h, #0x60
   42A7 E5            [11]  262 	push	hl
   42A8 CD 26 4B      [17]  263 	call	_cpct_memcpy
                            264 ;src/main.c:144: cpct_setStackLocation(0x6000);
   42AB 21 00 60      [10]  265 	ld	hl, #0x6000
   42AE CD AC 4A      [17]  266 	call	_cpct_setStackLocation
                            267 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   42B1 21 00 40      [10]  268 	ld	hl, #0x4000
   42B4 E5            [11]  269 	push	hl
   42B5 21 FF FF      [10]  270 	ld	hl, #0xffff
   42B8 E5            [11]  271 	push	hl
   42B9 21 00 80      [10]  272 	ld	hl, #0x8000
   42BC E5            [11]  273 	push	hl
   42BD CD 64 4A      [17]  274 	call	_cpct_memset_f64
                            275 ;src/main.c:147: bank0123();
   42C0 CD 2E 44      [17]  276 	call	_bank0123
                            277 ;src/main.c:148: cpct_setVideoMode(0);
   42C3 2E 00         [ 7]  278 	ld	l, #0x00
   42C5 CD FD 4A      [17]  279 	call	_cpct_setVideoMode
                            280 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   42C8 21 10 14      [10]  281 	ld	hl, #0x1410
   42CB E5            [11]  282 	push	hl
   42CC CD 68 49      [17]  283 	call	_cpct_setPALColour
                            284 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   42CF 21 06 00      [10]  285 	ld	hl, #0x0006
   42D2 E5            [11]  286 	push	hl
   42D3 21 E1 44      [10]  287 	ld	hl, #_g_tile_palette
   42D6 E5            [11]  288 	push	hl
   42D7 CD E7 48      [17]  289 	call	_cpct_setPalette
                            290 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   42DA 21 09 6E      [10]  291 	ld	hl, #0x6e09
   42DD E5            [11]  292 	push	hl
   42DE 21 00 C0      [10]  293 	ld	hl, #0xc000
   42E1 E5            [11]  294 	push	hl
   42E2 CD 56 4B      [17]  295 	call	_cpct_getScreenPtr
                            296 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   42E5 01 CE 41      [10]  297 	ld	bc, #_g_items_0
   42E8 E5            [11]  298 	push	hl
   42E9 C5            [11]  299 	push	bc
   42EA C5            [11]  300 	push	bc
   42EB 11 04 08      [10]  301 	ld	de, #0x0804
   42EE D5            [11]  302 	push	de
   42EF CD B1 4A      [17]  303 	call	_cpct_hflipSpriteM0
   42F2 C1            [10]  304 	pop	bc
   42F3 E1            [10]  305 	pop	hl
                            306 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   42F4 11 04 08      [10]  307 	ld	de, #0x0804
   42F7 D5            [11]  308 	push	de
   42F8 E5            [11]  309 	push	hl
   42F9 C5            [11]  310 	push	bc
   42FA CD 7D 49      [17]  311 	call	_cpct_drawSprite
                            312 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   42FD 21 0A 60      [10]  313 	ld	hl, #0x600a
   4300 E5            [11]  314 	push	hl
   4301 21 00 C0      [10]  315 	ld	hl, #0xc000
   4304 E5            [11]  316 	push	hl
   4305 CD 56 4B      [17]  317 	call	_cpct_getScreenPtr
                            318 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4308 01 E7 44      [10]  319 	ld	bc, #_g_tile_schtroumpf+0
   430B 11 10 20      [10]  320 	ld	de, #0x2010
   430E D5            [11]  321 	push	de
   430F E5            [11]  322 	push	hl
   4310 C5            [11]  323 	push	bc
   4311 CD 35 4A      [17]  324 	call	_cpct_drawSpriteMasked
                            325 ;src/main.c:161: calque8000();
   4314 CD 0D 44      [17]  326 	call	_calque8000
                            327 ;src/main.c:164: screen_location=(u8 *)(0x2000);
   4317 21 00 20      [10]  328 	ld	hl, #0x2000
   431A 22 27 4C      [16]  329 	ld	(_screen_location), hl
                            330 ;src/main.c:165: screen_plot_address=(u8 *)(0x8000+80-2);
   431D 21 4E 80      [10]  331 	ld	hl, #0x804e
   4320 22 29 4C      [16]  332 	ld	(_screen_plot_address), hl
                            333 ;src/main.c:167: cpct_setInterruptHandler(myInterruptHandler);
   4323 21 EE 41      [10]  334 	ld	hl, #_myInterruptHandler
   4326 CD 76 4B      [17]  335 	call	_cpct_setInterruptHandler
                            336 ;src/main.c:169: while (1) {
   4329 01 00 00      [10]  337 	ld	bc, #0x0000
   432C                     338 00104$:
                            339 ;src/main.c:170: cpct_waitVSYNC();
   432C C5            [11]  340 	push	bc
   432D CD F5 4A      [17]  341 	call	_cpct_waitVSYNC
   4330 C1            [10]  342 	pop	bc
                            343 ;src/main.c:172: screen_location++;
   4331 FD 21 27 4C   [14]  344 	ld	iy, #_screen_location
   4335 FD 34 00      [23]  345 	inc	0 (iy)
   4338 20 03         [12]  346 	jr	NZ,00116$
   433A FD 34 01      [23]  347 	inc	1 (iy)
   433D                     348 00116$:
                            349 ;src/main.c:173: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   433D 2A 27 4C      [16]  350 	ld	hl, (_screen_location)
   4340 7C            [ 4]  351 	ld	a, h
   4341 E6 23         [ 7]  352 	and	a, #0x23
   4343 67            [ 4]  353 	ld	h, a
   4344 22 27 4C      [16]  354 	ld	(_screen_location), hl
                            355 ;src/main.c:177: screen_plot_address+=2;
   4347 21 29 4C      [10]  356 	ld	hl, #_screen_plot_address
   434A 7E            [ 7]  357 	ld	a, (hl)
   434B C6 02         [ 7]  358 	add	a, #0x02
   434D 77            [ 7]  359 	ld	(hl), a
   434E 23            [ 6]  360 	inc	hl
   434F 7E            [ 7]  361 	ld	a, (hl)
   4350 CE 00         [ 7]  362 	adc	a, #0x00
   4352 77            [ 7]  363 	ld	(hl), a
                            364 ;src/main.c:178: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   4353 2A 29 4C      [16]  365 	ld	hl, (_screen_plot_address)
   4356 7C            [ 4]  366 	ld	a, h
   4357 E6 87         [ 7]  367 	and	a, #0x87
   4359 67            [ 4]  368 	ld	h, a
   435A 22 29 4C      [16]  369 	ld	(_screen_plot_address), hl
                            370 ;src/main.c:184: scroll_hard(t,screen_plot_address);
   435D C5            [11]  371 	push	bc
   435E 2A 29 4C      [16]  372 	ld	hl, (_screen_plot_address)
   4361 E5            [11]  373 	push	hl
   4362 C5            [11]  374 	push	bc
   4363 CD FA 03      [17]  375 	call	_scroll_hard
   4366 F1            [10]  376 	pop	af
   4367 F1            [10]  377 	pop	af
   4368 C1            [10]  378 	pop	bc
                            379 ;src/main.c:186: t=t+1;
   4369 03            [ 6]  380 	inc	bc
                            381 ;src/main.c:188: cpct_scanKeyboard_f();
   436A C5            [11]  382 	push	bc
   436B CD FE 48      [17]  383 	call	_cpct_scanKeyboard_f
   436E CD 0B 4B      [17]  384 	call	_cpct_isAnyKeyPressed_f
   4371 C1            [10]  385 	pop	bc
   4372 7D            [ 4]  386 	ld	a, l
   4373 B7            [ 4]  387 	or	a, a
   4374 28 B6         [12]  388 	jr	Z,00104$
                            389 ;src/main.c:190: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   4376 C5            [11]  390 	push	bc
   4377 21 00 40      [10]  391 	ld	hl, #0x4000
   437A E5            [11]  392 	push	hl
   437B 26 00         [ 7]  393 	ld	h, #0x00
   437D E5            [11]  394 	push	hl
   437E 26 80         [ 7]  395 	ld	h, #0x80
   4380 E5            [11]  396 	push	hl
   4381 CD 64 4A      [17]  397 	call	_cpct_memset_f64
   4384 C1            [10]  398 	pop	bc
   4385 18 A5         [12]  399 	jr	00104$
                            400 	.area _CODE
                            401 	.area _INITIALIZER
   4C34                     402 __xinit__intCounter:
   4C34 00                  403 	.db #0x00	; 0
                            404 	.area _CABS (ABS)
