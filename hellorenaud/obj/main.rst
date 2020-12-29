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
   4A1E                      49 _screen_location::
   4A1E                      50 	.ds 2
   4A20                      51 _screen_plot_address::
   4A20                      52 	.ds 2
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
   4A22                      57 _intCounter::
   4A22                      58 	.ds 1
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
   40D7 FD 21 22 4A   [14]  140 	ld	iy, #_intCounter
   40DB FD 34 00      [23]  141 	inc	0 (iy)
                            142 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   40DE FD 7E 00      [19]  143 	ld	a, 0 (iy)
   40E1 D6 06         [ 7]  144 	sub	a, #0x06
   40E3 20 04         [12]  145 	jr	NZ,00102$
   40E5 FD 36 00 00   [19]  146 	ld	0 (iy), #0x00
   40E9                     147 00102$:
                            148 ;src/main.c:79: if (intCounter == 2) {
   40E9 3A 22 4A      [13]  149 	ld	a,(#_intCounter + 0)
   40EC D6 02         [ 7]  150 	sub	a, #0x02
   40EE 20 09         [12]  151 	jr	NZ,00104$
                            152 ;src/main.c:80: cpct_setBorder(2);
   40F0 21 10 02      [10]  153 	ld	hl, #0x0210
   40F3 E5            [11]  154 	push	hl
   40F4 CD CC 47      [17]  155 	call	_cpct_setPALColour
   40F7 18 07         [12]  156 	jr	00105$
   40F9                     157 00104$:
                            158 ;src/main.c:82: cpct_setBorder(3);
   40F9 21 10 03      [10]  159 	ld	hl, #0x0310
   40FC E5            [11]  160 	push	hl
   40FD CD CC 47      [17]  161 	call	_cpct_setPALColour
   4100                     162 00105$:
                            163 ;src/main.c:85: if (intCounter==5) {
   4100 FD 21 22 4A   [14]  164 	ld	iy, #_intCounter
   4104 FD 7E 00      [19]  165 	ld	a, 0 (iy)
   4107 D6 05         [ 7]  166 	sub	a, #0x05
   4109 20 1D         [12]  167 	jr	NZ,00107$
                            168 ;src/main.c:91: __endasm;
   410B 01 06 BC      [10]  169 	ld	bc,#0xbc06
   410E ED 49         [12]  170 	out	(c),c
   4110 01 04 BD      [10]  171 	ld	bc,#0xbd04
   4113 ED 49         [12]  172 	out	(c),c
                            173 ;src/main.c:93: crtc(screen_location);
   4115 2A 1E 4A      [16]  174 	ld	hl, (_screen_location)
   4118 E5            [11]  175 	push	hl
   4119 CD 97 40      [17]  176 	call	_crtc
   411C F1            [10]  177 	pop	af
                            178 ;src/main.c:95: killVBL();
   411D CD 72 43      [17]  179 	call	_killVBL
                            180 ;src/main.c:96: rupture(19-1);
   4120 3E 12         [ 7]  181 	ld	a, #0x12
   4122 F5            [11]  182 	push	af
   4123 33            [ 6]  183 	inc	sp
   4124 CD 8F 43      [17]  184 	call	_rupture
   4127 33            [ 6]  185 	inc	sp
   4128                     186 00107$:
                            187 ;src/main.c:100: if (intCounter==2) {
   4128 FD 21 22 4A   [14]  188 	ld	iy, #_intCounter
   412C FD 7E 00      [19]  189 	ld	a, 0 (iy)
   412F D6 02         [ 7]  190 	sub	a, #0x02
   4131 20 1C         [12]  191 	jr	NZ,00109$
                            192 ;src/main.c:106: __endasm;
   4133 01 06 BC      [10]  193 	ld	bc,#0xbc06
   4136 ED 49         [12]  194 	out	(c),c
   4138 01 19 BD      [10]  195 	ld	bc,#0xbd19
   413B ED 49         [12]  196 	out	(c),c
                            197 ;src/main.c:107: cpct_setVideoMemoryPage(cpct_pageC0);
   413D 2E 30         [ 7]  198 	ld	l, #0x30
   413F CD 86 48      [17]  199 	call	_cpct_setVideoMemoryPage
                            200 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   4142 2E 00         [ 7]  201 	ld	l, #0x00
   4144 CD D8 47      [17]  202 	call	_cpct_setVideoMemoryOffset
                            203 ;src/main.c:109: rupture(7);
   4147 3E 07         [ 7]  204 	ld	a, #0x07
   4149 F5            [11]  205 	push	af
   414A 33            [ 6]  206 	inc	sp
   414B CD 8F 43      [17]  207 	call	_rupture
   414E 33            [ 6]  208 	inc	sp
   414F                     209 00109$:
                            210 ;src/main.c:112: if (intCounter==3) {
   414F 3A 22 4A      [13]  211 	ld	a,(#_intCounter + 0)
   4152 D6 03         [ 7]  212 	sub	a, #0x03
   4154 20 15         [12]  213 	jr	NZ,00111$
                            214 ;src/main.c:113: cpct_setVideoMemoryPage(cpct_pageC0);
   4156 2E 30         [ 7]  215 	ld	l, #0x30
   4158 CD 86 48      [17]  216 	call	_cpct_setVideoMemoryPage
                            217 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   415B 2E 00         [ 7]  218 	ld	l, #0x00
   415D CD D8 47      [17]  219 	call	_cpct_setVideoMemoryOffset
                            220 ;src/main.c:115: restoreVBL();
   4160 CD 83 43      [17]  221 	call	_restoreVBL
                            222 ;src/main.c:116: rupture(39-19-7+1);
   4163 3E 0E         [ 7]  223 	ld	a, #0x0e
   4165 F5            [11]  224 	push	af
   4166 33            [ 6]  225 	inc	sp
   4167 CD 8F 43      [17]  226 	call	_rupture
   416A 33            [ 6]  227 	inc	sp
   416B                     228 00111$:
                            229 ;src/main.c:120: if (intCounter==4) {
   416B 3A 22 4A      [13]  230 	ld	a,(#_intCounter + 0)
   416E D6 04         [ 7]  231 	sub	a, #0x04
   4170 C0            [11]  232 	ret	NZ
                            233 ;src/main.c:121: bank7_C000();
   4171 CD 02 43      [17]  234 	call	_bank7_C000
                            235 ;src/main.c:122: akp_musicPlay();
   4174 CD 57 40      [17]  236 	call	_akp_musicPlay
                            237 ;src/main.c:123: bank0123();
   4177 CD FC 42      [17]  238 	call	_bank0123
   417A C9            [10]  239 	ret
                            240 ;src/main.c:130: void main(void) {
                            241 ;	---------------------------------
                            242 ; Function main
                            243 ; ---------------------------------
   417B                     244 _main::
                            245 ;src/main.c:134: u8* sprite=g_items_0;
                            246 ;src/main.c:137: bank7_C000();
   417B CD 02 43      [17]  247 	call	_bank7_C000
                            248 ;src/main.c:138: akp_musicInit();
   417E CD 34 40      [17]  249 	call	_akp_musicInit
                            250 ;src/main.c:139: bank0123();
   4181 CD FC 42      [17]  251 	call	_bank0123
                            252 ;src/main.c:142: cpct_disableFirmware();
   4184 CD 6D 49      [17]  253 	call	_cpct_disableFirmware
                            254 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   4187 21 00 20      [10]  255 	ld	hl, #0x2000
   418A E5            [11]  256 	push	hl
   418B 26 80         [ 7]  257 	ld	h, #0x80
   418D E5            [11]  258 	push	hl
   418E 26 60         [ 7]  259 	ld	h, #0x60
   4190 E5            [11]  260 	push	hl
   4191 CD 65 49      [17]  261 	call	_cpct_memcpy
                            262 ;src/main.c:144: cpct_setStackLocation(0x6000);
   4194 21 00 60      [10]  263 	ld	hl, #0x6000
   4197 CD 06 49      [17]  264 	call	_cpct_setStackLocation
                            265 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   419A 21 00 40      [10]  266 	ld	hl, #0x4000
   419D E5            [11]  267 	push	hl
   419E 21 FF FF      [10]  268 	ld	hl, #0xffff
   41A1 E5            [11]  269 	push	hl
   41A2 21 00 80      [10]  270 	ld	hl, #0x8000
   41A5 E5            [11]  271 	push	hl
   41A6 CD BE 48      [17]  272 	call	_cpct_memset_f64
                            273 ;src/main.c:147: bank0123();
   41A9 CD FC 42      [17]  274 	call	_bank0123
                            275 ;src/main.c:148: cpct_setVideoMode(0);
   41AC 2E 00         [ 7]  276 	ld	l, #0x00
   41AE CD 57 49      [17]  277 	call	_cpct_setVideoMode
                            278 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   41B1 21 10 14      [10]  279 	ld	hl, #0x1410
   41B4 E5            [11]  280 	push	hl
   41B5 CD CC 47      [17]  281 	call	_cpct_setPALColour
                            282 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   41B8 21 06 00      [10]  283 	ld	hl, #0x0006
   41BB E5            [11]  284 	push	hl
   41BC 21 AF 43      [10]  285 	ld	hl, #_g_tile_palette
   41BF E5            [11]  286 	push	hl
   41C0 CD B5 47      [17]  287 	call	_cpct_setPalette
                            288 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   41C3 21 09 6E      [10]  289 	ld	hl, #0x6e09
   41C6 E5            [11]  290 	push	hl
   41C7 21 00 C0      [10]  291 	ld	hl, #0xc000
   41CA E5            [11]  292 	push	hl
   41CB CD 95 49      [17]  293 	call	_cpct_getScreenPtr
                            294 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   41CE 01 B7 40      [10]  295 	ld	bc, #_g_items_0
   41D1 E5            [11]  296 	push	hl
   41D2 C5            [11]  297 	push	bc
   41D3 C5            [11]  298 	push	bc
   41D4 11 04 08      [10]  299 	ld	de, #0x0804
   41D7 D5            [11]  300 	push	de
   41D8 CD 0B 49      [17]  301 	call	_cpct_hflipSpriteM0
   41DB C1            [10]  302 	pop	bc
   41DC E1            [10]  303 	pop	hl
                            304 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   41DD 11 04 08      [10]  305 	ld	de, #0x0804
   41E0 D5            [11]  306 	push	de
   41E1 E5            [11]  307 	push	hl
   41E2 C5            [11]  308 	push	bc
   41E3 CD E1 47      [17]  309 	call	_cpct_drawSprite
                            310 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   41E6 21 0A 60      [10]  311 	ld	hl, #0x600a
   41E9 E5            [11]  312 	push	hl
   41EA 21 00 C0      [10]  313 	ld	hl, #0xc000
   41ED E5            [11]  314 	push	hl
   41EE CD 95 49      [17]  315 	call	_cpct_getScreenPtr
                            316 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   41F1 01 B5 43      [10]  317 	ld	bc, #_g_tile_schtroumpf+0
   41F4 11 10 20      [10]  318 	ld	de, #0x2010
   41F7 D5            [11]  319 	push	de
   41F8 E5            [11]  320 	push	hl
   41F9 C5            [11]  321 	push	bc
   41FA CD 8F 48      [17]  322 	call	_cpct_drawSpriteMasked
                            323 ;src/main.c:164: calque8000();
   41FD CD DB 42      [17]  324 	call	_calque8000
                            325 ;src/main.c:166: screen_location=(u8 *)(0x2000);
   4200 21 00 20      [10]  326 	ld	hl, #0x2000
   4203 22 1E 4A      [16]  327 	ld	(_screen_location), hl
                            328 ;src/main.c:167: screen_plot_address=(u8 *)(0x8000+80-2);
   4206 21 4E 80      [10]  329 	ld	hl, #0x804e
   4209 22 20 4A      [16]  330 	ld	(_screen_plot_address), hl
                            331 ;src/main.c:169: cpct_setInterruptHandler(myInterruptHandler);
   420C 21 D7 40      [10]  332 	ld	hl, #_myInterruptHandler
   420F CD B5 49      [17]  333 	call	_cpct_setInterruptHandler
                            334 ;src/main.c:172: while (1) {
   4212 01 00 00      [10]  335 	ld	bc, #0x0000
   4215                     336 00102$:
                            337 ;src/main.c:173: cpct_waitVSYNC();
   4215 C5            [11]  338 	push	bc
   4216 CD 4F 49      [17]  339 	call	_cpct_waitVSYNC
   4219 C1            [10]  340 	pop	bc
                            341 ;src/main.c:175: screen_location++;
   421A FD 21 1E 4A   [14]  342 	ld	iy, #_screen_location
   421E FD 34 00      [23]  343 	inc	0 (iy)
   4221 20 03         [12]  344 	jr	NZ,00110$
   4223 FD 34 01      [23]  345 	inc	1 (iy)
   4226                     346 00110$:
                            347 ;src/main.c:176: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   4226 2A 1E 4A      [16]  348 	ld	hl, (_screen_location)
   4229 7C            [ 4]  349 	ld	a, h
   422A E6 23         [ 7]  350 	and	a, #0x23
   422C 67            [ 4]  351 	ld	h, a
   422D 22 1E 4A      [16]  352 	ld	(_screen_location), hl
                            353 ;src/main.c:177: screen_plot_address+=2;
   4230 21 20 4A      [10]  354 	ld	hl, #_screen_plot_address
   4233 7E            [ 7]  355 	ld	a, (hl)
   4234 C6 02         [ 7]  356 	add	a, #0x02
   4236 77            [ 7]  357 	ld	(hl), a
   4237 23            [ 6]  358 	inc	hl
   4238 7E            [ 7]  359 	ld	a, (hl)
   4239 CE 00         [ 7]  360 	adc	a, #0x00
   423B 77            [ 7]  361 	ld	(hl), a
                            362 ;src/main.c:178: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   423C 2A 20 4A      [16]  363 	ld	hl, (_screen_plot_address)
   423F 7C            [ 4]  364 	ld	a, h
   4240 E6 87         [ 7]  365 	and	a, #0x87
   4242 67            [ 4]  366 	ld	h, a
   4243 22 20 4A      [16]  367 	ld	(_screen_plot_address), hl
                            368 ;src/main.c:184: scroll_hard(t,screen_plot_address);
   4246 C5            [11]  369 	push	bc
   4247 2A 20 4A      [16]  370 	ld	hl, (_screen_plot_address)
   424A E5            [11]  371 	push	hl
   424B C5            [11]  372 	push	bc
   424C CD 48 03      [17]  373 	call	_scroll_hard
   424F F1            [10]  374 	pop	af
   4250 F1            [10]  375 	pop	af
   4251 C1            [10]  376 	pop	bc
                            377 ;src/main.c:186: t=t+1;
   4252 03            [ 6]  378 	inc	bc
   4253 18 C0         [12]  379 	jr	00102$
                            380 	.area _CODE
                            381 	.area _INITIALIZER
   4A29                     382 __xinit__intCounter:
   4A29 00                  383 	.db #0x00	; 0
                            384 	.area _CABS (ABS)
