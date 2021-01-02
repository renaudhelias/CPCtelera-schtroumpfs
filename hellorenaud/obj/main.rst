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
                             16 	.globl _calqueC000
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
                             38 	.globl _cpct_disableFirmware
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
   4D0F                      50 _screen_location::
   4D0F                      51 	.ds 2
   4D11                      52 _screen_plot_address::
   4D11                      53 	.ds 2
                             54 ;--------------------------------------------------------
                             55 ; ram data
                             56 ;--------------------------------------------------------
                             57 	.area _INITIALIZED
   4D14                      58 _intCounter::
   4D14                      59 	.ds 1
                             60 ;--------------------------------------------------------
                             61 ; absolute external ram data
                             62 ;--------------------------------------------------------
                             63 	.area _DABS (ABS)
                             64 ;--------------------------------------------------------
                             65 ; global & static initialisations
                             66 ;--------------------------------------------------------
                             67 	.area _HOME
                             68 	.area _GSINIT
                             69 	.area _GSFINAL
                             70 	.area _GSINIT
                             71 ;--------------------------------------------------------
                             72 ; Home
                             73 ;--------------------------------------------------------
                             74 	.area _HOME
                             75 	.area _HOME
                             76 ;--------------------------------------------------------
                             77 ; code
                             78 ;--------------------------------------------------------
                             79 	.area _CODE
                             80 ;src/main.c:45: void crtc(u8* R12R13) {
                             81 ;	---------------------------------
                             82 ; Function crtc
                             83 ; ---------------------------------
   41FA                      84 _crtc::
                             85 ;src/main.c:62: __endasm;
   41FA DD E5         [15]   86 	push	ix
   41FC DD 21 00 00   [14]   87 	ld	ix,#0
   4200 DD 39         [15]   88 	add	ix,sp
   4202 DD 66 05      [19]   89 	ld	h, 5 (ix)
   4205 DD 6E 04      [19]   90 	ld	l, 4 (ix)
   4208 01 0C BC      [10]   91 	ld	bc,#0xbc00+12
   420B ED 49         [12]   92 	out	(c),c
   420D 04            [ 4]   93 	inc	b
   420E ED 61         [12]   94 	out	(c),h
   4210 05            [ 4]   95 	dec	b
   4211 0C            [ 4]   96 	inc	c
   4212 ED 49         [12]   97 	out	(c),c
   4214 04            [ 4]   98 	inc	b
   4215 ED 69         [12]   99 	out	(c),l
   4217 DD E1         [14]  100 	pop	ix
   4219 C9            [10]  101 	ret
   421A                     102 _g_items_0:
   421A 05                  103 	.db #0x05	; 5
   421B 0F                  104 	.db #0x0f	; 15
   421C 0F                  105 	.db #0x0f	; 15
   421D 00                  106 	.db #0x00	; 0
   421E 0F                  107 	.db #0x0f	; 15
   421F 0F                  108 	.db #0x0f	; 15
   4220 0F                  109 	.db #0x0f	; 15
   4221 0A                  110 	.db #0x0a	; 10
   4222 0F                  111 	.db #0x0f	; 15
   4223 0A                  112 	.db #0x0a	; 10
   4224 05                  113 	.db #0x05	; 5
   4225 00                  114 	.db #0x00	; 0
   4226 0F                  115 	.db #0x0f	; 15
   4227 0A                  116 	.db #0x0a	; 10
   4228 05                  117 	.db #0x05	; 5
   4229 00                  118 	.db #0x00	; 0
   422A 05                  119 	.db #0x05	; 5
   422B 0F                  120 	.db #0x0f	; 15
   422C 0A                  121 	.db #0x0a	; 10
   422D 0A                  122 	.db #0x0a	; 10
   422E 00                  123 	.db #0x00	; 0
   422F 0F                  124 	.db #0x0f	; 15
   4230 0F                  125 	.db #0x0f	; 15
   4231 0A                  126 	.db #0x0a	; 10
   4232 00                  127 	.db #0x00	; 0
   4233 0A                  128 	.db #0x0a	; 10
   4234 0A                  129 	.db #0x0a	; 10
   4235 0A                  130 	.db #0x0a	; 10
   4236 00                  131 	.db #0x00	; 0
   4237 00                  132 	.db #0x00	; 0
   4238 00                  133 	.db #0x00	; 0
   4239 00                  134 	.db #0x00	; 0
                            135 ;src/main.c:73: void myInterruptHandler() {
                            136 ;	---------------------------------
                            137 ; Function myInterruptHandler
                            138 ; ---------------------------------
   423A                     139 _myInterruptHandler::
                            140 ;src/main.c:76: intCounter=intCounter+1;
   423A FD 21 14 4D   [14]  141 	ld	iy, #_intCounter
   423E FD 34 00      [23]  142 	inc	0 (iy)
                            143 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   4241 FD 7E 00      [19]  144 	ld	a, 0 (iy)
   4244 D6 06         [ 7]  145 	sub	a, #0x06
   4246 20 04         [12]  146 	jr	NZ,00102$
   4248 FD 36 00 00   [19]  147 	ld	0 (iy), #0x00
   424C                     148 00102$:
                            149 ;src/main.c:79: if (intCounter == 2) {
   424C 3A 14 4D      [13]  150 	ld	a,(#_intCounter + 0)
   424F D6 02         [ 7]  151 	sub	a, #0x02
   4251 20 09         [12]  152 	jr	NZ,00104$
                            153 ;src/main.c:80: cpct_setBorder(2);
   4253 21 10 02      [10]  154 	ld	hl, #0x0210
   4256 E5            [11]  155 	push	hl
   4257 CD C0 49      [17]  156 	call	_cpct_setPALColour
   425A 18 07         [12]  157 	jr	00105$
   425C                     158 00104$:
                            159 ;src/main.c:82: cpct_setBorder(3);
   425C 21 10 03      [10]  160 	ld	hl, #0x0310
   425F E5            [11]  161 	push	hl
   4260 CD C0 49      [17]  162 	call	_cpct_setPALColour
   4263                     163 00105$:
                            164 ;src/main.c:85: if (intCounter==5) {
   4263 FD 21 14 4D   [14]  165 	ld	iy, #_intCounter
   4267 FD 7E 00      [19]  166 	ld	a, 0 (iy)
   426A D6 05         [ 7]  167 	sub	a, #0x05
   426C 20 1D         [12]  168 	jr	NZ,00107$
                            169 ;src/main.c:91: __endasm;
   426E 01 06 BC      [10]  170 	ld	bc,#0xbc06
   4271 ED 49         [12]  171 	out	(c),c
   4273 01 04 BD      [10]  172 	ld	bc,#0xbd04
   4276 ED 49         [12]  173 	out	(c),c
                            174 ;src/main.c:93: crtc(screen_location);
   4278 2A 0F 4D      [16]  175 	ld	hl, (_screen_location)
   427B E5            [11]  176 	push	hl
   427C CD FA 41      [17]  177 	call	_crtc
   427F F1            [10]  178 	pop	af
                            179 ;src/main.c:95: killVBL();
   4280 CD FC 44      [17]  180 	call	_killVBL
                            181 ;src/main.c:96: rupture(19-1);
   4283 3E 12         [ 7]  182 	ld	a, #0x12
   4285 F5            [11]  183 	push	af
   4286 33            [ 6]  184 	inc	sp
   4287 CD 19 45      [17]  185 	call	_rupture
   428A 33            [ 6]  186 	inc	sp
   428B                     187 00107$:
                            188 ;src/main.c:100: if (intCounter==2) {
   428B FD 21 14 4D   [14]  189 	ld	iy, #_intCounter
   428F FD 7E 00      [19]  190 	ld	a, 0 (iy)
   4292 D6 02         [ 7]  191 	sub	a, #0x02
   4294 20 1C         [12]  192 	jr	NZ,00109$
                            193 ;src/main.c:106: __endasm;
   4296 01 06 BC      [10]  194 	ld	bc,#0xbc06
   4299 ED 49         [12]  195 	out	(c),c
   429B 01 19 BD      [10]  196 	ld	bc,#0xbd19
   429E ED 49         [12]  197 	out	(c),c
                            198 ;src/main.c:107: cpct_setVideoMemoryPage(cpct_pageC0);
   42A0 2E 30         [ 7]  199 	ld	l, #0x30
   42A2 CD 84 4A      [17]  200 	call	_cpct_setVideoMemoryPage
                            201 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   42A5 2E 00         [ 7]  202 	ld	l, #0x00
   42A7 CD CC 49      [17]  203 	call	_cpct_setVideoMemoryOffset
                            204 ;src/main.c:109: rupture(7);
   42AA 3E 07         [ 7]  205 	ld	a, #0x07
   42AC F5            [11]  206 	push	af
   42AD 33            [ 6]  207 	inc	sp
   42AE CD 19 45      [17]  208 	call	_rupture
   42B1 33            [ 6]  209 	inc	sp
   42B2                     210 00109$:
                            211 ;src/main.c:112: if (intCounter==3) {
   42B2 3A 14 4D      [13]  212 	ld	a,(#_intCounter + 0)
   42B5 D6 03         [ 7]  213 	sub	a, #0x03
   42B7 20 15         [12]  214 	jr	NZ,00111$
                            215 ;src/main.c:113: cpct_setVideoMemoryPage(cpct_pageC0);
   42B9 2E 30         [ 7]  216 	ld	l, #0x30
   42BB CD 84 4A      [17]  217 	call	_cpct_setVideoMemoryPage
                            218 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   42BE 2E 00         [ 7]  219 	ld	l, #0x00
   42C0 CD CC 49      [17]  220 	call	_cpct_setVideoMemoryOffset
                            221 ;src/main.c:115: restoreVBL();
   42C3 CD 0D 45      [17]  222 	call	_restoreVBL
                            223 ;src/main.c:116: rupture(39-19-7+1);
   42C6 3E 0E         [ 7]  224 	ld	a, #0x0e
   42C8 F5            [11]  225 	push	af
   42C9 33            [ 6]  226 	inc	sp
   42CA CD 19 45      [17]  227 	call	_rupture
   42CD 33            [ 6]  228 	inc	sp
   42CE                     229 00111$:
                            230 ;src/main.c:120: if (intCounter==4) {
   42CE 3A 14 4D      [13]  231 	ld	a,(#_intCounter + 0)
   42D1 D6 04         [ 7]  232 	sub	a, #0x04
   42D3 C0            [11]  233 	ret	NZ
                            234 ;src/main.c:121: bank7_C000();
   42D4 CD 8C 44      [17]  235 	call	_bank7_C000
                            236 ;src/main.c:122: akp_musicPlay();
   42D7 CD BA 41      [17]  237 	call	_akp_musicPlay
                            238 ;src/main.c:123: bank0123();
   42DA CD 86 44      [17]  239 	call	_bank0123
   42DD C9            [10]  240 	ret
                            241 ;src/main.c:130: void main(void) {
                            242 ;	---------------------------------
                            243 ; Function main
                            244 ; ---------------------------------
   42DE                     245 _main::
                            246 ;src/main.c:134: u8* sprite=g_items_0;
                            247 ;src/main.c:137: bank7_C000();
   42DE CD 8C 44      [17]  248 	call	_bank7_C000
                            249 ;src/main.c:138: akp_musicInit();
   42E1 CD 97 41      [17]  250 	call	_akp_musicInit
                            251 ;src/main.c:139: bank0123();
   42E4 CD 86 44      [17]  252 	call	_bank0123
                            253 ;src/main.c:142: cpct_disableFirmware();
   42E7 CD 86 4B      [17]  254 	call	_cpct_disableFirmware
                            255 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   42EA 21 00 20      [10]  256 	ld	hl, #0x2000
   42ED E5            [11]  257 	push	hl
   42EE 26 80         [ 7]  258 	ld	h, #0x80
   42F0 E5            [11]  259 	push	hl
   42F1 26 60         [ 7]  260 	ld	h, #0x60
   42F3 E5            [11]  261 	push	hl
   42F4 CD 7E 4B      [17]  262 	call	_cpct_memcpy
                            263 ;src/main.c:144: cpct_setStackLocation(0x6000);
   42F7 21 00 60      [10]  264 	ld	hl, #0x6000
   42FA CD 04 4B      [17]  265 	call	_cpct_setStackLocation
                            266 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   42FD 21 00 40      [10]  267 	ld	hl, #0x4000
   4300 E5            [11]  268 	push	hl
   4301 21 FF FF      [10]  269 	ld	hl, #0xffff
   4304 E5            [11]  270 	push	hl
   4305 21 00 80      [10]  271 	ld	hl, #0x8000
   4308 E5            [11]  272 	push	hl
   4309 CD BC 4A      [17]  273 	call	_cpct_memset_f64
                            274 ;src/main.c:147: bank0123();
   430C CD 86 44      [17]  275 	call	_bank0123
                            276 ;src/main.c:148: cpct_setVideoMode(0);
   430F 2E 00         [ 7]  277 	ld	l, #0x00
   4311 CD 55 4B      [17]  278 	call	_cpct_setVideoMode
                            279 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   4314 21 10 14      [10]  280 	ld	hl, #0x1410
   4317 E5            [11]  281 	push	hl
   4318 CD C0 49      [17]  282 	call	_cpct_setPALColour
                            283 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   431B 21 06 00      [10]  284 	ld	hl, #0x0006
   431E E5            [11]  285 	push	hl
   431F 21 39 45      [10]  286 	ld	hl, #_g_tile_palette
   4322 E5            [11]  287 	push	hl
   4323 CD 3F 49      [17]  288 	call	_cpct_setPalette
                            289 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   4326 21 09 6E      [10]  290 	ld	hl, #0x6e09
   4329 E5            [11]  291 	push	hl
   432A 21 00 C0      [10]  292 	ld	hl, #0xc000
   432D E5            [11]  293 	push	hl
   432E CD 66 4C      [17]  294 	call	_cpct_getScreenPtr
                            295 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   4331 01 1A 42      [10]  296 	ld	bc, #_g_items_0
   4334 E5            [11]  297 	push	hl
   4335 C5            [11]  298 	push	bc
   4336 C5            [11]  299 	push	bc
   4337 11 04 08      [10]  300 	ld	de, #0x0804
   433A D5            [11]  301 	push	de
   433B CD 09 4B      [17]  302 	call	_cpct_hflipSpriteM0
   433E C1            [10]  303 	pop	bc
   433F E1            [10]  304 	pop	hl
                            305 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   4340 11 04 08      [10]  306 	ld	de, #0x0804
   4343 D5            [11]  307 	push	de
   4344 E5            [11]  308 	push	hl
   4345 C5            [11]  309 	push	bc
   4346 CD D5 49      [17]  310 	call	_cpct_drawSprite
                            311 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   4349 21 0A 60      [10]  312 	ld	hl, #0x600a
   434C E5            [11]  313 	push	hl
   434D 21 00 C0      [10]  314 	ld	hl, #0xc000
   4350 E5            [11]  315 	push	hl
   4351 CD 66 4C      [17]  316 	call	_cpct_getScreenPtr
                            317 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4354 01 3F 45      [10]  318 	ld	bc, #_g_tile_schtroumpf+0
   4357 11 10 20      [10]  319 	ld	de, #0x2010
   435A D5            [11]  320 	push	de
   435B E5            [11]  321 	push	hl
   435C C5            [11]  322 	push	bc
   435D CD 8D 4A      [17]  323 	call	_cpct_drawSpriteMasked
                            324 ;src/main.c:162: calqueC000();
   4360 CD 5A 44      [17]  325 	call	_calqueC000
                            326 ;src/main.c:164: screen_location=(u8 *)(0x2000);
   4363 21 00 20      [10]  327 	ld	hl, #0x2000
   4366 22 0F 4D      [16]  328 	ld	(_screen_location), hl
                            329 ;src/main.c:165: screen_plot_address=(u8 *)(0x8000+80-2);
   4369 21 4E 80      [10]  330 	ld	hl, #0x804e
   436C 22 11 4D      [16]  331 	ld	(_screen_plot_address), hl
                            332 ;src/main.c:170: while (1) {
   436F 01 00 00      [10]  333 	ld	bc, #0x0000
   4372                     334 00104$:
                            335 ;src/main.c:171: cpct_waitVSYNC();
   4372 C5            [11]  336 	push	bc
   4373 CD 4D 4B      [17]  337 	call	_cpct_waitVSYNC
   4376 C1            [10]  338 	pop	bc
                            339 ;src/main.c:173: screen_location++;
   4377 FD 21 0F 4D   [14]  340 	ld	iy, #_screen_location
   437B FD 34 00      [23]  341 	inc	0 (iy)
   437E 20 03         [12]  342 	jr	NZ,00116$
   4380 FD 34 01      [23]  343 	inc	1 (iy)
   4383                     344 00116$:
                            345 ;src/main.c:174: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   4383 2A 0F 4D      [16]  346 	ld	hl, (_screen_location)
   4386 7C            [ 4]  347 	ld	a, h
   4387 E6 23         [ 7]  348 	and	a, #0x23
   4389 67            [ 4]  349 	ld	h, a
   438A 22 0F 4D      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:176: crtc(screen_location+0x1000);
   438D FD 21 00 10   [14]  352 	ld	iy, #0x1000
   4391 ED 5B 0F 4D   [20]  353 	ld	de, (_screen_location)
   4395 FD 19         [15]  354 	add	iy, de
   4397 C5            [11]  355 	push	bc
   4398 FD E5         [15]  356 	push	iy
   439A CD FA 41      [17]  357 	call	_crtc
   439D F1            [10]  358 	pop	af
   439E C1            [10]  359 	pop	bc
                            360 ;src/main.c:178: screen_plot_address+=2;
   439F 21 11 4D      [10]  361 	ld	hl, #_screen_plot_address
   43A2 7E            [ 7]  362 	ld	a, (hl)
   43A3 C6 02         [ 7]  363 	add	a, #0x02
   43A5 77            [ 7]  364 	ld	(hl), a
   43A6 23            [ 6]  365 	inc	hl
   43A7 7E            [ 7]  366 	ld	a, (hl)
   43A8 CE 00         [ 7]  367 	adc	a, #0x00
   43AA 77            [ 7]  368 	ld	(hl), a
                            369 ;src/main.c:179: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   43AB 2A 11 4D      [16]  370 	ld	hl, (_screen_plot_address)
   43AE 7C            [ 4]  371 	ld	a, h
   43AF E6 87         [ 7]  372 	and	a, #0x87
   43B1 67            [ 4]  373 	ld	h, a
   43B2 22 11 4D      [16]  374 	ld	(_screen_plot_address), hl
                            375 ;src/main.c:185: scroll_hard(t,screen_plot_address);
   43B5 C5            [11]  376 	push	bc
   43B6 2A 11 4D      [16]  377 	ld	hl, (_screen_plot_address)
   43B9 E5            [11]  378 	push	hl
   43BA C5            [11]  379 	push	bc
   43BB CD 46 04      [17]  380 	call	_scroll_hard
   43BE F1            [10]  381 	pop	af
   43BF F1            [10]  382 	pop	af
   43C0 C1            [10]  383 	pop	bc
                            384 ;src/main.c:187: t=t+1;
   43C1 03            [ 6]  385 	inc	bc
                            386 ;src/main.c:190: cpct_scanKeyboard_f();
   43C2 C5            [11]  387 	push	bc
   43C3 CD 56 49      [17]  388 	call	_cpct_scanKeyboard_f
   43C6 CD 63 4B      [17]  389 	call	_cpct_isAnyKeyPressed_f
   43C9 C1            [10]  390 	pop	bc
   43CA 7D            [ 4]  391 	ld	a, l
   43CB B7            [ 4]  392 	or	a, a
   43CC 28 A4         [12]  393 	jr	Z,00104$
                            394 ;src/main.c:192: cpct_memset_f64(0xC000, 0x0000, 0x4000);
   43CE C5            [11]  395 	push	bc
   43CF 21 00 40      [10]  396 	ld	hl, #0x4000
   43D2 E5            [11]  397 	push	hl
   43D3 26 00         [ 7]  398 	ld	h, #0x00
   43D5 E5            [11]  399 	push	hl
   43D6 26 C0         [ 7]  400 	ld	h, #0xc0
   43D8 E5            [11]  401 	push	hl
   43D9 CD BC 4A      [17]  402 	call	_cpct_memset_f64
   43DC C1            [10]  403 	pop	bc
   43DD 18 93         [12]  404 	jr	00104$
                            405 	.area _CODE
                            406 	.area _INITIALIZER
   4D1C                     407 __xinit__intCounter:
   4D1C 00                  408 	.db #0x00	; 0
                            409 	.area _CABS (ABS)
