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
   4C03                      50 _screen_location::
   4C03                      51 	.ds 2
   4C05                      52 _screen_plot_address::
   4C05                      53 	.ds 2
                             54 ;--------------------------------------------------------
                             55 ; ram data
                             56 ;--------------------------------------------------------
                             57 	.area _INITIALIZED
   4C08                      58 _intCounter::
   4C08                      59 	.ds 1
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
   41AE                      84 _crtc::
                             85 ;src/main.c:62: __endasm;
   41AE DD E5         [15]   86 	push	ix
   41B0 DD 21 00 00   [14]   87 	ld	ix,#0
   41B4 DD 39         [15]   88 	add	ix,sp
   41B6 DD 66 05      [19]   89 	ld	h, 5 (ix)
   41B9 DD 6E 04      [19]   90 	ld	l, 4 (ix)
   41BC 01 0C BC      [10]   91 	ld	bc,#0xbc00+12
   41BF ED 49         [12]   92 	out	(c),c
   41C1 04            [ 4]   93 	inc	b
   41C2 ED 61         [12]   94 	out	(c),h
   41C4 05            [ 4]   95 	dec	b
   41C5 0C            [ 4]   96 	inc	c
   41C6 ED 49         [12]   97 	out	(c),c
   41C8 04            [ 4]   98 	inc	b
   41C9 ED 69         [12]   99 	out	(c),l
   41CB DD E1         [14]  100 	pop	ix
   41CD C9            [10]  101 	ret
   41CE                     102 _g_items_0:
   41CE 05                  103 	.db #0x05	; 5
   41CF 0F                  104 	.db #0x0f	; 15
   41D0 0F                  105 	.db #0x0f	; 15
   41D1 00                  106 	.db #0x00	; 0
   41D2 0F                  107 	.db #0x0f	; 15
   41D3 0F                  108 	.db #0x0f	; 15
   41D4 0F                  109 	.db #0x0f	; 15
   41D5 0A                  110 	.db #0x0a	; 10
   41D6 0F                  111 	.db #0x0f	; 15
   41D7 0A                  112 	.db #0x0a	; 10
   41D8 05                  113 	.db #0x05	; 5
   41D9 00                  114 	.db #0x00	; 0
   41DA 0F                  115 	.db #0x0f	; 15
   41DB 0A                  116 	.db #0x0a	; 10
   41DC 05                  117 	.db #0x05	; 5
   41DD 00                  118 	.db #0x00	; 0
   41DE 05                  119 	.db #0x05	; 5
   41DF 0F                  120 	.db #0x0f	; 15
   41E0 0A                  121 	.db #0x0a	; 10
   41E1 0A                  122 	.db #0x0a	; 10
   41E2 00                  123 	.db #0x00	; 0
   41E3 0F                  124 	.db #0x0f	; 15
   41E4 0F                  125 	.db #0x0f	; 15
   41E5 0A                  126 	.db #0x0a	; 10
   41E6 00                  127 	.db #0x00	; 0
   41E7 0A                  128 	.db #0x0a	; 10
   41E8 0A                  129 	.db #0x0a	; 10
   41E9 0A                  130 	.db #0x0a	; 10
   41EA 00                  131 	.db #0x00	; 0
   41EB 00                  132 	.db #0x00	; 0
   41EC 00                  133 	.db #0x00	; 0
   41ED 00                  134 	.db #0x00	; 0
                            135 ;src/main.c:73: void myInterruptHandler() {
                            136 ;	---------------------------------
                            137 ; Function myInterruptHandler
                            138 ; ---------------------------------
   41EE                     139 _myInterruptHandler::
                            140 ;src/main.c:76: intCounter=intCounter+1;
   41EE FD 21 08 4C   [14]  141 	ld	iy, #_intCounter
   41F2 FD 34 00      [23]  142 	inc	0 (iy)
                            143 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   41F5 FD 7E 00      [19]  144 	ld	a, 0 (iy)
   41F8 D6 06         [ 7]  145 	sub	a, #0x06
   41FA 20 04         [12]  146 	jr	NZ,00102$
   41FC FD 36 00 00   [19]  147 	ld	0 (iy), #0x00
   4200                     148 00102$:
                            149 ;src/main.c:79: if (intCounter == 2) {
   4200 3A 08 4C      [13]  150 	ld	a,(#_intCounter + 0)
   4203 D6 02         [ 7]  151 	sub	a, #0x02
   4205 20 09         [12]  152 	jr	NZ,00104$
                            153 ;src/main.c:80: cpct_setBorder(2);
   4207 21 10 02      [10]  154 	ld	hl, #0x0210
   420A E5            [11]  155 	push	hl
   420B CD 6C 49      [17]  156 	call	_cpct_setPALColour
   420E 18 07         [12]  157 	jr	00105$
   4210                     158 00104$:
                            159 ;src/main.c:82: cpct_setBorder(3);
   4210 21 10 03      [10]  160 	ld	hl, #0x0310
   4213 E5            [11]  161 	push	hl
   4214 CD 6C 49      [17]  162 	call	_cpct_setPALColour
   4217                     163 00105$:
                            164 ;src/main.c:85: if (intCounter==5) {
   4217 FD 21 08 4C   [14]  165 	ld	iy, #_intCounter
   421B FD 7E 00      [19]  166 	ld	a, 0 (iy)
   421E D6 05         [ 7]  167 	sub	a, #0x05
   4220 20 1D         [12]  168 	jr	NZ,00107$
                            169 ;src/main.c:91: __endasm;
   4222 01 06 BC      [10]  170 	ld	bc,#0xbc06
   4225 ED 49         [12]  171 	out	(c),c
   4227 01 04 BD      [10]  172 	ld	bc,#0xbd04
   422A ED 49         [12]  173 	out	(c),c
                            174 ;src/main.c:93: crtc(screen_location);
   422C 2A 03 4C      [16]  175 	ld	hl, (_screen_location)
   422F E5            [11]  176 	push	hl
   4230 CD AE 41      [17]  177 	call	_crtc
   4233 F1            [10]  178 	pop	af
                            179 ;src/main.c:95: killVBL();
   4234 CD A8 44      [17]  180 	call	_killVBL
                            181 ;src/main.c:96: rupture(19-1);
   4237 3E 12         [ 7]  182 	ld	a, #0x12
   4239 F5            [11]  183 	push	af
   423A 33            [ 6]  184 	inc	sp
   423B CD C5 44      [17]  185 	call	_rupture
   423E 33            [ 6]  186 	inc	sp
   423F                     187 00107$:
                            188 ;src/main.c:100: if (intCounter==2) {
   423F FD 21 08 4C   [14]  189 	ld	iy, #_intCounter
   4243 FD 7E 00      [19]  190 	ld	a, 0 (iy)
   4246 D6 02         [ 7]  191 	sub	a, #0x02
   4248 20 1C         [12]  192 	jr	NZ,00109$
                            193 ;src/main.c:106: __endasm;
   424A 01 06 BC      [10]  194 	ld	bc,#0xbc06
   424D ED 49         [12]  195 	out	(c),c
   424F 01 19 BD      [10]  196 	ld	bc,#0xbd19
   4252 ED 49         [12]  197 	out	(c),c
                            198 ;src/main.c:107: cpct_setVideoMemoryPage(cpct_pageC0);
   4254 2E 30         [ 7]  199 	ld	l, #0x30
   4256 CD 30 4A      [17]  200 	call	_cpct_setVideoMemoryPage
                            201 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   4259 2E 00         [ 7]  202 	ld	l, #0x00
   425B CD 78 49      [17]  203 	call	_cpct_setVideoMemoryOffset
                            204 ;src/main.c:109: rupture(7);
   425E 3E 07         [ 7]  205 	ld	a, #0x07
   4260 F5            [11]  206 	push	af
   4261 33            [ 6]  207 	inc	sp
   4262 CD C5 44      [17]  208 	call	_rupture
   4265 33            [ 6]  209 	inc	sp
   4266                     210 00109$:
                            211 ;src/main.c:112: if (intCounter==3) {
   4266 3A 08 4C      [13]  212 	ld	a,(#_intCounter + 0)
   4269 D6 03         [ 7]  213 	sub	a, #0x03
   426B 20 15         [12]  214 	jr	NZ,00111$
                            215 ;src/main.c:113: cpct_setVideoMemoryPage(cpct_pageC0);
   426D 2E 30         [ 7]  216 	ld	l, #0x30
   426F CD 30 4A      [17]  217 	call	_cpct_setVideoMemoryPage
                            218 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   4272 2E 00         [ 7]  219 	ld	l, #0x00
   4274 CD 78 49      [17]  220 	call	_cpct_setVideoMemoryOffset
                            221 ;src/main.c:115: restoreVBL();
   4277 CD B9 44      [17]  222 	call	_restoreVBL
                            223 ;src/main.c:116: rupture(39-19-7+1);
   427A 3E 0E         [ 7]  224 	ld	a, #0x0e
   427C F5            [11]  225 	push	af
   427D 33            [ 6]  226 	inc	sp
   427E CD C5 44      [17]  227 	call	_rupture
   4281 33            [ 6]  228 	inc	sp
   4282                     229 00111$:
                            230 ;src/main.c:120: if (intCounter==4) {
   4282 3A 08 4C      [13]  231 	ld	a,(#_intCounter + 0)
   4285 D6 04         [ 7]  232 	sub	a, #0x04
   4287 C0            [11]  233 	ret	NZ
                            234 ;src/main.c:121: bank7_C000();
   4288 CD 38 44      [17]  235 	call	_bank7_C000
                            236 ;src/main.c:122: akp_musicPlay();
   428B CD 6E 41      [17]  237 	call	_akp_musicPlay
                            238 ;src/main.c:123: bank0123();
   428E CD 32 44      [17]  239 	call	_bank0123
   4291 C9            [10]  240 	ret
                            241 ;src/main.c:130: void main(void) {
                            242 ;	---------------------------------
                            243 ; Function main
                            244 ; ---------------------------------
   4292                     245 _main::
                            246 ;src/main.c:134: u8* sprite=g_items_0;
                            247 ;src/main.c:137: bank7_C000();
   4292 CD 38 44      [17]  248 	call	_bank7_C000
                            249 ;src/main.c:138: akp_musicInit();
   4295 CD 4B 41      [17]  250 	call	_akp_musicInit
                            251 ;src/main.c:139: bank0123();
   4298 CD 32 44      [17]  252 	call	_bank0123
                            253 ;src/main.c:142: cpct_disableFirmware();
   429B CD 32 4B      [17]  254 	call	_cpct_disableFirmware
                            255 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   429E 21 00 20      [10]  256 	ld	hl, #0x2000
   42A1 E5            [11]  257 	push	hl
   42A2 26 80         [ 7]  258 	ld	h, #0x80
   42A4 E5            [11]  259 	push	hl
   42A5 26 60         [ 7]  260 	ld	h, #0x60
   42A7 E5            [11]  261 	push	hl
   42A8 CD 2A 4B      [17]  262 	call	_cpct_memcpy
                            263 ;src/main.c:144: cpct_setStackLocation(0x6000);
   42AB 21 00 60      [10]  264 	ld	hl, #0x6000
   42AE CD B0 4A      [17]  265 	call	_cpct_setStackLocation
                            266 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   42B1 21 00 40      [10]  267 	ld	hl, #0x4000
   42B4 E5            [11]  268 	push	hl
   42B5 21 FF FF      [10]  269 	ld	hl, #0xffff
   42B8 E5            [11]  270 	push	hl
   42B9 21 00 80      [10]  271 	ld	hl, #0x8000
   42BC E5            [11]  272 	push	hl
   42BD CD 68 4A      [17]  273 	call	_cpct_memset_f64
                            274 ;src/main.c:147: bank0123();
   42C0 CD 32 44      [17]  275 	call	_bank0123
                            276 ;src/main.c:148: cpct_setVideoMode(0);
   42C3 2E 00         [ 7]  277 	ld	l, #0x00
   42C5 CD 01 4B      [17]  278 	call	_cpct_setVideoMode
                            279 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   42C8 21 10 14      [10]  280 	ld	hl, #0x1410
   42CB E5            [11]  281 	push	hl
   42CC CD 6C 49      [17]  282 	call	_cpct_setPALColour
                            283 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   42CF 21 06 00      [10]  284 	ld	hl, #0x0006
   42D2 E5            [11]  285 	push	hl
   42D3 21 E5 44      [10]  286 	ld	hl, #_g_tile_palette
   42D6 E5            [11]  287 	push	hl
   42D7 CD EB 48      [17]  288 	call	_cpct_setPalette
                            289 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   42DA 21 09 6E      [10]  290 	ld	hl, #0x6e09
   42DD E5            [11]  291 	push	hl
   42DE 21 00 C0      [10]  292 	ld	hl, #0xc000
   42E1 E5            [11]  293 	push	hl
   42E2 CD 5A 4B      [17]  294 	call	_cpct_getScreenPtr
                            295 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   42E5 01 CE 41      [10]  296 	ld	bc, #_g_items_0
   42E8 E5            [11]  297 	push	hl
   42E9 C5            [11]  298 	push	bc
   42EA C5            [11]  299 	push	bc
   42EB 11 04 08      [10]  300 	ld	de, #0x0804
   42EE D5            [11]  301 	push	de
   42EF CD B5 4A      [17]  302 	call	_cpct_hflipSpriteM0
   42F2 C1            [10]  303 	pop	bc
   42F3 E1            [10]  304 	pop	hl
                            305 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   42F4 11 04 08      [10]  306 	ld	de, #0x0804
   42F7 D5            [11]  307 	push	de
   42F8 E5            [11]  308 	push	hl
   42F9 C5            [11]  309 	push	bc
   42FA CD 81 49      [17]  310 	call	_cpct_drawSprite
                            311 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   42FD 21 0A 60      [10]  312 	ld	hl, #0x600a
   4300 E5            [11]  313 	push	hl
   4301 21 00 C0      [10]  314 	ld	hl, #0xc000
   4304 E5            [11]  315 	push	hl
   4305 CD 5A 4B      [17]  316 	call	_cpct_getScreenPtr
                            317 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4308 01 EB 44      [10]  318 	ld	bc, #_g_tile_schtroumpf+0
   430B 11 10 20      [10]  319 	ld	de, #0x2010
   430E D5            [11]  320 	push	de
   430F E5            [11]  321 	push	hl
   4310 C5            [11]  322 	push	bc
   4311 CD 39 4A      [17]  323 	call	_cpct_drawSpriteMasked
                            324 ;src/main.c:161: calque8000();
   4314 CD 11 44      [17]  325 	call	_calque8000
                            326 ;src/main.c:164: screen_location=(u8 *)(0x2000);
   4317 21 00 20      [10]  327 	ld	hl, #0x2000
   431A 22 03 4C      [16]  328 	ld	(_screen_location), hl
                            329 ;src/main.c:165: screen_plot_address=(u8 *)(0x8000+80-2);
   431D 21 4E 80      [10]  330 	ld	hl, #0x804e
   4320 22 05 4C      [16]  331 	ld	(_screen_plot_address), hl
                            332 ;src/main.c:169: while (1) {
   4323 01 00 00      [10]  333 	ld	bc, #0x0000
   4326                     334 00104$:
                            335 ;src/main.c:170: cpct_waitVSYNC();
   4326 C5            [11]  336 	push	bc
   4327 CD F9 4A      [17]  337 	call	_cpct_waitVSYNC
   432A C1            [10]  338 	pop	bc
                            339 ;src/main.c:172: screen_location++;
   432B FD 21 03 4C   [14]  340 	ld	iy, #_screen_location
   432F FD 34 00      [23]  341 	inc	0 (iy)
   4332 20 03         [12]  342 	jr	NZ,00116$
   4334 FD 34 01      [23]  343 	inc	1 (iy)
   4337                     344 00116$:
                            345 ;src/main.c:173: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   4337 2A 03 4C      [16]  346 	ld	hl, (_screen_location)
   433A 7C            [ 4]  347 	ld	a, h
   433B E6 23         [ 7]  348 	and	a, #0x23
   433D 67            [ 4]  349 	ld	h, a
   433E 22 03 4C      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:175: crtc(screen_location);
   4341 C5            [11]  352 	push	bc
   4342 2A 03 4C      [16]  353 	ld	hl, (_screen_location)
   4345 E5            [11]  354 	push	hl
   4346 CD AE 41      [17]  355 	call	_crtc
   4349 F1            [10]  356 	pop	af
   434A C1            [10]  357 	pop	bc
                            358 ;src/main.c:177: screen_plot_address+=2;
   434B 21 05 4C      [10]  359 	ld	hl, #_screen_plot_address
   434E 7E            [ 7]  360 	ld	a, (hl)
   434F C6 02         [ 7]  361 	add	a, #0x02
   4351 77            [ 7]  362 	ld	(hl), a
   4352 23            [ 6]  363 	inc	hl
   4353 7E            [ 7]  364 	ld	a, (hl)
   4354 CE 00         [ 7]  365 	adc	a, #0x00
   4356 77            [ 7]  366 	ld	(hl), a
                            367 ;src/main.c:178: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   4357 2A 05 4C      [16]  368 	ld	hl, (_screen_plot_address)
   435A 7C            [ 4]  369 	ld	a, h
   435B E6 87         [ 7]  370 	and	a, #0x87
   435D 67            [ 4]  371 	ld	h, a
   435E 22 05 4C      [16]  372 	ld	(_screen_plot_address), hl
                            373 ;src/main.c:184: scroll_hard(t,screen_plot_address);
   4361 C5            [11]  374 	push	bc
   4362 2A 05 4C      [16]  375 	ld	hl, (_screen_plot_address)
   4365 E5            [11]  376 	push	hl
   4366 C5            [11]  377 	push	bc
   4367 CD FA 03      [17]  378 	call	_scroll_hard
   436A F1            [10]  379 	pop	af
   436B F1            [10]  380 	pop	af
   436C C1            [10]  381 	pop	bc
                            382 ;src/main.c:186: t=t+1;
   436D 03            [ 6]  383 	inc	bc
                            384 ;src/main.c:188: cpct_scanKeyboard_f();
   436E C5            [11]  385 	push	bc
   436F CD 02 49      [17]  386 	call	_cpct_scanKeyboard_f
   4372 CD 0F 4B      [17]  387 	call	_cpct_isAnyKeyPressed_f
   4375 C1            [10]  388 	pop	bc
   4376 7D            [ 4]  389 	ld	a, l
   4377 B7            [ 4]  390 	or	a, a
   4378 28 AC         [12]  391 	jr	Z,00104$
                            392 ;src/main.c:190: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   437A C5            [11]  393 	push	bc
   437B 21 00 40      [10]  394 	ld	hl, #0x4000
   437E E5            [11]  395 	push	hl
   437F 26 00         [ 7]  396 	ld	h, #0x00
   4381 E5            [11]  397 	push	hl
   4382 26 80         [ 7]  398 	ld	h, #0x80
   4384 E5            [11]  399 	push	hl
   4385 CD 68 4A      [17]  400 	call	_cpct_memset_f64
   4388 C1            [10]  401 	pop	bc
   4389 18 9B         [12]  402 	jr	00104$
                            403 	.area _CODE
                            404 	.area _INITIALIZER
   4C10                     405 __xinit__intCounter:
   4C10 00                  406 	.db #0x00	; 0
                            407 	.area _CABS (ABS)
