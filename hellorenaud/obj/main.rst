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
                             26 	.globl _cpct_setStackLocation
                             27 	.globl _cpct_memcpy
                             28 	.globl _cpct_memset_f64
                             29 	.globl _cpct_disableFirmware
                             30 	.globl _slow
                             31 	.globl _hOffset
                             32 	.globl _intCounter
                             33 	.globl _screen_plot_address
                             34 	.globl _screen_location
                             35 	.globl _g_items_0
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   49EA                      43 _screen_location::
   49EA                      44 	.ds 2
   49EC                      45 _screen_plot_address::
   49EC                      46 	.ds 2
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _INITIALIZED
   49EE                      51 _intCounter::
   49EE                      52 	.ds 1
   49EF                      53 _hOffset::
   49EF                      54 	.ds 2
   49F1                      55 _slow::
   49F1                      56 	.ds 1
                             57 ;--------------------------------------------------------
                             58 ; absolute external ram data
                             59 ;--------------------------------------------------------
                             60 	.area _DABS (ABS)
                             61 ;--------------------------------------------------------
                             62 ; global & static initialisations
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _GSINIT
                             66 	.area _GSFINAL
                             67 	.area _GSINIT
                             68 ;--------------------------------------------------------
                             69 ; Home
                             70 ;--------------------------------------------------------
                             71 	.area _HOME
                             72 	.area _HOME
                             73 ;--------------------------------------------------------
                             74 ; code
                             75 ;--------------------------------------------------------
                             76 	.area _CODE
                             77 ;src/main.c:45: void crtc(u8* R12R13) {
                             78 ;	---------------------------------
                             79 ; Function crtc
                             80 ; ---------------------------------
   404C                      81 _crtc::
                             82 ;src/main.c:62: __endasm;
   404C DD E5         [15]   83 	push	ix
   404E DD 21 00 00   [14]   84 	ld	ix,#0
   4052 DD 39         [15]   85 	add	ix,sp
   4054 DD 66 05      [19]   86 	ld	h, 5 (ix)
   4057 DD 6E 04      [19]   87 	ld	l, 4 (ix)
   405A 01 0C BC      [10]   88 	ld	bc,#0xbc00+12
   405D ED 49         [12]   89 	out	(c),c
   405F 04            [ 4]   90 	inc	b
   4060 ED 61         [12]   91 	out	(c),h
   4062 05            [ 4]   92 	dec	b
   4063 0C            [ 4]   93 	inc	c
   4064 ED 49         [12]   94 	out	(c),c
   4066 04            [ 4]   95 	inc	b
   4067 ED 69         [12]   96 	out	(c),l
   4069 DD E1         [14]   97 	pop	ix
   406B C9            [10]   98 	ret
   406C                      99 _g_items_0:
   406C 05                  100 	.db #0x05	; 5
   406D 0F                  101 	.db #0x0f	; 15
   406E 0F                  102 	.db #0x0f	; 15
   406F 00                  103 	.db #0x00	; 0
   4070 0F                  104 	.db #0x0f	; 15
   4071 0F                  105 	.db #0x0f	; 15
   4072 0F                  106 	.db #0x0f	; 15
   4073 0A                  107 	.db #0x0a	; 10
   4074 0F                  108 	.db #0x0f	; 15
   4075 0A                  109 	.db #0x0a	; 10
   4076 05                  110 	.db #0x05	; 5
   4077 00                  111 	.db #0x00	; 0
   4078 0F                  112 	.db #0x0f	; 15
   4079 0A                  113 	.db #0x0a	; 10
   407A 05                  114 	.db #0x05	; 5
   407B 00                  115 	.db #0x00	; 0
   407C 05                  116 	.db #0x05	; 5
   407D 0F                  117 	.db #0x0f	; 15
   407E 0A                  118 	.db #0x0a	; 10
   407F 0A                  119 	.db #0x0a	; 10
   4080 00                  120 	.db #0x00	; 0
   4081 0F                  121 	.db #0x0f	; 15
   4082 0F                  122 	.db #0x0f	; 15
   4083 0A                  123 	.db #0x0a	; 10
   4084 00                  124 	.db #0x00	; 0
   4085 0A                  125 	.db #0x0a	; 10
   4086 0A                  126 	.db #0x0a	; 10
   4087 0A                  127 	.db #0x0a	; 10
   4088 00                  128 	.db #0x00	; 0
   4089 00                  129 	.db #0x00	; 0
   408A 00                  130 	.db #0x00	; 0
   408B 00                  131 	.db #0x00	; 0
                            132 ;src/main.c:141: void main(void) {
                            133 ;	---------------------------------
                            134 ; Function main
                            135 ; ---------------------------------
   408C                     136 _main::
                            137 ;src/main.c:145: u8* sprite=g_items_0;
                            138 ;src/main.c:153: bank7_C000();
   408C CD BE 42      [17]  139 	call	_bank7_C000
                            140 ;src/main.c:154: akp_musicInit();
   408F CD E9 3F      [17]  141 	call	_akp_musicInit
                            142 ;src/main.c:155: bank0123();
   4092 CD B8 42      [17]  143 	call	_bank0123
                            144 ;src/main.c:158: cpct_disableFirmware();
   4095 CD 17 49      [17]  145 	call	_cpct_disableFirmware
                            146 ;src/main.c:159: cpct_memcpy(0x6000,0x8000,0x2000);
   4098 21 00 20      [10]  147 	ld	hl, #0x2000
   409B E5            [11]  148 	push	hl
   409C 26 80         [ 7]  149 	ld	h, #0x80
   409E E5            [11]  150 	push	hl
   409F 26 60         [ 7]  151 	ld	h, #0x60
   40A1 E5            [11]  152 	push	hl
   40A2 CD 0F 49      [17]  153 	call	_cpct_memcpy
                            154 ;src/main.c:160: cpct_setStackLocation(0x6000);
   40A5 21 00 60      [10]  155 	ld	hl, #0x6000
   40A8 CD B0 48      [17]  156 	call	_cpct_setStackLocation
                            157 ;src/main.c:161: cpct_memset_f64(0x8000, 0x0000, 0x4000);
   40AB 21 00 40      [10]  158 	ld	hl, #0x4000
   40AE E5            [11]  159 	push	hl
   40AF 26 00         [ 7]  160 	ld	h, #0x00
   40B1 E5            [11]  161 	push	hl
   40B2 26 80         [ 7]  162 	ld	h, #0x80
   40B4 E5            [11]  163 	push	hl
   40B5 CD 68 48      [17]  164 	call	_cpct_memset_f64
                            165 ;src/main.c:164: bank0123();
   40B8 CD B8 42      [17]  166 	call	_bank0123
                            167 ;src/main.c:165: cpct_setVideoMode(0);
   40BB 2E 00         [ 7]  168 	ld	l, #0x00
   40BD CD 01 49      [17]  169 	call	_cpct_setVideoMode
                            170 ;src/main.c:166: cpct_setBorder(HW_BLACK);
   40C0 21 10 14      [10]  171 	ld	hl, #0x1410
   40C3 E5            [11]  172 	push	hl
   40C4 CD 88 47      [17]  173 	call	_cpct_setPALColour
                            174 ;src/main.c:167: cpct_setPalette(g_tile_palette, 6);
   40C7 21 06 00      [10]  175 	ld	hl, #0x0006
   40CA E5            [11]  176 	push	hl
   40CB 21 6B 43      [10]  177 	ld	hl, #_g_tile_palette
   40CE E5            [11]  178 	push	hl
   40CF CD 71 47      [17]  179 	call	_cpct_setPalette
                            180 ;src/main.c:170: p = cpct_getScreenPtr(CPCT_VMEM_START, 9,110);
   40D2 21 09 6E      [10]  181 	ld	hl, #0x6e09
   40D5 E5            [11]  182 	push	hl
   40D6 21 00 C0      [10]  183 	ld	hl, #0xc000
   40D9 E5            [11]  184 	push	hl
   40DA CD 41 49      [17]  185 	call	_cpct_getScreenPtr
                            186 ;src/main.c:171: cpct_hflipSpriteM0(4, 8, sprite);
   40DD 01 6C 40      [10]  187 	ld	bc, #_g_items_0
   40E0 E5            [11]  188 	push	hl
   40E1 C5            [11]  189 	push	bc
   40E2 C5            [11]  190 	push	bc
   40E3 11 04 08      [10]  191 	ld	de, #0x0804
   40E6 D5            [11]  192 	push	de
   40E7 CD B5 48      [17]  193 	call	_cpct_hflipSpriteM0
   40EA C1            [10]  194 	pop	bc
   40EB E1            [10]  195 	pop	hl
                            196 ;src/main.c:172: cpct_drawSprite(sprite, p, 4, 8);
   40EC 11 04 08      [10]  197 	ld	de, #0x0804
   40EF D5            [11]  198 	push	de
   40F0 E5            [11]  199 	push	hl
   40F1 C5            [11]  200 	push	bc
   40F2 CD 94 47      [17]  201 	call	_cpct_drawSprite
                            202 ;src/main.c:175: p = cpct_getScreenPtr(CPCT_VMEM_START, 10,96);
   40F5 21 0A 60      [10]  203 	ld	hl, #0x600a
   40F8 E5            [11]  204 	push	hl
   40F9 21 00 C0      [10]  205 	ld	hl, #0xc000
   40FC E5            [11]  206 	push	hl
   40FD CD 41 49      [17]  207 	call	_cpct_getScreenPtr
                            208 ;src/main.c:176: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4100 01 71 43      [10]  209 	ld	bc, #_g_tile_schtroumpf+0
   4103 11 10 20      [10]  210 	ld	de, #0x2010
   4106 D5            [11]  211 	push	de
   4107 E5            [11]  212 	push	hl
   4108 C5            [11]  213 	push	bc
   4109 CD 39 48      [17]  214 	call	_cpct_drawSpriteMasked
                            215 ;src/main.c:178: calque8000();
   410C CD 97 42      [17]  216 	call	_calque8000
                            217 ;src/main.c:179: screen_location=(u8 *)(0x2000);
   410F 21 00 20      [10]  218 	ld	hl, #0x2000
   4112 22 EA 49      [16]  219 	ld	(_screen_location), hl
                            220 ;src/main.c:180: screen_plot_address=(u8 *)(0x8000+80-2);
   4115 21 4E 80      [10]  221 	ld	hl, #0x804e
   4118 22 EC 49      [16]  222 	ld	(_screen_plot_address), hl
                            223 ;src/main.c:181: t=0;
   411B 01 00 00      [10]  224 	ld	bc, #0x0000
                            225 ;src/main.c:182: while (1) {
   411E                     226 00104$:
                            227 ;src/main.c:183: cpct_waitVSYNC();
   411E C5            [11]  228 	push	bc
   411F CD F9 48      [17]  229 	call	_cpct_waitVSYNC
   4122 C1            [10]  230 	pop	bc
                            231 ;src/main.c:186: screen_location++;
   4123 FD 21 EA 49   [14]  232 	ld	iy, #_screen_location
   4127 FD 34 00      [23]  233 	inc	0 (iy)
   412A 20 03         [12]  234 	jr	NZ,00116$
   412C FD 34 01      [23]  235 	inc	1 (iy)
   412F                     236 00116$:
                            237 ;src/main.c:187: screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
   412F 2A EA 49      [16]  238 	ld	hl, (_screen_location)
   4132 7C            [ 4]  239 	ld	a, h
   4133 E6 23         [ 7]  240 	and	a, #0x23
   4135 67            [ 4]  241 	ld	h, a
   4136 22 EA 49      [16]  242 	ld	(_screen_location), hl
                            243 ;src/main.c:188: crtc(screen_location);
   4139 C5            [11]  244 	push	bc
   413A 2A EA 49      [16]  245 	ld	hl, (_screen_location)
   413D E5            [11]  246 	push	hl
   413E CD 4C 40      [17]  247 	call	_crtc
   4141 F1            [10]  248 	pop	af
   4142 C1            [10]  249 	pop	bc
                            250 ;src/main.c:190: screen_plot_address++;
   4143 FD 21 EC 49   [14]  251 	ld	iy, #_screen_plot_address
   4147 FD 34 00      [23]  252 	inc	0 (iy)
   414A 20 03         [12]  253 	jr	NZ,00117$
   414C FD 34 01      [23]  254 	inc	1 (iy)
   414F                     255 00117$:
                            256 ;src/main.c:191: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   414F 2A EC 49      [16]  257 	ld	hl, (_screen_plot_address)
   4152 7C            [ 4]  258 	ld	a, h
   4153 E6 87         [ 7]  259 	and	a, #0x87
   4155 67            [ 4]  260 	ld	h, a
   4156 22 EC 49      [16]  261 	ld	(_screen_plot_address), hl
                            262 ;src/main.c:192: screen_plot_address++;
   4159 FD 34 00      [23]  263 	inc	0 (iy)
   415C 20 03         [12]  264 	jr	NZ,00118$
   415E FD 34 01      [23]  265 	inc	1 (iy)
   4161                     266 00118$:
                            267 ;src/main.c:193: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
   4161 2A EC 49      [16]  268 	ld	hl, (_screen_plot_address)
   4164 7C            [ 4]  269 	ld	a, h
   4165 E6 87         [ 7]  270 	and	a, #0x87
   4167 67            [ 4]  271 	ld	h, a
   4168 22 EC 49      [16]  272 	ld	(_screen_plot_address), hl
                            273 ;src/main.c:198: scroll_hard("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR          ", 120, t,screen_plot_address);
   416B C5            [11]  274 	push	bc
   416C 2A EC 49      [16]  275 	ld	hl, (_screen_plot_address)
   416F E5            [11]  276 	push	hl
   4170 C5            [11]  277 	push	bc
   4171 21 78 00      [10]  278 	ld	hl, #0x0078
   4174 E5            [11]  279 	push	hl
   4175 21 93 41      [10]  280 	ld	hl, #___str_0
   4178 E5            [11]  281 	push	hl
   4179 CD 48 03      [17]  282 	call	_scroll_hard
   417C 21 08 00      [10]  283 	ld	hl, #8
   417F 39            [11]  284 	add	hl, sp
   4180 F9            [ 6]  285 	ld	sp, hl
   4181 C1            [10]  286 	pop	bc
                            287 ;src/main.c:199: t=t+1;
   4182 03            [ 6]  288 	inc	bc
                            289 ;src/main.c:200: if (t>=120*8) {t=0;}
   4183 79            [ 4]  290 	ld	a, c
   4184 D6 C0         [ 7]  291 	sub	a, #0xc0
   4186 78            [ 4]  292 	ld	a, b
   4187 17            [ 4]  293 	rla
   4188 3F            [ 4]  294 	ccf
   4189 1F            [ 4]  295 	rra
   418A DE 83         [ 7]  296 	sbc	a, #0x83
   418C 38 90         [12]  297 	jr	C,00104$
   418E 01 00 00      [10]  298 	ld	bc, #0x0000
   4191 18 8B         [12]  299 	jr	00104$
   4193                     300 ___str_0:
   4193 57 45 20 57 49 53   301 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   41CF 57 45 20 57 49 53   302 	.ascii "WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR          "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        41 4E 44 20 41 20
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 20 20 20
        20 20 20 20 20 20
   420B 00                  303 	.db 0x00
                            304 	.area _CODE
                            305 	.area _INITIALIZER
   49F7                     306 __xinit__intCounter:
   49F7 00                  307 	.db #0x00	; 0
   49F8                     308 __xinit__hOffset:
   49F8 00 00               309 	.dw #0x0000
   49FA                     310 __xinit__slow:
   49FA 00                  311 	.db #0x00	; 0
                            312 	.area _CABS (ABS)
