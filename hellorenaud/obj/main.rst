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
   4BB7                      50 _screen_location::
   4BB7                      51 	.ds 2
   4BB9                      52 _screen_plot_address::
   4BB9                      53 	.ds 2
                             54 ;--------------------------------------------------------
                             55 ; ram data
                             56 ;--------------------------------------------------------
                             57 	.area _INITIALIZED
   4BBB                      58 _intCounter::
   4BBB                      59 	.ds 1
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
   41A2                      84 _crtc::
                             85 ;src/main.c:62: __endasm;
   41A2 DD E5         [15]   86 	push	ix
   41A4 DD 21 00 00   [14]   87 	ld	ix,#0
   41A8 DD 39         [15]   88 	add	ix,sp
   41AA DD 66 05      [19]   89 	ld	h, 5 (ix)
   41AD DD 6E 04      [19]   90 	ld	l, 4 (ix)
   41B0 01 0C BC      [10]   91 	ld	bc,#0xbc00+12
   41B3 ED 49         [12]   92 	out	(c),c
   41B5 04            [ 4]   93 	inc	b
   41B6 ED 61         [12]   94 	out	(c),h
   41B8 05            [ 4]   95 	dec	b
   41B9 0C            [ 4]   96 	inc	c
   41BA ED 49         [12]   97 	out	(c),c
   41BC 04            [ 4]   98 	inc	b
   41BD ED 69         [12]   99 	out	(c),l
   41BF DD E1         [14]  100 	pop	ix
   41C1 C9            [10]  101 	ret
   41C2                     102 _g_items_0:
   41C2 05                  103 	.db #0x05	; 5
   41C3 0F                  104 	.db #0x0f	; 15
   41C4 0F                  105 	.db #0x0f	; 15
   41C5 00                  106 	.db #0x00	; 0
   41C6 0F                  107 	.db #0x0f	; 15
   41C7 0F                  108 	.db #0x0f	; 15
   41C8 0F                  109 	.db #0x0f	; 15
   41C9 0A                  110 	.db #0x0a	; 10
   41CA 0F                  111 	.db #0x0f	; 15
   41CB 0A                  112 	.db #0x0a	; 10
   41CC 05                  113 	.db #0x05	; 5
   41CD 00                  114 	.db #0x00	; 0
   41CE 0F                  115 	.db #0x0f	; 15
   41CF 0A                  116 	.db #0x0a	; 10
   41D0 05                  117 	.db #0x05	; 5
   41D1 00                  118 	.db #0x00	; 0
   41D2 05                  119 	.db #0x05	; 5
   41D3 0F                  120 	.db #0x0f	; 15
   41D4 0A                  121 	.db #0x0a	; 10
   41D5 0A                  122 	.db #0x0a	; 10
   41D6 00                  123 	.db #0x00	; 0
   41D7 0F                  124 	.db #0x0f	; 15
   41D8 0F                  125 	.db #0x0f	; 15
   41D9 0A                  126 	.db #0x0a	; 10
   41DA 00                  127 	.db #0x00	; 0
   41DB 0A                  128 	.db #0x0a	; 10
   41DC 0A                  129 	.db #0x0a	; 10
   41DD 0A                  130 	.db #0x0a	; 10
   41DE 00                  131 	.db #0x00	; 0
   41DF 00                  132 	.db #0x00	; 0
   41E0 00                  133 	.db #0x00	; 0
   41E1 00                  134 	.db #0x00	; 0
                            135 ;src/main.c:73: void myInterruptHandler() {
                            136 ;	---------------------------------
                            137 ; Function myInterruptHandler
                            138 ; ---------------------------------
   41E2                     139 _myInterruptHandler::
                            140 ;src/main.c:76: intCounter=intCounter+1;
   41E2 FD 21 BB 4B   [14]  141 	ld	iy, #_intCounter
   41E6 FD 34 00      [23]  142 	inc	0 (iy)
                            143 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   41E9 FD 7E 00      [19]  144 	ld	a, 0 (iy)
   41EC D6 06         [ 7]  145 	sub	a, #0x06
   41EE 20 04         [12]  146 	jr	NZ,00102$
   41F0 FD 36 00 00   [19]  147 	ld	0 (iy), #0x00
   41F4                     148 00102$:
                            149 ;src/main.c:79: if (intCounter == 2) {
   41F4 3A BB 4B      [13]  150 	ld	a,(#_intCounter + 0)
   41F7 D6 02         [ 7]  151 	sub	a, #0x02
   41F9 20 09         [12]  152 	jr	NZ,00104$
                            153 ;src/main.c:80: cpct_setBorder(2);
   41FB 21 10 02      [10]  154 	ld	hl, #0x0210
   41FE E5            [11]  155 	push	hl
   41FF CD 68 49      [17]  156 	call	_cpct_setPALColour
   4202 18 07         [12]  157 	jr	00105$
   4204                     158 00104$:
                            159 ;src/main.c:82: cpct_setBorder(3);
   4204 21 10 03      [10]  160 	ld	hl, #0x0310
   4207 E5            [11]  161 	push	hl
   4208 CD 68 49      [17]  162 	call	_cpct_setPALColour
   420B                     163 00105$:
                            164 ;src/main.c:85: if (intCounter==5) {
   420B FD 21 BB 4B   [14]  165 	ld	iy, #_intCounter
   420F FD 7E 00      [19]  166 	ld	a, 0 (iy)
   4212 D6 05         [ 7]  167 	sub	a, #0x05
   4214 20 1D         [12]  168 	jr	NZ,00107$
                            169 ;src/main.c:91: __endasm;
   4216 01 06 BC      [10]  170 	ld	bc,#0xbc06
   4219 ED 49         [12]  171 	out	(c),c
   421B 01 04 BD      [10]  172 	ld	bc,#0xbd04
   421E ED 49         [12]  173 	out	(c),c
                            174 ;src/main.c:93: crtc(screen_location);
   4220 2A B7 4B      [16]  175 	ld	hl, (_screen_location)
   4223 E5            [11]  176 	push	hl
   4224 CD A2 41      [17]  177 	call	_crtc
   4227 F1            [10]  178 	pop	af
                            179 ;src/main.c:95: killVBL();
   4228 CD A4 44      [17]  180 	call	_killVBL
                            181 ;src/main.c:96: rupture(19-1);
   422B 3E 12         [ 7]  182 	ld	a, #0x12
   422D F5            [11]  183 	push	af
   422E 33            [ 6]  184 	inc	sp
   422F CD C1 44      [17]  185 	call	_rupture
   4232 33            [ 6]  186 	inc	sp
   4233                     187 00107$:
                            188 ;src/main.c:100: if (intCounter==2) {
   4233 FD 21 BB 4B   [14]  189 	ld	iy, #_intCounter
   4237 FD 7E 00      [19]  190 	ld	a, 0 (iy)
   423A D6 02         [ 7]  191 	sub	a, #0x02
   423C 20 1C         [12]  192 	jr	NZ,00109$
                            193 ;src/main.c:106: __endasm;
   423E 01 06 BC      [10]  194 	ld	bc,#0xbc06
   4241 ED 49         [12]  195 	out	(c),c
   4243 01 19 BD      [10]  196 	ld	bc,#0xbd19
   4246 ED 49         [12]  197 	out	(c),c
                            198 ;src/main.c:107: cpct_setVideoMemoryPage(cpct_pageC0);
   4248 2E 30         [ 7]  199 	ld	l, #0x30
   424A CD 2C 4A      [17]  200 	call	_cpct_setVideoMemoryPage
                            201 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   424D 2E 00         [ 7]  202 	ld	l, #0x00
   424F CD 74 49      [17]  203 	call	_cpct_setVideoMemoryOffset
                            204 ;src/main.c:109: rupture(7);
   4252 3E 07         [ 7]  205 	ld	a, #0x07
   4254 F5            [11]  206 	push	af
   4255 33            [ 6]  207 	inc	sp
   4256 CD C1 44      [17]  208 	call	_rupture
   4259 33            [ 6]  209 	inc	sp
   425A                     210 00109$:
                            211 ;src/main.c:112: if (intCounter==3) {
   425A 3A BB 4B      [13]  212 	ld	a,(#_intCounter + 0)
   425D D6 03         [ 7]  213 	sub	a, #0x03
   425F 20 15         [12]  214 	jr	NZ,00111$
                            215 ;src/main.c:113: cpct_setVideoMemoryPage(cpct_pageC0);
   4261 2E 30         [ 7]  216 	ld	l, #0x30
   4263 CD 2C 4A      [17]  217 	call	_cpct_setVideoMemoryPage
                            218 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   4266 2E 00         [ 7]  219 	ld	l, #0x00
   4268 CD 74 49      [17]  220 	call	_cpct_setVideoMemoryOffset
                            221 ;src/main.c:115: restoreVBL();
   426B CD B5 44      [17]  222 	call	_restoreVBL
                            223 ;src/main.c:116: rupture(39-19-7+1);
   426E 3E 0E         [ 7]  224 	ld	a, #0x0e
   4270 F5            [11]  225 	push	af
   4271 33            [ 6]  226 	inc	sp
   4272 CD C1 44      [17]  227 	call	_rupture
   4275 33            [ 6]  228 	inc	sp
   4276                     229 00111$:
                            230 ;src/main.c:120: if (intCounter==4) {
   4276 3A BB 4B      [13]  231 	ld	a,(#_intCounter + 0)
   4279 D6 04         [ 7]  232 	sub	a, #0x04
   427B C0            [11]  233 	ret	NZ
                            234 ;src/main.c:121: bank7_C000();
   427C CD 34 44      [17]  235 	call	_bank7_C000
                            236 ;src/main.c:122: akp_musicPlay();
   427F CD 62 41      [17]  237 	call	_akp_musicPlay
                            238 ;src/main.c:123: bank0123();
   4282 CD 2E 44      [17]  239 	call	_bank0123
   4285 C9            [10]  240 	ret
                            241 ;src/main.c:130: void main(void) {
                            242 ;	---------------------------------
                            243 ; Function main
                            244 ; ---------------------------------
   4286                     245 _main::
                            246 ;src/main.c:134: u8* sprite=g_items_0;
                            247 ;src/main.c:137: bank7_C000();
   4286 CD 34 44      [17]  248 	call	_bank7_C000
                            249 ;src/main.c:138: akp_musicInit();
   4289 CD 3F 41      [17]  250 	call	_akp_musicInit
                            251 ;src/main.c:139: bank0123();
   428C CD 2E 44      [17]  252 	call	_bank0123
                            253 ;src/main.c:142: cpct_disableFirmware();
   428F CD 2E 4B      [17]  254 	call	_cpct_disableFirmware
                            255 ;src/main.c:143: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   4292 21 00 20      [10]  256 	ld	hl, #0x2000
   4295 E5            [11]  257 	push	hl
   4296 26 80         [ 7]  258 	ld	h, #0x80
   4298 E5            [11]  259 	push	hl
   4299 26 60         [ 7]  260 	ld	h, #0x60
   429B E5            [11]  261 	push	hl
   429C CD 26 4B      [17]  262 	call	_cpct_memcpy
                            263 ;src/main.c:144: cpct_setStackLocation(0x6000);
   429F 21 00 60      [10]  264 	ld	hl, #0x6000
   42A2 CD AC 4A      [17]  265 	call	_cpct_setStackLocation
                            266 ;src/main.c:145: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   42A5 21 00 40      [10]  267 	ld	hl, #0x4000
   42A8 E5            [11]  268 	push	hl
   42A9 21 FF FF      [10]  269 	ld	hl, #0xffff
   42AC E5            [11]  270 	push	hl
   42AD 21 00 80      [10]  271 	ld	hl, #0x8000
   42B0 E5            [11]  272 	push	hl
   42B1 CD 64 4A      [17]  273 	call	_cpct_memset_f64
                            274 ;src/main.c:147: bank0123();
   42B4 CD 2E 44      [17]  275 	call	_bank0123
                            276 ;src/main.c:148: cpct_setVideoMode(0);
   42B7 2E 00         [ 7]  277 	ld	l, #0x00
   42B9 CD FD 4A      [17]  278 	call	_cpct_setVideoMode
                            279 ;src/main.c:149: cpct_setBorder(HW_BLACK);
   42BC 21 10 14      [10]  280 	ld	hl, #0x1410
   42BF E5            [11]  281 	push	hl
   42C0 CD 68 49      [17]  282 	call	_cpct_setPALColour
                            283 ;src/main.c:150: cpct_setPalette(g_tile_palette, 6);
   42C3 21 06 00      [10]  284 	ld	hl, #0x0006
   42C6 E5            [11]  285 	push	hl
   42C7 21 E1 44      [10]  286 	ld	hl, #_g_tile_palette
   42CA E5            [11]  287 	push	hl
   42CB CD E7 48      [17]  288 	call	_cpct_setPalette
                            289 ;src/main.c:153: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   42CE 21 09 6E      [10]  290 	ld	hl, #0x6e09
   42D1 E5            [11]  291 	push	hl
   42D2 21 00 C0      [10]  292 	ld	hl, #0xc000
   42D5 E5            [11]  293 	push	hl
   42D6 CD 56 4B      [17]  294 	call	_cpct_getScreenPtr
                            295 ;src/main.c:154: cpct_hflipSpriteM0(4, 8, sprite);
   42D9 01 C2 41      [10]  296 	ld	bc, #_g_items_0
   42DC E5            [11]  297 	push	hl
   42DD C5            [11]  298 	push	bc
   42DE C5            [11]  299 	push	bc
   42DF 11 04 08      [10]  300 	ld	de, #0x0804
   42E2 D5            [11]  301 	push	de
   42E3 CD B1 4A      [17]  302 	call	_cpct_hflipSpriteM0
   42E6 C1            [10]  303 	pop	bc
   42E7 E1            [10]  304 	pop	hl
                            305 ;src/main.c:155: cpct_drawSprite(sprite, p, 4, 8);
   42E8 11 04 08      [10]  306 	ld	de, #0x0804
   42EB D5            [11]  307 	push	de
   42EC E5            [11]  308 	push	hl
   42ED C5            [11]  309 	push	bc
   42EE CD 7D 49      [17]  310 	call	_cpct_drawSprite
                            311 ;src/main.c:158: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   42F1 21 0A 60      [10]  312 	ld	hl, #0x600a
   42F4 E5            [11]  313 	push	hl
   42F5 21 00 C0      [10]  314 	ld	hl, #0xc000
   42F8 E5            [11]  315 	push	hl
   42F9 CD 56 4B      [17]  316 	call	_cpct_getScreenPtr
                            317 ;src/main.c:159: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   42FC 01 E7 44      [10]  318 	ld	bc, #_g_tile_schtroumpf+0
   42FF 11 10 20      [10]  319 	ld	de, #0x2010
   4302 D5            [11]  320 	push	de
   4303 E5            [11]  321 	push	hl
   4304 C5            [11]  322 	push	bc
   4305 CD 35 4A      [17]  323 	call	_cpct_drawSpriteMasked
                            324 ;src/main.c:162: calqueC000();
   4308 CD 02 44      [17]  325 	call	_calqueC000
                            326 ;src/main.c:164: screen_location=(u8 *)(0x2000);
   430B 21 00 20      [10]  327 	ld	hl, #0x2000
   430E 22 B7 4B      [16]  328 	ld	(_screen_location), hl
                            329 ;src/main.c:165: screen_plot_address=(u8 *)(0x8000+80-2);
   4311 21 4E 80      [10]  330 	ld	hl, #0x804e
   4314 22 B9 4B      [16]  331 	ld	(_screen_plot_address), hl
                            332 ;src/main.c:170: while (1) {
   4317 01 00 00      [10]  333 	ld	bc, #0x0000
   431A                     334 00104$:
                            335 ;src/main.c:171: cpct_waitVSYNC();
   431A C5            [11]  336 	push	bc
   431B CD F5 4A      [17]  337 	call	_cpct_waitVSYNC
   431E C1            [10]  338 	pop	bc
                            339 ;src/main.c:173: screen_location++;
   431F FD 21 B7 4B   [14]  340 	ld	iy, #_screen_location
   4323 FD 34 00      [23]  341 	inc	0 (iy)
   4326 20 03         [12]  342 	jr	NZ,00116$
   4328 FD 34 01      [23]  343 	inc	1 (iy)
   432B                     344 00116$:
                            345 ;src/main.c:174: screen_location=(u8 *)(((u16)screen_location) & 0x23FF);
   432B 2A B7 4B      [16]  346 	ld	hl, (_screen_location)
   432E 7C            [ 4]  347 	ld	a, h
   432F E6 23         [ 7]  348 	and	a, #0x23
   4331 67            [ 4]  349 	ld	h, a
   4332 22 B7 4B      [16]  350 	ld	(_screen_location), hl
                            351 ;src/main.c:176: crtc(screen_location+0x1000);
   4335 FD 21 00 10   [14]  352 	ld	iy, #0x1000
   4339 ED 5B B7 4B   [20]  353 	ld	de, (_screen_location)
   433D FD 19         [15]  354 	add	iy, de
   433F C5            [11]  355 	push	bc
   4340 FD E5         [15]  356 	push	iy
   4342 CD A2 41      [17]  357 	call	_crtc
   4345 F1            [10]  358 	pop	af
   4346 C1            [10]  359 	pop	bc
                            360 ;src/main.c:178: screen_plot_address+=2;
   4347 21 B9 4B      [10]  361 	ld	hl, #_screen_plot_address
   434A 7E            [ 7]  362 	ld	a, (hl)
   434B C6 02         [ 7]  363 	add	a, #0x02
   434D 77            [ 7]  364 	ld	(hl), a
   434E 23            [ 6]  365 	inc	hl
   434F 7E            [ 7]  366 	ld	a, (hl)
   4350 CE 00         [ 7]  367 	adc	a, #0x00
   4352 77            [ 7]  368 	ld	(hl), a
                            369 ;src/main.c:179: screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
   4353 2A B9 4B      [16]  370 	ld	hl, (_screen_plot_address)
   4356 7C            [ 4]  371 	ld	a, h
   4357 E6 87         [ 7]  372 	and	a, #0x87
   4359 67            [ 4]  373 	ld	h, a
   435A 22 B9 4B      [16]  374 	ld	(_screen_plot_address), hl
                            375 ;src/main.c:185: scroll_hard(t,screen_plot_address);
   435D C5            [11]  376 	push	bc
   435E 2A B9 4B      [16]  377 	ld	hl, (_screen_plot_address)
   4361 E5            [11]  378 	push	hl
   4362 C5            [11]  379 	push	bc
   4363 CD 24 04      [17]  380 	call	_scroll_hard
   4366 F1            [10]  381 	pop	af
   4367 F1            [10]  382 	pop	af
   4368 C1            [10]  383 	pop	bc
                            384 ;src/main.c:187: t=t+1;
   4369 03            [ 6]  385 	inc	bc
                            386 ;src/main.c:190: cpct_scanKeyboard_f();
   436A C5            [11]  387 	push	bc
   436B CD FE 48      [17]  388 	call	_cpct_scanKeyboard_f
   436E CD 0B 4B      [17]  389 	call	_cpct_isAnyKeyPressed_f
   4371 C1            [10]  390 	pop	bc
   4372 7D            [ 4]  391 	ld	a, l
   4373 B7            [ 4]  392 	or	a, a
   4374 28 A4         [12]  393 	jr	Z,00104$
                            394 ;src/main.c:192: cpct_memset_f64(0xC000, 0x0000, 0x4000);
   4376 C5            [11]  395 	push	bc
   4377 21 00 40      [10]  396 	ld	hl, #0x4000
   437A E5            [11]  397 	push	hl
   437B 26 00         [ 7]  398 	ld	h, #0x00
   437D E5            [11]  399 	push	hl
   437E 26 C0         [ 7]  400 	ld	h, #0xc0
   4380 E5            [11]  401 	push	hl
   4381 CD 64 4A      [17]  402 	call	_cpct_memset_f64
   4384 C1            [10]  403 	pop	bc
   4385 18 93         [12]  404 	jr	00104$
                            405 	.area _CODE
                            406 	.area _INITIALIZER
   4BC2                     407 __xinit__intCounter:
   4BC2 00                  408 	.db #0x00	; 0
                            409 	.area _CABS (ABS)
