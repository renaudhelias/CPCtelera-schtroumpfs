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
   4CAF                      50 _screen_location::
   4CAF                      51 	.ds 2
   4CB1                      52 _screen_plot_address::
   4CB1                      53 	.ds 2
                             54 ;--------------------------------------------------------
                             55 ; ram data
                             56 ;--------------------------------------------------------
                             57 	.area _INITIALIZED
   4CB3                      58 _intCounter::
   4CB3                      59 	.ds 1
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
   41F4                      84 _crtc::
                             85 ;src/main.c:62: __endasm;
   41F4 DD E5         [15]   86 	push	ix
   41F6 DD 21 00 00   [14]   87 	ld	ix,#0
   41FA DD 39         [15]   88 	add	ix,sp
   41FC DD 66 05      [19]   89 	ld	h, 5 (ix)
   41FF DD 6E 04      [19]   90 	ld	l, 4 (ix)
   4202 01 0C BC      [10]   91 	ld	bc,#0xbc00+12
   4205 ED 49         [12]   92 	out	(c),c
   4207 04            [ 4]   93 	inc	b
   4208 ED 61         [12]   94 	out	(c),h
   420A 05            [ 4]   95 	dec	b
   420B 0C            [ 4]   96 	inc	c
   420C ED 49         [12]   97 	out	(c),c
   420E 04            [ 4]   98 	inc	b
   420F ED 69         [12]   99 	out	(c),l
   4211 DD E1         [14]  100 	pop	ix
   4213 C9            [10]  101 	ret
   4214                     102 _g_items_0:
   4214 05                  103 	.db #0x05	; 5
   4215 0F                  104 	.db #0x0f	; 15
   4216 0F                  105 	.db #0x0f	; 15
   4217 00                  106 	.db #0x00	; 0
   4218 0F                  107 	.db #0x0f	; 15
   4219 0F                  108 	.db #0x0f	; 15
   421A 0F                  109 	.db #0x0f	; 15
   421B 0A                  110 	.db #0x0a	; 10
   421C 0F                  111 	.db #0x0f	; 15
   421D 0A                  112 	.db #0x0a	; 10
   421E 05                  113 	.db #0x05	; 5
   421F 00                  114 	.db #0x00	; 0
   4220 0F                  115 	.db #0x0f	; 15
   4221 0A                  116 	.db #0x0a	; 10
   4222 05                  117 	.db #0x05	; 5
   4223 00                  118 	.db #0x00	; 0
   4224 05                  119 	.db #0x05	; 5
   4225 0F                  120 	.db #0x0f	; 15
   4226 0A                  121 	.db #0x0a	; 10
   4227 0A                  122 	.db #0x0a	; 10
   4228 00                  123 	.db #0x00	; 0
   4229 0F                  124 	.db #0x0f	; 15
   422A 0F                  125 	.db #0x0f	; 15
   422B 0A                  126 	.db #0x0a	; 10
   422C 00                  127 	.db #0x00	; 0
   422D 0A                  128 	.db #0x0a	; 10
   422E 0A                  129 	.db #0x0a	; 10
   422F 0A                  130 	.db #0x0a	; 10
   4230 00                  131 	.db #0x00	; 0
   4231 00                  132 	.db #0x00	; 0
   4232 00                  133 	.db #0x00	; 0
   4233 00                  134 	.db #0x00	; 0
                            135 ;src/main.c:73: void myInterruptHandler() {
                            136 ;	---------------------------------
                            137 ; Function myInterruptHandler
                            138 ; ---------------------------------
   4234                     139 _myInterruptHandler::
                            140 ;src/main.c:76: intCounter=intCounter+1;
   4234 FD 21 B3 4C   [14]  141 	ld	iy, #_intCounter
   4238 FD 34 00      [23]  142 	inc	0 (iy)
                            143 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   423B FD 7E 00      [19]  144 	ld	a, 0 (iy)
   423E D6 06         [ 7]  145 	sub	a, #0x06
   4240 20 04         [12]  146 	jr	NZ,00102$
   4242 FD 36 00 00   [19]  147 	ld	0 (iy), #0x00
   4246                     148 00102$:
                            149 ;src/main.c:79: if (intCounter == 2) {
   4246 3A B3 4C      [13]  150 	ld	a,(#_intCounter + 0)
   4249 D6 02         [ 7]  151 	sub	a, #0x02
   424B 20 09         [12]  152 	jr	NZ,00104$
                            153 ;src/main.c:80: cpct_setBorder(2);
   424D 21 10 02      [10]  154 	ld	hl, #0x0210
   4250 E5            [11]  155 	push	hl
   4251 CD BA 49      [17]  156 	call	_cpct_setPALColour
   4254 18 07         [12]  157 	jr	00105$
   4256                     158 00104$:
                            159 ;src/main.c:82: cpct_setBorder(3);
   4256 21 10 03      [10]  160 	ld	hl, #0x0310
   4259 E5            [11]  161 	push	hl
   425A CD BA 49      [17]  162 	call	_cpct_setPALColour
   425D                     163 00105$:
                            164 ;src/main.c:85: if (intCounter==5) {
   425D FD 21 B3 4C   [14]  165 	ld	iy, #_intCounter
   4261 FD 7E 00      [19]  166 	ld	a, 0 (iy)
   4264 D6 05         [ 7]  167 	sub	a, #0x05
   4266 20 1D         [12]  168 	jr	NZ,00107$
                            169 ;src/main.c:91: __endasm;
   4268 01 06 BC      [10]  170 	ld	bc,#0xbc06
   426B ED 49         [12]  171 	out	(c),c
   426D 01 04 BD      [10]  172 	ld	bc,#0xbd04
   4270 ED 49         [12]  173 	out	(c),c
                            174 ;src/main.c:93: crtc(screen_location);
   4272 2A AF 4C      [16]  175 	ld	hl, (_screen_location)
   4275 E5            [11]  176 	push	hl
   4276 CD F4 41      [17]  177 	call	_crtc
   4279 F1            [10]  178 	pop	af
                            179 ;src/main.c:95: killVBL();
   427A CD F6 44      [17]  180 	call	_killVBL
                            181 ;src/main.c:96: rupture(19-1);
   427D 3E 12         [ 7]  182 	ld	a, #0x12
   427F F5            [11]  183 	push	af
   4280 33            [ 6]  184 	inc	sp
   4281 CD 13 45      [17]  185 	call	_rupture
   4284 33            [ 6]  186 	inc	sp
   4285                     187 00107$:
                            188 ;src/main.c:100: if (intCounter==2) {
   4285 FD 21 B3 4C   [14]  189 	ld	iy, #_intCounter
   4289 FD 7E 00      [19]  190 	ld	a, 0 (iy)
   428C D6 02         [ 7]  191 	sub	a, #0x02
   428E 20 1C         [12]  192 	jr	NZ,00109$
                            193 ;src/main.c:106: __endasm;
   4290 01 06 BC      [10]  194 	ld	bc,#0xbc06
   4293 ED 49         [12]  195 	out	(c),c
   4295 01 19 BD      [10]  196 	ld	bc,#0xbd19
   4298 ED 49         [12]  197 	out	(c),c
                            198 ;src/main.c:107: cpct_setVideoMemoryPage(cpct_pageC0);
   429A 2E 30         [ 7]  199 	ld	l, #0x30
   429C CD 7E 4A      [17]  200 	call	_cpct_setVideoMemoryPage
                            201 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   429F 2E 00         [ 7]  202 	ld	l, #0x00
   42A1 CD C6 49      [17]  203 	call	_cpct_setVideoMemoryOffset
                            204 ;src/main.c:109: rupture(7);
   42A4 3E 07         [ 7]  205 	ld	a, #0x07
   42A6 F5            [11]  206 	push	af
   42A7 33            [ 6]  207 	inc	sp
   42A8 CD 13 45      [17]  208 	call	_rupture
   42AB 33            [ 6]  209 	inc	sp
   42AC                     210 00109$:
                            211 ;src/main.c:112: if (intCounter==3) {
   42AC 3A B3 4C      [13]  212 	ld	a,(#_intCounter + 0)
   42AF D6 03         [ 7]  213 	sub	a, #0x03
   42B1 20 15         [12]  214 	jr	NZ,00111$
                            215 ;src/main.c:113: cpct_setVideoMemoryPage(cpct_pageC0);
   42B3 2E 30         [ 7]  216 	ld	l, #0x30
   42B5 CD 7E 4A      [17]  217 	call	_cpct_setVideoMemoryPage
                            218 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   42B8 2E 00         [ 7]  219 	ld	l, #0x00
   42BA CD C6 49      [17]  220 	call	_cpct_setVideoMemoryOffset
                            221 ;src/main.c:115: restoreVBL();
   42BD CD 07 45      [17]  222 	call	_restoreVBL
                            223 ;src/main.c:116: rupture(39-19-7+1);
   42C0 3E 0E         [ 7]  224 	ld	a, #0x0e
   42C2 F5            [11]  225 	push	af
   42C3 33            [ 6]  226 	inc	sp
   42C4 CD 13 45      [17]  227 	call	_rupture
   42C7 33            [ 6]  228 	inc	sp
   42C8                     229 00111$:
                            230 ;src/main.c:120: if (intCounter==4) {
   42C8 3A B3 4C      [13]  231 	ld	a,(#_intCounter + 0)
   42CB D6 04         [ 7]  232 	sub	a, #0x04
   42CD C0            [11]  233 	ret	NZ
                            234 ;src/main.c:121: bank7_C000();
   42CE CD 86 44      [17]  235 	call	_bank7_C000
                            236 ;src/main.c:122: akp_musicPlay();
   42D1 CD B4 41      [17]  237 	call	_akp_musicPlay
                            238 ;src/main.c:123: bank0123();
   42D4 CD 80 44      [17]  239 	call	_bank0123
   42D7 C9            [10]  240 	ret
                            241 ;src/main.c:130: void main(void) {
                            242 ;	---------------------------------
                            243 ; Function main
                            244 ; ---------------------------------
   42D8                     245 _main::
                            246 ;src/main.c:134: u8* sprite=g_items_0;
                            247 ;src/main.c:137: bank7_C000();
   42D8 CD 86 44      [17]  248 	call	_bank7_C000
                            249 ;src/main.c:138: akp_musicInit();
   42DB CD 91 41      [17]  250 	call	_akp_musicInit
                            251 ;src/main.c:139: bank0123();
   42DE CD 80 44      [17]  252 	call	_bank0123
                            253 ;src/main.c:142: cpct_disableFirmware();
   42E1 CD 80 4B      [17]  254 	call	_cpct_disableFirmware
                            255 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   42E4 21 00 20      [10]  256 	ld	hl, #0x2000
   42E7 E5            [11]  257 	push	hl
   42E8 26 80         [ 7]  258 	ld	h, #0x80
   42EA E5            [11]  259 	push	hl
   42EB 26 60         [ 7]  260 	ld	h, #0x60
   42ED E5            [11]  261 	push	hl
   42EE CD 78 4B      [17]  262 	call	_cpct_memcpy
                            263 ;src/main.c:144: cpct_setStackLocation(0x6000);
   42F1 21 00 60      [10]  264 	ld	hl, #0x6000
   42F4 CD FE 4A      [17]  265 	call	_cpct_setStackLocation
                            266 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   42F7 21 00 40      [10]  267 	ld	hl, #0x4000
   42FA E5            [11]  268 	push	hl
   42FB 21 FF FF      [10]  269 	ld	hl, #0xffff
   42FE E5            [11]  270 	push	hl
   42FF 21 00 80      [10]  271 	ld	hl, #0x8000
   4302 E5            [11]  272 	push	hl
   4303 CD B6 4A      [17]  273 	call	_cpct_memset_f64
                            274 ;src/main.c:147: bank0123();
   4306 CD 80 44      [17]  275 	call	_bank0123
                            276 ;src/main.c:148: cpct_setVideoMode(0);
   4309 2E 00         [ 7]  277 	ld	l, #0x00
   430B CD 4F 4B      [17]  278 	call	_cpct_setVideoMode
                            279 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   430E 21 10 14      [10]  280 	ld	hl, #0x1410
   4311 E5            [11]  281 	push	hl
   4312 CD BA 49      [17]  282 	call	_cpct_setPALColour
                            283 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   4315 21 06 00      [10]  284 	ld	hl, #0x0006
   4318 E5            [11]  285 	push	hl
   4319 21 33 45      [10]  286 	ld	hl, #_g_tile_palette
   431C E5            [11]  287 	push	hl
   431D CD 39 49      [17]  288 	call	_cpct_setPalette
                            289 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   4320 21 09 6E      [10]  290 	ld	hl, #0x6e09
   4323 E5            [11]  291 	push	hl
   4324 21 00 C0      [10]  292 	ld	hl, #0xc000
   4327 E5            [11]  293 	push	hl
   4328 CD C1 4B      [17]  294 	call	_cpct_getScreenPtr
                            295 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   432B 01 14 42      [10]  296 	ld	bc, #_g_items_0
   432E E5            [11]  297 	push	hl
   432F C5            [11]  298 	push	bc
   4330 C5            [11]  299 	push	bc
   4331 11 04 08      [10]  300 	ld	de, #0x0804
   4334 D5            [11]  301 	push	de
   4335 CD 03 4B      [17]  302 	call	_cpct_hflipSpriteM0
   4338 C1            [10]  303 	pop	bc
   4339 E1            [10]  304 	pop	hl
                            305 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   433A 11 04 08      [10]  306 	ld	de, #0x0804
   433D D5            [11]  307 	push	de
   433E E5            [11]  308 	push	hl
   433F C5            [11]  309 	push	bc
   4340 CD CF 49      [17]  310 	call	_cpct_drawSprite
                            311 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   4343 21 0A 60      [10]  312 	ld	hl, #0x600a
   4346 E5            [11]  313 	push	hl
   4347 21 00 C0      [10]  314 	ld	hl, #0xc000
   434A E5            [11]  315 	push	hl
   434B CD C1 4B      [17]  316 	call	_cpct_getScreenPtr
                            317 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   434E 01 39 45      [10]  318 	ld	bc, #_g_tile_schtroumpf+0
   4351 11 10 20      [10]  319 	ld	de, #0x2010
   4354 D5            [11]  320 	push	de
   4355 E5            [11]  321 	push	hl
   4356 C5            [11]  322 	push	bc
   4357 CD 87 4A      [17]  323 	call	_cpct_drawSpriteMasked
                            324 ;src/main.c:162: calqueC000();
   435A CD 54 44      [17]  325 	call	_calqueC000
                            326 ;src/main.c:164: screen_location=(u8 *)(0x2000);
   435D 21 00 20      [10]  327 	ld	hl, #0x2000
   4360 22 AF 4C      [16]  328 	ld	(_screen_location), hl
                            329 ;src/main.c:165: screen_plot_address=(u8 *)(0x8000+80-2);
   4363 21 4E 80      [10]  330 	ld	hl, #0x804e
   4366 22 B1 4C      [16]  331 	ld	(_screen_plot_address), hl
                            332 ;src/main.c:170: while (1) {
   4369 01 00 00      [10]  333 	ld	bc, #0x0000
   436C                     334 00104$:
                            335 ;src/main.c:171: cpct_waitVSYNC();
   436C C5            [11]  336 	push	bc
   436D CD 47 4B      [17]  337 	call	_cpct_waitVSYNC
   4370 C1            [10]  338 	pop	bc
                            339 ;src/main.c:173: screen_location++;
   4371 FD 21 AF 4C   [14]  340 	ld	iy, #_screen_location
   4375 FD 34 00      [23]  341 	inc	0 (iy)
   4378 20 03         [12]  342 	jr	NZ,00116$
   437A FD 34 01      [23]  343 	inc	1 (iy)
   437D                     344 00116$:
                            345 ;src/main.c:174: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   437D 2A AF 4C      [16]  346 	ld	hl, (_screen_location)
   4380 7C            [ 4]  347 	ld	a, h
   4381 E6 23         [ 7]  348 	and	a, #0x23
   4383 67            [ 4]  349 	ld	h, a
   4384 22 AF 4C      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:176: crtc(screen_location+0x1000);
   4387 FD 21 00 10   [14]  352 	ld	iy, #0x1000
   438B ED 5B AF 4C   [20]  353 	ld	de, (_screen_location)
   438F FD 19         [15]  354 	add	iy, de
   4391 C5            [11]  355 	push	bc
   4392 FD E5         [15]  356 	push	iy
   4394 CD F4 41      [17]  357 	call	_crtc
   4397 F1            [10]  358 	pop	af
   4398 C1            [10]  359 	pop	bc
                            360 ;src/main.c:178: screen_plot_address+=2;
   4399 21 B1 4C      [10]  361 	ld	hl, #_screen_plot_address
   439C 7E            [ 7]  362 	ld	a, (hl)
   439D C6 02         [ 7]  363 	add	a, #0x02
   439F 77            [ 7]  364 	ld	(hl), a
   43A0 23            [ 6]  365 	inc	hl
   43A1 7E            [ 7]  366 	ld	a, (hl)
   43A2 CE 00         [ 7]  367 	adc	a, #0x00
   43A4 77            [ 7]  368 	ld	(hl), a
                            369 ;src/main.c:179: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   43A5 2A B1 4C      [16]  370 	ld	hl, (_screen_plot_address)
   43A8 7C            [ 4]  371 	ld	a, h
   43A9 E6 87         [ 7]  372 	and	a, #0x87
   43AB 67            [ 4]  373 	ld	h, a
   43AC 22 B1 4C      [16]  374 	ld	(_screen_plot_address), hl
                            375 ;src/main.c:185: scroll_hard(t,screen_plot_address);
   43AF C5            [11]  376 	push	bc
   43B0 2A B1 4C      [16]  377 	ld	hl, (_screen_plot_address)
   43B3 E5            [11]  378 	push	hl
   43B4 C5            [11]  379 	push	bc
   43B5 CD 76 04      [17]  380 	call	_scroll_hard
   43B8 F1            [10]  381 	pop	af
   43B9 F1            [10]  382 	pop	af
   43BA C1            [10]  383 	pop	bc
                            384 ;src/main.c:187: t=t+1;
   43BB 03            [ 6]  385 	inc	bc
                            386 ;src/main.c:190: cpct_scanKeyboard_f();
   43BC C5            [11]  387 	push	bc
   43BD CD 50 49      [17]  388 	call	_cpct_scanKeyboard_f
   43C0 CD 5D 4B      [17]  389 	call	_cpct_isAnyKeyPressed_f
   43C3 C1            [10]  390 	pop	bc
   43C4 7D            [ 4]  391 	ld	a, l
   43C5 B7            [ 4]  392 	or	a, a
   43C6 28 A4         [12]  393 	jr	Z,00104$
                            394 ;src/main.c:192: cpct_memset_f64(0xC000, 0x0000, 0x4000);
   43C8 C5            [11]  395 	push	bc
   43C9 21 00 40      [10]  396 	ld	hl, #0x4000
   43CC E5            [11]  397 	push	hl
   43CD 26 00         [ 7]  398 	ld	h, #0x00
   43CF E5            [11]  399 	push	hl
   43D0 26 C0         [ 7]  400 	ld	h, #0xc0
   43D2 E5            [11]  401 	push	hl
   43D3 CD B6 4A      [17]  402 	call	_cpct_memset_f64
   43D6 C1            [10]  403 	pop	bc
   43D7 18 93         [12]  404 	jr	00104$
                            405 	.area _CODE
                            406 	.area _INITIALIZER
   4CBA                     407 __xinit__intCounter:
   4CBA 00                  408 	.db #0x00	; 0
                            409 	.area _CABS (ABS)
