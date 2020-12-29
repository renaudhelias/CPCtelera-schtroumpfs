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
   4A11                      49 _screen_location::
   4A11                      50 	.ds 2
   4A13                      51 _screen_plot_address::
   4A13                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   4A15                      57 _intCounter::
   4A15                      58 	.ds 1
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
   4097                      83 _crtc::
                             84 ;src/main.c:62: __endasm;
   4097 DD E5         [15]   85 	push	ix
   4099 DD 21 00 00   [14]   86 	ld	ix,#0
   409D DD 39         [15]   87 	add	ix,sp
   409F DD 66 05      [19]   88 	ld	h, 5 (ix)
   40A2 DD 6E 04      [19]   89 	ld	l, 4 (ix)
   40A5 01 0C BC      [10]   90 	ld	bc,#0xbc00+12
   40A8 ED 49         [12]   91 	out	(c),c
   40AA 04            [ 4]   92 	inc	b
   40AB ED 61         [12]   93 	out	(c),h
   40AD 05            [ 4]   94 	dec	b
   40AE 0C            [ 4]   95 	inc	c
   40AF ED 49         [12]   96 	out	(c),c
   40B1 04            [ 4]   97 	inc	b
   40B2 ED 69         [12]   98 	out	(c),l
   40B4 DD E1         [14]   99 	pop	ix
   40B6 C9            [10]  100 	ret
   40B7                     101 _g_items_0:
   40B7 05                  102 	.db #0x05	; 5
   40B8 0F                  103 	.db #0x0f	; 15
   40B9 0F                  104 	.db #0x0f	; 15
   40BA 00                  105 	.db #0x00	; 0
   40BB 0F                  106 	.db #0x0f	; 15
   40BC 0F                  107 	.db #0x0f	; 15
   40BD 0F                  108 	.db #0x0f	; 15
   40BE 0A                  109 	.db #0x0a	; 10
   40BF 0F                  110 	.db #0x0f	; 15
   40C0 0A                  111 	.db #0x0a	; 10
   40C1 05                  112 	.db #0x05	; 5
   40C2 00                  113 	.db #0x00	; 0
   40C3 0F                  114 	.db #0x0f	; 15
   40C4 0A                  115 	.db #0x0a	; 10
   40C5 05                  116 	.db #0x05	; 5
   40C6 00                  117 	.db #0x00	; 0
   40C7 05                  118 	.db #0x05	; 5
   40C8 0F                  119 	.db #0x0f	; 15
   40C9 0A                  120 	.db #0x0a	; 10
   40CA 0A                  121 	.db #0x0a	; 10
   40CB 00                  122 	.db #0x00	; 0
   40CC 0F                  123 	.db #0x0f	; 15
   40CD 0F                  124 	.db #0x0f	; 15
   40CE 0A                  125 	.db #0x0a	; 10
   40CF 00                  126 	.db #0x00	; 0
   40D0 0A                  127 	.db #0x0a	; 10
   40D1 0A                  128 	.db #0x0a	; 10
   40D2 0A                  129 	.db #0x0a	; 10
   40D3 00                  130 	.db #0x00	; 0
   40D4 00                  131 	.db #0x00	; 0
   40D5 00                  132 	.db #0x00	; 0
   40D6 00                  133 	.db #0x00	; 0
                            134 ;src/main.c:73: void myInterruptHandler() {
                            135 ;	---------------------------------
                            136 ; Function myInterruptHandler
                            137 ; ---------------------------------
   40D7                     138 _myInterruptHandler::
                            139 ;src/main.c:76: intCounter=intCounter+1;
   40D7 FD 21 15 4A   [14]  140 	ld	iy, #_intCounter
   40DB FD 34 00      [23]  141 	inc	0 (iy)
                            142 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   40DE FD 7E 00      [19]  143 	ld	a, 0 (iy)
   40E1 D6 06         [ 7]  144 	sub	a, #0x06
   40E3 20 04         [12]  145 	jr	NZ,00102$
   40E5 FD 36 00 00   [19]  146 	ld	0 (iy), #0x00
   40E9                     147 00102$:
                            148 ;src/main.c:79: if (intCounter == 2) {
   40E9 3A 15 4A      [13]  149 	ld	a,(#_intCounter + 0)
   40EC D6 02         [ 7]  150 	sub	a, #0x02
   40EE 20 09         [12]  151 	jr	NZ,00104$
                            152 ;src/main.c:80: cpct_setBorder(2);
   40F0 21 10 02      [10]  153 	ld	hl, #0x0210
   40F3 E5            [11]  154 	push	hl
   40F4 CD C8 47      [17]  155 	call	_cpct_setPALColour
   40F7 18 07         [12]  156 	jr	00105$
   40F9                     157 00104$:
                            158 ;src/main.c:82: cpct_setBorder(3);
   40F9 21 10 03      [10]  159 	ld	hl, #0x0310
   40FC E5            [11]  160 	push	hl
   40FD CD C8 47      [17]  161 	call	_cpct_setPALColour
   4100                     162 00105$:
                            163 ;src/main.c:85: if (intCounter==5) {
   4100 FD 21 15 4A   [14]  164 	ld	iy, #_intCounter
   4104 FD 7E 00      [19]  165 	ld	a, 0 (iy)
   4107 D6 05         [ 7]  166 	sub	a, #0x05
   4109 20 1D         [12]  167 	jr	NZ,00107$
                            168 ;src/main.c:91: __endasm;
   410B 01 06 BC      [10]  169 	ld	bc,#0xbc06
   410E ED 49         [12]  170 	out	(c),c
   4110 01 04 BD      [10]  171 	ld	bc,#0xbd04
   4113 ED 49         [12]  172 	out	(c),c
                            173 ;src/main.c:93: crtc(screen_location);
   4115 2A 11 4A      [16]  174 	ld	hl, (_screen_location)
   4118 E5            [11]  175 	push	hl
   4119 CD 97 40      [17]  176 	call	_crtc
   411C F1            [10]  177 	pop	af
                            178 ;src/main.c:95: killVBL();
   411D CD 6E 43      [17]  179 	call	_killVBL
                            180 ;src/main.c:96: rupture(19-1);
   4120 3E 12         [ 7]  181 	ld	a, #0x12
   4122 F5            [11]  182 	push	af
   4123 33            [ 6]  183 	inc	sp
   4124 CD 8B 43      [17]  184 	call	_rupture
   4127 33            [ 6]  185 	inc	sp
   4128                     186 00107$:
                            187 ;src/main.c:100: if (intCounter==2) {
   4128 FD 21 15 4A   [14]  188 	ld	iy, #_intCounter
   412C FD 7E 00      [19]  189 	ld	a, 0 (iy)
   412F D6 02         [ 7]  190 	sub	a, #0x02
   4131 20 1A         [12]  191 	jr	NZ,00109$
                            192 ;src/main.c:106: __endasm;
   4133 01 06 BC      [10]  193 	ld	bc,#0xbc06
   4136 ED 49         [12]  194 	out	(c),c
   4138 01 19 BD      [10]  195 	ld	bc,#0xbd19
   413B ED 49         [12]  196 	out	(c),c
                            197 ;src/main.c:107: calqueC000();
   413D CD CC 42      [17]  198 	call	_calqueC000
                            199 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   4140 2E 00         [ 7]  200 	ld	l, #0x00
   4142 CD D4 47      [17]  201 	call	_cpct_setVideoMemoryOffset
                            202 ;src/main.c:109: rupture(7);
   4145 3E 07         [ 7]  203 	ld	a, #0x07
   4147 F5            [11]  204 	push	af
   4148 33            [ 6]  205 	inc	sp
   4149 CD 8B 43      [17]  206 	call	_rupture
   414C 33            [ 6]  207 	inc	sp
   414D                     208 00109$:
                            209 ;src/main.c:112: if (intCounter==3) {
   414D 3A 15 4A      [13]  210 	ld	a,(#_intCounter + 0)
   4150 D6 03         [ 7]  211 	sub	a, #0x03
   4152 20 13         [12]  212 	jr	NZ,00111$
                            213 ;src/main.c:113: calqueC000();
   4154 CD CC 42      [17]  214 	call	_calqueC000
                            215 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   4157 2E 00         [ 7]  216 	ld	l, #0x00
   4159 CD D4 47      [17]  217 	call	_cpct_setVideoMemoryOffset
                            218 ;src/main.c:115: restoreVBL();
   415C CD 7F 43      [17]  219 	call	_restoreVBL
                            220 ;src/main.c:116: rupture(39-19-7+1);
   415F 3E 0E         [ 7]  221 	ld	a, #0x0e
   4161 F5            [11]  222 	push	af
   4162 33            [ 6]  223 	inc	sp
   4163 CD 8B 43      [17]  224 	call	_rupture
   4166 33            [ 6]  225 	inc	sp
   4167                     226 00111$:
                            227 ;src/main.c:120: if (intCounter==4) {
   4167 3A 15 4A      [13]  228 	ld	a,(#_intCounter + 0)
   416A D6 04         [ 7]  229 	sub	a, #0x04
   416C C0            [11]  230 	ret	NZ
                            231 ;src/main.c:121: bank7_C000();
   416D CD FE 42      [17]  232 	call	_bank7_C000
                            233 ;src/main.c:122: akp_musicPlay();
   4170 CD 57 40      [17]  234 	call	_akp_musicPlay
                            235 ;src/main.c:123: bank0123();
   4173 CD F8 42      [17]  236 	call	_bank0123
   4176 C9            [10]  237 	ret
                            238 ;src/main.c:130: void main(void) {
                            239 ;	---------------------------------
                            240 ; Function main
                            241 ; ---------------------------------
   4177                     242 _main::
                            243 ;src/main.c:134: u8* sprite=g_items_0;
                            244 ;src/main.c:137: bank7_C000();
   4177 CD FE 42      [17]  245 	call	_bank7_C000
                            246 ;src/main.c:138: akp_musicInit();
   417A CD 34 40      [17]  247 	call	_akp_musicInit
                            248 ;src/main.c:139: bank0123();
   417D CD F8 42      [17]  249 	call	_bank0123
                            250 ;src/main.c:142: cpct_disableFirmware();
   4180 CD 60 49      [17]  251 	call	_cpct_disableFirmware
                            252 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   4183 21 00 20      [10]  253 	ld	hl, #0x2000
   4186 E5            [11]  254 	push	hl
   4187 26 80         [ 7]  255 	ld	h, #0x80
   4189 E5            [11]  256 	push	hl
   418A 26 60         [ 7]  257 	ld	h, #0x60
   418C E5            [11]  258 	push	hl
   418D CD 58 49      [17]  259 	call	_cpct_memcpy
                            260 ;src/main.c:144: cpct_setStackLocation(0x6000);
   4190 21 00 60      [10]  261 	ld	hl, #0x6000
   4193 CD F9 48      [17]  262 	call	_cpct_setStackLocation
                            263 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   4196 21 00 40      [10]  264 	ld	hl, #0x4000
   4199 E5            [11]  265 	push	hl
   419A 21 FF FF      [10]  266 	ld	hl, #0xffff
   419D E5            [11]  267 	push	hl
   419E 21 00 80      [10]  268 	ld	hl, #0x8000
   41A1 E5            [11]  269 	push	hl
   41A2 CD B1 48      [17]  270 	call	_cpct_memset_f64
                            271 ;src/main.c:147: bank0123();
   41A5 CD F8 42      [17]  272 	call	_bank0123
                            273 ;src/main.c:148: cpct_setVideoMode(0);
   41A8 2E 00         [ 7]  274 	ld	l, #0x00
   41AA CD 4A 49      [17]  275 	call	_cpct_setVideoMode
                            276 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   41AD 21 10 14      [10]  277 	ld	hl, #0x1410
   41B0 E5            [11]  278 	push	hl
   41B1 CD C8 47      [17]  279 	call	_cpct_setPALColour
                            280 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   41B4 21 06 00      [10]  281 	ld	hl, #0x0006
   41B7 E5            [11]  282 	push	hl
   41B8 21 AB 43      [10]  283 	ld	hl, #_g_tile_palette
   41BB E5            [11]  284 	push	hl
   41BC CD B1 47      [17]  285 	call	_cpct_setPalette
                            286 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   41BF 21 09 6E      [10]  287 	ld	hl, #0x6e09
   41C2 E5            [11]  288 	push	hl
   41C3 21 00 C0      [10]  289 	ld	hl, #0xc000
   41C6 E5            [11]  290 	push	hl
   41C7 CD 88 49      [17]  291 	call	_cpct_getScreenPtr
                            292 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   41CA 01 B7 40      [10]  293 	ld	bc, #_g_items_0
   41CD E5            [11]  294 	push	hl
   41CE C5            [11]  295 	push	bc
   41CF C5            [11]  296 	push	bc
   41D0 11 04 08      [10]  297 	ld	de, #0x0804
   41D3 D5            [11]  298 	push	de
   41D4 CD FE 48      [17]  299 	call	_cpct_hflipSpriteM0
   41D7 C1            [10]  300 	pop	bc
   41D8 E1            [10]  301 	pop	hl
                            302 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   41D9 11 04 08      [10]  303 	ld	de, #0x0804
   41DC D5            [11]  304 	push	de
   41DD E5            [11]  305 	push	hl
   41DE C5            [11]  306 	push	bc
   41DF CD DD 47      [17]  307 	call	_cpct_drawSprite
                            308 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   41E2 21 0A 60      [10]  309 	ld	hl, #0x600a
   41E5 E5            [11]  310 	push	hl
   41E6 21 00 C0      [10]  311 	ld	hl, #0xc000
   41E9 E5            [11]  312 	push	hl
   41EA CD 88 49      [17]  313 	call	_cpct_getScreenPtr
                            314 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   41ED 01 B1 43      [10]  315 	ld	bc, #_g_tile_schtroumpf+0
   41F0 11 10 20      [10]  316 	ld	de, #0x2010
   41F3 D5            [11]  317 	push	de
   41F4 E5            [11]  318 	push	hl
   41F5 C5            [11]  319 	push	bc
   41F6 CD 82 48      [17]  320 	call	_cpct_drawSpriteMasked
                            321 ;src/main.c:164: calque8000();
   41F9 CD D7 42      [17]  322 	call	_calque8000
                            323 ;src/main.c:166: screen_location=(u8 *)(0x2000);
   41FC 21 00 20      [10]  324 	ld	hl, #0x2000
   41FF 22 11 4A      [16]  325 	ld	(_screen_location), hl
                            326 ;src/main.c:167: screen_plot_address=(u8 *)(0x8000+80-2);
   4202 21 4E 80      [10]  327 	ld	hl, #0x804e
   4205 22 13 4A      [16]  328 	ld	(_screen_plot_address), hl
                            329 ;src/main.c:169: cpct_setInterruptHandler(myInterruptHandler);
   4208 21 D7 40      [10]  330 	ld	hl, #_myInterruptHandler
   420B CD A8 49      [17]  331 	call	_cpct_setInterruptHandler
                            332 ;src/main.c:172: while (1) {
   420E 01 00 00      [10]  333 	ld	bc, #0x0000
   4211                     334 00102$:
                            335 ;src/main.c:173: cpct_waitVSYNC();
   4211 C5            [11]  336 	push	bc
   4212 CD 42 49      [17]  337 	call	_cpct_waitVSYNC
   4215 C1            [10]  338 	pop	bc
                            339 ;src/main.c:175: screen_location++;
   4216 FD 21 11 4A   [14]  340 	ld	iy, #_screen_location
   421A FD 34 00      [23]  341 	inc	0 (iy)
   421D 20 03         [12]  342 	jr	NZ,00110$
   421F FD 34 01      [23]  343 	inc	1 (iy)
   4222                     344 00110$:
                            345 ;src/main.c:176: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   4222 2A 11 4A      [16]  346 	ld	hl, (_screen_location)
   4225 7C            [ 4]  347 	ld	a, h
   4226 E6 23         [ 7]  348 	and	a, #0x23
   4228 67            [ 4]  349 	ld	h, a
   4229 22 11 4A      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:177: screen_plot_address+=2;
   422C 21 13 4A      [10]  352 	ld	hl, #_screen_plot_address
   422F 7E            [ 7]  353 	ld	a, (hl)
   4230 C6 02         [ 7]  354 	add	a, #0x02
   4232 77            [ 7]  355 	ld	(hl), a
   4233 23            [ 6]  356 	inc	hl
   4234 7E            [ 7]  357 	ld	a, (hl)
   4235 CE 00         [ 7]  358 	adc	a, #0x00
   4237 77            [ 7]  359 	ld	(hl), a
                            360 ;src/main.c:178: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   4238 2A 13 4A      [16]  361 	ld	hl, (_screen_plot_address)
   423B 7C            [ 4]  362 	ld	a, h
   423C E6 87         [ 7]  363 	and	a, #0x87
   423E 67            [ 4]  364 	ld	h, a
   423F 22 13 4A      [16]  365 	ld	(_screen_plot_address), hl
                            366 ;src/main.c:184: scroll_hard(t,screen_plot_address);
   4242 C5            [11]  367 	push	bc
   4243 2A 13 4A      [16]  368 	ld	hl, (_screen_plot_address)
   4246 E5            [11]  369 	push	hl
   4247 C5            [11]  370 	push	bc
   4248 CD 48 03      [17]  371 	call	_scroll_hard
   424B F1            [10]  372 	pop	af
   424C F1            [10]  373 	pop	af
   424D C1            [10]  374 	pop	bc
                            375 ;src/main.c:186: t=t+1;
   424E 03            [ 6]  376 	inc	bc
   424F 18 C0         [12]  377 	jr	00102$
                            378 	.area _CODE
                            379 	.area _INITIALIZER
   4A1C                     380 __xinit__intCounter:
   4A1C 00                  381 	.db #0x00	; 0
                            382 	.area _CABS (ABS)
