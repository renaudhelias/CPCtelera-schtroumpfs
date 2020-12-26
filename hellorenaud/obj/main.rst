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
                             38 	.globl _slow
                             39 	.globl _hOffset
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
   4AB7                      51 _screen_location::
   4AB7                      52 	.ds 2
   4AB9                      53 _screen_plot_address::
   4AB9                      54 	.ds 2
                             55 ;--------------------------------------------------------
                             56 ; ram data
                             57 ;--------------------------------------------------------
                             58 	.area _INITIALIZED
   4ABB                      59 _intCounter::
   4ABB                      60 	.ds 1
   4ABC                      61 _hOffset::
   4ABC                      62 	.ds 2
   4ABE                      63 _slow::
   4ABE                      64 	.ds 1
                             65 ;--------------------------------------------------------
                             66 ; absolute external ram data
                             67 ;--------------------------------------------------------
                             68 	.area _DABS (ABS)
                             69 ;--------------------------------------------------------
                             70 ; global & static initialisations
                             71 ;--------------------------------------------------------
                             72 	.area _HOME
                             73 	.area _GSINIT
                             74 	.area _GSFINAL
                             75 	.area _GSINIT
                             76 ;--------------------------------------------------------
                             77 ; Home
                             78 ;--------------------------------------------------------
                             79 	.area _HOME
                             80 	.area _HOME
                             81 ;--------------------------------------------------------
                             82 ; code
                             83 ;--------------------------------------------------------
                             84 	.area _CODE
                             85 ;src/main.c:45: void crtc(u8* R12R13) {
                             86 ;	---------------------------------
                             87 ; Function crtc
                             88 ; ---------------------------------
   404C                      89 _crtc::
                             90 ;src/main.c:62: __endasm;
   404C DD E5         [15]   91 	push	ix
   404E DD 21 00 00   [14]   92 	ld	ix,#0
   4052 DD 39         [15]   93 	add	ix,sp
   4054 DD 66 05      [19]   94 	ld	h, 5 (ix)
   4057 DD 6E 04      [19]   95 	ld	l, 4 (ix)
   405A 01 0C BC      [10]   96 	ld	bc,#0xbc00+12
   405D ED 49         [12]   97 	out	(c),c
   405F 04            [ 4]   98 	inc	b
   4060 ED 61         [12]   99 	out	(c),h
   4062 05            [ 4]  100 	dec	b
   4063 0C            [ 4]  101 	inc	c
   4064 ED 49         [12]  102 	out	(c),c
   4066 04            [ 4]  103 	inc	b
   4067 ED 69         [12]  104 	out	(c),l
   4069 DD E1         [14]  105 	pop	ix
   406B C9            [10]  106 	ret
   406C                     107 _g_items_0:
   406C 05                  108 	.db #0x05	; 5
   406D 0F                  109 	.db #0x0f	; 15
   406E 0F                  110 	.db #0x0f	; 15
   406F 00                  111 	.db #0x00	; 0
   4070 0F                  112 	.db #0x0f	; 15
   4071 0F                  113 	.db #0x0f	; 15
   4072 0F                  114 	.db #0x0f	; 15
   4073 0A                  115 	.db #0x0a	; 10
   4074 0F                  116 	.db #0x0f	; 15
   4075 0A                  117 	.db #0x0a	; 10
   4076 05                  118 	.db #0x05	; 5
   4077 00                  119 	.db #0x00	; 0
   4078 0F                  120 	.db #0x0f	; 15
   4079 0A                  121 	.db #0x0a	; 10
   407A 05                  122 	.db #0x05	; 5
   407B 00                  123 	.db #0x00	; 0
   407C 05                  124 	.db #0x05	; 5
   407D 0F                  125 	.db #0x0f	; 15
   407E 0A                  126 	.db #0x0a	; 10
   407F 0A                  127 	.db #0x0a	; 10
   4080 00                  128 	.db #0x00	; 0
   4081 0F                  129 	.db #0x0f	; 15
   4082 0F                  130 	.db #0x0f	; 15
   4083 0A                  131 	.db #0x0a	; 10
   4084 00                  132 	.db #0x00	; 0
   4085 0A                  133 	.db #0x0a	; 10
   4086 0A                  134 	.db #0x0a	; 10
   4087 0A                  135 	.db #0x0a	; 10
   4088 00                  136 	.db #0x00	; 0
   4089 00                  137 	.db #0x00	; 0
   408A 00                  138 	.db #0x00	; 0
   408B 00                  139 	.db #0x00	; 0
                            140 ;src/main.c:75: void myInterruptHandler() {
                            141 ;	---------------------------------
                            142 ; Function myInterruptHandler
                            143 ; ---------------------------------
   408C                     144 _myInterruptHandler::
                            145 ;src/main.c:78: intCounter=intCounter+1;
   408C FD 21 BB 4A   [14]  146 	ld	iy, #_intCounter
   4090 FD 34 00      [23]  147 	inc	0 (iy)
                            148 ;src/main.c:79: if (intCounter == 6) intCounter=0;
   4093 FD 7E 00      [19]  149 	ld	a, 0 (iy)
   4096 D6 06         [ 7]  150 	sub	a, #0x06
   4098 20 04         [12]  151 	jr	NZ,00102$
   409A FD 36 00 00   [19]  152 	ld	0 (iy), #0x00
   409E                     153 00102$:
                            154 ;src/main.c:81: if (intCounter == 2) {
   409E 3A BB 4A      [13]  155 	ld	a,(#_intCounter + 0)
   40A1 D6 02         [ 7]  156 	sub	a, #0x02
   40A3 20 09         [12]  157 	jr	NZ,00104$
                            158 ;src/main.c:82: cpct_setBorder(2);
   40A5 21 10 02      [10]  159 	ld	hl, #0x0210
   40A8 E5            [11]  160 	push	hl
   40A9 CD 24 48      [17]  161 	call	_cpct_setPALColour
   40AC 18 07         [12]  162 	jr	00105$
   40AE                     163 00104$:
                            164 ;src/main.c:84: cpct_setBorder(3);
   40AE 21 10 03      [10]  165 	ld	hl, #0x0310
   40B1 E5            [11]  166 	push	hl
   40B2 CD 24 48      [17]  167 	call	_cpct_setPALColour
   40B5                     168 00105$:
                            169 ;src/main.c:87: if (intCounter==5) {
   40B5 FD 21 BB 4A   [14]  170 	ld	iy, #_intCounter
   40B9 FD 7E 00      [19]  171 	ld	a, 0 (iy)
   40BC D6 05         [ 7]  172 	sub	a, #0x05
   40BE 20 5B         [12]  173 	jr	NZ,00107$
                            174 ;src/main.c:93: __endasm;
   40C0 01 06 BC      [10]  175 	ld	bc,#0xbc06
   40C3 ED 49         [12]  176 	out	(c),c
   40C5 01 04 BD      [10]  177 	ld	bc,#0xbd04
   40C8 ED 49         [12]  178 	out	(c),c
                            179 ;src/main.c:95: screen_location++;
   40CA FD 21 B7 4A   [14]  180 	ld	iy, #_screen_location
   40CE FD 34 00      [23]  181 	inc	0 (iy)
   40D1 20 03         [12]  182 	jr	NZ,00146$
   40D3 FD 34 01      [23]  183 	inc	1 (iy)
   40D6                     184 00146$:
                            185 ;src/main.c:96: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   40D6 2A B7 4A      [16]  186 	ld	hl, (_screen_location)
   40D9 7C            [ 4]  187 	ld	a, h
   40DA E6 23         [ 7]  188 	and	a, #0x23
   40DC 67            [ 4]  189 	ld	h, a
   40DD 22 B7 4A      [16]  190 	ld	(_screen_location), hl
                            191 ;src/main.c:97: crtc(screen_location);
   40E0 2A B7 4A      [16]  192 	ld	hl, (_screen_location)
   40E3 E5            [11]  193 	push	hl
   40E4 CD 4C 40      [17]  194 	call	_crtc
   40E7 F1            [10]  195 	pop	af
                            196 ;src/main.c:99: screen_plot_address++;
   40E8 FD 21 B9 4A   [14]  197 	ld	iy, #_screen_plot_address
   40EC FD 34 00      [23]  198 	inc	0 (iy)
   40EF 20 03         [12]  199 	jr	NZ,00147$
   40F1 FD 34 01      [23]  200 	inc	1 (iy)
   40F4                     201 00147$:
                            202 ;src/main.c:100: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   40F4 2A B9 4A      [16]  203 	ld	hl, (_screen_plot_address)
   40F7 7C            [ 4]  204 	ld	a, h
   40F8 E6 87         [ 7]  205 	and	a, #0x87
   40FA 67            [ 4]  206 	ld	h, a
   40FB 22 B9 4A      [16]  207 	ld	(_screen_plot_address), hl
                            208 ;src/main.c:101: screen_plot_address++;
   40FE FD 34 00      [23]  209 	inc	0 (iy)
   4101 20 03         [12]  210 	jr	NZ,00148$
   4103 FD 34 01      [23]  211 	inc	1 (iy)
   4106                     212 00148$:
                            213 ;src/main.c:102: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4106 2A B9 4A      [16]  214 	ld	hl, (_screen_plot_address)
   4109 7C            [ 4]  215 	ld	a, h
   410A E6 87         [ 7]  216 	and	a, #0x87
   410C 67            [ 4]  217 	ld	h, a
   410D 22 B9 4A      [16]  218 	ld	(_screen_plot_address), hl
                            219 ;src/main.c:105: killVBL();
   4110 CD CA 43      [17]  220 	call	_killVBL
                            221 ;src/main.c:106: rupture(19-1);
   4113 3E 12         [ 7]  222 	ld	a, #0x12
   4115 F5            [11]  223 	push	af
   4116 33            [ 6]  224 	inc	sp
   4117 CD E7 43      [17]  225 	call	_rupture
   411A 33            [ 6]  226 	inc	sp
   411B                     227 00107$:
                            228 ;src/main.c:111: if (intCounter==2) {
   411B FD 21 BB 4A   [14]  229 	ld	iy, #_intCounter
   411F FD 7E 00      [19]  230 	ld	a, 0 (iy)
   4122 D6 02         [ 7]  231 	sub	a, #0x02
   4124 20 1A         [12]  232 	jr	NZ,00109$
                            233 ;src/main.c:117: __endasm;
   4126 01 06 BC      [10]  234 	ld	bc,#0xbc06
   4129 ED 49         [12]  235 	out	(c),c
   412B 01 19 BD      [10]  236 	ld	bc,#0xbd19
   412E ED 49         [12]  237 	out	(c),c
                            238 ;src/main.c:118: calqueC000();
   4130 CD 28 43      [17]  239 	call	_calqueC000
                            240 ;src/main.c:119: cpct_setVideoMemoryOffset(0);
   4133 2E 00         [ 7]  241 	ld	l, #0x00
   4135 CD 30 48      [17]  242 	call	_cpct_setVideoMemoryOffset
                            243 ;src/main.c:120: rupture(7);
   4138 3E 07         [ 7]  244 	ld	a, #0x07
   413A F5            [11]  245 	push	af
   413B 33            [ 6]  246 	inc	sp
   413C CD E7 43      [17]  247 	call	_rupture
   413F 33            [ 6]  248 	inc	sp
   4140                     249 00109$:
                            250 ;src/main.c:123: if (intCounter==3) {
   4140 3A BB 4A      [13]  251 	ld	a,(#_intCounter + 0)
   4143 D6 03         [ 7]  252 	sub	a, #0x03
   4145 20 13         [12]  253 	jr	NZ,00111$
                            254 ;src/main.c:124: calqueC000();
   4147 CD 28 43      [17]  255 	call	_calqueC000
                            256 ;src/main.c:125: cpct_setVideoMemoryOffset(0);
   414A 2E 00         [ 7]  257 	ld	l, #0x00
   414C CD 30 48      [17]  258 	call	_cpct_setVideoMemoryOffset
                            259 ;src/main.c:126: restoreVBL();
   414F CD DB 43      [17]  260 	call	_restoreVBL
                            261 ;src/main.c:127: rupture(39-19-7+1);
   4152 3E 0E         [ 7]  262 	ld	a, #0x0e
   4154 F5            [11]  263 	push	af
   4155 33            [ 6]  264 	inc	sp
   4156 CD E7 43      [17]  265 	call	_rupture
   4159 33            [ 6]  266 	inc	sp
   415A                     267 00111$:
                            268 ;src/main.c:131: if (intCounter==4) {
   415A 3A BB 4A      [13]  269 	ld	a,(#_intCounter + 0)
   415D D6 04         [ 7]  270 	sub	a, #0x04
   415F C0            [11]  271 	ret	NZ
                            272 ;src/main.c:132: bank7_C000();
   4160 CD 5A 43      [17]  273 	call	_bank7_C000
                            274 ;src/main.c:133: akp_musicPlay();
   4163 CD 0C 40      [17]  275 	call	_akp_musicPlay
                            276 ;src/main.c:134: bank0123();
   4166 CD 54 43      [17]  277 	call	_bank0123
   4169 C9            [10]  278 	ret
                            279 ;src/main.c:141: void main(void) {
                            280 ;	---------------------------------
                            281 ; Function main
                            282 ; ---------------------------------
   416A                     283 _main::
                            284 ;src/main.c:145: u8* sprite=g_items_0;
                            285 ;src/main.c:153: bank7_C000();
   416A CD 5A 43      [17]  286 	call	_bank7_C000
                            287 ;src/main.c:154: akp_musicInit();
   416D CD E9 3F      [17]  288 	call	_akp_musicInit
                            289 ;src/main.c:155: bank0123();
   4170 CD 54 43      [17]  290 	call	_bank0123
                            291 ;src/main.c:158: cpct_disableFirmware();
   4173 CD BC 49      [17]  292 	call	_cpct_disableFirmware
                            293 ;src/main.c:159: cpct_memcpy(0x7000,0x5000,0x3000);
   4176 21 00 30      [10]  294 	ld	hl, #0x3000
   4179 E5            [11]  295 	push	hl
   417A 26 50         [ 7]  296 	ld	h, #0x50
   417C E5            [11]  297 	push	hl
   417D 26 70         [ 7]  298 	ld	h, #0x70
   417F E5            [11]  299 	push	hl
   4180 CD B4 49      [17]  300 	call	_cpct_memcpy
                            301 ;src/main.c:160: cpct_setStackLocation(0x5000);
   4183 21 00 50      [10]  302 	ld	hl, #0x5000
   4186 CD 55 49      [17]  303 	call	_cpct_setStackLocation
                            304 ;src/main.c:161: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   4189 21 00 40      [10]  305 	ld	hl, #0x4000
   418C E5            [11]  306 	push	hl
   418D 26 00         [ 7]  307 	ld	h, #0x00
   418F E5            [11]  308 	push	hl
   4190 26 80         [ 7]  309 	ld	h, #0x80
   4192 E5            [11]  310 	push	hl
   4193 CD 0D 49      [17]  311 	call	_cpct_memset_f64
                            312 ;src/main.c:162: cpct_setInterruptHandler(myInterruptHandler);
   4196 21 8C 40      [10]  313 	ld	hl, #_myInterruptHandler
   4199 CD 06 4A      [17]  314 	call	_cpct_setInterruptHandler
                            315 ;src/main.c:164: bank0123();
   419C CD 54 43      [17]  316 	call	_bank0123
                            317 ;src/main.c:165: cpct_setVideoMode(0);
   419F 2E 00         [ 7]  318 	ld	l, #0x00
   41A1 CD A6 49      [17]  319 	call	_cpct_setVideoMode
                            320 ;src/main.c:166: cpct_setBorder(HW_BLACK);
   41A4 21 10 14      [10]  321 	ld	hl, #0x1410
   41A7 E5            [11]  322 	push	hl
   41A8 CD 24 48      [17]  323 	call	_cpct_setPALColour
                            324 ;src/main.c:167: cpct_setPalette(g_tile_palette, 6);
   41AB 21 06 00      [10]  325 	ld	hl, #0x0006
   41AE E5            [11]  326 	push	hl
   41AF 21 07 44      [10]  327 	ld	hl, #_g_tile_palette
   41B2 E5            [11]  328 	push	hl
   41B3 CD 0D 48      [17]  329 	call	_cpct_setPalette
                            330 ;src/main.c:170: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   41B6 21 09 6E      [10]  331 	ld	hl, #0x6e09
   41B9 E5            [11]  332 	push	hl
   41BA 21 00 C0      [10]  333 	ld	hl, #0xc000
   41BD E5            [11]  334 	push	hl
   41BE CD E6 49      [17]  335 	call	_cpct_getScreenPtr
                            336 ;src/main.c:171: cpct_hflipSpriteM0(4, 8, sprite);
   41C1 01 6C 40      [10]  337 	ld	bc, #_g_items_0
   41C4 E5            [11]  338 	push	hl
   41C5 C5            [11]  339 	push	bc
   41C6 C5            [11]  340 	push	bc
   41C7 11 04 08      [10]  341 	ld	de, #0x0804
   41CA D5            [11]  342 	push	de
   41CB CD 5A 49      [17]  343 	call	_cpct_hflipSpriteM0
   41CE C1            [10]  344 	pop	bc
   41CF E1            [10]  345 	pop	hl
                            346 ;src/main.c:172: cpct_drawSprite(sprite, p, 4, 8);
   41D0 11 04 08      [10]  347 	ld	de, #0x0804
   41D3 D5            [11]  348 	push	de
   41D4 E5            [11]  349 	push	hl
   41D5 C5            [11]  350 	push	bc
   41D6 CD 39 48      [17]  351 	call	_cpct_drawSprite
                            352 ;src/main.c:175: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   41D9 21 0A 60      [10]  353 	ld	hl, #0x600a
   41DC E5            [11]  354 	push	hl
   41DD 21 00 C0      [10]  355 	ld	hl, #0xc000
   41E0 E5            [11]  356 	push	hl
   41E1 CD E6 49      [17]  357 	call	_cpct_getScreenPtr
                            358 ;src/main.c:176: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   41E4 01 0D 44      [10]  359 	ld	bc, #_g_tile_schtroumpf+0
   41E7 11 10 20      [10]  360 	ld	de, #0x2010
   41EA D5            [11]  361 	push	de
   41EB E5            [11]  362 	push	hl
   41EC C5            [11]  363 	push	bc
   41ED CD DE 48      [17]  364 	call	_cpct_drawSpriteMasked
                            365 ;src/main.c:178: calque8000();
   41F0 CD 33 43      [17]  366 	call	_calque8000
                            367 ;src/main.c:179: screen_location=(u8 *)(0x2000);
   41F3 21 00 20      [10]  368 	ld	hl, #0x2000
   41F6 22 B7 4A      [16]  369 	ld	(_screen_location), hl
                            370 ;src/main.c:180: screen_plot_address=(u8 *)(0x8000+80-2);
   41F9 21 4E 80      [10]  371 	ld	hl, #0x804e
   41FC 22 B9 4A      [16]  372 	ld	(_screen_plot_address), hl
                            373 ;src/main.c:181: t=0;
   41FF 01 00 00      [10]  374 	ld	bc, #0x0000
                            375 ;src/main.c:182: while (1) {
   4202                     376 00104$:
                            377 ;src/main.c:183: cpct_waitVSYNC();
   4202 C5            [11]  378 	push	bc
   4203 CD 9E 49      [17]  379 	call	_cpct_waitVSYNC
   4206 C1            [10]  380 	pop	bc
                            381 ;src/main.c:186: scroll_hard("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR          ", 120, t,screen_plot_address);
   4207 C5            [11]  382 	push	bc
   4208 2A B9 4A      [16]  383 	ld	hl, (_screen_plot_address)
   420B E5            [11]  384 	push	hl
   420C C5            [11]  385 	push	bc
   420D 21 78 00      [10]  386 	ld	hl, #0x0078
   4210 E5            [11]  387 	push	hl
   4211 21 2F 42      [10]  388 	ld	hl, #___str_0
   4214 E5            [11]  389 	push	hl
   4215 CD 48 03      [17]  390 	call	_scroll_hard
   4218 21 08 00      [10]  391 	ld	hl, #8
   421B 39            [11]  392 	add	hl, sp
   421C F9            [ 6]  393 	ld	sp, hl
   421D C1            [10]  394 	pop	bc
                            395 ;src/main.c:187: t=t+1;
   421E 03            [ 6]  396 	inc	bc
                            397 ;src/main.c:188: if (t>=120*8) {t=0;}
   421F 79            [ 4]  398 	ld	a, c
   4220 D6 C0         [ 7]  399 	sub	a, #0xc0
   4222 78            [ 4]  400 	ld	a, b
   4223 17            [ 4]  401 	rla
   4224 3F            [ 4]  402 	ccf
   4225 1F            [ 4]  403 	rra
   4226 DE 83         [ 7]  404 	sbc	a, #0x83
   4228 38 D8         [12]  405 	jr	C,00104$
   422A 01 00 00      [10]  406 	ld	bc, #0x0000
   422D 18 D3         [12]  407 	jr	00104$
   422F                     408 ___str_0:
   422F 57 45 20 57 49 53   409 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   426B 57 45 20 57 49 53   410 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR          "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 20 20 20
        20 20 20 20 20 20
   42A7 00                  411 	.db 0x00
                            412 	.area _CODE
                            413 	.area _INITIALIZER
   4AC4                     414 __xinit__intCounter:
   4AC4 00                  415 	.db #0x00	; 0
   4AC5                     416 __xinit__hOffset:
   4AC5 00 00               417 	.dw #0x0000
   4AC7                     418 __xinit__slow:
   4AC7 00                  419 	.db #0x00	; 0
                            420 	.area _CABS (ABS)
