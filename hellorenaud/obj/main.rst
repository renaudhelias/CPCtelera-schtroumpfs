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
                             12 	.globl _crtc
                             13 	.globl _bank7_C000
                             14 	.globl _bank0123
                             15 	.globl _calque8000
                             16 	.globl _akp_musicInit
                             17 	.globl _scroll_hard
                             18 	.globl _cpct_getScreenPtr
                             19 	.globl _cpct_setPALColour
                             20 	.globl _cpct_setPalette
                             21 	.globl _cpct_waitVSYNC
                             22 	.globl _cpct_setVideoMode
                             23 	.globl _cpct_hflipSpriteM0
                             24 	.globl _cpct_drawSpriteMasked
                             25 	.globl _cpct_drawSprite
                             26 	.globl _cpct_isAnyKeyPressed_f
                             27 	.globl _cpct_scanKeyboard_f
                             28 	.globl _cpct_setStackLocation
                             29 	.globl _cpct_memcpy
                             30 	.globl _cpct_memset_f64
                             31 	.globl _cpct_disableFirmware
                             32 	.globl _slow
                             33 	.globl _hOffset
                             34 	.globl _intCounter
                             35 	.globl _screen_plot_address
                             36 	.globl _screen_location
                             37 	.globl _g_items_0
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   4A6C                      45 _screen_location::
   4A6C                      46 	.ds 2
   4A6E                      47 _screen_plot_address::
   4A6E                      48 	.ds 2
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
   4A70                      53 _intCounter::
   4A70                      54 	.ds 1
   4A71                      55 _hOffset::
   4A71                      56 	.ds 2
   4A73                      57 _slow::
   4A73                      58 	.ds 1
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
                            134 ;src/main.c:141: void main(void) {
                            135 ;	---------------------------------
                            136 ; Function main
                            137 ; ---------------------------------
   40F6                     138 _main::
                            139 ;src/main.c:145: u8* sprite=g_items_0;
                            140 ;src/main.c:153: bank7_C000();
   40F6 CD B1 42      [17]  141 	call	_bank7_C000
                            142 ;src/main.c:154: akp_musicInit();
   40F9 CD 53 40      [17]  143 	call	_akp_musicInit
                            144 ;src/main.c:155: bank0123();
   40FC CD AB 42      [17]  145 	call	_bank0123
                            146 ;src/main.c:158: cpct_disableFirmware();
   40FF CD 99 49      [17]  147 	call	_cpct_disableFirmware
                            148 ;src/main.c:159: cpct_memcpy(0x6000,0x8000,0x2000);
   4102 21 00 20      [10]  149 	ld	hl, #0x2000
   4105 E5            [11]  150 	push	hl
   4106 26 80         [ 7]  151 	ld	h, #0x80
   4108 E5            [11]  152 	push	hl
   4109 26 60         [ 7]  153 	ld	h, #0x60
   410B E5            [11]  154 	push	hl
   410C CD 91 49      [17]  155 	call	_cpct_memcpy
                            156 ;src/main.c:160: cpct_setStackLocation(0x6000);
   410F 21 00 60      [10]  157 	ld	hl, #0x6000
   4112 CD 17 49      [17]  158 	call	_cpct_setStackLocation
                            159 ;src/main.c:161: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   4115 21 00 40      [10]  160 	ld	hl, #0x4000
   4118 E5            [11]  161 	push	hl
   4119 26 00         [ 7]  162 	ld	h, #0x00
   411B E5            [11]  163 	push	hl
   411C 26 80         [ 7]  164 	ld	h, #0x80
   411E E5            [11]  165 	push	hl
   411F CD CF 48      [17]  166 	call	_cpct_memset_f64
                            167 ;src/main.c:164: bank0123();
   4122 CD AB 42      [17]  168 	call	_bank0123
                            169 ;src/main.c:165: cpct_setVideoMode(0);
   4125 2E 00         [ 7]  170 	ld	l, #0x00
   4127 CD 68 49      [17]  171 	call	_cpct_setVideoMode
                            172 ;src/main.c:166: cpct_setBorder(HW_BLACK);
   412A 21 10 14      [10]  173 	ld	hl, #0x1410
   412D E5            [11]  174 	push	hl
   412E CD E5 47      [17]  175 	call	_cpct_setPALColour
                            176 ;src/main.c:167: cpct_setPalette(g_tile_palette, 6);
   4131 21 06 00      [10]  177 	ld	hl, #0x0006
   4134 E5            [11]  178 	push	hl
   4135 21 5E 43      [10]  179 	ld	hl, #_g_tile_palette
   4138 E5            [11]  180 	push	hl
   4139 CD 64 47      [17]  181 	call	_cpct_setPalette
                            182 ;src/main.c:170: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   413C 21 09 6E      [10]  183 	ld	hl, #0x6e09
   413F E5            [11]  184 	push	hl
   4140 21 00 C0      [10]  185 	ld	hl, #0xc000
   4143 E5            [11]  186 	push	hl
   4144 CD C3 49      [17]  187 	call	_cpct_getScreenPtr
                            188 ;src/main.c:171: cpct_hflipSpriteM0(4, 8, sprite);
   4147 01 D6 40      [10]  189 	ld	bc, #_g_items_0
   414A E5            [11]  190 	push	hl
   414B C5            [11]  191 	push	bc
   414C C5            [11]  192 	push	bc
   414D 11 04 08      [10]  193 	ld	de, #0x0804
   4150 D5            [11]  194 	push	de
   4151 CD 1C 49      [17]  195 	call	_cpct_hflipSpriteM0
   4154 C1            [10]  196 	pop	bc
   4155 E1            [10]  197 	pop	hl
                            198 ;src/main.c:172: cpct_drawSprite(sprite, p, 4, 8);
   4156 11 04 08      [10]  199 	ld	de, #0x0804
   4159 D5            [11]  200 	push	de
   415A E5            [11]  201 	push	hl
   415B C5            [11]  202 	push	bc
   415C CD F1 47      [17]  203 	call	_cpct_drawSprite
                            204 ;src/main.c:175: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   415F 21 0A 60      [10]  205 	ld	hl, #0x600a
   4162 E5            [11]  206 	push	hl
   4163 21 00 C0      [10]  207 	ld	hl, #0xc000
   4166 E5            [11]  208 	push	hl
   4167 CD C3 49      [17]  209 	call	_cpct_getScreenPtr
                            210 ;src/main.c:176: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   416A 01 64 43      [10]  211 	ld	bc, #_g_tile_schtroumpf+0
   416D 11 10 20      [10]  212 	ld	de, #0x2010
   4170 D5            [11]  213 	push	de
   4171 E5            [11]  214 	push	hl
   4172 C5            [11]  215 	push	bc
   4173 CD A0 48      [17]  216 	call	_cpct_drawSpriteMasked
                            217 ;src/main.c:178: calque8000();
   4176 CD 8A 42      [17]  218 	call	_calque8000
                            219 ;src/main.c:179: screen_location=(u8 *)(0x2000);
   4179 21 00 20      [10]  220 	ld	hl, #0x2000
   417C 22 6C 4A      [16]  221 	ld	(_screen_location), hl
                            222 ;src/main.c:180: screen_plot_address=(u8 *)(0x8000+80-2);
   417F 21 4E 80      [10]  223 	ld	hl, #0x804e
   4182 22 6E 4A      [16]  224 	ld	(_screen_plot_address), hl
                            225 ;src/main.c:182: while (1) {
   4185 01 00 00      [10]  226 	ld	bc, #0x0000
   4188                     227 00104$:
                            228 ;src/main.c:183: cpct_waitVSYNC();
   4188 C5            [11]  229 	push	bc
   4189 CD 60 49      [17]  230 	call	_cpct_waitVSYNC
   418C C1            [10]  231 	pop	bc
                            232 ;src/main.c:186: screen_location++;
   418D FD 21 6C 4A   [14]  233 	ld	iy, #_screen_location
   4191 FD 34 00      [23]  234 	inc	0 (iy)
   4194 20 03         [12]  235 	jr	NZ,00116$
   4196 FD 34 01      [23]  236 	inc	1 (iy)
   4199                     237 00116$:
                            238 ;src/main.c:187: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   4199 2A 6C 4A      [16]  239 	ld	hl, (_screen_location)
   419C 7C            [ 4]  240 	ld	a, h
   419D E6 23         [ 7]  241 	and	a, #0x23
   419F 67            [ 4]  242 	ld	h, a
   41A0 22 6C 4A      [16]  243 	ld	(_screen_location), hl
                            244 ;src/main.c:188: crtc(screen_location);
   41A3 C5            [11]  245 	push	bc
   41A4 2A 6C 4A      [16]  246 	ld	hl, (_screen_location)
   41A7 E5            [11]  247 	push	hl
   41A8 CD B6 40      [17]  248 	call	_crtc
   41AB F1            [10]  249 	pop	af
   41AC C1            [10]  250 	pop	bc
                            251 ;src/main.c:190: screen_plot_address++;
   41AD FD 21 6E 4A   [14]  252 	ld	iy, #_screen_plot_address
   41B1 FD 34 00      [23]  253 	inc	0 (iy)
   41B4 20 03         [12]  254 	jr	NZ,00117$
   41B6 FD 34 01      [23]  255 	inc	1 (iy)
   41B9                     256 00117$:
                            257 ;src/main.c:191: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   41B9 2A 6E 4A      [16]  258 	ld	hl, (_screen_plot_address)
   41BC 7C            [ 4]  259 	ld	a, h
   41BD E6 87         [ 7]  260 	and	a, #0x87
   41BF 67            [ 4]  261 	ld	h, a
   41C0 22 6E 4A      [16]  262 	ld	(_screen_plot_address), hl
                            263 ;src/main.c:192: screen_plot_address++;
   41C3 FD 34 00      [23]  264 	inc	0 (iy)
   41C6 20 03         [12]  265 	jr	NZ,00118$
   41C8 FD 34 01      [23]  266 	inc	1 (iy)
   41CB                     267 00118$:
                            268 ;src/main.c:193: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   41CB 2A 6E 4A      [16]  269 	ld	hl, (_screen_plot_address)
   41CE 7C            [ 4]  270 	ld	a, h
   41CF E6 87         [ 7]  271 	and	a, #0x87
   41D1 67            [ 4]  272 	ld	h, a
   41D2 22 6E 4A      [16]  273 	ld	(_screen_plot_address), hl
                            274 ;src/main.c:198: scroll_hard(t,screen_plot_address);
   41D5 C5            [11]  275 	push	bc
   41D6 2A 6E 4A      [16]  276 	ld	hl, (_screen_plot_address)
   41D9 E5            [11]  277 	push	hl
   41DA C5            [11]  278 	push	bc
   41DB CD 48 03      [17]  279 	call	_scroll_hard
   41DE F1            [10]  280 	pop	af
   41DF F1            [10]  281 	pop	af
   41E0 C1            [10]  282 	pop	bc
                            283 ;src/main.c:200: t=t+1;
   41E1 03            [ 6]  284 	inc	bc
                            285 ;src/main.c:203: cpct_scanKeyboard_f();
   41E2 C5            [11]  286 	push	bc
   41E3 CD 7B 47      [17]  287 	call	_cpct_scanKeyboard_f
   41E6 CD 76 49      [17]  288 	call	_cpct_isAnyKeyPressed_f
   41E9 C1            [10]  289 	pop	bc
   41EA 7D            [ 4]  290 	ld	a, l
   41EB B7            [ 4]  291 	or	a, a
   41EC 28 9A         [12]  292 	jr	Z,00104$
                            293 ;src/main.c:205: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   41EE C5            [11]  294 	push	bc
   41EF 21 00 40      [10]  295 	ld	hl, #0x4000
   41F2 E5            [11]  296 	push	hl
   41F3 26 00         [ 7]  297 	ld	h, #0x00
   41F5 E5            [11]  298 	push	hl
   41F6 26 80         [ 7]  299 	ld	h, #0x80
   41F8 E5            [11]  300 	push	hl
   41F9 CD CF 48      [17]  301 	call	_cpct_memset_f64
   41FC C1            [10]  302 	pop	bc
   41FD 18 89         [12]  303 	jr	00104$
                            304 	.area _CODE
                            305 	.area _INITIALIZER
   4A79                     306 __xinit__intCounter:
   4A79 00                  307 	.db #0x00	; 0
   4A7A                     308 __xinit__hOffset:
   4A7A 00 00               309 	.dw #0x0000
   4A7C                     310 __xinit__slow:
   4A7C 00                  311 	.db #0x00	; 0
                            312 	.area _CABS (ABS)
