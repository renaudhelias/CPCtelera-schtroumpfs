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
                             13 	.globl _cpct_restoreState_mxor_u8
                             14 	.globl _cpct_setSeed_mxor
                             15 	.globl _cpct_getRandom_mxor_u8
                             16 	.globl _cpct_getScreenPtr
                             17 	.globl _cpct_setPALColour
                             18 	.globl _cpct_setPalette
                             19 	.globl _cpct_setVideoMode
                             20 	.globl _cpct_drawStringM0
                             21 	.globl _cpct_drawCharM0
                             22 	.globl _cpct_hflipSpriteM0
                             23 	.globl _cpct_drawSolidBox
                             24 	.globl _cpct_drawSpriteMasked
                             25 	.globl _cpct_drawSprite
                             26 	.globl _cpct_px2byteM0
                             27 	.globl _cpct_isKeyPressed
                             28 	.globl _cpct_scanKeyboard_f
                             29 	.globl _cpct_memset_f64
                             30 	.globl _cpct_setInterruptHandler
                             31 	.globl _cpct_disableFirmware
                             32 	.globl _g_items_0
                             33 ;--------------------------------------------------------
                             34 ; special function registers
                             35 ;--------------------------------------------------------
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DATA
   49E2                      40 _myInterruptHandler_i_1_78:
   49E2                      41 	.ds 1
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _INITIALIZED
                             46 ;--------------------------------------------------------
                             47 ; absolute external ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DABS (ABS)
                             50 ;--------------------------------------------------------
                             51 ; global & static initialisations
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _GSINIT
                             55 	.area _GSFINAL
                             56 	.area _GSINIT
                             57 ;--------------------------------------------------------
                             58 ; Home
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _HOME
                             62 ;--------------------------------------------------------
                             63 ; code
                             64 ;--------------------------------------------------------
                             65 	.area _CODE
                             66 ;src/main.c:35: void myInterruptHandler() {
                             67 ;	---------------------------------
                             68 ; Function myInterruptHandler
                             69 ; ---------------------------------
   4000                      70 _myInterruptHandler::
                             71 ;src/main.c:37: cpct_setBorder(i+1);
   4000 21 E2 49      [10]   72 	ld	hl,#_myInterruptHandler_i_1_78 + 0
   4003 46            [ 7]   73 	ld	b, (hl)
   4004 04            [ 4]   74 	inc	b
   4005 C5            [11]   75 	push	bc
   4006 33            [ 6]   76 	inc	sp
   4007 3E 10         [ 7]   77 	ld	a, #0x10
   4009 F5            [11]   78 	push	af
   400A 33            [ 6]   79 	inc	sp
   400B CD 16 46      [17]   80 	call	_cpct_setPALColour
                             81 ;src/main.c:38: if (++i > 5) i=0;
   400E FD 21 E2 49   [14]   82 	ld	iy, #_myInterruptHandler_i_1_78
   4012 FD 34 00      [23]   83 	inc	0 (iy)
   4015 3E 05         [ 7]   84 	ld	a, #0x05
   4017 FD 96 00      [19]   85 	sub	a, 0 (iy)
   401A D0            [11]   86 	ret	NC
   401B FD 36 00 00   [19]   87 	ld	0 (iy), #0x00
   401F C9            [10]   88 	ret
   4020                      89 _g_items_0:
   4020 05                   90 	.db #0x05	; 5
   4021 0F                   91 	.db #0x0f	; 15
   4022 0F                   92 	.db #0x0f	; 15
   4023 00                   93 	.db #0x00	; 0
   4024 0F                   94 	.db #0x0f	; 15
   4025 0F                   95 	.db #0x0f	; 15
   4026 0F                   96 	.db #0x0f	; 15
   4027 0A                   97 	.db #0x0a	; 10
   4028 0F                   98 	.db #0x0f	; 15
   4029 0A                   99 	.db #0x0a	; 10
   402A 05                  100 	.db #0x05	; 5
   402B 00                  101 	.db #0x00	; 0
   402C 0F                  102 	.db #0x0f	; 15
   402D 0A                  103 	.db #0x0a	; 10
   402E 05                  104 	.db #0x05	; 5
   402F 00                  105 	.db #0x00	; 0
   4030 05                  106 	.db #0x05	; 5
   4031 0F                  107 	.db #0x0f	; 15
   4032 0A                  108 	.db #0x0a	; 10
   4033 0A                  109 	.db #0x0a	; 10
   4034 00                  110 	.db #0x00	; 0
   4035 0F                  111 	.db #0x0f	; 15
   4036 0F                  112 	.db #0x0f	; 15
   4037 0A                  113 	.db #0x0a	; 10
   4038 00                  114 	.db #0x00	; 0
   4039 0A                  115 	.db #0x0a	; 10
   403A 0A                  116 	.db #0x0a	; 10
   403B 0A                  117 	.db #0x0a	; 10
   403C 00                  118 	.db #0x00	; 0
   403D 00                  119 	.db #0x00	; 0
   403E 00                  120 	.db #0x00	; 0
   403F 00                  121 	.db #0x00	; 0
                            122 ;src/main.c:41: void main(void) {
                            123 ;	---------------------------------
                            124 ; Function main
                            125 ; ---------------------------------
   4040                     126 _main::
                            127 ;src/main.c:44: u8* sprite=g_items_0;
                            128 ;src/main.c:48: cpct_disableFirmware();
   4040 CD CD 48      [17]  129 	call	_cpct_disableFirmware
                            130 ;src/main.c:51: cpct_clearScreen_f64(0);
   4043 21 00 40      [10]  131 	ld	hl, #0x4000
   4046 E5            [11]  132 	push	hl
   4047 26 00         [ 7]  133 	ld	h, #0x00
   4049 E5            [11]  134 	push	hl
   404A 26 C0         [ 7]  135 	ld	h, #0xc0
   404C E5            [11]  136 	push	hl
   404D CD E4 47      [17]  137 	call	_cpct_memset_f64
                            138 ;src/main.c:52: cpct_setVideoMode(0);
   4050 2E 00         [ 7]  139 	ld	l, #0x00
   4052 CD 93 48      [17]  140 	call	_cpct_setVideoMode
                            141 ;src/main.c:53: cpct_setBorder(HW_BLACK);
   4055 21 10 14      [10]  142 	ld	hl, #0x1410
   4058 E5            [11]  143 	push	hl
   4059 CD 16 46      [17]  144 	call	_cpct_setPALColour
                            145 ;src/main.c:54: cpct_setPalette(g_tile_palette, 6);
   405C 21 06 00      [10]  146 	ld	hl, #0x0006
   405F E5            [11]  147 	push	hl
   4060 21 83 41      [10]  148 	ld	hl, #_g_tile_palette
   4063 E5            [11]  149 	push	hl
   4064 CD 89 45      [17]  150 	call	_cpct_setPalette
                            151 ;src/main.c:60: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   4067 21 0F 0F      [10]  152 	ld	hl, #0x0f0f
   406A E5            [11]  153 	push	hl
   406B 21 00 C0      [10]  154 	ld	hl, #0xc000
   406E E5            [11]  155 	push	hl
   406F CD 96 49      [17]  156 	call	_cpct_getScreenPtr
                            157 ;src/main.c:61: cpct_drawSprite(sprite, p, 4, 8);
   4072 E5            [11]  158 	push	hl
   4073 01 04 08      [10]  159 	ld	bc, #0x0804
   4076 C5            [11]  160 	push	bc
   4077 E5            [11]  161 	push	hl
   4078 01 20 40      [10]  162 	ld	bc, #_g_items_0
   407B C5            [11]  163 	push	bc
   407C CD 46 46      [17]  164 	call	_cpct_drawSprite
   407F 01 00 40      [10]  165 	ld	bc, #0x4000
   4082 C5            [11]  166 	push	bc
   4083 01 FF FF      [10]  167 	ld	bc, #0xffff
   4086 C5            [11]  168 	push	bc
   4087 01 00 C0      [10]  169 	ld	bc, #0xc000
   408A C5            [11]  170 	push	bc
   408B CD E4 47      [17]  171 	call	_cpct_memset_f64
   408E 01 20 40      [10]  172 	ld	bc, #_g_items_0
   4091 C5            [11]  173 	push	bc
   4092 01 04 08      [10]  174 	ld	bc, #0x0804
   4095 C5            [11]  175 	push	bc
   4096 CD 4F 48      [17]  176 	call	_cpct_hflipSpriteM0
   4099 E1            [10]  177 	pop	hl
                            178 ;src/main.c:68: cpct_drawSprite(sprite, p, 4, 8);
   409A 01 04 08      [10]  179 	ld	bc, #0x0804
   409D C5            [11]  180 	push	bc
   409E E5            [11]  181 	push	hl
   409F 21 20 40      [10]  182 	ld	hl, #_g_items_0
   40A2 E5            [11]  183 	push	hl
   40A3 CD 46 46      [17]  184 	call	_cpct_drawSprite
                            185 ;src/main.c:70: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   40A6 21 0F 1F      [10]  186 	ld	hl, #0x1f0f
   40A9 E5            [11]  187 	push	hl
   40AA 21 00 C0      [10]  188 	ld	hl, #0xc000
   40AD E5            [11]  189 	push	hl
   40AE CD 96 49      [17]  190 	call	_cpct_getScreenPtr
                            191 ;src/main.c:71: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   40B1 E5            [11]  192 	push	hl
   40B2 21 02 03      [10]  193 	ld	hl, #0x0302
   40B5 E5            [11]  194 	push	hl
   40B6 CD B1 48      [17]  195 	call	_cpct_px2byteM0
   40B9 55            [ 4]  196 	ld	d, l
   40BA C1            [10]  197 	pop	bc
   40BB 21 0A 14      [10]  198 	ld	hl, #0x140a
   40BE E5            [11]  199 	push	hl
   40BF D5            [11]  200 	push	de
   40C0 33            [ 6]  201 	inc	sp
   40C1 C5            [11]  202 	push	bc
   40C2 CD DD 48      [17]  203 	call	_cpct_drawSolidBox
   40C5 F1            [10]  204 	pop	af
                            205 ;src/main.c:74: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   40C6 33            [ 6]  206 	inc	sp
   40C7 21 14 58      [10]  207 	ld	hl,#0x5814
   40CA E3            [19]  208 	ex	(sp),hl
   40CB 21 00 C0      [10]  209 	ld	hl, #0xc000
   40CE E5            [11]  210 	push	hl
   40CF CD 96 49      [17]  211 	call	_cpct_getScreenPtr
                            212 ;src/main.c:75: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   40D2 01 66 41      [10]  213 	ld	bc, #___str_0+0
   40D5 11 02 00      [10]  214 	ld	de, #0x0002
   40D8 D5            [11]  215 	push	de
   40D9 E5            [11]  216 	push	hl
   40DA C5            [11]  217 	push	bc
   40DB CD 22 46      [17]  218 	call	_cpct_drawStringM0
   40DE 21 06 00      [10]  219 	ld	hl, #6
   40E1 39            [11]  220 	add	hl, sp
   40E2 F9            [ 6]  221 	ld	sp, hl
                            222 ;src/main.c:78: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   40E3 21 09 4F      [10]  223 	ld	hl, #0x4f09
   40E6 E5            [11]  224 	push	hl
   40E7 21 00 C0      [10]  225 	ld	hl, #0xc000
   40EA E5            [11]  226 	push	hl
   40EB CD 96 49      [17]  227 	call	_cpct_getScreenPtr
                            228 ;src/main.c:79: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   40EE 01 89 41      [10]  229 	ld	bc, #_g_tile_schtroumpf+0
   40F1 11 10 20      [10]  230 	ld	de, #0x2010
   40F4 D5            [11]  231 	push	de
   40F5 E5            [11]  232 	push	hl
   40F6 C5            [11]  233 	push	bc
   40F7 CD B5 47      [17]  234 	call	_cpct_drawSpriteMasked
                            235 ;src/main.c:81: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
   40FA 21 0A 96      [10]  236 	ld	hl, #0x960a
   40FD E5            [11]  237 	push	hl
   40FE 21 00 C0      [10]  238 	ld	hl, #0xc000
   4101 E5            [11]  239 	push	hl
   4102 CD 96 49      [17]  240 	call	_cpct_getScreenPtr
                            241 ;src/main.c:82: cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
   4105 01 76 41      [10]  242 	ld	bc, #___str_1+0
   4108 11 03 02      [10]  243 	ld	de, #0x0203
   410B D5            [11]  244 	push	de
   410C E5            [11]  245 	push	hl
   410D C5            [11]  246 	push	bc
   410E CD 22 46      [17]  247 	call	_cpct_drawStringM0
   4111 21 06 00      [10]  248 	ld	hl, #6
   4114 39            [11]  249 	add	hl, sp
   4115 F9            [ 6]  250 	ld	sp, hl
                            251 ;src/main.c:84: cpct_srand(77);
   4116 21 4D 00      [10]  252 	ld	hl,#0x004d
   4119 11 00 00      [10]  253 	ld	de,#0x0000
   411C CD 82 47      [17]  254 	call	_cpct_setSeed_mxor
   411F CD 8A 47      [17]  255 	call	_cpct_restoreState_mxor_u8
                            256 ;src/main.c:86: cpct_scanKeyboard_f();
   4122 CD AC 45      [17]  257 	call	_cpct_scanKeyboard_f
                            258 ;src/main.c:87: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   4125                     259 00102$:
   4125 21 00 40      [10]  260 	ld	hl, #0x4000
   4128 CD A0 45      [17]  261 	call	_cpct_isKeyPressed
   412B 7D            [ 4]  262 	ld	a, l
   412C B7            [ 4]  263 	or	a, a
   412D 20 2F         [12]  264 	jr	NZ,00104$
   412F 21 02 04      [10]  265 	ld	hl, #0x0402
   4132 CD A0 45      [17]  266 	call	_cpct_isKeyPressed
   4135 7D            [ 4]  267 	ld	a, l
   4136 B7            [ 4]  268 	or	a, a
   4137 20 25         [12]  269 	jr	NZ,00104$
                            270 ;src/main.c:88: p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   4139 21 07 5E      [10]  271 	ld	hl, #0x5e07
   413C E5            [11]  272 	push	hl
   413D 21 00 C0      [10]  273 	ld	hl, #0xc000
   4140 E5            [11]  274 	push	hl
   4141 CD 96 49      [17]  275 	call	_cpct_getScreenPtr
                            276 ;src/main.c:89: cpct_drawCharM0(p, 2,0, cpct_rand());
   4144 E5            [11]  277 	push	hl
   4145 CD 90 47      [17]  278 	call	_cpct_getRandom_mxor_u8
   4148 55            [ 4]  279 	ld	d, l
   4149 E1            [10]  280 	pop	hl
   414A 4D            [ 4]  281 	ld	c, l
   414B 44            [ 4]  282 	ld	b, h
   414C D5            [11]  283 	push	de
   414D 33            [ 6]  284 	inc	sp
   414E 21 02 00      [10]  285 	ld	hl, #0x0002
   4151 E5            [11]  286 	push	hl
   4152 C5            [11]  287 	push	bc
   4153 CD EB 46      [17]  288 	call	_cpct_drawCharM0
   4156 F1            [10]  289 	pop	af
   4157 F1            [10]  290 	pop	af
   4158 33            [ 6]  291 	inc	sp
                            292 ;src/main.c:90: cpct_scanKeyboard_f();
   4159 CD AC 45      [17]  293 	call	_cpct_scanKeyboard_f
   415C 18 C7         [12]  294 	jr	00102$
   415E                     295 00104$:
                            296 ;src/main.c:92: cpct_setInterruptHandler(myInterruptHandler);
   415E 21 00 40      [10]  297 	ld	hl, #_myInterruptHandler
   4161 CD B6 49      [17]  298 	call	_cpct_setInterruptHandler
                            299 ;src/main.c:93: while (1) {}
   4164                     300 00106$:
   4164 18 FE         [12]  301 	jr	00106$
   4166                     302 ___str_0:
   4166 57 65 6C 63 6F 6D   303 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   4175 00                  304 	.db 0x00
   4176                     305 ___str_1:
   4176 50 72 65 73 73 20   306 	.ascii "Press ENTER."
        45 4E 54 45 52 2E
   4182 00                  307 	.db 0x00
                            308 	.area _CODE
                            309 	.area _INITIALIZER
                            310 	.area _CABS (ABS)
