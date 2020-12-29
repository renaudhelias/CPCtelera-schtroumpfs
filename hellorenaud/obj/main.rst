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
   4AEB                      49 _screen_location::
   4AEB                      50 	.ds 2
   4AED                      51 _screen_plot_address::
   4AED                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   4AEF                      57 _intCounter::
   4AEF                      58 	.ds 1
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
   410D                      83 _crtc::
                             84 ;src/main.c:62: __endasm;
   410D DD E5         [15]   85 	push	ix
   410F DD 21 00 00   [14]   86 	ld	ix,#0
   4113 DD 39         [15]   87 	add	ix,sp
   4115 DD 66 05      [19]   88 	ld	h, 5 (ix)
   4118 DD 6E 04      [19]   89 	ld	l, 4 (ix)
   411B 01 0C BC      [10]   90 	ld	bc,#0xbc00+12
   411E ED 49         [12]   91 	out	(c),c
   4120 04            [ 4]   92 	inc	b
   4121 ED 61         [12]   93 	out	(c),h
   4123 05            [ 4]   94 	dec	b
   4124 0C            [ 4]   95 	inc	c
   4125 ED 49         [12]   96 	out	(c),c
   4127 04            [ 4]   97 	inc	b
   4128 ED 69         [12]   98 	out	(c),l
   412A DD E1         [14]   99 	pop	ix
   412C C9            [10]  100 	ret
   412D                     101 _g_items_0:
   412D 05                  102 	.db #0x05	; 5
   412E 0F                  103 	.db #0x0f	; 15
   412F 0F                  104 	.db #0x0f	; 15
   4130 00                  105 	.db #0x00	; 0
   4131 0F                  106 	.db #0x0f	; 15
   4132 0F                  107 	.db #0x0f	; 15
   4133 0F                  108 	.db #0x0f	; 15
   4134 0A                  109 	.db #0x0a	; 10
   4135 0F                  110 	.db #0x0f	; 15
   4136 0A                  111 	.db #0x0a	; 10
   4137 05                  112 	.db #0x05	; 5
   4138 00                  113 	.db #0x00	; 0
   4139 0F                  114 	.db #0x0f	; 15
   413A 0A                  115 	.db #0x0a	; 10
   413B 05                  116 	.db #0x05	; 5
   413C 00                  117 	.db #0x00	; 0
   413D 05                  118 	.db #0x05	; 5
   413E 0F                  119 	.db #0x0f	; 15
   413F 0A                  120 	.db #0x0a	; 10
   4140 0A                  121 	.db #0x0a	; 10
   4141 00                  122 	.db #0x00	; 0
   4142 0F                  123 	.db #0x0f	; 15
   4143 0F                  124 	.db #0x0f	; 15
   4144 0A                  125 	.db #0x0a	; 10
   4145 00                  126 	.db #0x00	; 0
   4146 0A                  127 	.db #0x0a	; 10
   4147 0A                  128 	.db #0x0a	; 10
   4148 0A                  129 	.db #0x0a	; 10
   4149 00                  130 	.db #0x00	; 0
   414A 00                  131 	.db #0x00	; 0
   414B 00                  132 	.db #0x00	; 0
   414C 00                  133 	.db #0x00	; 0
                            134 ;src/main.c:72: void myInterruptHandler() {
                            135 ;	---------------------------------
                            136 ; Function myInterruptHandler
                            137 ; ---------------------------------
   414D                     138 _myInterruptHandler::
                            139 ;src/main.c:75: intCounter=intCounter+1;
   414D FD 21 EF 4A   [14]  140 	ld	iy, #_intCounter
   4151 FD 34 00      [23]  141 	inc	0 (iy)
                            142 ;src/main.c:76: if (intCounter == 6) intCounter=0;
   4154 FD 7E 00      [19]  143 	ld	a, 0 (iy)
   4157 D6 06         [ 7]  144 	sub	a, #0x06
   4159 20 04         [12]  145 	jr	NZ,00102$
   415B FD 36 00 00   [19]  146 	ld	0 (iy), #0x00
   415F                     147 00102$:
                            148 ;src/main.c:78: if (intCounter == 2) {
   415F 3A EF 4A      [13]  149 	ld	a,(#_intCounter + 0)
   4162 D6 02         [ 7]  150 	sub	a, #0x02
   4164 20 09         [12]  151 	jr	NZ,00104$
                            152 ;src/main.c:79: cpct_setBorder(2);
   4166 21 10 02      [10]  153 	ld	hl, #0x0210
   4169 E5            [11]  154 	push	hl
   416A CD 41 48      [17]  155 	call	_cpct_setPALColour
   416D 18 07         [12]  156 	jr	00105$
   416F                     157 00104$:
                            158 ;src/main.c:81: cpct_setBorder(3);
   416F 21 10 03      [10]  159 	ld	hl, #0x0310
   4172 E5            [11]  160 	push	hl
   4173 CD 41 48      [17]  161 	call	_cpct_setPALColour
   4176                     162 00105$:
                            163 ;src/main.c:84: if (intCounter==5) {
   4176 FD 21 EF 4A   [14]  164 	ld	iy, #_intCounter
   417A FD 7E 00      [19]  165 	ld	a, 0 (iy)
   417D D6 05         [ 7]  166 	sub	a, #0x05
   417F 20 1D         [12]  167 	jr	NZ,00107$
                            168 ;src/main.c:90: __endasm;
   4181 01 06 BC      [10]  169 	ld	bc,#0xbc06
   4184 ED 49         [12]  170 	out	(c),c
   4186 01 04 BD      [10]  171 	ld	bc,#0xbd04
   4189 ED 49         [12]  172 	out	(c),c
                            173 ;src/main.c:93: crtc(screen_location);
   418B 2A EB 4A      [16]  174 	ld	hl, (_screen_location)
   418E E5            [11]  175 	push	hl
   418F CD 0D 41      [17]  176 	call	_crtc
   4192 F1            [10]  177 	pop	af
                            178 ;src/main.c:95: killVBL();
   4193 CD E7 43      [17]  179 	call	_killVBL
                            180 ;src/main.c:96: rupture(19-1);
   4196 3E 12         [ 7]  181 	ld	a, #0x12
   4198 F5            [11]  182 	push	af
   4199 33            [ 6]  183 	inc	sp
   419A CD 04 44      [17]  184 	call	_rupture
   419D 33            [ 6]  185 	inc	sp
   419E                     186 00107$:
                            187 ;src/main.c:100: if (intCounter==2) {
   419E FD 21 EF 4A   [14]  188 	ld	iy, #_intCounter
   41A2 FD 7E 00      [19]  189 	ld	a, 0 (iy)
   41A5 D6 02         [ 7]  190 	sub	a, #0x02
   41A7 20 1A         [12]  191 	jr	NZ,00109$
                            192 ;src/main.c:106: __endasm;
   41A9 01 06 BC      [10]  193 	ld	bc,#0xbc06
   41AC ED 49         [12]  194 	out	(c),c
   41AE 01 19 BD      [10]  195 	ld	bc,#0xbd19
   41B1 ED 49         [12]  196 	out	(c),c
                            197 ;src/main.c:107: calqueC000();
   41B3 CD 45 43      [17]  198 	call	_calqueC000
                            199 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   41B6 2E 00         [ 7]  200 	ld	l, #0x00
   41B8 CD 4D 48      [17]  201 	call	_cpct_setVideoMemoryOffset
                            202 ;src/main.c:109: rupture(7);
   41BB 3E 07         [ 7]  203 	ld	a, #0x07
   41BD F5            [11]  204 	push	af
   41BE 33            [ 6]  205 	inc	sp
   41BF CD 04 44      [17]  206 	call	_rupture
   41C2 33            [ 6]  207 	inc	sp
   41C3                     208 00109$:
                            209 ;src/main.c:112: if (intCounter==3) {
   41C3 3A EF 4A      [13]  210 	ld	a,(#_intCounter + 0)
   41C6 D6 03         [ 7]  211 	sub	a, #0x03
   41C8 20 13         [12]  212 	jr	NZ,00111$
                            213 ;src/main.c:113: calqueC000();
   41CA CD 45 43      [17]  214 	call	_calqueC000
                            215 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   41CD 2E 00         [ 7]  216 	ld	l, #0x00
   41CF CD 4D 48      [17]  217 	call	_cpct_setVideoMemoryOffset
                            218 ;src/main.c:115: restoreVBL();
   41D2 CD F8 43      [17]  219 	call	_restoreVBL
                            220 ;src/main.c:116: rupture(39-19-7+1);
   41D5 3E 0E         [ 7]  221 	ld	a, #0x0e
   41D7 F5            [11]  222 	push	af
   41D8 33            [ 6]  223 	inc	sp
   41D9 CD 04 44      [17]  224 	call	_rupture
   41DC 33            [ 6]  225 	inc	sp
   41DD                     226 00111$:
                            227 ;src/main.c:120: if (intCounter==4) {
   41DD 3A EF 4A      [13]  228 	ld	a,(#_intCounter + 0)
   41E0 D6 04         [ 7]  229 	sub	a, #0x04
   41E2 C0            [11]  230 	ret	NZ
                            231 ;src/main.c:121: bank7_C000();
   41E3 CD 77 43      [17]  232 	call	_bank7_C000
                            233 ;src/main.c:122: akp_musicPlay();
   41E6 CD CD 40      [17]  234 	call	_akp_musicPlay
                            235 ;src/main.c:123: bank0123();
   41E9 CD 71 43      [17]  236 	call	_bank0123
   41EC C9            [10]  237 	ret
                            238 ;src/main.c:130: void main(void) {
                            239 ;	---------------------------------
                            240 ; Function main
                            241 ; ---------------------------------
   41ED                     242 _main::
                            243 ;src/main.c:134: u8* sprite=g_items_0;
                            244 ;src/main.c:139: bank7_C000();
   41ED CD 77 43      [17]  245 	call	_bank7_C000
                            246 ;src/main.c:140: akp_musicInit();
   41F0 CD AA 40      [17]  247 	call	_akp_musicInit
                            248 ;src/main.c:141: bank0123();
   41F3 CD 71 43      [17]  249 	call	_bank0123
                            250 ;src/main.c:144: cpct_disableFirmware();
   41F6 CD D9 49      [17]  251 	call	_cpct_disableFirmware
                            252 ;src/main.c:145: cpct_memcpy(0x6000,0x8000,0x2000);
   41F9 21 00 20      [10]  253 	ld	hl, #0x2000
   41FC E5            [11]  254 	push	hl
   41FD 26 80         [ 7]  255 	ld	h, #0x80
   41FF E5            [11]  256 	push	hl
   4200 26 60         [ 7]  257 	ld	h, #0x60
   4202 E5            [11]  258 	push	hl
   4203 CD D1 49      [17]  259 	call	_cpct_memcpy
                            260 ;src/main.c:146: cpct_setStackLocation(0x6000);
   4206 21 00 60      [10]  261 	ld	hl, #0x6000
   4209 CD 72 49      [17]  262 	call	_cpct_setStackLocation
                            263 ;src/main.c:147: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   420C 21 00 40      [10]  264 	ld	hl, #0x4000
   420F E5            [11]  265 	push	hl
   4210 26 00         [ 7]  266 	ld	h, #0x00
   4212 E5            [11]  267 	push	hl
   4213 26 80         [ 7]  268 	ld	h, #0x80
   4215 E5            [11]  269 	push	hl
   4216 CD 2A 49      [17]  270 	call	_cpct_memset_f64
                            271 ;src/main.c:149: bank0123();
   4219 CD 71 43      [17]  272 	call	_bank0123
                            273 ;src/main.c:150: cpct_setVideoMode(0);
   421C 2E 00         [ 7]  274 	ld	l, #0x00
   421E CD C3 49      [17]  275 	call	_cpct_setVideoMode
                            276 ;src/main.c:151: cpct_setBorder(HW_BLACK);
   4221 21 10 14      [10]  277 	ld	hl, #0x1410
   4224 E5            [11]  278 	push	hl
   4225 CD 41 48      [17]  279 	call	_cpct_setPALColour
                            280 ;src/main.c:152: cpct_setPalette(g_tile_palette, 6);
   4228 21 06 00      [10]  281 	ld	hl, #0x0006
   422B E5            [11]  282 	push	hl
   422C 21 24 44      [10]  283 	ld	hl, #_g_tile_palette
   422F E5            [11]  284 	push	hl
   4230 CD 2A 48      [17]  285 	call	_cpct_setPalette
                            286 ;src/main.c:155: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   4233 21 09 6E      [10]  287 	ld	hl, #0x6e09
   4236 E5            [11]  288 	push	hl
   4237 21 00 C0      [10]  289 	ld	hl, #0xc000
   423A E5            [11]  290 	push	hl
   423B CD 1A 4A      [17]  291 	call	_cpct_getScreenPtr
                            292 ;src/main.c:156: cpct_hflipSpriteM0(4, 8, sprite);
   423E 01 2D 41      [10]  293 	ld	bc, #_g_items_0
   4241 E5            [11]  294 	push	hl
   4242 C5            [11]  295 	push	bc
   4243 C5            [11]  296 	push	bc
   4244 11 04 08      [10]  297 	ld	de, #0x0804
   4247 D5            [11]  298 	push	de
   4248 CD 77 49      [17]  299 	call	_cpct_hflipSpriteM0
   424B C1            [10]  300 	pop	bc
   424C E1            [10]  301 	pop	hl
                            302 ;src/main.c:157: cpct_drawSprite(sprite, p, 4, 8);
   424D 11 04 08      [10]  303 	ld	de, #0x0804
   4250 D5            [11]  304 	push	de
   4251 E5            [11]  305 	push	hl
   4252 C5            [11]  306 	push	bc
   4253 CD 56 48      [17]  307 	call	_cpct_drawSprite
                            308 ;src/main.c:160: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   4256 21 0A 60      [10]  309 	ld	hl, #0x600a
   4259 E5            [11]  310 	push	hl
   425A 21 00 C0      [10]  311 	ld	hl, #0xc000
   425D E5            [11]  312 	push	hl
   425E CD 1A 4A      [17]  313 	call	_cpct_getScreenPtr
                            314 ;src/main.c:161: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4261 01 2A 44      [10]  315 	ld	bc, #_g_tile_schtroumpf+0
   4264 11 10 20      [10]  316 	ld	de, #0x2010
   4267 D5            [11]  317 	push	de
   4268 E5            [11]  318 	push	hl
   4269 C5            [11]  319 	push	bc
   426A CD FB 48      [17]  320 	call	_cpct_drawSpriteMasked
                            321 ;src/main.c:163: calque8000();
   426D CD 50 43      [17]  322 	call	_calque8000
                            323 ;src/main.c:165: screen_location=(u8 *)(0x2000);
   4270 21 00 20      [10]  324 	ld	hl, #0x2000
   4273 22 EB 4A      [16]  325 	ld	(_screen_location), hl
                            326 ;src/main.c:166: screen_plot_address=(u8 *)(0x8000+80-2);
   4276 21 4E 80      [10]  327 	ld	hl, #0x804e
   4279 22 ED 4A      [16]  328 	ld	(_screen_plot_address), hl
                            329 ;src/main.c:168: cpct_setInterruptHandler(myInterruptHandler);
   427C 21 4D 41      [10]  330 	ld	hl, #_myInterruptHandler
   427F CD 3A 4A      [17]  331 	call	_cpct_setInterruptHandler
                            332 ;src/main.c:171: while (1) {
   4282 01 00 00      [10]  333 	ld	bc, #0x0000
   4285                     334 00102$:
                            335 ;src/main.c:172: cpct_waitVSYNC();
   4285 C5            [11]  336 	push	bc
   4286 CD BB 49      [17]  337 	call	_cpct_waitVSYNC
   4289 C1            [10]  338 	pop	bc
                            339 ;src/main.c:174: screen_location++;
   428A FD 21 EB 4A   [14]  340 	ld	iy, #_screen_location
   428E FD 34 00      [23]  341 	inc	0 (iy)
   4291 20 03         [12]  342 	jr	NZ,00110$
   4293 FD 34 01      [23]  343 	inc	1 (iy)
   4296                     344 00110$:
                            345 ;src/main.c:175: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4296 2A EB 4A      [16]  346 	ld	hl, (_screen_location)
   4299 7C            [ 4]  347 	ld	a, h
   429A E6 23         [ 7]  348 	and	a, #0x23
   429C 67            [ 4]  349 	ld	h, a
   429D 22 EB 4A      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:176: screen_plot_address+=2;
   42A0 21 ED 4A      [10]  352 	ld	hl, #_screen_plot_address
   42A3 7E            [ 7]  353 	ld	a, (hl)
   42A4 C6 02         [ 7]  354 	add	a, #0x02
   42A6 77            [ 7]  355 	ld	(hl), a
   42A7 23            [ 6]  356 	inc	hl
   42A8 7E            [ 7]  357 	ld	a, (hl)
   42A9 CE 00         [ 7]  358 	adc	a, #0x00
   42AB 77            [ 7]  359 	ld	(hl), a
                            360 ;src/main.c:177: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   42AC 2A ED 4A      [16]  361 	ld	hl, (_screen_plot_address)
   42AF 7C            [ 4]  362 	ld	a, h
   42B0 E6 87         [ 7]  363 	and	a, #0x87
   42B2 67            [ 4]  364 	ld	h, a
   42B3 22 ED 4A      [16]  365 	ld	(_screen_plot_address), hl
                            366 ;src/main.c:182: scroll_hard(t,screen_plot_address);
   42B6 C5            [11]  367 	push	bc
   42B7 2A ED 4A      [16]  368 	ld	hl, (_screen_plot_address)
   42BA E5            [11]  369 	push	hl
   42BB C5            [11]  370 	push	bc
   42BC CD 48 03      [17]  371 	call	_scroll_hard
   42BF F1            [10]  372 	pop	af
   42C0 F1            [10]  373 	pop	af
   42C1 C1            [10]  374 	pop	bc
                            375 ;src/main.c:184: t=t+1;
   42C2 03            [ 6]  376 	inc	bc
   42C3 18 C0         [12]  377 	jr	00102$
                            378 	.area _CODE
                            379 	.area _INITIALIZER
   4AF5                     380 __xinit__intCounter:
   4AF5 00                  381 	.db #0x00	; 0
                            382 	.area _CABS (ABS)
