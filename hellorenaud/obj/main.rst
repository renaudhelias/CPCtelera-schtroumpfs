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
   4A94                      49 _screen_location::
   4A94                      50 	.ds 2
   4A96                      51 _screen_plot_address::
   4A96                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   4A98                      57 _intCounter::
   4A98                      58 	.ds 1
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
   40F6 FD 21 98 4A   [14]  140 	ld	iy, #_intCounter
   40FA FD 34 00      [23]  141 	inc	0 (iy)
                            142 ;src/main.c:76: if (intCounter == 6) intCounter=0;
   40FD FD 7E 00      [19]  143 	ld	a, 0 (iy)
   4100 D6 06         [ 7]  144 	sub	a, #0x06
   4102 20 04         [12]  145 	jr	NZ,00102$
   4104 FD 36 00 00   [19]  146 	ld	0 (iy), #0x00
   4108                     147 00102$:
                            148 ;src/main.c:78: if (intCounter == 2) {
   4108 3A 98 4A      [13]  149 	ld	a,(#_intCounter + 0)
   410B D6 02         [ 7]  150 	sub	a, #0x02
   410D 20 09         [12]  151 	jr	NZ,00104$
                            152 ;src/main.c:79: cpct_setBorder(2);
   410F 21 10 02      [10]  153 	ld	hl, #0x0210
   4112 E5            [11]  154 	push	hl
   4113 CD EA 47      [17]  155 	call	_cpct_setPALColour
   4116 18 07         [12]  156 	jr	00105$
   4118                     157 00104$:
                            158 ;src/main.c:81: cpct_setBorder(3);
   4118 21 10 03      [10]  159 	ld	hl, #0x0310
   411B E5            [11]  160 	push	hl
   411C CD EA 47      [17]  161 	call	_cpct_setPALColour
   411F                     162 00105$:
                            163 ;src/main.c:84: if (intCounter==5) {
   411F FD 21 98 4A   [14]  164 	ld	iy, #_intCounter
   4123 FD 7E 00      [19]  165 	ld	a, 0 (iy)
   4126 D6 05         [ 7]  166 	sub	a, #0x05
   4128 20 1D         [12]  167 	jr	NZ,00107$
                            168 ;src/main.c:90: __endasm;
   412A 01 06 BC      [10]  169 	ld	bc,#0xbc06
   412D ED 49         [12]  170 	out	(c),c
   412F 01 04 BD      [10]  171 	ld	bc,#0xbd04
   4132 ED 49         [12]  172 	out	(c),c
                            173 ;src/main.c:93: crtc(screen_location);
   4134 2A 94 4A      [16]  174 	ld	hl, (_screen_location)
   4137 E5            [11]  175 	push	hl
   4138 CD B6 40      [17]  176 	call	_crtc
   413B F1            [10]  177 	pop	af
                            178 ;src/main.c:95: killVBL();
   413C CD 90 43      [17]  179 	call	_killVBL
                            180 ;src/main.c:96: rupture(19-1);
   413F 3E 12         [ 7]  181 	ld	a, #0x12
   4141 F5            [11]  182 	push	af
   4142 33            [ 6]  183 	inc	sp
   4143 CD AD 43      [17]  184 	call	_rupture
   4146 33            [ 6]  185 	inc	sp
   4147                     186 00107$:
                            187 ;src/main.c:100: if (intCounter==2) {
   4147 FD 21 98 4A   [14]  188 	ld	iy, #_intCounter
   414B FD 7E 00      [19]  189 	ld	a, 0 (iy)
   414E D6 02         [ 7]  190 	sub	a, #0x02
   4150 20 1A         [12]  191 	jr	NZ,00109$
                            192 ;src/main.c:106: __endasm;
   4152 01 06 BC      [10]  193 	ld	bc,#0xbc06
   4155 ED 49         [12]  194 	out	(c),c
   4157 01 19 BD      [10]  195 	ld	bc,#0xbd19
   415A ED 49         [12]  196 	out	(c),c
                            197 ;src/main.c:107: calqueC000();
   415C CD EE 42      [17]  198 	call	_calqueC000
                            199 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   415F 2E 00         [ 7]  200 	ld	l, #0x00
   4161 CD F6 47      [17]  201 	call	_cpct_setVideoMemoryOffset
                            202 ;src/main.c:109: rupture(7);
   4164 3E 07         [ 7]  203 	ld	a, #0x07
   4166 F5            [11]  204 	push	af
   4167 33            [ 6]  205 	inc	sp
   4168 CD AD 43      [17]  206 	call	_rupture
   416B 33            [ 6]  207 	inc	sp
   416C                     208 00109$:
                            209 ;src/main.c:112: if (intCounter==3) {
   416C 3A 98 4A      [13]  210 	ld	a,(#_intCounter + 0)
   416F D6 03         [ 7]  211 	sub	a, #0x03
   4171 20 13         [12]  212 	jr	NZ,00111$
                            213 ;src/main.c:113: calqueC000();
   4173 CD EE 42      [17]  214 	call	_calqueC000
                            215 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   4176 2E 00         [ 7]  216 	ld	l, #0x00
   4178 CD F6 47      [17]  217 	call	_cpct_setVideoMemoryOffset
                            218 ;src/main.c:115: restoreVBL();
   417B CD A1 43      [17]  219 	call	_restoreVBL
                            220 ;src/main.c:116: rupture(39-19-7+1);
   417E 3E 0E         [ 7]  221 	ld	a, #0x0e
   4180 F5            [11]  222 	push	af
   4181 33            [ 6]  223 	inc	sp
   4182 CD AD 43      [17]  224 	call	_rupture
   4185 33            [ 6]  225 	inc	sp
   4186                     226 00111$:
                            227 ;src/main.c:120: if (intCounter==4) {
   4186 3A 98 4A      [13]  228 	ld	a,(#_intCounter + 0)
   4189 D6 04         [ 7]  229 	sub	a, #0x04
   418B C0            [11]  230 	ret	NZ
                            231 ;src/main.c:121: bank7_C000();
   418C CD 20 43      [17]  232 	call	_bank7_C000
                            233 ;src/main.c:122: akp_musicPlay();
   418F CD 76 40      [17]  234 	call	_akp_musicPlay
                            235 ;src/main.c:123: bank0123();
   4192 CD 1A 43      [17]  236 	call	_bank0123
   4195 C9            [10]  237 	ret
                            238 ;src/main.c:130: void main(void) {
                            239 ;	---------------------------------
                            240 ; Function main
                            241 ; ---------------------------------
   4196                     242 _main::
                            243 ;src/main.c:134: u8* sprite=g_items_0;
                            244 ;src/main.c:139: bank7_C000();
   4196 CD 20 43      [17]  245 	call	_bank7_C000
                            246 ;src/main.c:140: akp_musicInit();
   4199 CD 53 40      [17]  247 	call	_akp_musicInit
                            248 ;src/main.c:141: bank0123();
   419C CD 1A 43      [17]  249 	call	_bank0123
                            250 ;src/main.c:144: cpct_disableFirmware();
   419F CD 82 49      [17]  251 	call	_cpct_disableFirmware
                            252 ;src/main.c:145: cpct_memcpy(0x6000,0x8000,0x2000);
   41A2 21 00 20      [10]  253 	ld	hl, #0x2000
   41A5 E5            [11]  254 	push	hl
   41A6 26 80         [ 7]  255 	ld	h, #0x80
   41A8 E5            [11]  256 	push	hl
   41A9 26 60         [ 7]  257 	ld	h, #0x60
   41AB E5            [11]  258 	push	hl
   41AC CD 7A 49      [17]  259 	call	_cpct_memcpy
                            260 ;src/main.c:146: cpct_setStackLocation(0x6000);
   41AF 21 00 60      [10]  261 	ld	hl, #0x6000
   41B2 CD 1B 49      [17]  262 	call	_cpct_setStackLocation
                            263 ;src/main.c:147: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   41B5 21 00 40      [10]  264 	ld	hl, #0x4000
   41B8 E5            [11]  265 	push	hl
   41B9 26 00         [ 7]  266 	ld	h, #0x00
   41BB E5            [11]  267 	push	hl
   41BC 26 80         [ 7]  268 	ld	h, #0x80
   41BE E5            [11]  269 	push	hl
   41BF CD D3 48      [17]  270 	call	_cpct_memset_f64
                            271 ;src/main.c:149: bank0123();
   41C2 CD 1A 43      [17]  272 	call	_bank0123
                            273 ;src/main.c:150: cpct_setVideoMode(0);
   41C5 2E 00         [ 7]  274 	ld	l, #0x00
   41C7 CD 6C 49      [17]  275 	call	_cpct_setVideoMode
                            276 ;src/main.c:151: cpct_setBorder(HW_BLACK);
   41CA 21 10 14      [10]  277 	ld	hl, #0x1410
   41CD E5            [11]  278 	push	hl
   41CE CD EA 47      [17]  279 	call	_cpct_setPALColour
                            280 ;src/main.c:152: cpct_setPalette(g_tile_palette, 6);
   41D1 21 06 00      [10]  281 	ld	hl, #0x0006
   41D4 E5            [11]  282 	push	hl
   41D5 21 CD 43      [10]  283 	ld	hl, #_g_tile_palette
   41D8 E5            [11]  284 	push	hl
   41D9 CD D3 47      [17]  285 	call	_cpct_setPalette
                            286 ;src/main.c:155: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   41DC 21 09 6E      [10]  287 	ld	hl, #0x6e09
   41DF E5            [11]  288 	push	hl
   41E0 21 00 C0      [10]  289 	ld	hl, #0xc000
   41E3 E5            [11]  290 	push	hl
   41E4 CD AC 49      [17]  291 	call	_cpct_getScreenPtr
                            292 ;src/main.c:156: cpct_hflipSpriteM0(4, 8, sprite);
   41E7 01 D6 40      [10]  293 	ld	bc, #_g_items_0
   41EA E5            [11]  294 	push	hl
   41EB C5            [11]  295 	push	bc
   41EC C5            [11]  296 	push	bc
   41ED 11 04 08      [10]  297 	ld	de, #0x0804
   41F0 D5            [11]  298 	push	de
   41F1 CD 20 49      [17]  299 	call	_cpct_hflipSpriteM0
   41F4 C1            [10]  300 	pop	bc
   41F5 E1            [10]  301 	pop	hl
                            302 ;src/main.c:157: cpct_drawSprite(sprite, p, 4, 8);
   41F6 11 04 08      [10]  303 	ld	de, #0x0804
   41F9 D5            [11]  304 	push	de
   41FA E5            [11]  305 	push	hl
   41FB C5            [11]  306 	push	bc
   41FC CD FF 47      [17]  307 	call	_cpct_drawSprite
                            308 ;src/main.c:160: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   41FF 21 0A 60      [10]  309 	ld	hl, #0x600a
   4202 E5            [11]  310 	push	hl
   4203 21 00 C0      [10]  311 	ld	hl, #0xc000
   4206 E5            [11]  312 	push	hl
   4207 CD AC 49      [17]  313 	call	_cpct_getScreenPtr
                            314 ;src/main.c:161: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   420A 01 D3 43      [10]  315 	ld	bc, #_g_tile_schtroumpf+0
   420D 11 10 20      [10]  316 	ld	de, #0x2010
   4210 D5            [11]  317 	push	de
   4211 E5            [11]  318 	push	hl
   4212 C5            [11]  319 	push	bc
   4213 CD A4 48      [17]  320 	call	_cpct_drawSpriteMasked
                            321 ;src/main.c:163: calque8000();
   4216 CD F9 42      [17]  322 	call	_calque8000
                            323 ;src/main.c:165: screen_location=(u8 *)(0x2000);
   4219 21 00 20      [10]  324 	ld	hl, #0x2000
   421C 22 94 4A      [16]  325 	ld	(_screen_location), hl
                            326 ;src/main.c:166: screen_plot_address=(u8 *)(0x8000+80-2);
   421F 21 4E 80      [10]  327 	ld	hl, #0x804e
   4222 22 96 4A      [16]  328 	ld	(_screen_plot_address), hl
                            329 ;src/main.c:168: cpct_setInterruptHandler(myInterruptHandler);
   4225 21 F6 40      [10]  330 	ld	hl, #_myInterruptHandler
   4228 CD E3 49      [17]  331 	call	_cpct_setInterruptHandler
                            332 ;src/main.c:171: while (1) {
   422B 01 00 00      [10]  333 	ld	bc, #0x0000
   422E                     334 00102$:
                            335 ;src/main.c:172: cpct_waitVSYNC();
   422E C5            [11]  336 	push	bc
   422F CD 64 49      [17]  337 	call	_cpct_waitVSYNC
   4232 C1            [10]  338 	pop	bc
                            339 ;src/main.c:174: screen_location++;
   4233 FD 21 94 4A   [14]  340 	ld	iy, #_screen_location
   4237 FD 34 00      [23]  341 	inc	0 (iy)
   423A 20 03         [12]  342 	jr	NZ,00110$
   423C FD 34 01      [23]  343 	inc	1 (iy)
   423F                     344 00110$:
                            345 ;src/main.c:175: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   423F 2A 94 4A      [16]  346 	ld	hl, (_screen_location)
   4242 7C            [ 4]  347 	ld	a, h
   4243 E6 23         [ 7]  348 	and	a, #0x23
   4245 67            [ 4]  349 	ld	h, a
   4246 22 94 4A      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:176: screen_plot_address+=2;
   4249 21 96 4A      [10]  352 	ld	hl, #_screen_plot_address
   424C 7E            [ 7]  353 	ld	a, (hl)
   424D C6 02         [ 7]  354 	add	a, #0x02
   424F 77            [ 7]  355 	ld	(hl), a
   4250 23            [ 6]  356 	inc	hl
   4251 7E            [ 7]  357 	ld	a, (hl)
   4252 CE 00         [ 7]  358 	adc	a, #0x00
   4254 77            [ 7]  359 	ld	(hl), a
                            360 ;src/main.c:177: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4255 2A 96 4A      [16]  361 	ld	hl, (_screen_plot_address)
   4258 7C            [ 4]  362 	ld	a, h
   4259 E6 87         [ 7]  363 	and	a, #0x87
   425B 67            [ 4]  364 	ld	h, a
   425C 22 96 4A      [16]  365 	ld	(_screen_plot_address), hl
                            366 ;src/main.c:182: scroll_hard(t,screen_plot_address);
   425F C5            [11]  367 	push	bc
   4260 2A 96 4A      [16]  368 	ld	hl, (_screen_plot_address)
   4263 E5            [11]  369 	push	hl
   4264 C5            [11]  370 	push	bc
   4265 CD 48 03      [17]  371 	call	_scroll_hard
   4268 F1            [10]  372 	pop	af
   4269 F1            [10]  373 	pop	af
   426A C1            [10]  374 	pop	bc
                            375 ;src/main.c:184: t=t+1;
   426B 03            [ 6]  376 	inc	bc
   426C 18 C0         [12]  377 	jr	00102$
                            378 	.area _CODE
                            379 	.area _INITIALIZER
   4A9E                     380 __xinit__intCounter:
   4A9E 00                  381 	.db #0x00	; 0
                            382 	.area _CABS (ABS)
