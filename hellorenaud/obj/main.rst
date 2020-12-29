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
                             14 	.globl _bank0123
                             15 	.globl _calque8000
                             16 	.globl _calqueC000
                             17 	.globl _scroll_hard
                             18 	.globl _rupture
                             19 	.globl _restoreVBL
                             20 	.globl _killVBL
                             21 	.globl _cpct_getScreenPtr
                             22 	.globl _cpct_setVideoMemoryOffset
                             23 	.globl _cpct_setPALColour
                             24 	.globl _cpct_setPalette
                             25 	.globl _cpct_waitVSYNC
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_hflipSpriteM0
                             28 	.globl _cpct_drawSpriteMasked
                             29 	.globl _cpct_drawSprite
                             30 	.globl _cpct_setStackLocation
                             31 	.globl _cpct_memcpy
                             32 	.globl _cpct_memset_f64
                             33 	.globl _cpct_setInterruptHandler
                             34 	.globl _cpct_disableFirmware
                             35 	.globl _intCounter
                             36 	.globl _screen_plot_address
                             37 	.globl _screen_location
                             38 	.globl _g_items_0
                             39 ;--------------------------------------------------------
                             40 ; special function registers
                             41 ;--------------------------------------------------------
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DATA
   4A5F                      46 _screen_location::
   4A5F                      47 	.ds 2
   4A61                      48 _screen_plot_address::
   4A61                      49 	.ds 2
                             50 ;--------------------------------------------------------
                             51 ; ram data
                             52 ;--------------------------------------------------------
                             53 	.area _INITIALIZED
   4A63                      54 _intCounter::
   4A63                      55 	.ds 1
                             56 ;--------------------------------------------------------
                             57 ; absolute external ram data
                             58 ;--------------------------------------------------------
                             59 	.area _DABS (ABS)
                             60 ;--------------------------------------------------------
                             61 ; global & static initialisations
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _GSINIT
                             65 	.area _GSFINAL
                             66 	.area _GSINIT
                             67 ;--------------------------------------------------------
                             68 ; Home
                             69 ;--------------------------------------------------------
                             70 	.area _HOME
                             71 	.area _HOME
                             72 ;--------------------------------------------------------
                             73 ; code
                             74 ;--------------------------------------------------------
                             75 	.area _CODE
                             76 ;src/main.c:45: void crtc(u8* R12R13) {
                             77 ;	---------------------------------
                             78 ; Function crtc
                             79 ; ---------------------------------
   40AF                      80 _crtc::
                             81 ;src/main.c:62: __endasm;
   40AF DD E5         [15]   82 	push	ix
   40B1 DD 21 00 00   [14]   83 	ld	ix,#0
   40B5 DD 39         [15]   84 	add	ix,sp
   40B7 DD 66 05      [19]   85 	ld	h, 5 (ix)
   40BA DD 6E 04      [19]   86 	ld	l, 4 (ix)
   40BD 01 0C BC      [10]   87 	ld	bc,#0xbc00+12
   40C0 ED 49         [12]   88 	out	(c),c
   40C2 04            [ 4]   89 	inc	b
   40C3 ED 61         [12]   90 	out	(c),h
   40C5 05            [ 4]   91 	dec	b
   40C6 0C            [ 4]   92 	inc	c
   40C7 ED 49         [12]   93 	out	(c),c
   40C9 04            [ 4]   94 	inc	b
   40CA ED 69         [12]   95 	out	(c),l
   40CC DD E1         [14]   96 	pop	ix
   40CE C9            [10]   97 	ret
   40CF                      98 _g_items_0:
   40CF 05                   99 	.db #0x05	; 5
   40D0 0F                  100 	.db #0x0f	; 15
   40D1 0F                  101 	.db #0x0f	; 15
   40D2 00                  102 	.db #0x00	; 0
   40D3 0F                  103 	.db #0x0f	; 15
   40D4 0F                  104 	.db #0x0f	; 15
   40D5 0F                  105 	.db #0x0f	; 15
   40D6 0A                  106 	.db #0x0a	; 10
   40D7 0F                  107 	.db #0x0f	; 15
   40D8 0A                  108 	.db #0x0a	; 10
   40D9 05                  109 	.db #0x05	; 5
   40DA 00                  110 	.db #0x00	; 0
   40DB 0F                  111 	.db #0x0f	; 15
   40DC 0A                  112 	.db #0x0a	; 10
   40DD 05                  113 	.db #0x05	; 5
   40DE 00                  114 	.db #0x00	; 0
   40DF 05                  115 	.db #0x05	; 5
   40E0 0F                  116 	.db #0x0f	; 15
   40E1 0A                  117 	.db #0x0a	; 10
   40E2 0A                  118 	.db #0x0a	; 10
   40E3 00                  119 	.db #0x00	; 0
   40E4 0F                  120 	.db #0x0f	; 15
   40E5 0F                  121 	.db #0x0f	; 15
   40E6 0A                  122 	.db #0x0a	; 10
   40E7 00                  123 	.db #0x00	; 0
   40E8 0A                  124 	.db #0x0a	; 10
   40E9 0A                  125 	.db #0x0a	; 10
   40EA 0A                  126 	.db #0x0a	; 10
   40EB 00                  127 	.db #0x00	; 0
   40EC 00                  128 	.db #0x00	; 0
   40ED 00                  129 	.db #0x00	; 0
   40EE 00                  130 	.db #0x00	; 0
                            131 ;src/main.c:73: void myInterruptHandler() {
                            132 ;	---------------------------------
                            133 ; Function myInterruptHandler
                            134 ; ---------------------------------
   40EF                     135 _myInterruptHandler::
                            136 ;src/main.c:76: intCounter=intCounter+1;
   40EF FD 21 63 4A   [14]  137 	ld	iy, #_intCounter
   40F3 FD 34 00      [23]  138 	inc	0 (iy)
                            139 ;src/main.c:77: if (intCounter == 6) intCounter=0;
   40F6 FD 7E 00      [19]  140 	ld	a, 0 (iy)
   40F9 D6 06         [ 7]  141 	sub	a, #0x06
   40FB 20 04         [12]  142 	jr	NZ,00102$
   40FD FD 36 00 00   [19]  143 	ld	0 (iy), #0x00
   4101                     144 00102$:
                            145 ;src/main.c:79: if (intCounter == 2) {
   4101 3A 63 4A      [13]  146 	ld	a,(#_intCounter + 0)
   4104 D6 02         [ 7]  147 	sub	a, #0x02
   4106 20 09         [12]  148 	jr	NZ,00104$
                            149 ;src/main.c:80: cpct_setBorder(2);
   4108 21 10 02      [10]  150 	ld	hl, #0x0210
   410B E5            [11]  151 	push	hl
   410C CD CC 47      [17]  152 	call	_cpct_setPALColour
   410F 18 07         [12]  153 	jr	00105$
   4111                     154 00104$:
                            155 ;src/main.c:82: cpct_setBorder(3);
   4111 21 10 03      [10]  156 	ld	hl, #0x0310
   4114 E5            [11]  157 	push	hl
   4115 CD CC 47      [17]  158 	call	_cpct_setPALColour
   4118                     159 00105$:
                            160 ;src/main.c:85: if (intCounter==5) {
   4118 FD 21 63 4A   [14]  161 	ld	iy, #_intCounter
   411C FD 7E 00      [19]  162 	ld	a, 0 (iy)
   411F D6 05         [ 7]  163 	sub	a, #0x05
   4121 20 1D         [12]  164 	jr	NZ,00107$
                            165 ;src/main.c:91: __endasm;
   4123 01 06 BC      [10]  166 	ld	bc,#0xbc06
   4126 ED 49         [12]  167 	out	(c),c
   4128 01 04 BD      [10]  168 	ld	bc,#0xbd04
   412B ED 49         [12]  169 	out	(c),c
                            170 ;src/main.c:93: crtc(screen_location);
   412D 2A 5F 4A      [16]  171 	ld	hl, (_screen_location)
   4130 E5            [11]  172 	push	hl
   4131 CD AF 40      [17]  173 	call	_crtc
   4134 F1            [10]  174 	pop	af
                            175 ;src/main.c:95: killVBL();
   4135 CD 72 43      [17]  176 	call	_killVBL
                            177 ;src/main.c:96: rupture(19-1);
   4138 3E 12         [ 7]  178 	ld	a, #0x12
   413A F5            [11]  179 	push	af
   413B 33            [ 6]  180 	inc	sp
   413C CD 8F 43      [17]  181 	call	_rupture
   413F 33            [ 6]  182 	inc	sp
   4140                     183 00107$:
                            184 ;src/main.c:100: if (intCounter==2) {
   4140 FD 21 63 4A   [14]  185 	ld	iy, #_intCounter
   4144 FD 7E 00      [19]  186 	ld	a, 0 (iy)
   4147 D6 02         [ 7]  187 	sub	a, #0x02
   4149 20 1A         [12]  188 	jr	NZ,00109$
                            189 ;src/main.c:106: __endasm;
   414B 01 06 BC      [10]  190 	ld	bc,#0xbc06
   414E ED 49         [12]  191 	out	(c),c
   4150 01 19 BD      [10]  192 	ld	bc,#0xbd19
   4153 ED 49         [12]  193 	out	(c),c
                            194 ;src/main.c:107: calqueC000();
   4155 CD D0 42      [17]  195 	call	_calqueC000
                            196 ;src/main.c:108: cpct_setVideoMemoryOffset(0);
   4158 2E 00         [ 7]  197 	ld	l, #0x00
   415A CD D8 47      [17]  198 	call	_cpct_setVideoMemoryOffset
                            199 ;src/main.c:109: rupture(7);
   415D 3E 07         [ 7]  200 	ld	a, #0x07
   415F F5            [11]  201 	push	af
   4160 33            [ 6]  202 	inc	sp
   4161 CD 8F 43      [17]  203 	call	_rupture
   4164 33            [ 6]  204 	inc	sp
   4165                     205 00109$:
                            206 ;src/main.c:112: if (intCounter==3) {
   4165 3A 63 4A      [13]  207 	ld	a,(#_intCounter + 0)
   4168 D6 03         [ 7]  208 	sub	a, #0x03
   416A C0            [11]  209 	ret	NZ
                            210 ;src/main.c:113: calqueC000();
   416B CD D0 42      [17]  211 	call	_calqueC000
                            212 ;src/main.c:114: cpct_setVideoMemoryOffset(0);
   416E 2E 00         [ 7]  213 	ld	l, #0x00
   4170 CD D8 47      [17]  214 	call	_cpct_setVideoMemoryOffset
                            215 ;src/main.c:115: restoreVBL();
   4173 CD 83 43      [17]  216 	call	_restoreVBL
                            217 ;src/main.c:116: rupture(39-19-7+1);
   4176 3E 0E         [ 7]  218 	ld	a, #0x0e
   4178 F5            [11]  219 	push	af
   4179 33            [ 6]  220 	inc	sp
   417A CD 8F 43      [17]  221 	call	_rupture
   417D 33            [ 6]  222 	inc	sp
   417E C9            [10]  223 	ret
                            224 ;src/main.c:130: void main(void) {
                            225 ;	---------------------------------
                            226 ; Function main
                            227 ; ---------------------------------
   417F                     228 _main::
                            229 ;src/main.c:134: u8* sprite=g_items_0;
                            230 ;src/main.c:144: cpct_disableFirmware();
   417F CD 64 49      [17]  231 	call	_cpct_disableFirmware
                            232 ;src/main.c:145: cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   4182 21 00 20      [10]  233 	ld	hl, #0x2000
   4185 E5            [11]  234 	push	hl
   4186 26 80         [ 7]  235 	ld	h, #0x80
   4188 E5            [11]  236 	push	hl
   4189 26 60         [ 7]  237 	ld	h, #0x60
   418B E5            [11]  238 	push	hl
   418C CD 5C 49      [17]  239 	call	_cpct_memcpy
                            240 ;src/main.c:146: cpct_setStackLocation(0x6000);
   418F 21 00 60      [10]  241 	ld	hl, #0x6000
   4192 CD FD 48      [17]  242 	call	_cpct_setStackLocation
                            243 ;src/main.c:147: cpct_memset_f64(0x8000, 0xFFFF, 0x4000);
   4195 21 00 40      [10]  244 	ld	hl, #0x4000
   4198 E5            [11]  245 	push	hl
   4199 21 FF FF      [10]  246 	ld	hl, #0xffff
   419C E5            [11]  247 	push	hl
   419D 21 00 80      [10]  248 	ld	hl, #0x8000
   41A0 E5            [11]  249 	push	hl
   41A1 CD B5 48      [17]  250 	call	_cpct_memset_f64
                            251 ;src/main.c:149: bank0123();
   41A4 CD FC 42      [17]  252 	call	_bank0123
                            253 ;src/main.c:150: cpct_setVideoMode(0);
   41A7 2E 00         [ 7]  254 	ld	l, #0x00
   41A9 CD 4E 49      [17]  255 	call	_cpct_setVideoMode
                            256 ;src/main.c:151: cpct_setBorder(HW_BLACK);
   41AC 21 10 14      [10]  257 	ld	hl, #0x1410
   41AF E5            [11]  258 	push	hl
   41B0 CD CC 47      [17]  259 	call	_cpct_setPALColour
                            260 ;src/main.c:152: cpct_setPalette(g_tile_palette, 6);
   41B3 21 06 00      [10]  261 	ld	hl, #0x0006
   41B6 E5            [11]  262 	push	hl
   41B7 21 AF 43      [10]  263 	ld	hl, #_g_tile_palette
   41BA E5            [11]  264 	push	hl
   41BB CD B5 47      [17]  265 	call	_cpct_setPalette
                            266 ;src/main.c:155: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   41BE 21 09 6E      [10]  267 	ld	hl, #0x6e09
   41C1 E5            [11]  268 	push	hl
   41C2 21 00 C0      [10]  269 	ld	hl, #0xc000
   41C5 E5            [11]  270 	push	hl
   41C6 CD 8E 49      [17]  271 	call	_cpct_getScreenPtr
                            272 ;src/main.c:156: cpct_hflipSpriteM0(4, 8, sprite);
   41C9 01 CF 40      [10]  273 	ld	bc, #_g_items_0
   41CC E5            [11]  274 	push	hl
   41CD C5            [11]  275 	push	bc
   41CE C5            [11]  276 	push	bc
   41CF 11 04 08      [10]  277 	ld	de, #0x0804
   41D2 D5            [11]  278 	push	de
   41D3 CD 02 49      [17]  279 	call	_cpct_hflipSpriteM0
   41D6 C1            [10]  280 	pop	bc
   41D7 E1            [10]  281 	pop	hl
                            282 ;src/main.c:157: cpct_drawSprite(sprite, p, 4, 8);
   41D8 11 04 08      [10]  283 	ld	de, #0x0804
   41DB D5            [11]  284 	push	de
   41DC E5            [11]  285 	push	hl
   41DD C5            [11]  286 	push	bc
   41DE CD E1 47      [17]  287 	call	_cpct_drawSprite
                            288 ;src/main.c:160: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   41E1 21 0A 60      [10]  289 	ld	hl, #0x600a
   41E4 E5            [11]  290 	push	hl
   41E5 21 00 C0      [10]  291 	ld	hl, #0xc000
   41E8 E5            [11]  292 	push	hl
   41E9 CD 8E 49      [17]  293 	call	_cpct_getScreenPtr
                            294 ;src/main.c:161: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   41EC 01 B5 43      [10]  295 	ld	bc, #_g_tile_schtroumpf+0
   41EF 11 10 20      [10]  296 	ld	de, #0x2010
   41F2 D5            [11]  297 	push	de
   41F3 E5            [11]  298 	push	hl
   41F4 C5            [11]  299 	push	bc
   41F5 CD 86 48      [17]  300 	call	_cpct_drawSpriteMasked
                            301 ;src/main.c:166: calque8000();
   41F8 CD DB 42      [17]  302 	call	_calque8000
                            303 ;src/main.c:168: screen_location=(u8 *)(0x2000);
   41FB 21 00 20      [10]  304 	ld	hl, #0x2000
   41FE 22 5F 4A      [16]  305 	ld	(_screen_location), hl
                            306 ;src/main.c:169: screen_plot_address=(u8 *)(0x8000+80-2);
   4201 21 4E 80      [10]  307 	ld	hl, #0x804e
   4204 22 61 4A      [16]  308 	ld	(_screen_plot_address), hl
                            309 ;src/main.c:171: cpct_setInterruptHandler(myInterruptHandler);
   4207 21 EF 40      [10]  310 	ld	hl, #_myInterruptHandler
   420A CD AE 49      [17]  311 	call	_cpct_setInterruptHandler
                            312 ;src/main.c:174: while (1) {
   420D 01 00 00      [10]  313 	ld	bc, #0x0000
   4210                     314 00102$:
                            315 ;src/main.c:175: cpct_waitVSYNC();
   4210 C5            [11]  316 	push	bc
   4211 CD 46 49      [17]  317 	call	_cpct_waitVSYNC
   4214 C1            [10]  318 	pop	bc
                            319 ;src/main.c:177: screen_location++;
   4215 FD 21 5F 4A   [14]  320 	ld	iy, #_screen_location
   4219 FD 34 00      [23]  321 	inc	0 (iy)
   421C 20 03         [12]  322 	jr	NZ,00110$
   421E FD 34 01      [23]  323 	inc	1 (iy)
   4221                     324 00110$:
                            325 ;src/main.c:178: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4221 2A 5F 4A      [16]  326 	ld	hl, (_screen_location)
   4224 7C            [ 4]  327 	ld	a, h
   4225 E6 23         [ 7]  328 	and	a, #0x23
   4227 67            [ 4]  329 	ld	h, a
   4228 22 5F 4A      [16]  330 	ld	(_screen_location), hl
                            331 ;src/main.c:179: screen_plot_address+=2;
   422B 21 61 4A      [10]  332 	ld	hl, #_screen_plot_address
   422E 7E            [ 7]  333 	ld	a, (hl)
   422F C6 02         [ 7]  334 	add	a, #0x02
   4231 77            [ 7]  335 	ld	(hl), a
   4232 23            [ 6]  336 	inc	hl
   4233 7E            [ 7]  337 	ld	a, (hl)
   4234 CE 00         [ 7]  338 	adc	a, #0x00
   4236 77            [ 7]  339 	ld	(hl), a
                            340 ;src/main.c:180: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4237 2A 61 4A      [16]  341 	ld	hl, (_screen_plot_address)
   423A 7C            [ 4]  342 	ld	a, h
   423B E6 87         [ 7]  343 	and	a, #0x87
   423D 67            [ 4]  344 	ld	h, a
   423E 22 61 4A      [16]  345 	ld	(_screen_plot_address), hl
                            346 ;src/main.c:185: scroll_hard(t,screen_plot_address);
   4241 C5            [11]  347 	push	bc
   4242 2A 61 4A      [16]  348 	ld	hl, (_screen_plot_address)
   4245 E5            [11]  349 	push	hl
   4246 C5            [11]  350 	push	bc
   4247 CD 48 03      [17]  351 	call	_scroll_hard
   424A F1            [10]  352 	pop	af
   424B F1            [10]  353 	pop	af
   424C C1            [10]  354 	pop	bc
                            355 ;src/main.c:187: t=t+1;
   424D 03            [ 6]  356 	inc	bc
   424E 18 C0         [12]  357 	jr	00102$
                            358 	.area _CODE
                            359 	.area _INITIALIZER
   4A69                     360 __xinit__intCounter:
   4A69 00                  361 	.db #0x00	; 0
                            362 	.area _CABS (ABS)
