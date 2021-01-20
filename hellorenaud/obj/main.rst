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
                             14 	.globl _cpct_loadBinaryFile
                             15 	.globl _InitializeAmsdos
                             16 	.globl _StoreDriveLetter
                             17 	.globl _bank7_C000
                             18 	.globl _bank0123
                             19 	.globl _calque8000
                             20 	.globl _akp_musicPlay
                             21 	.globl _akp_musicInit
                             22 	.globl _scroll_hard
                             23 	.globl _rupture
                             24 	.globl _restoreVBL
                             25 	.globl _killVBL
                             26 	.globl _cpct_getScreenPtr
                             27 	.globl _cpct_setVideoMemoryOffset
                             28 	.globl _cpct_setVideoMemoryPage
                             29 	.globl _cpct_setPALColour
                             30 	.globl _cpct_setPalette
                             31 	.globl _cpct_waitVSYNC
                             32 	.globl _cpct_setVideoMode
                             33 	.globl _cpct_hflipSpriteM0
                             34 	.globl _cpct_drawSpriteMasked
                             35 	.globl _cpct_drawSprite
                             36 	.globl _cpct_isAnyKeyPressed_f
                             37 	.globl _cpct_scanKeyboard_f
                             38 	.globl _cpct_setStackLocation
                             39 	.globl _cpct_memcpy
                             40 	.globl _cpct_memset_f64
                             41 	.globl _cpct_setInterruptHandler
                             42 	.globl _cpct_disableFirmware
                             43 	.globl _intCounter
                             44 	.globl _screen_plot_address
                             45 	.globl _screen_location
                             46 	.globl _g_items_0
                             47 ;--------------------------------------------------------
                             48 ; special function registers
                             49 ;--------------------------------------------------------
                             50 ;--------------------------------------------------------
                             51 ; ram data
                             52 ;--------------------------------------------------------
                             53 	.area _DATA
   4CD6                      54 _screen_location::
   4CD6                      55 	.ds 2
   4CD8                      56 _screen_plot_address::
   4CD8                      57 	.ds 2
                             58 ;--------------------------------------------------------
                             59 ; ram data
                             60 ;--------------------------------------------------------
                             61 	.area _INITIALIZED
   4CDB                      62 _intCounter::
   4CDB                      63 	.ds 1
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
                             84 ;src/main.c:46: void crtc(u8* R12R13) {
                             85 ;	---------------------------------
                             86 ; Function crtc
                             87 ; ---------------------------------
   41AE                      88 _crtc::
                             89 ;src/main.c:63: __endasm;
   41AE DD E5         [15]   90 	push	ix
   41B0 DD 21 00 00   [14]   91 	ld	ix,#0
   41B4 DD 39         [15]   92 	add	ix,sp
   41B6 DD 66 05      [19]   93 	ld	h, 5 (ix)
   41B9 DD 6E 04      [19]   94 	ld	l, 4 (ix)
   41BC 01 0C BC      [10]   95 	ld	bc,#0xbc00+12
   41BF ED 49         [12]   96 	out	(c),c
   41C1 04            [ 4]   97 	inc	b
   41C2 ED 61         [12]   98 	out	(c),h
   41C4 05            [ 4]   99 	dec	b
   41C5 0C            [ 4]  100 	inc	c
   41C6 ED 49         [12]  101 	out	(c),c
   41C8 04            [ 4]  102 	inc	b
   41C9 ED 69         [12]  103 	out	(c),l
   41CB DD E1         [14]  104 	pop	ix
   41CD C9            [10]  105 	ret
   41CE                     106 _g_items_0:
   41CE 05                  107 	.db #0x05	; 5
   41CF 0F                  108 	.db #0x0f	; 15
   41D0 0F                  109 	.db #0x0f	; 15
   41D1 00                  110 	.db #0x00	; 0
   41D2 0F                  111 	.db #0x0f	; 15
   41D3 0F                  112 	.db #0x0f	; 15
   41D4 0F                  113 	.db #0x0f	; 15
   41D5 0A                  114 	.db #0x0a	; 10
   41D6 0F                  115 	.db #0x0f	; 15
   41D7 0A                  116 	.db #0x0a	; 10
   41D8 05                  117 	.db #0x05	; 5
   41D9 00                  118 	.db #0x00	; 0
   41DA 0F                  119 	.db #0x0f	; 15
   41DB 0A                  120 	.db #0x0a	; 10
   41DC 05                  121 	.db #0x05	; 5
   41DD 00                  122 	.db #0x00	; 0
   41DE 05                  123 	.db #0x05	; 5
   41DF 0F                  124 	.db #0x0f	; 15
   41E0 0A                  125 	.db #0x0a	; 10
   41E1 0A                  126 	.db #0x0a	; 10
   41E2 00                  127 	.db #0x00	; 0
   41E3 0F                  128 	.db #0x0f	; 15
   41E4 0F                  129 	.db #0x0f	; 15
   41E5 0A                  130 	.db #0x0a	; 10
   41E6 00                  131 	.db #0x00	; 0
   41E7 0A                  132 	.db #0x0a	; 10
   41E8 0A                  133 	.db #0x0a	; 10
   41E9 0A                  134 	.db #0x0a	; 10
   41EA 00                  135 	.db #0x00	; 0
   41EB 00                  136 	.db #0x00	; 0
   41EC 00                  137 	.db #0x00	; 0
   41ED 00                  138 	.db #0x00	; 0
                            139 ;src/main.c:74: void myInterruptHandler() {
                            140 ;	---------------------------------
                            141 ; Function myInterruptHandler
                            142 ; ---------------------------------
   41EE                     143 _myInterruptHandler::
                            144 ;src/main.c:77: intCounter=intCounter+1;
   41EE FD 21 DB 4C   [14]  145 	ld	iy, #_intCounter
   41F2 FD 34 00      [23]  146 	inc	0 (iy)
                            147 ;src/main.c:78: if (intCounter == 6) intCounter=0;
   41F5 FD 7E 00      [19]  148 	ld	a, 0 (iy)
   41F8 D6 06         [ 7]  149 	sub	a, #0x06
   41FA 20 04         [12]  150 	jr	NZ,00102$
   41FC FD 36 00 00   [19]  151 	ld	0 (iy), #0x00
   4200                     152 00102$:
                            153 ;src/main.c:80: if (intCounter == 2) {
   4200 3A DB 4C      [13]  154 	ld	a,(#_intCounter + 0)
   4203 D6 02         [ 7]  155 	sub	a, #0x02
   4205 20 09         [12]  156 	jr	NZ,00104$
                            157 ;src/main.c:81: cpct_setBorder(0x54);
   4207 21 10 54      [10]  158 	ld	hl, #0x5410
   420A E5            [11]  159 	push	hl
   420B CD 17 4A      [17]  160 	call	_cpct_setPALColour
   420E 18 07         [12]  161 	jr	00105$
   4210                     162 00104$:
                            163 ;src/main.c:83: cpct_setBorder(0x50);
   4210 21 10 50      [10]  164 	ld	hl, #0x5010
   4213 E5            [11]  165 	push	hl
   4214 CD 17 4A      [17]  166 	call	_cpct_setPALColour
   4217                     167 00105$:
                            168 ;src/main.c:86: if (intCounter==5) {
   4217 FD 21 DB 4C   [14]  169 	ld	iy, #_intCounter
   421B FD 7E 00      [19]  170 	ld	a, 0 (iy)
   421E D6 05         [ 7]  171 	sub	a, #0x05
   4220 20 1D         [12]  172 	jr	NZ,00107$
                            173 ;src/main.c:92: __endasm;
   4222 01 06 BC      [10]  174 	ld	bc,#0xbc06
   4225 ED 49         [12]  175 	out	(c),c
   4227 01 04 BD      [10]  176 	ld	bc,#0xbd04
   422A ED 49         [12]  177 	out	(c),c
                            178 ;src/main.c:94: crtc(screen_location);
   422C 2A D6 4C      [16]  179 	ld	hl, (_screen_location)
   422F E5            [11]  180 	push	hl
   4230 CD AE 41      [17]  181 	call	_crtc
   4233 F1            [10]  182 	pop	af
                            183 ;src/main.c:96: killVBL();
   4234 CD C0 44      [17]  184 	call	_killVBL
                            185 ;src/main.c:97: rupture(19-1);
   4237 3E 12         [ 7]  186 	ld	a, #0x12
   4239 F5            [11]  187 	push	af
   423A 33            [ 6]  188 	inc	sp
   423B CD DD 44      [17]  189 	call	_rupture
   423E 33            [ 6]  190 	inc	sp
   423F                     191 00107$:
                            192 ;src/main.c:101: if (intCounter==2) {
   423F FD 21 DB 4C   [14]  193 	ld	iy, #_intCounter
   4243 FD 7E 00      [19]  194 	ld	a, 0 (iy)
   4246 D6 02         [ 7]  195 	sub	a, #0x02
   4248 20 1C         [12]  196 	jr	NZ,00109$
                            197 ;src/main.c:107: __endasm;
   424A 01 06 BC      [10]  198 	ld	bc,#0xbc06
   424D ED 49         [12]  199 	out	(c),c
   424F 01 19 BD      [10]  200 	ld	bc,#0xbd19
   4252 ED 49         [12]  201 	out	(c),c
                            202 ;src/main.c:108: cpct_setVideoMemoryPage(cpct_pageC0);
   4254 2E 30         [ 7]  203 	ld	l, #0x30
   4256 CD DB 4A      [17]  204 	call	_cpct_setVideoMemoryPage
                            205 ;src/main.c:109: cpct_setVideoMemoryOffset(0);
   4259 2E 00         [ 7]  206 	ld	l, #0x00
   425B CD 23 4A      [17]  207 	call	_cpct_setVideoMemoryOffset
                            208 ;src/main.c:110: rupture(7);
   425E 3E 07         [ 7]  209 	ld	a, #0x07
   4260 F5            [11]  210 	push	af
   4261 33            [ 6]  211 	inc	sp
   4262 CD DD 44      [17]  212 	call	_rupture
   4265 33            [ 6]  213 	inc	sp
   4266                     214 00109$:
                            215 ;src/main.c:113: if (intCounter==3) {
   4266 3A DB 4C      [13]  216 	ld	a,(#_intCounter + 0)
   4269 D6 03         [ 7]  217 	sub	a, #0x03
   426B 20 15         [12]  218 	jr	NZ,00111$
                            219 ;src/main.c:114: cpct_setVideoMemoryPage(cpct_pageC0);
   426D 2E 30         [ 7]  220 	ld	l, #0x30
   426F CD DB 4A      [17]  221 	call	_cpct_setVideoMemoryPage
                            222 ;src/main.c:115: cpct_setVideoMemoryOffset(0);
   4272 2E 00         [ 7]  223 	ld	l, #0x00
   4274 CD 23 4A      [17]  224 	call	_cpct_setVideoMemoryOffset
                            225 ;src/main.c:116: restoreVBL();
   4277 CD D1 44      [17]  226 	call	_restoreVBL
                            227 ;src/main.c:117: rupture(39-19-7+1);
   427A 3E 0E         [ 7]  228 	ld	a, #0x0e
   427C F5            [11]  229 	push	af
   427D 33            [ 6]  230 	inc	sp
   427E CD DD 44      [17]  231 	call	_rupture
   4281 33            [ 6]  232 	inc	sp
   4282                     233 00111$:
                            234 ;src/main.c:121: if (intCounter==4) {
   4282 3A DB 4C      [13]  235 	ld	a,(#_intCounter + 0)
   4285 D6 04         [ 7]  236 	sub	a, #0x04
   4287 C0            [11]  237 	ret	NZ
                            238 ;src/main.c:122: bank7_C000();
   4288 CD 50 44      [17]  239 	call	_bank7_C000
                            240 ;src/main.c:123: akp_musicPlay();
   428B CD 6E 41      [17]  241 	call	_akp_musicPlay
                            242 ;src/main.c:124: bank0123();
   428E CD 4A 44      [17]  243 	call	_bank0123
   4291 C9            [10]  244 	ret
                            245 ;src/main.c:131: void main(void) {
                            246 ;	---------------------------------
                            247 ; Function main
                            248 ; ---------------------------------
   4292                     249 _main::
                            250 ;src/main.c:135: u8* sprite=g_items_0;
                            251 ;src/main.c:137: StoreDriveLetter();
   4292 CD 0D 49      [17]  252 	call	_StoreDriveLetter
                            253 ;src/main.c:138: InitializeAmsdos();
   4295 CD 1B 49      [17]  254 	call	_InitializeAmsdos
                            255 ;src/main.c:140: cpct_loadBinaryFile("CPC-BAT.SCR", 0xC000);
   4298 21 00 C0      [10]  256 	ld	hl, #0xc000
   429B E5            [11]  257 	push	hl
   429C 21 97 43      [10]  258 	ld	hl, #___str_0
   429F E5            [11]  259 	push	hl
   42A0 CD 58 49      [17]  260 	call	_cpct_loadBinaryFile
   42A3 F1            [10]  261 	pop	af
   42A4 F1            [10]  262 	pop	af
                            263 ;src/main.c:145: bank7_C000();
   42A5 CD 50 44      [17]  264 	call	_bank7_C000
                            265 ;src/main.c:146: akp_musicInit();
   42A8 CD 4B 41      [17]  266 	call	_akp_musicInit
                            267 ;src/main.c:147: bank0123();
   42AB CD 4A 44      [17]  268 	call	_bank0123
                            269 ;src/main.c:150: cpct_disableFirmware();
   42AE CD DD 4B      [17]  270 	call	_cpct_disableFirmware
                            271 ;src/main.c:151: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   42B1 21 00 20      [10]  272 	ld	hl, #0x2000
   42B4 E5            [11]  273 	push	hl
   42B5 26 80         [ 7]  274 	ld	h, #0x80
   42B7 E5            [11]  275 	push	hl
   42B8 26 60         [ 7]  276 	ld	h, #0x60
   42BA E5            [11]  277 	push	hl
   42BB CD D5 4B      [17]  278 	call	_cpct_memcpy
                            279 ;src/main.c:152: cpct_setStackLocation(0x6000);
   42BE 21 00 60      [10]  280 	ld	hl, #0x6000
   42C1 CD 5B 4B      [17]  281 	call	_cpct_setStackLocation
                            282 ;src/main.c:153: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   42C4 21 00 40      [10]  283 	ld	hl, #0x4000
   42C7 E5            [11]  284 	push	hl
   42C8 26 00         [ 7]  285 	ld	h, #0x00
   42CA E5            [11]  286 	push	hl
   42CB 26 80         [ 7]  287 	ld	h, #0x80
   42CD E5            [11]  288 	push	hl
   42CE CD 13 4B      [17]  289 	call	_cpct_memset_f64
                            290 ;src/main.c:159: bank0123();
   42D1 CD 4A 44      [17]  291 	call	_bank0123
                            292 ;src/main.c:160: cpct_setVideoMode(0);
   42D4 2E 00         [ 7]  293 	ld	l, #0x00
   42D6 CD AC 4B      [17]  294 	call	_cpct_setVideoMode
                            295 ;src/main.c:161: cpct_setBorder(HW_BLACK);
   42D9 21 10 14      [10]  296 	ld	hl, #0x1410
   42DC E5            [11]  297 	push	hl
   42DD CD 17 4A      [17]  298 	call	_cpct_setPALColour
                            299 ;src/main.c:162: cpct_setPalette(g_tile_palette, 6);
   42E0 21 06 00      [10]  300 	ld	hl, #0x0006
   42E3 E5            [11]  301 	push	hl
   42E4 21 FD 44      [10]  302 	ld	hl, #_g_tile_palette
   42E7 E5            [11]  303 	push	hl
   42E8 CD 96 49      [17]  304 	call	_cpct_setPalette
                            305 ;src/main.c:165: p = cpct_getScreenPtr(CPCT_VMEM_START, 0,110+16);
   42EB 21 00 7E      [10]  306 	ld	hl, #0x7e00
   42EE E5            [11]  307 	push	hl
   42EF 26 C0         [ 7]  308 	ld	h, #0xc0
   42F1 E5            [11]  309 	push	hl
   42F2 CD 05 4C      [17]  310 	call	_cpct_getScreenPtr
                            311 ;src/main.c:166: cpct_hflipSpriteM0(4, 8, sprite);
   42F5 01 CE 41      [10]  312 	ld	bc, #_g_items_0
   42F8 E5            [11]  313 	push	hl
   42F9 C5            [11]  314 	push	bc
   42FA C5            [11]  315 	push	bc
   42FB 11 04 08      [10]  316 	ld	de, #0x0804
   42FE D5            [11]  317 	push	de
   42FF CD 60 4B      [17]  318 	call	_cpct_hflipSpriteM0
   4302 C1            [10]  319 	pop	bc
   4303 E1            [10]  320 	pop	hl
                            321 ;src/main.c:167: cpct_drawSprite(sprite, p, 4, 8);
   4304 11 04 08      [10]  322 	ld	de, #0x0804
   4307 D5            [11]  323 	push	de
   4308 E5            [11]  324 	push	hl
   4309 C5            [11]  325 	push	bc
   430A CD 2C 4A      [17]  326 	call	_cpct_drawSprite
                            327 ;src/main.c:170: p = cpct_getScreenPtr(CPCT_VMEM_START, 1,96+16);
   430D 21 01 70      [10]  328 	ld	hl, #0x7001
   4310 E5            [11]  329 	push	hl
   4311 21 00 C0      [10]  330 	ld	hl, #0xc000
   4314 E5            [11]  331 	push	hl
   4315 CD 05 4C      [17]  332 	call	_cpct_getScreenPtr
                            333 ;src/main.c:171: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4318 01 0D 45      [10]  334 	ld	bc, #_g_tile_schtroumpf+0
   431B 11 10 20      [10]  335 	ld	de, #0x2010
   431E D5            [11]  336 	push	de
   431F E5            [11]  337 	push	hl
   4320 C5            [11]  338 	push	bc
   4321 CD E4 4A      [17]  339 	call	_cpct_drawSpriteMasked
                            340 ;src/main.c:173: calque8000();
   4324 CD 29 44      [17]  341 	call	_calque8000
                            342 ;src/main.c:176: screen_location=(u8 *)(0x2000);
   4327 21 00 20      [10]  343 	ld	hl, #0x2000
   432A 22 D6 4C      [16]  344 	ld	(_screen_location), hl
                            345 ;src/main.c:177: screen_plot_address=(u8 *)(0x8000+80-2);
   432D 21 4E 80      [10]  346 	ld	hl, #0x804e
   4330 22 D8 4C      [16]  347 	ld	(_screen_plot_address), hl
                            348 ;src/main.c:179: cpct_setInterruptHandler(myInterruptHandler);
   4333 21 EE 41      [10]  349 	ld	hl, #_myInterruptHandler
   4336 CD 25 4C      [17]  350 	call	_cpct_setInterruptHandler
                            351 ;src/main.c:181: while (1) {
   4339 01 00 00      [10]  352 	ld	bc, #0x0000
   433C                     353 00104$:
                            354 ;src/main.c:182: cpct_waitVSYNC();
   433C C5            [11]  355 	push	bc
   433D CD A4 4B      [17]  356 	call	_cpct_waitVSYNC
   4340 C1            [10]  357 	pop	bc
                            358 ;src/main.c:184: screen_location++;
   4341 FD 21 D6 4C   [14]  359 	ld	iy, #_screen_location
   4345 FD 34 00      [23]  360 	inc	0 (iy)
   4348 20 03         [12]  361 	jr	NZ,00116$
   434A FD 34 01      [23]  362 	inc	1 (iy)
   434D                     363 00116$:
                            364 ;src/main.c:185: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   434D 2A D6 4C      [16]  365 	ld	hl, (_screen_location)
   4350 7C            [ 4]  366 	ld	a, h
   4351 E6 23         [ 7]  367 	and	a, #0x23
   4353 67            [ 4]  368 	ld	h, a
   4354 22 D6 4C      [16]  369 	ld	(_screen_location), hl
                            370 ;src/main.c:189: screen_plot_address+=2;
   4357 21 D8 4C      [10]  371 	ld	hl, #_screen_plot_address
   435A 7E            [ 7]  372 	ld	a, (hl)
   435B C6 02         [ 7]  373 	add	a, #0x02
   435D 77            [ 7]  374 	ld	(hl), a
   435E 23            [ 6]  375 	inc	hl
   435F 7E            [ 7]  376 	ld	a, (hl)
   4360 CE 00         [ 7]  377 	adc	a, #0x00
   4362 77            [ 7]  378 	ld	(hl), a
                            379 ;src/main.c:190: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   4363 2A D8 4C      [16]  380 	ld	hl, (_screen_plot_address)
   4366 7C            [ 4]  381 	ld	a, h
   4367 E6 87         [ 7]  382 	and	a, #0x87
   4369 67            [ 4]  383 	ld	h, a
   436A 22 D8 4C      [16]  384 	ld	(_screen_plot_address), hl
                            385 ;src/main.c:196: scroll_hard(t,screen_plot_address);
   436D C5            [11]  386 	push	bc
   436E 2A D8 4C      [16]  387 	ld	hl, (_screen_plot_address)
   4371 E5            [11]  388 	push	hl
   4372 C5            [11]  389 	push	bc
   4373 CD FA 03      [17]  390 	call	_scroll_hard
   4376 F1            [10]  391 	pop	af
   4377 F1            [10]  392 	pop	af
   4378 C1            [10]  393 	pop	bc
                            394 ;src/main.c:198: t=t+1;
   4379 03            [ 6]  395 	inc	bc
                            396 ;src/main.c:200: cpct_scanKeyboard_f();
   437A C5            [11]  397 	push	bc
   437B CD AD 49      [17]  398 	call	_cpct_scanKeyboard_f
   437E CD BA 4B      [17]  399 	call	_cpct_isAnyKeyPressed_f
   4381 C1            [10]  400 	pop	bc
   4382 7D            [ 4]  401 	ld	a, l
   4383 B7            [ 4]  402 	or	a, a
   4384 28 B6         [12]  403 	jr	Z,00104$
                            404 ;src/main.c:202: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   4386 C5            [11]  405 	push	bc
   4387 21 00 40      [10]  406 	ld	hl, #0x4000
   438A E5            [11]  407 	push	hl
   438B 26 00         [ 7]  408 	ld	h, #0x00
   438D E5            [11]  409 	push	hl
   438E 26 80         [ 7]  410 	ld	h, #0x80
   4390 E5            [11]  411 	push	hl
   4391 CD 13 4B      [17]  412 	call	_cpct_memset_f64
   4394 C1            [10]  413 	pop	bc
   4395 18 A5         [12]  414 	jr	00104$
   4397                     415 ___str_0:
   4397 43 50 43 2D 42 41   416 	.ascii "CPC-BAT.SCR"
        54 2E 53 43 52
   43A2 00                  417 	.db 0x00
                            418 	.area _CODE
                            419 	.area _INITIALIZER
   4CE3                     420 __xinit__intCounter:
   4CE3 00                  421 	.db #0x00	; 0
                            422 	.area _CABS (ABS)
