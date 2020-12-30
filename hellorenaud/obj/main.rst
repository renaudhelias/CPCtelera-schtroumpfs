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
                             26 	.globl _cpct_setVideoMemoryPage
                             27 	.globl _cpct_setPALColour
                             28 	.globl _cpct_setPalette
                             29 	.globl _cpct_waitVSYNC
                             30 	.globl _cpct_setVideoMode
                             31 	.globl _cpct_hflipSpriteM0
                             32 	.globl _cpct_drawSpriteMasked
                             33 	.globl _cpct_drawSprite
                             34 	.globl _cpct_isAnyKeyPressed_f
                             35 	.globl _cpct_scanKeyboard_f
                             36 	.globl _cpct_setStackLocation
                             37 	.globl _cpct_memcpy
                             38 	.globl _cpct_memset_f64
                             39 	.globl _cpct_disableFirmware
                             40 	.globl _intCounter
                             41 	.globl _screen_plot_address
                             42 	.globl _screen_location
                             43 	.globl _g_items_0
                             44 ;--------------------------------------------------------
                             45 ; special function registers
                             46 ;--------------------------------------------------------
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DATA
   4B16                      51 _screen_location::
   4B16                      52 	.ds 2
   4B18                      53 _screen_plot_address::
   4B18                      54 	.ds 2
                             55 ;--------------------------------------------------------
                             56 ; ram data
                             57 ;--------------------------------------------------------
                             58 	.area _INITIALIZED
   4B1A                      59 _intCounter::
   4B1A                      60 	.ds 1
                             61 ;--------------------------------------------------------
                             62 ; absolute external ram data
                             63 ;--------------------------------------------------------
                             64 	.area _DABS (ABS)
                             65 ;--------------------------------------------------------
                             66 ; global & static initialisations
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _GSINIT
                             70 	.area _GSFINAL
                             71 	.area _GSINIT
                             72 ;--------------------------------------------------------
                             73 ; Home
                             74 ;--------------------------------------------------------
                             75 	.area _HOME
                             76 	.area _HOME
                             77 ;--------------------------------------------------------
                             78 ; code
                             79 ;--------------------------------------------------------
                             80 	.area _CODE
                             81 ;src/main.c:45: void crtc(u8* R12R13) {
                             82 ;	---------------------------------
                             83 ; Function crtc
                             84 ; ---------------------------------
   4110                      85 _crtc::
                             86 ;src/main.c:62: __endasm;
   4110 DD E5         [15]   87 	push	ix
   4112 DD 21 00 00   [14]   88 	ld	ix,#0
   4116 DD 39         [15]   89 	add	ix,sp
   4118 DD 66 05      [19]   90 	ld	h, 5 (ix)
   411B DD 6E 04      [19]   91 	ld	l, 4 (ix)
   411E 01 0C BC      [10]   92 	ld	bc,#0xbc00+12
   4121 ED 49         [12]   93 	out	(c),c
   4123 04            [ 4]   94 	inc	b
   4124 ED 61         [12]   95 	out	(c),h
   4126 05            [ 4]   96 	dec	b
   4127 0C            [ 4]   97 	inc	c
   4128 ED 49         [12]   98 	out	(c),c
   412A 04            [ 4]   99 	inc	b
   412B ED 69         [12]  100 	out	(c),l
   412D DD E1         [14]  101 	pop	ix
   412F C9            [10]  102 	ret
   4130                     103 _g_items_0:
   4130 05                  104 	.db #0x05	; 5
   4131 0F                  105 	.db #0x0f	; 15
   4132 0F                  106 	.db #0x0f	; 15
   4133 00                  107 	.db #0x00	; 0
   4134 0F                  108 	.db #0x0f	; 15
   4135 0F                  109 	.db #0x0f	; 15
   4136 0F                  110 	.db #0x0f	; 15
   4137 0A                  111 	.db #0x0a	; 10
   4138 0F                  112 	.db #0x0f	; 15
   4139 0A                  113 	.db #0x0a	; 10
   413A 05                  114 	.db #0x05	; 5
   413B 00                  115 	.db #0x00	; 0
   413C 0F                  116 	.db #0x0f	; 15
   413D 0A                  117 	.db #0x0a	; 10
   413E 05                  118 	.db #0x05	; 5
   413F 00                  119 	.db #0x00	; 0
   4140 05                  120 	.db #0x05	; 5
   4141 0F                  121 	.db #0x0f	; 15
   4142 0A                  122 	.db #0x0a	; 10
   4143 0A                  123 	.db #0x0a	; 10
   4144 00                  124 	.db #0x00	; 0
   4145 0F                  125 	.db #0x0f	; 15
   4146 0F                  126 	.db #0x0f	; 15
   4147 0A                  127 	.db #0x0a	; 10
   4148 00                  128 	.db #0x00	; 0
   4149 0A                  129 	.db #0x0a	; 10
   414A 0A                  130 	.db #0x0a	; 10
   414B 0A                  131 	.db #0x0a	; 10
   414C 00                  132 	.db #0x00	; 0
   414D 00                  133 	.db #0x00	; 0
   414E 00                  134 	.db #0x00	; 0
   414F 00                  135 	.db #0x00	; 0
                            136 ;src/main.c:73: void myInterruptHandler() {
                            137 ;	---------------------------------
                            138 ; Function myInterruptHandler
                            139 ; ---------------------------------
   4150                     140 _myInterruptHandler::
                            141 ;src/main.c:76: intCounter=intCounter+1;
   4150 FD 21 1A 4B   [14]  142 	ld	iy, #_intCounter
   4154 FD 34 00      [23]  143 	inc	0 (iy)
                            144 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   4157 FD 7E 00      [19]  145 	ld	a, 0 (iy)
   415A D6 06         [ 7]  146 	sub	a, #0x06
   415C 20 04         [12]  147 	jr	NZ,00102$
   415E FD 36 00 00   [19]  148 	ld	0 (iy), #0x00
   4162                     149 00102$:
                            150 ;src/main.c:79: if (intCounter == 2) {
   4162 3A 1A 4B      [13]  151 	ld	a,(#_intCounter + 0)
   4165 D6 02         [ 7]  152 	sub	a, #0x02
   4167 20 09         [12]  153 	jr	NZ,00104$
                            154 ;src/main.c:80: cpct_setBorder(2);
   4169 21 10 02      [10]  155 	ld	hl, #0x0210
   416C E5            [11]  156 	push	hl
   416D CD C7 48      [17]  157 	call	_cpct_setPALColour
   4170 18 07         [12]  158 	jr	00105$
   4172                     159 00104$:
                            160 ;src/main.c:82: cpct_setBorder(3);
   4172 21 10 03      [10]  161 	ld	hl, #0x0310
   4175 E5            [11]  162 	push	hl
   4176 CD C7 48      [17]  163 	call	_cpct_setPALColour
   4179                     164 00105$:
                            165 ;src/main.c:85: if (intCounter==5) {
   4179 FD 21 1A 4B   [14]  166 	ld	iy, #_intCounter
   417D FD 7E 00      [19]  167 	ld	a, 0 (iy)
   4180 D6 05         [ 7]  168 	sub	a, #0x05
   4182 20 1D         [12]  169 	jr	NZ,00107$
                            170 ;src/main.c:91: __endasm;
   4184 01 06 BC      [10]  171 	ld	bc,#0xbc06
   4187 ED 49         [12]  172 	out	(c),c
   4189 01 04 BD      [10]  173 	ld	bc,#0xbd04
   418C ED 49         [12]  174 	out	(c),c
                            175 ;src/main.c:93: crtc(screen_location);
   418E 2A 16 4B      [16]  176 	ld	hl, (_screen_location)
   4191 E5            [11]  177 	push	hl
   4192 CD 10 41      [17]  178 	call	_crtc
   4195 F1            [10]  179 	pop	af
                            180 ;src/main.c:95: killVBL();
   4196 CD 03 44      [17]  181 	call	_killVBL
                            182 ;src/main.c:96: rupture(19-1);
   4199 3E 12         [ 7]  183 	ld	a, #0x12
   419B F5            [11]  184 	push	af
   419C 33            [ 6]  185 	inc	sp
   419D CD 20 44      [17]  186 	call	_rupture
   41A0 33            [ 6]  187 	inc	sp
   41A1                     188 00107$:
                            189 ;src/main.c:100: if (intCounter==2) {
   41A1 FD 21 1A 4B   [14]  190 	ld	iy, #_intCounter
   41A5 FD 7E 00      [19]  191 	ld	a, 0 (iy)
   41A8 D6 02         [ 7]  192 	sub	a, #0x02
   41AA 20 1C         [12]  193 	jr	NZ,00109$
                            194 ;src/main.c:106: __endasm;
   41AC 01 06 BC      [10]  195 	ld	bc,#0xbc06
   41AF ED 49         [12]  196 	out	(c),c
   41B1 01 19 BD      [10]  197 	ld	bc,#0xbd19
   41B4 ED 49         [12]  198 	out	(c),c
                            199 ;src/main.c:107: cpct_setVideoMemoryPage(cpct_pageC0);
   41B6 2E 30         [ 7]  200 	ld	l, #0x30
   41B8 CD 8B 49      [17]  201 	call	_cpct_setVideoMemoryPage
                            202 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   41BB 2E 00         [ 7]  203 	ld	l, #0x00
   41BD CD D3 48      [17]  204 	call	_cpct_setVideoMemoryOffset
                            205 ;src/main.c:109: rupture(7);
   41C0 3E 07         [ 7]  206 	ld	a, #0x07
   41C2 F5            [11]  207 	push	af
   41C3 33            [ 6]  208 	inc	sp
   41C4 CD 20 44      [17]  209 	call	_rupture
   41C7 33            [ 6]  210 	inc	sp
   41C8                     211 00109$:
                            212 ;src/main.c:112: if (intCounter==3) {
   41C8 3A 1A 4B      [13]  213 	ld	a,(#_intCounter + 0)
   41CB D6 03         [ 7]  214 	sub	a, #0x03
   41CD 20 15         [12]  215 	jr	NZ,00111$
                            216 ;src/main.c:113: cpct_setVideoMemoryPage(cpct_pageC0);
   41CF 2E 30         [ 7]  217 	ld	l, #0x30
   41D1 CD 8B 49      [17]  218 	call	_cpct_setVideoMemoryPage
                            219 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   41D4 2E 00         [ 7]  220 	ld	l, #0x00
   41D6 CD D3 48      [17]  221 	call	_cpct_setVideoMemoryOffset
                            222 ;src/main.c:115: restoreVBL();
   41D9 CD 14 44      [17]  223 	call	_restoreVBL
                            224 ;src/main.c:116: rupture(39-19-7+1);
   41DC 3E 0E         [ 7]  225 	ld	a, #0x0e
   41DE F5            [11]  226 	push	af
   41DF 33            [ 6]  227 	inc	sp
   41E0 CD 20 44      [17]  228 	call	_rupture
   41E3 33            [ 6]  229 	inc	sp
   41E4                     230 00111$:
                            231 ;src/main.c:120: if (intCounter==4) {
   41E4 3A 1A 4B      [13]  232 	ld	a,(#_intCounter + 0)
   41E7 D6 04         [ 7]  233 	sub	a, #0x04
   41E9 C0            [11]  234 	ret	NZ
                            235 ;src/main.c:121: bank7_C000();
   41EA CD 93 43      [17]  236 	call	_bank7_C000
                            237 ;src/main.c:122: akp_musicPlay();
   41ED CD D0 40      [17]  238 	call	_akp_musicPlay
                            239 ;src/main.c:123: bank0123();
   41F0 CD 8D 43      [17]  240 	call	_bank0123
   41F3 C9            [10]  241 	ret
                            242 ;src/main.c:130: void main(void) {
                            243 ;	---------------------------------
                            244 ; Function main
                            245 ; ---------------------------------
   41F4                     246 _main::
                            247 ;src/main.c:134: u8* sprite=g_items_0;
                            248 ;src/main.c:137: bank7_C000();
   41F4 CD 93 43      [17]  249 	call	_bank7_C000
                            250 ;src/main.c:138: akp_musicInit();
   41F7 CD AD 40      [17]  251 	call	_akp_musicInit
                            252 ;src/main.c:139: bank0123();
   41FA CD 8D 43      [17]  253 	call	_bank0123
                            254 ;src/main.c:142: cpct_disableFirmware();
   41FD CD 8D 4A      [17]  255 	call	_cpct_disableFirmware
                            256 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   4200 21 00 20      [10]  257 	ld	hl, #0x2000
   4203 E5            [11]  258 	push	hl
   4204 26 80         [ 7]  259 	ld	h, #0x80
   4206 E5            [11]  260 	push	hl
   4207 26 60         [ 7]  261 	ld	h, #0x60
   4209 E5            [11]  262 	push	hl
   420A CD 85 4A      [17]  263 	call	_cpct_memcpy
                            264 ;src/main.c:144: cpct_setStackLocation(0x6000);
   420D 21 00 60      [10]  265 	ld	hl, #0x6000
   4210 CD 0B 4A      [17]  266 	call	_cpct_setStackLocation
                            267 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   4213 21 00 40      [10]  268 	ld	hl, #0x4000
   4216 E5            [11]  269 	push	hl
   4217 21 FF FF      [10]  270 	ld	hl, #0xffff
   421A E5            [11]  271 	push	hl
   421B 21 00 80      [10]  272 	ld	hl, #0x8000
   421E E5            [11]  273 	push	hl
   421F CD C3 49      [17]  274 	call	_cpct_memset_f64
                            275 ;src/main.c:147: bank0123();
   4222 CD 8D 43      [17]  276 	call	_bank0123
                            277 ;src/main.c:148: cpct_setVideoMode(0);
   4225 2E 00         [ 7]  278 	ld	l, #0x00
   4227 CD 5C 4A      [17]  279 	call	_cpct_setVideoMode
                            280 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   422A 21 10 14      [10]  281 	ld	hl, #0x1410
   422D E5            [11]  282 	push	hl
   422E CD C7 48      [17]  283 	call	_cpct_setPALColour
                            284 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   4231 21 06 00      [10]  285 	ld	hl, #0x0006
   4234 E5            [11]  286 	push	hl
   4235 21 40 44      [10]  287 	ld	hl, #_g_tile_palette
   4238 E5            [11]  288 	push	hl
   4239 CD 46 48      [17]  289 	call	_cpct_setPalette
                            290 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   423C 21 09 6E      [10]  291 	ld	hl, #0x6e09
   423F E5            [11]  292 	push	hl
   4240 21 00 C0      [10]  293 	ld	hl, #0xc000
   4243 E5            [11]  294 	push	hl
   4244 CD B5 4A      [17]  295 	call	_cpct_getScreenPtr
                            296 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   4247 01 30 41      [10]  297 	ld	bc, #_g_items_0
   424A E5            [11]  298 	push	hl
   424B C5            [11]  299 	push	bc
   424C C5            [11]  300 	push	bc
   424D 11 04 08      [10]  301 	ld	de, #0x0804
   4250 D5            [11]  302 	push	de
   4251 CD 10 4A      [17]  303 	call	_cpct_hflipSpriteM0
   4254 C1            [10]  304 	pop	bc
   4255 E1            [10]  305 	pop	hl
                            306 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   4256 11 04 08      [10]  307 	ld	de, #0x0804
   4259 D5            [11]  308 	push	de
   425A E5            [11]  309 	push	hl
   425B C5            [11]  310 	push	bc
   425C CD DC 48      [17]  311 	call	_cpct_drawSprite
                            312 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   425F 21 0A 60      [10]  313 	ld	hl, #0x600a
   4262 E5            [11]  314 	push	hl
   4263 21 00 C0      [10]  315 	ld	hl, #0xc000
   4266 E5            [11]  316 	push	hl
   4267 CD B5 4A      [17]  317 	call	_cpct_getScreenPtr
                            318 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   426A 01 46 44      [10]  319 	ld	bc, #_g_tile_schtroumpf+0
   426D 11 10 20      [10]  320 	ld	de, #0x2010
   4270 D5            [11]  321 	push	de
   4271 E5            [11]  322 	push	hl
   4272 C5            [11]  323 	push	bc
   4273 CD 94 49      [17]  324 	call	_cpct_drawSpriteMasked
                            325 ;src/main.c:161: calque8000();
   4276 CD 6C 43      [17]  326 	call	_calque8000
                            327 ;src/main.c:162: calqueC000();
   4279 CD 61 43      [17]  328 	call	_calqueC000
                            329 ;src/main.c:164: screen_location=(u8 *)(0x2000);
   427C 21 00 20      [10]  330 	ld	hl, #0x2000
   427F 22 16 4B      [16]  331 	ld	(_screen_location), hl
                            332 ;src/main.c:165: screen_plot_address=(u8 *)(0x8000+80-2);
   4282 21 4E 80      [10]  333 	ld	hl, #0x804e
   4285 22 18 4B      [16]  334 	ld	(_screen_plot_address), hl
                            335 ;src/main.c:170: while (1) {
   4288 01 00 00      [10]  336 	ld	bc, #0x0000
   428B                     337 00104$:
                            338 ;src/main.c:171: cpct_waitVSYNC();
   428B C5            [11]  339 	push	bc
   428C CD 54 4A      [17]  340 	call	_cpct_waitVSYNC
   428F C1            [10]  341 	pop	bc
                            342 ;src/main.c:173: screen_location++;
   4290 FD 21 16 4B   [14]  343 	ld	iy, #_screen_location
   4294 FD 34 00      [23]  344 	inc	0 (iy)
   4297 20 03         [12]  345 	jr	NZ,00116$
   4299 FD 34 01      [23]  346 	inc	1 (iy)
   429C                     347 00116$:
                            348 ;src/main.c:174: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   429C 2A 16 4B      [16]  349 	ld	hl, (_screen_location)
   429F 7C            [ 4]  350 	ld	a, h
   42A0 E6 23         [ 7]  351 	and	a, #0x23
   42A2 67            [ 4]  352 	ld	h, a
   42A3 22 16 4B      [16]  353 	ld	(_screen_location), hl
                            354 ;src/main.c:175: screen_plot_address+=2;
   42A6 21 18 4B      [10]  355 	ld	hl, #_screen_plot_address
   42A9 7E            [ 7]  356 	ld	a, (hl)
   42AA C6 02         [ 7]  357 	add	a, #0x02
   42AC 77            [ 7]  358 	ld	(hl), a
   42AD 23            [ 6]  359 	inc	hl
   42AE 7E            [ 7]  360 	ld	a, (hl)
   42AF CE 00         [ 7]  361 	adc	a, #0x00
   42B1 77            [ 7]  362 	ld	(hl), a
                            363 ;src/main.c:176: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   42B2 2A 18 4B      [16]  364 	ld	hl, (_screen_plot_address)
   42B5 7C            [ 4]  365 	ld	a, h
   42B6 E6 87         [ 7]  366 	and	a, #0x87
   42B8 67            [ 4]  367 	ld	h, a
   42B9 22 18 4B      [16]  368 	ld	(_screen_plot_address), hl
                            369 ;src/main.c:182: scroll_hard(t,screen_plot_address);
   42BC C5            [11]  370 	push	bc
   42BD 2A 18 4B      [16]  371 	ld	hl, (_screen_plot_address)
   42C0 E5            [11]  372 	push	hl
   42C1 C5            [11]  373 	push	bc
   42C2 CD BC 03      [17]  374 	call	_scroll_hard
   42C5 F1            [10]  375 	pop	af
   42C6 F1            [10]  376 	pop	af
   42C7 C1            [10]  377 	pop	bc
                            378 ;src/main.c:184: t=t+1;
   42C8 03            [ 6]  379 	inc	bc
                            380 ;src/main.c:187: cpct_scanKeyboard_f();
   42C9 C5            [11]  381 	push	bc
   42CA CD 5D 48      [17]  382 	call	_cpct_scanKeyboard_f
   42CD CD 6A 4A      [17]  383 	call	_cpct_isAnyKeyPressed_f
   42D0 C1            [10]  384 	pop	bc
   42D1 7D            [ 4]  385 	ld	a, l
   42D2 B7            [ 4]  386 	or	a, a
   42D3 28 B6         [12]  387 	jr	Z,00104$
                            388 ;src/main.c:189: cpct_memset_f64(0xC000, 0x0000, 0x4000);
   42D5 C5            [11]  389 	push	bc
   42D6 21 00 40      [10]  390 	ld	hl, #0x4000
   42D9 E5            [11]  391 	push	hl
   42DA 26 00         [ 7]  392 	ld	h, #0x00
   42DC E5            [11]  393 	push	hl
   42DD 26 C0         [ 7]  394 	ld	h, #0xc0
   42DF E5            [11]  395 	push	hl
   42E0 CD C3 49      [17]  396 	call	_cpct_memset_f64
   42E3 C1            [10]  397 	pop	bc
   42E4 18 A5         [12]  398 	jr	00104$
                            399 	.area _CODE
                            400 	.area _INITIALIZER
   4B21                     401 __xinit__intCounter:
   4B21 00                  402 	.db #0x00	; 0
                            403 	.area _CABS (ABS)
