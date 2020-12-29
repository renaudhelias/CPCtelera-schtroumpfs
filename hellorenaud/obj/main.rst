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
   4A75                      49 _screen_location::
   4A75                      50 	.ds 2
   4A77                      51 _screen_plot_address::
   4A77                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   4A79                      57 _intCounter::
   4A79                      58 	.ds 1
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
   40AE                      83 _crtc::
                             84 ;src/main.c:62: __endasm;
   40AE DD E5         [15]   85 	push	ix
   40B0 DD 21 00 00   [14]   86 	ld	ix,#0
   40B4 DD 39         [15]   87 	add	ix,sp
   40B6 DD 66 05      [19]   88 	ld	h, 5 (ix)
   40B9 DD 6E 04      [19]   89 	ld	l, 4 (ix)
   40BC 01 0C BC      [10]   90 	ld	bc,#0xbc00+12
   40BF ED 49         [12]   91 	out	(c),c
   40C1 04            [ 4]   92 	inc	b
   40C2 ED 61         [12]   93 	out	(c),h
   40C4 05            [ 4]   94 	dec	b
   40C5 0C            [ 4]   95 	inc	c
   40C6 ED 49         [12]   96 	out	(c),c
   40C8 04            [ 4]   97 	inc	b
   40C9 ED 69         [12]   98 	out	(c),l
   40CB DD E1         [14]   99 	pop	ix
   40CD C9            [10]  100 	ret
   40CE                     101 _g_items_0:
   40CE 05                  102 	.db #0x05	; 5
   40CF 0F                  103 	.db #0x0f	; 15
   40D0 0F                  104 	.db #0x0f	; 15
   40D1 00                  105 	.db #0x00	; 0
   40D2 0F                  106 	.db #0x0f	; 15
   40D3 0F                  107 	.db #0x0f	; 15
   40D4 0F                  108 	.db #0x0f	; 15
   40D5 0A                  109 	.db #0x0a	; 10
   40D6 0F                  110 	.db #0x0f	; 15
   40D7 0A                  111 	.db #0x0a	; 10
   40D8 05                  112 	.db #0x05	; 5
   40D9 00                  113 	.db #0x00	; 0
   40DA 0F                  114 	.db #0x0f	; 15
   40DB 0A                  115 	.db #0x0a	; 10
   40DC 05                  116 	.db #0x05	; 5
   40DD 00                  117 	.db #0x00	; 0
   40DE 05                  118 	.db #0x05	; 5
   40DF 0F                  119 	.db #0x0f	; 15
   40E0 0A                  120 	.db #0x0a	; 10
   40E1 0A                  121 	.db #0x0a	; 10
   40E2 00                  122 	.db #0x00	; 0
   40E3 0F                  123 	.db #0x0f	; 15
   40E4 0F                  124 	.db #0x0f	; 15
   40E5 0A                  125 	.db #0x0a	; 10
   40E6 00                  126 	.db #0x00	; 0
   40E7 0A                  127 	.db #0x0a	; 10
   40E8 0A                  128 	.db #0x0a	; 10
   40E9 0A                  129 	.db #0x0a	; 10
   40EA 00                  130 	.db #0x00	; 0
   40EB 00                  131 	.db #0x00	; 0
   40EC 00                  132 	.db #0x00	; 0
   40ED 00                  133 	.db #0x00	; 0
                            134 ;src/main.c:73: void myInterruptHandler() {
                            135 ;	---------------------------------
                            136 ; Function myInterruptHandler
                            137 ; ---------------------------------
   40EE                     138 _myInterruptHandler::
                            139 ;src/main.c:76: intCounter=intCounter+1;
   40EE FD 21 79 4A   [14]  140 	ld	iy, #_intCounter
   40F2 FD 34 00      [23]  141 	inc	0 (iy)
                            142 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   40F5 FD 7E 00      [19]  143 	ld	a, 0 (iy)
   40F8 D6 06         [ 7]  144 	sub	a, #0x06
   40FA 20 04         [12]  145 	jr	NZ,00102$
   40FC FD 36 00 00   [19]  146 	ld	0 (iy), #0x00
   4100                     147 00102$:
                            148 ;src/main.c:79: if (intCounter == 2) {
   4100 3A 79 4A      [13]  149 	ld	a,(#_intCounter + 0)
   4103 D6 02         [ 7]  150 	sub	a, #0x02
   4105 20 09         [12]  151 	jr	NZ,00104$
                            152 ;src/main.c:80: cpct_setBorder(2);
   4107 21 10 02      [10]  153 	ld	hl, #0x0210
   410A E5            [11]  154 	push	hl
   410B CD E2 47      [17]  155 	call	_cpct_setPALColour
   410E 18 07         [12]  156 	jr	00105$
   4110                     157 00104$:
                            158 ;src/main.c:82: cpct_setBorder(3);
   4110 21 10 03      [10]  159 	ld	hl, #0x0310
   4113 E5            [11]  160 	push	hl
   4114 CD E2 47      [17]  161 	call	_cpct_setPALColour
   4117                     162 00105$:
                            163 ;src/main.c:85: if (intCounter==5) {
   4117 FD 21 79 4A   [14]  164 	ld	iy, #_intCounter
   411B FD 7E 00      [19]  165 	ld	a, 0 (iy)
   411E D6 05         [ 7]  166 	sub	a, #0x05
   4120 20 1D         [12]  167 	jr	NZ,00107$
                            168 ;src/main.c:91: __endasm;
   4122 01 06 BC      [10]  169 	ld	bc,#0xbc06
   4125 ED 49         [12]  170 	out	(c),c
   4127 01 04 BD      [10]  171 	ld	bc,#0xbd04
   412A ED 49         [12]  172 	out	(c),c
                            173 ;src/main.c:93: crtc(screen_location);
   412C 2A 75 4A      [16]  174 	ld	hl, (_screen_location)
   412F E5            [11]  175 	push	hl
   4130 CD AE 40      [17]  176 	call	_crtc
   4133 F1            [10]  177 	pop	af
                            178 ;src/main.c:95: killVBL();
   4134 CD 88 43      [17]  179 	call	_killVBL
                            180 ;src/main.c:96: rupture(19-1);
   4137 3E 12         [ 7]  181 	ld	a, #0x12
   4139 F5            [11]  182 	push	af
   413A 33            [ 6]  183 	inc	sp
   413B CD A5 43      [17]  184 	call	_rupture
   413E 33            [ 6]  185 	inc	sp
   413F                     186 00107$:
                            187 ;src/main.c:100: if (intCounter==2) {
   413F FD 21 79 4A   [14]  188 	ld	iy, #_intCounter
   4143 FD 7E 00      [19]  189 	ld	a, 0 (iy)
   4146 D6 02         [ 7]  190 	sub	a, #0x02
   4148 20 1A         [12]  191 	jr	NZ,00109$
                            192 ;src/main.c:106: __endasm;
   414A 01 06 BC      [10]  193 	ld	bc,#0xbc06
   414D ED 49         [12]  194 	out	(c),c
   414F 01 19 BD      [10]  195 	ld	bc,#0xbd19
   4152 ED 49         [12]  196 	out	(c),c
                            197 ;src/main.c:107: calqueC000();
   4154 CD E6 42      [17]  198 	call	_calqueC000
                            199 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   4157 2E 00         [ 7]  200 	ld	l, #0x00
   4159 CD EE 47      [17]  201 	call	_cpct_setVideoMemoryOffset
                            202 ;src/main.c:109: rupture(7);
   415C 3E 07         [ 7]  203 	ld	a, #0x07
   415E F5            [11]  204 	push	af
   415F 33            [ 6]  205 	inc	sp
   4160 CD A5 43      [17]  206 	call	_rupture
   4163 33            [ 6]  207 	inc	sp
   4164                     208 00109$:
                            209 ;src/main.c:112: if (intCounter==3) {
   4164 3A 79 4A      [13]  210 	ld	a,(#_intCounter + 0)
   4167 D6 03         [ 7]  211 	sub	a, #0x03
   4169 20 13         [12]  212 	jr	NZ,00111$
                            213 ;src/main.c:113: calqueC000();
   416B CD E6 42      [17]  214 	call	_calqueC000
                            215 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   416E 2E 00         [ 7]  216 	ld	l, #0x00
   4170 CD EE 47      [17]  217 	call	_cpct_setVideoMemoryOffset
                            218 ;src/main.c:115: restoreVBL();
   4173 CD 99 43      [17]  219 	call	_restoreVBL
                            220 ;src/main.c:116: rupture(39-19-7+1);
   4176 3E 0E         [ 7]  221 	ld	a, #0x0e
   4178 F5            [11]  222 	push	af
   4179 33            [ 6]  223 	inc	sp
   417A CD A5 43      [17]  224 	call	_rupture
   417D 33            [ 6]  225 	inc	sp
   417E                     226 00111$:
                            227 ;src/main.c:120: if (intCounter==4) {
   417E 3A 79 4A      [13]  228 	ld	a,(#_intCounter + 0)
   4181 D6 04         [ 7]  229 	sub	a, #0x04
   4183 C0            [11]  230 	ret	NZ
                            231 ;src/main.c:121: bank7_C000();
   4184 CD 18 43      [17]  232 	call	_bank7_C000
                            233 ;src/main.c:122: akp_musicPlay();
   4187 CD 6E 40      [17]  234 	call	_akp_musicPlay
                            235 ;src/main.c:123: bank0123();
   418A CD 12 43      [17]  236 	call	_bank0123
   418D C9            [10]  237 	ret
                            238 ;src/main.c:130: void main(void) {
                            239 ;	---------------------------------
                            240 ; Function main
                            241 ; ---------------------------------
   418E                     242 _main::
                            243 ;src/main.c:134: u8* sprite=g_items_0;
                            244 ;src/main.c:139: bank7_C000();
   418E CD 18 43      [17]  245 	call	_bank7_C000
                            246 ;src/main.c:140: akp_musicInit();
   4191 CD 4B 40      [17]  247 	call	_akp_musicInit
                            248 ;src/main.c:141: bank0123();
   4194 CD 12 43      [17]  249 	call	_bank0123
                            250 ;src/main.c:144: cpct_disableFirmware();
   4197 CD 7A 49      [17]  251 	call	_cpct_disableFirmware
                            252 ;src/main.c:145: cpct_memcpy(0x6000,0x8000,0x2000);
   419A 21 00 20      [10]  253 	ld	hl, #0x2000
   419D E5            [11]  254 	push	hl
   419E 26 80         [ 7]  255 	ld	h, #0x80
   41A0 E5            [11]  256 	push	hl
   41A1 26 60         [ 7]  257 	ld	h, #0x60
   41A3 E5            [11]  258 	push	hl
   41A4 CD 72 49      [17]  259 	call	_cpct_memcpy
                            260 ;src/main.c:146: cpct_setStackLocation(0x6000);
   41A7 21 00 60      [10]  261 	ld	hl, #0x6000
   41AA CD 13 49      [17]  262 	call	_cpct_setStackLocation
                            263 ;src/main.c:147: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   41AD 21 00 40      [10]  264 	ld	hl, #0x4000
   41B0 E5            [11]  265 	push	hl
   41B1 26 00         [ 7]  266 	ld	h, #0x00
   41B3 E5            [11]  267 	push	hl
   41B4 26 80         [ 7]  268 	ld	h, #0x80
   41B6 E5            [11]  269 	push	hl
   41B7 CD CB 48      [17]  270 	call	_cpct_memset_f64
                            271 ;src/main.c:149: bank0123();
   41BA CD 12 43      [17]  272 	call	_bank0123
                            273 ;src/main.c:150: cpct_setVideoMode(0);
   41BD 2E 00         [ 7]  274 	ld	l, #0x00
   41BF CD 64 49      [17]  275 	call	_cpct_setVideoMode
                            276 ;src/main.c:151: cpct_setBorder(HW_BLACK);
   41C2 21 10 14      [10]  277 	ld	hl, #0x1410
   41C5 E5            [11]  278 	push	hl
   41C6 CD E2 47      [17]  279 	call	_cpct_setPALColour
                            280 ;src/main.c:152: cpct_setPalette(g_tile_palette, 6);
   41C9 21 06 00      [10]  281 	ld	hl, #0x0006
   41CC E5            [11]  282 	push	hl
   41CD 21 C5 43      [10]  283 	ld	hl, #_g_tile_palette
   41D0 E5            [11]  284 	push	hl
   41D1 CD CB 47      [17]  285 	call	_cpct_setPalette
                            286 ;src/main.c:155: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   41D4 21 09 6E      [10]  287 	ld	hl, #0x6e09
   41D7 E5            [11]  288 	push	hl
   41D8 21 00 C0      [10]  289 	ld	hl, #0xc000
   41DB E5            [11]  290 	push	hl
   41DC CD A4 49      [17]  291 	call	_cpct_getScreenPtr
                            292 ;src/main.c:156: cpct_hflipSpriteM0(4, 8, sprite);
   41DF 01 CE 40      [10]  293 	ld	bc, #_g_items_0
   41E2 E5            [11]  294 	push	hl
   41E3 C5            [11]  295 	push	bc
   41E4 C5            [11]  296 	push	bc
   41E5 11 04 08      [10]  297 	ld	de, #0x0804
   41E8 D5            [11]  298 	push	de
   41E9 CD 18 49      [17]  299 	call	_cpct_hflipSpriteM0
   41EC C1            [10]  300 	pop	bc
   41ED E1            [10]  301 	pop	hl
                            302 ;src/main.c:157: cpct_drawSprite(sprite, p, 4, 8);
   41EE 11 04 08      [10]  303 	ld	de, #0x0804
   41F1 D5            [11]  304 	push	de
   41F2 E5            [11]  305 	push	hl
   41F3 C5            [11]  306 	push	bc
   41F4 CD F7 47      [17]  307 	call	_cpct_drawSprite
                            308 ;src/main.c:160: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   41F7 21 0A 60      [10]  309 	ld	hl, #0x600a
   41FA E5            [11]  310 	push	hl
   41FB 21 00 C0      [10]  311 	ld	hl, #0xc000
   41FE E5            [11]  312 	push	hl
   41FF CD A4 49      [17]  313 	call	_cpct_getScreenPtr
                            314 ;src/main.c:161: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4202 01 CB 43      [10]  315 	ld	bc, #_g_tile_schtroumpf+0
   4205 11 10 20      [10]  316 	ld	de, #0x2010
   4208 D5            [11]  317 	push	de
   4209 E5            [11]  318 	push	hl
   420A C5            [11]  319 	push	bc
   420B CD 9C 48      [17]  320 	call	_cpct_drawSpriteMasked
                            321 ;src/main.c:163: calque8000();
   420E CD F1 42      [17]  322 	call	_calque8000
                            323 ;src/main.c:165: screen_location=(u8 *)(0x2000);
   4211 21 00 20      [10]  324 	ld	hl, #0x2000
   4214 22 75 4A      [16]  325 	ld	(_screen_location), hl
                            326 ;src/main.c:166: screen_plot_address=(u8 *)(0x8000+80-2);
   4217 21 4E 80      [10]  327 	ld	hl, #0x804e
   421A 22 77 4A      [16]  328 	ld	(_screen_plot_address), hl
                            329 ;src/main.c:168: cpct_setInterruptHandler(myInterruptHandler);
   421D 21 EE 40      [10]  330 	ld	hl, #_myInterruptHandler
   4220 CD C4 49      [17]  331 	call	_cpct_setInterruptHandler
                            332 ;src/main.c:171: while (1) {
   4223 01 00 00      [10]  333 	ld	bc, #0x0000
   4226                     334 00102$:
                            335 ;src/main.c:172: cpct_waitVSYNC();
   4226 C5            [11]  336 	push	bc
   4227 CD 5C 49      [17]  337 	call	_cpct_waitVSYNC
   422A C1            [10]  338 	pop	bc
                            339 ;src/main.c:174: screen_location++;
   422B FD 21 75 4A   [14]  340 	ld	iy, #_screen_location
   422F FD 34 00      [23]  341 	inc	0 (iy)
   4232 20 03         [12]  342 	jr	NZ,00110$
   4234 FD 34 01      [23]  343 	inc	1 (iy)
   4237                     344 00110$:
                            345 ;src/main.c:175: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4237 2A 75 4A      [16]  346 	ld	hl, (_screen_location)
   423A 7C            [ 4]  347 	ld	a, h
   423B E6 23         [ 7]  348 	and	a, #0x23
   423D 67            [ 4]  349 	ld	h, a
   423E 22 75 4A      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:176: screen_plot_address+=2;
   4241 21 77 4A      [10]  352 	ld	hl, #_screen_plot_address
   4244 7E            [ 7]  353 	ld	a, (hl)
   4245 C6 02         [ 7]  354 	add	a, #0x02
   4247 77            [ 7]  355 	ld	(hl), a
   4248 23            [ 6]  356 	inc	hl
   4249 7E            [ 7]  357 	ld	a, (hl)
   424A CE 00         [ 7]  358 	adc	a, #0x00
   424C 77            [ 7]  359 	ld	(hl), a
                            360 ;src/main.c:177: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   424D 2A 77 4A      [16]  361 	ld	hl, (_screen_plot_address)
   4250 7C            [ 4]  362 	ld	a, h
   4251 E6 87         [ 7]  363 	and	a, #0x87
   4253 67            [ 4]  364 	ld	h, a
   4254 22 77 4A      [16]  365 	ld	(_screen_plot_address), hl
                            366 ;src/main.c:182: scroll_hard(t,screen_plot_address);
   4257 C5            [11]  367 	push	bc
   4258 2A 77 4A      [16]  368 	ld	hl, (_screen_plot_address)
   425B E5            [11]  369 	push	hl
   425C C5            [11]  370 	push	bc
   425D CD 48 03      [17]  371 	call	_scroll_hard
   4260 F1            [10]  372 	pop	af
   4261 F1            [10]  373 	pop	af
   4262 C1            [10]  374 	pop	bc
                            375 ;src/main.c:184: t=t+1;
   4263 03            [ 6]  376 	inc	bc
   4264 18 C0         [12]  377 	jr	00102$
                            378 	.area _CODE
                            379 	.area _INITIALIZER
   4A7F                     380 __xinit__intCounter:
   4A7F 00                  381 	.db #0x00	; 0
                            382 	.area _CABS (ABS)
