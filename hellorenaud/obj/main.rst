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
                             17 	.globl _calqueC000
                             18 	.globl _akp_musicPlay
                             19 	.globl _akp_musicInit
                             20 	.globl _scroll_hard
                             21 	.globl _rupture
                             22 	.globl _restoreVBL
                             23 	.globl _killVBL
                             24 	.globl _cpct_getScreenPtr
                             25 	.globl _cpct_setVideoMemoryOffset
                             26 	.globl _cpct_setPALColour
                             27 	.globl _cpct_setPalette
                             28 	.globl _cpct_waitVSYNC
                             29 	.globl _cpct_setVideoMode
                             30 	.globl _cpct_hflipSpriteM0
                             31 	.globl _cpct_drawSpriteMasked
                             32 	.globl _cpct_drawSprite
                             33 	.globl _cpct_setStackLocation
                             34 	.globl _cpct_memcpy
                             35 	.globl _cpct_memset_f64
                             36 	.globl _cpct_setInterruptHandler
                             37 	.globl _cpct_disableFirmware
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
   4A8F                      49 _screen_location::
   4A8F                      50 	.ds 2
   4A91                      51 _screen_plot_address::
   4A91                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   4A93                      57 _intCounter::
   4A93                      58 	.ds 1
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
                             79 ;src/main.c:45: void crtc(u8* R12R13) {
                             80 ;	---------------------------------
                             81 ; Function crtc
                             82 ; ---------------------------------
   40B6                      83 _crtc::
                             84 ;src/main.c:62: __endasm;
   40B6 DD E5         [15]   85 	push	ix
   40B8 DD 21 00 00   [14]   86 	ld	ix,#0
   40BC DD 39         [15]   87 	add	ix,sp
   40BE DD 66 05      [19]   88 	ld	h, 5 (ix)
   40C1 DD 6E 04      [19]   89 	ld	l, 4 (ix)
   40C4 01 0C BC      [10]   90 	ld	bc,#0xbc00+12
   40C7 ED 49         [12]   91 	out	(c),c
   40C9 04            [ 4]   92 	inc	b
   40CA ED 61         [12]   93 	out	(c),h
   40CC 05            [ 4]   94 	dec	b
   40CD 0C            [ 4]   95 	inc	c
   40CE ED 49         [12]   96 	out	(c),c
   40D0 04            [ 4]   97 	inc	b
   40D1 ED 69         [12]   98 	out	(c),l
   40D3 DD E1         [14]   99 	pop	ix
   40D5 C9            [10]  100 	ret
   40D6                     101 _g_items_0:
   40D6 05                  102 	.db #0x05	; 5
   40D7 0F                  103 	.db #0x0f	; 15
   40D8 0F                  104 	.db #0x0f	; 15
   40D9 00                  105 	.db #0x00	; 0
   40DA 0F                  106 	.db #0x0f	; 15
   40DB 0F                  107 	.db #0x0f	; 15
   40DC 0F                  108 	.db #0x0f	; 15
   40DD 0A                  109 	.db #0x0a	; 10
   40DE 0F                  110 	.db #0x0f	; 15
   40DF 0A                  111 	.db #0x0a	; 10
   40E0 05                  112 	.db #0x05	; 5
   40E1 00                  113 	.db #0x00	; 0
   40E2 0F                  114 	.db #0x0f	; 15
   40E3 0A                  115 	.db #0x0a	; 10
   40E4 05                  116 	.db #0x05	; 5
   40E5 00                  117 	.db #0x00	; 0
   40E6 05                  118 	.db #0x05	; 5
   40E7 0F                  119 	.db #0x0f	; 15
   40E8 0A                  120 	.db #0x0a	; 10
   40E9 0A                  121 	.db #0x0a	; 10
   40EA 00                  122 	.db #0x00	; 0
   40EB 0F                  123 	.db #0x0f	; 15
   40EC 0F                  124 	.db #0x0f	; 15
   40ED 0A                  125 	.db #0x0a	; 10
   40EE 00                  126 	.db #0x00	; 0
   40EF 0A                  127 	.db #0x0a	; 10
   40F0 0A                  128 	.db #0x0a	; 10
   40F1 0A                  129 	.db #0x0a	; 10
   40F2 00                  130 	.db #0x00	; 0
   40F3 00                  131 	.db #0x00	; 0
   40F4 00                  132 	.db #0x00	; 0
   40F5 00                  133 	.db #0x00	; 0
                            134 ;src/main.c:72: void myInterruptHandler() {
                            135 ;	---------------------------------
                            136 ; Function myInterruptHandler
                            137 ; ---------------------------------
   40F6                     138 _myInterruptHandler::
                            139 ;src/main.c:75: intCounter=intCounter+1;
   40F6 FD 21 93 4A   [14]  140 	ld	iy, #_intCounter
   40FA FD 34 00      [23]  141 	inc	0 (iy)
                            142 ;src/main.c:76: if (intCounter == 6) intCounter=0;
   40FD FD 7E 00      [19]  143 	ld	a, 0 (iy)
   4100 D6 06         [ 7]  144 	sub	a, #0x06
   4102 20 04         [12]  145 	jr	NZ,00102$
   4104 FD 36 00 00   [19]  146 	ld	0 (iy), #0x00
   4108                     147 00102$:
                            148 ;src/main.c:78: if (intCounter == 2) {
   4108 3A 93 4A      [13]  149 	ld	a,(#_intCounter + 0)
   410B D6 02         [ 7]  150 	sub	a, #0x02
   410D 20 09         [12]  151 	jr	NZ,00104$
                            152 ;src/main.c:79: cpct_setBorder(2);
   410F 21 10 02      [10]  153 	ld	hl, #0x0210
   4112 E5            [11]  154 	push	hl
   4113 CD FC 47      [17]  155 	call	_cpct_setPALColour
   4116 18 07         [12]  156 	jr	00105$
   4118                     157 00104$:
                            158 ;src/main.c:81: cpct_setBorder(3);
   4118 21 10 03      [10]  159 	ld	hl, #0x0310
   411B E5            [11]  160 	push	hl
   411C CD FC 47      [17]  161 	call	_cpct_setPALColour
   411F                     162 00105$:
                            163 ;src/main.c:84: if (intCounter==5) {
   411F FD 21 93 4A   [14]  164 	ld	iy, #_intCounter
   4123 FD 7E 00      [19]  165 	ld	a, 0 (iy)
   4126 D6 05         [ 7]  166 	sub	a, #0x05
   4128 20 5B         [12]  167 	jr	NZ,00107$
                            168 ;src/main.c:90: __endasm;
   412A 01 06 BC      [10]  169 	ld	bc,#0xbc06
   412D ED 49         [12]  170 	out	(c),c
   412F 01 04 BD      [10]  171 	ld	bc,#0xbd04
   4132 ED 49         [12]  172 	out	(c),c
                            173 ;src/main.c:92: screen_location++;
   4134 FD 21 8F 4A   [14]  174 	ld	iy, #_screen_location
   4138 FD 34 00      [23]  175 	inc	0 (iy)
   413B 20 03         [12]  176 	jr	NZ,00146$
   413D FD 34 01      [23]  177 	inc	1 (iy)
   4140                     178 00146$:
                            179 ;src/main.c:93: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4140 2A 8F 4A      [16]  180 	ld	hl, (_screen_location)
   4143 7C            [ 4]  181 	ld	a, h
   4144 E6 23         [ 7]  182 	and	a, #0x23
   4146 67            [ 4]  183 	ld	h, a
   4147 22 8F 4A      [16]  184 	ld	(_screen_location), hl
                            185 ;src/main.c:94: crtc(screen_location);
   414A 2A 8F 4A      [16]  186 	ld	hl, (_screen_location)
   414D E5            [11]  187 	push	hl
   414E CD B6 40      [17]  188 	call	_crtc
   4151 F1            [10]  189 	pop	af
                            190 ;src/main.c:96: screen_plot_address++;
   4152 FD 21 91 4A   [14]  191 	ld	iy, #_screen_plot_address
   4156 FD 34 00      [23]  192 	inc	0 (iy)
   4159 20 03         [12]  193 	jr	NZ,00147$
   415B FD 34 01      [23]  194 	inc	1 (iy)
   415E                     195 00147$:
                            196 ;src/main.c:97: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   415E 2A 91 4A      [16]  197 	ld	hl, (_screen_plot_address)
   4161 7C            [ 4]  198 	ld	a, h
   4162 E6 87         [ 7]  199 	and	a, #0x87
   4164 67            [ 4]  200 	ld	h, a
   4165 22 91 4A      [16]  201 	ld	(_screen_plot_address), hl
                            202 ;src/main.c:98: screen_plot_address++;
   4168 FD 34 00      [23]  203 	inc	0 (iy)
   416B 20 03         [12]  204 	jr	NZ,00148$
   416D FD 34 01      [23]  205 	inc	1 (iy)
   4170                     206 00148$:
                            207 ;src/main.c:99: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4170 2A 91 4A      [16]  208 	ld	hl, (_screen_plot_address)
   4173 7C            [ 4]  209 	ld	a, h
   4174 E6 87         [ 7]  210 	and	a, #0x87
   4176 67            [ 4]  211 	ld	h, a
   4177 22 91 4A      [16]  212 	ld	(_screen_plot_address), hl
                            213 ;src/main.c:102: killVBL();
   417A CD A2 43      [17]  214 	call	_killVBL
                            215 ;src/main.c:103: rupture(19-1);
   417D 3E 12         [ 7]  216 	ld	a, #0x12
   417F F5            [11]  217 	push	af
   4180 33            [ 6]  218 	inc	sp
   4181 CD BF 43      [17]  219 	call	_rupture
   4184 33            [ 6]  220 	inc	sp
   4185                     221 00107$:
                            222 ;src/main.c:108: if (intCounter==2) {
   4185 FD 21 93 4A   [14]  223 	ld	iy, #_intCounter
   4189 FD 7E 00      [19]  224 	ld	a, 0 (iy)
   418C D6 02         [ 7]  225 	sub	a, #0x02
   418E 20 1A         [12]  226 	jr	NZ,00109$
                            227 ;src/main.c:114: __endasm;
   4190 01 06 BC      [10]  228 	ld	bc,#0xbc06
   4193 ED 49         [12]  229 	out	(c),c
   4195 01 19 BD      [10]  230 	ld	bc,#0xbd19
   4198 ED 49         [12]  231 	out	(c),c
                            232 ;src/main.c:115: calqueC000();
   419A CD 00 43      [17]  233 	call	_calqueC000
                            234 ;src/main.c:116: cpct_setVideoMemoryOffset(0);
   419D 2E 00         [ 7]  235 	ld	l, #0x00
   419F CD 08 48      [17]  236 	call	_cpct_setVideoMemoryOffset
                            237 ;src/main.c:117: rupture(7);
   41A2 3E 07         [ 7]  238 	ld	a, #0x07
   41A4 F5            [11]  239 	push	af
   41A5 33            [ 6]  240 	inc	sp
   41A6 CD BF 43      [17]  241 	call	_rupture
   41A9 33            [ 6]  242 	inc	sp
   41AA                     243 00109$:
                            244 ;src/main.c:120: if (intCounter==3) {
   41AA 3A 93 4A      [13]  245 	ld	a,(#_intCounter + 0)
   41AD D6 03         [ 7]  246 	sub	a, #0x03
   41AF 20 13         [12]  247 	jr	NZ,00111$
                            248 ;src/main.c:121: calqueC000();
   41B1 CD 00 43      [17]  249 	call	_calqueC000
                            250 ;src/main.c:122: cpct_setVideoMemoryOffset(0);
   41B4 2E 00         [ 7]  251 	ld	l, #0x00
   41B6 CD 08 48      [17]  252 	call	_cpct_setVideoMemoryOffset
                            253 ;src/main.c:123: restoreVBL();
   41B9 CD B3 43      [17]  254 	call	_restoreVBL
                            255 ;src/main.c:124: rupture(39-19-7+1);
   41BC 3E 0E         [ 7]  256 	ld	a, #0x0e
   41BE F5            [11]  257 	push	af
   41BF 33            [ 6]  258 	inc	sp
   41C0 CD BF 43      [17]  259 	call	_rupture
   41C3 33            [ 6]  260 	inc	sp
   41C4                     261 00111$:
                            262 ;src/main.c:128: if (intCounter==4) {
   41C4 3A 93 4A      [13]  263 	ld	a,(#_intCounter + 0)
   41C7 D6 04         [ 7]  264 	sub	a, #0x04
   41C9 C0            [11]  265 	ret	NZ
                            266 ;src/main.c:129: bank7_C000();
   41CA CD 32 43      [17]  267 	call	_bank7_C000
                            268 ;src/main.c:130: akp_musicPlay();
   41CD CD 76 40      [17]  269 	call	_akp_musicPlay
                            270 ;src/main.c:131: bank0123();
   41D0 CD 2C 43      [17]  271 	call	_bank0123
   41D3 C9            [10]  272 	ret
                            273 ;src/main.c:138: void main(void) {
                            274 ;	---------------------------------
                            275 ; Function main
                            276 ; ---------------------------------
   41D4                     277 _main::
                            278 ;src/main.c:142: u8* sprite=g_items_0;
                            279 ;src/main.c:147: bank7_C000();
   41D4 CD 32 43      [17]  280 	call	_bank7_C000
                            281 ;src/main.c:148: akp_musicInit();
   41D7 CD 53 40      [17]  282 	call	_akp_musicInit
                            283 ;src/main.c:149: bank0123();
   41DA CD 2C 43      [17]  284 	call	_bank0123
                            285 ;src/main.c:152: cpct_disableFirmware();
   41DD CD 94 49      [17]  286 	call	_cpct_disableFirmware
                            287 ;src/main.c:153: cpct_memcpy(0x6000,0x8000,0x2000);
   41E0 21 00 20      [10]  288 	ld	hl, #0x2000
   41E3 E5            [11]  289 	push	hl
   41E4 26 80         [ 7]  290 	ld	h, #0x80
   41E6 E5            [11]  291 	push	hl
   41E7 26 60         [ 7]  292 	ld	h, #0x60
   41E9 E5            [11]  293 	push	hl
   41EA CD 8C 49      [17]  294 	call	_cpct_memcpy
                            295 ;src/main.c:154: cpct_setStackLocation(0x6000);
   41ED 21 00 60      [10]  296 	ld	hl, #0x6000
   41F0 CD 2D 49      [17]  297 	call	_cpct_setStackLocation
                            298 ;src/main.c:155: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   41F3 21 00 40      [10]  299 	ld	hl, #0x4000
   41F6 E5            [11]  300 	push	hl
   41F7 26 00         [ 7]  301 	ld	h, #0x00
   41F9 E5            [11]  302 	push	hl
   41FA 26 80         [ 7]  303 	ld	h, #0x80
   41FC E5            [11]  304 	push	hl
   41FD CD E5 48      [17]  305 	call	_cpct_memset_f64
                            306 ;src/main.c:156: cpct_setInterruptHandler(myInterruptHandler);
   4200 21 F6 40      [10]  307 	ld	hl, #_myInterruptHandler
   4203 CD DE 49      [17]  308 	call	_cpct_setInterruptHandler
                            309 ;src/main.c:158: bank0123();
   4206 CD 2C 43      [17]  310 	call	_bank0123
                            311 ;src/main.c:159: cpct_setVideoMode(0);
   4209 2E 00         [ 7]  312 	ld	l, #0x00
   420B CD 7E 49      [17]  313 	call	_cpct_setVideoMode
                            314 ;src/main.c:160: cpct_setBorder(HW_BLACK);
   420E 21 10 14      [10]  315 	ld	hl, #0x1410
   4211 E5            [11]  316 	push	hl
   4212 CD FC 47      [17]  317 	call	_cpct_setPALColour
                            318 ;src/main.c:161: cpct_setPalette(g_tile_palette, 6);
   4215 21 06 00      [10]  319 	ld	hl, #0x0006
   4218 E5            [11]  320 	push	hl
   4219 21 DF 43      [10]  321 	ld	hl, #_g_tile_palette
   421C E5            [11]  322 	push	hl
   421D CD E5 47      [17]  323 	call	_cpct_setPalette
                            324 ;src/main.c:164: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   4220 21 09 6E      [10]  325 	ld	hl, #0x6e09
   4223 E5            [11]  326 	push	hl
   4224 21 00 C0      [10]  327 	ld	hl, #0xc000
   4227 E5            [11]  328 	push	hl
   4228 CD BE 49      [17]  329 	call	_cpct_getScreenPtr
                            330 ;src/main.c:165: cpct_hflipSpriteM0(4, 8, sprite);
   422B 01 D6 40      [10]  331 	ld	bc, #_g_items_0
   422E E5            [11]  332 	push	hl
   422F C5            [11]  333 	push	bc
   4230 C5            [11]  334 	push	bc
   4231 11 04 08      [10]  335 	ld	de, #0x0804
   4234 D5            [11]  336 	push	de
   4235 CD 32 49      [17]  337 	call	_cpct_hflipSpriteM0
   4238 C1            [10]  338 	pop	bc
   4239 E1            [10]  339 	pop	hl
                            340 ;src/main.c:166: cpct_drawSprite(sprite, p, 4, 8);
   423A 11 04 08      [10]  341 	ld	de, #0x0804
   423D D5            [11]  342 	push	de
   423E E5            [11]  343 	push	hl
   423F C5            [11]  344 	push	bc
   4240 CD 11 48      [17]  345 	call	_cpct_drawSprite
                            346 ;src/main.c:169: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   4243 21 0A 60      [10]  347 	ld	hl, #0x600a
   4246 E5            [11]  348 	push	hl
   4247 21 00 C0      [10]  349 	ld	hl, #0xc000
   424A E5            [11]  350 	push	hl
   424B CD BE 49      [17]  351 	call	_cpct_getScreenPtr
                            352 ;src/main.c:170: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   424E 01 E5 43      [10]  353 	ld	bc, #_g_tile_schtroumpf+0
   4251 11 10 20      [10]  354 	ld	de, #0x2010
   4254 D5            [11]  355 	push	de
   4255 E5            [11]  356 	push	hl
   4256 C5            [11]  357 	push	bc
   4257 CD B6 48      [17]  358 	call	_cpct_drawSpriteMasked
                            359 ;src/main.c:172: calque8000();
   425A CD 0B 43      [17]  360 	call	_calque8000
                            361 ;src/main.c:173: screen_location=(u8 *)(0x2000);
   425D 21 00 20      [10]  362 	ld	hl, #0x2000
   4260 22 8F 4A      [16]  363 	ld	(_screen_location), hl
                            364 ;src/main.c:174: screen_plot_address=(u8 *)(0x8000+80-2);
   4263 21 4E 80      [10]  365 	ld	hl, #0x804e
   4266 22 91 4A      [16]  366 	ld	(_screen_plot_address), hl
                            367 ;src/main.c:176: while (1) {
   4269 01 00 00      [10]  368 	ld	bc, #0x0000
   426C                     369 00102$:
                            370 ;src/main.c:177: cpct_waitVSYNC();
   426C C5            [11]  371 	push	bc
   426D CD 76 49      [17]  372 	call	_cpct_waitVSYNC
   4270 C1            [10]  373 	pop	bc
                            374 ;src/main.c:182: scroll_hard(t,screen_plot_address);
   4271 C5            [11]  375 	push	bc
   4272 2A 91 4A      [16]  376 	ld	hl, (_screen_plot_address)
   4275 E5            [11]  377 	push	hl
   4276 C5            [11]  378 	push	bc
   4277 CD 48 03      [17]  379 	call	_scroll_hard
   427A F1            [10]  380 	pop	af
   427B F1            [10]  381 	pop	af
   427C C1            [10]  382 	pop	bc
                            383 ;src/main.c:184: t=t+1;
   427D 03            [ 6]  384 	inc	bc
   427E 18 EC         [12]  385 	jr	00102$
                            386 	.area _CODE
                            387 	.area _INITIALIZER
   4A99                     388 __xinit__intCounter:
   4A99 00                  389 	.db #0x00	; 0
                            390 	.area _CABS (ABS)
