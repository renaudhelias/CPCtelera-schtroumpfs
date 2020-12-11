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
                             29 	.globl _cpct_setInterruptHandler
                             30 	.globl _cpct_disableFirmware
                             31 	.globl _g_items_0
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
   4ACF                      39 _myInterruptHandler_i_1_79:
   4ACF                      40 	.ds 1
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
                             45 ;--------------------------------------------------------
                             46 ; absolute external ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DABS (ABS)
                             49 ;--------------------------------------------------------
                             50 ; global & static initialisations
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _GSINIT
                             54 	.area _GSFINAL
                             55 	.area _GSINIT
                             56 ;--------------------------------------------------------
                             57 ; Home
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _HOME
                             61 ;--------------------------------------------------------
                             62 ; code
                             63 ;--------------------------------------------------------
                             64 	.area _CODE
                             65 ;src/main.c:41: void myInterruptHandler() {
                             66 ;	---------------------------------
                             67 ; Function myInterruptHandler
                             68 ; ---------------------------------
   4124                      69 _myInterruptHandler::
                             70 ;src/main.c:45: cpct_setBorder(i+1);
   4124 21 CF 4A      [10]   71 	ld	hl,#_myInterruptHandler_i_1_79 + 0
   4127 46            [ 7]   72 	ld	b, (hl)
   4128 04            [ 4]   73 	inc	b
   4129 C5            [11]   74 	push	bc
   412A 33            [ 6]   75 	inc	sp
   412B 3E 10         [ 7]   76 	ld	a, #0x10
   412D F5            [11]   77 	push	af
   412E 33            [ 6]   78 	inc	sp
   412F CD 3A 47      [17]   79 	call	_cpct_setPALColour
                             80 ;src/main.c:46: if (++i > 5) i=0;
   4132 FD 21 CF 4A   [14]   81 	ld	iy, #_myInterruptHandler_i_1_79
   4136 FD 34 00      [23]   82 	inc	0 (iy)
   4139 3E 05         [ 7]   83 	ld	a, #0x05
   413B FD 96 00      [19]   84 	sub	a, 0 (iy)
   413E D0            [11]   85 	ret	NC
   413F FD 36 00 00   [19]   86 	ld	0 (iy), #0x00
   4143 C9            [10]   87 	ret
   4144                      88 _g_items_0:
   4144 05                   89 	.db #0x05	; 5
   4145 0F                   90 	.db #0x0f	; 15
   4146 0F                   91 	.db #0x0f	; 15
   4147 00                   92 	.db #0x00	; 0
   4148 0F                   93 	.db #0x0f	; 15
   4149 0F                   94 	.db #0x0f	; 15
   414A 0F                   95 	.db #0x0f	; 15
   414B 0A                   96 	.db #0x0a	; 10
   414C 0F                   97 	.db #0x0f	; 15
   414D 0A                   98 	.db #0x0a	; 10
   414E 05                   99 	.db #0x05	; 5
   414F 00                  100 	.db #0x00	; 0
   4150 0F                  101 	.db #0x0f	; 15
   4151 0A                  102 	.db #0x0a	; 10
   4152 05                  103 	.db #0x05	; 5
   4153 00                  104 	.db #0x00	; 0
   4154 05                  105 	.db #0x05	; 5
   4155 0F                  106 	.db #0x0f	; 15
   4156 0A                  107 	.db #0x0a	; 10
   4157 0A                  108 	.db #0x0a	; 10
   4158 00                  109 	.db #0x00	; 0
   4159 0F                  110 	.db #0x0f	; 15
   415A 0F                  111 	.db #0x0f	; 15
   415B 0A                  112 	.db #0x0a	; 10
   415C 00                  113 	.db #0x00	; 0
   415D 0A                  114 	.db #0x0a	; 10
   415E 0A                  115 	.db #0x0a	; 10
   415F 0A                  116 	.db #0x0a	; 10
   4160 00                  117 	.db #0x00	; 0
   4161 00                  118 	.db #0x00	; 0
   4162 00                  119 	.db #0x00	; 0
   4163 00                  120 	.db #0x00	; 0
                            121 ;src/main.c:55: void main(void) {
                            122 ;	---------------------------------
                            123 ; Function main
                            124 ; ---------------------------------
   4164                     125 _main::
                            126 ;src/main.c:58: u8* sprite=g_items_0;
                            127 ;src/main.c:69: cpct_disableFirmware();
   4164 CD B8 49      [17]  128 	call	_cpct_disableFirmware
                            129 ;src/main.c:76: __endasm;
   4167 01 0C BC      [10]  130 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   416A ED 49         [12]  131 	out	(c),c ; le registre 12 du CRTC
   416C 01 10 BD      [10]  132 	ld	bc,#0xBD00+16
   416F ED 49         [12]  133 	out	(c),c
                            134 ;src/main.c:80: cpct_setVideoMode(0);
   4171 2E 00         [ 7]  135 	ld	l, #0x00
   4173 CD 6F 49      [17]  136 	call	_cpct_setVideoMode
                            137 ;src/main.c:81: cpct_setBorder(HW_BLACK);
   4176 21 10 14      [10]  138 	ld	hl, #0x1410
   4179 E5            [11]  139 	push	hl
   417A CD 3A 47      [17]  140 	call	_cpct_setPALColour
                            141 ;src/main.c:82: cpct_setPalette(g_tile_palette, 16);
   417D 21 10 00      [10]  142 	ld	hl, #0x0010
   4180 E5            [11]  143 	push	hl
   4181 21 9D 42      [10]  144 	ld	hl, #_g_tile_palette
   4184 E5            [11]  145 	push	hl
   4185 CD AD 46      [17]  146 	call	_cpct_setPalette
                            147 ;src/main.c:89: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   4188 21 0F 0F      [10]  148 	ld	hl, #0x0f0f
   418B E5            [11]  149 	push	hl
   418C 21 00 C0      [10]  150 	ld	hl, #0xc000
   418F E5            [11]  151 	push	hl
   4190 CD 81 4A      [17]  152 	call	_cpct_getScreenPtr
                            153 ;src/main.c:90: cpct_drawSprite(sprite, p, 4, 8);
   4193 01 44 41      [10]  154 	ld	bc, #_g_items_0
   4196 E5            [11]  155 	push	hl
   4197 C5            [11]  156 	push	bc
   4198 11 04 08      [10]  157 	ld	de, #0x0804
   419B D5            [11]  158 	push	de
   419C E5            [11]  159 	push	hl
   419D C5            [11]  160 	push	bc
   419E CD 6A 47      [17]  161 	call	_cpct_drawSprite
   41A1 C1            [10]  162 	pop	bc
   41A2 C5            [11]  163 	push	bc
   41A3 C5            [11]  164 	push	bc
   41A4 11 04 08      [10]  165 	ld	de, #0x0804
   41A7 D5            [11]  166 	push	de
   41A8 CD 2B 49      [17]  167 	call	_cpct_hflipSpriteM0
   41AB C1            [10]  168 	pop	bc
   41AC E1            [10]  169 	pop	hl
                            170 ;src/main.c:98: cpct_drawSprite(sprite, p, 4, 8);
   41AD 11 04 08      [10]  171 	ld	de, #0x0804
   41B0 D5            [11]  172 	push	de
   41B1 E5            [11]  173 	push	hl
   41B2 C5            [11]  174 	push	bc
   41B3 CD 6A 47      [17]  175 	call	_cpct_drawSprite
                            176 ;src/main.c:100: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   41B6 21 0F 1F      [10]  177 	ld	hl, #0x1f0f
   41B9 E5            [11]  178 	push	hl
   41BA 21 00 C0      [10]  179 	ld	hl, #0xc000
   41BD E5            [11]  180 	push	hl
   41BE CD 81 4A      [17]  181 	call	_cpct_getScreenPtr
                            182 ;src/main.c:101: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   41C1 E5            [11]  183 	push	hl
   41C2 21 02 03      [10]  184 	ld	hl, #0x0302
   41C5 E5            [11]  185 	push	hl
   41C6 CD 8D 49      [17]  186 	call	_cpct_px2byteM0
   41C9 55            [ 4]  187 	ld	d, l
   41CA C1            [10]  188 	pop	bc
   41CB 21 0A 14      [10]  189 	ld	hl, #0x140a
   41CE E5            [11]  190 	push	hl
   41CF D5            [11]  191 	push	de
   41D0 33            [ 6]  192 	inc	sp
   41D1 C5            [11]  193 	push	bc
   41D2 CD C8 49      [17]  194 	call	_cpct_drawSolidBox
   41D5 F1            [10]  195 	pop	af
                            196 ;src/main.c:104: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   41D6 33            [ 6]  197 	inc	sp
   41D7 21 14 58      [10]  198 	ld	hl,#0x5814
   41DA E3            [19]  199 	ex	(sp),hl
   41DB 21 00 C0      [10]  200 	ld	hl, #0xc000
   41DE E5            [11]  201 	push	hl
   41DF CD 81 4A      [17]  202 	call	_cpct_getScreenPtr
                            203 ;src/main.c:105: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   41E2 01 80 42      [10]  204 	ld	bc, #___str_0+0
   41E5 11 02 00      [10]  205 	ld	de, #0x0002
   41E8 D5            [11]  206 	push	de
   41E9 E5            [11]  207 	push	hl
   41EA C5            [11]  208 	push	bc
   41EB CD 46 47      [17]  209 	call	_cpct_drawStringM0
   41EE 21 06 00      [10]  210 	ld	hl, #6
   41F1 39            [11]  211 	add	hl, sp
   41F2 F9            [ 6]  212 	ld	sp, hl
                            213 ;src/main.c:108: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   41F3 21 09 4F      [10]  214 	ld	hl, #0x4f09
   41F6 E5            [11]  215 	push	hl
   41F7 21 00 C0      [10]  216 	ld	hl, #0xc000
   41FA E5            [11]  217 	push	hl
   41FB CD 81 4A      [17]  218 	call	_cpct_getScreenPtr
                            219 ;src/main.c:109: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   41FE 01 AD 42      [10]  220 	ld	bc, #_g_tile_schtroumpf+0
   4201 11 10 20      [10]  221 	ld	de, #0x2010
   4204 D5            [11]  222 	push	de
   4205 E5            [11]  223 	push	hl
   4206 C5            [11]  224 	push	bc
   4207 CD D9 48      [17]  225 	call	_cpct_drawSpriteMasked
                            226 ;src/main.c:111: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
   420A 21 0A 96      [10]  227 	ld	hl, #0x960a
   420D E5            [11]  228 	push	hl
   420E 21 00 C0      [10]  229 	ld	hl, #0xc000
   4211 E5            [11]  230 	push	hl
   4212 CD 81 4A      [17]  231 	call	_cpct_getScreenPtr
                            232 ;src/main.c:112: cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
   4215 01 90 42      [10]  233 	ld	bc, #___str_1+0
   4218 11 03 02      [10]  234 	ld	de, #0x0203
   421B D5            [11]  235 	push	de
   421C E5            [11]  236 	push	hl
   421D C5            [11]  237 	push	bc
   421E CD 46 47      [17]  238 	call	_cpct_drawStringM0
   4221 21 06 00      [10]  239 	ld	hl, #6
   4224 39            [11]  240 	add	hl, sp
   4225 F9            [ 6]  241 	ld	sp, hl
                            242 ;src/main.c:114: cpct_srand(77);
   4226 21 4D 00      [10]  243 	ld	hl,#0x004d
   4229 11 00 00      [10]  244 	ld	de,#0x0000
   422C CD A6 48      [17]  245 	call	_cpct_setSeed_mxor
   422F CD AE 48      [17]  246 	call	_cpct_restoreState_mxor_u8
                            247 ;src/main.c:121: cpct_scanKeyboard_f();
   4232 CD D0 46      [17]  248 	call	_cpct_scanKeyboard_f
                            249 ;src/main.c:122: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   4235                     250 00102$:
   4235 21 00 40      [10]  251 	ld	hl, #0x4000
   4238 CD C4 46      [17]  252 	call	_cpct_isKeyPressed
   423B 7D            [ 4]  253 	ld	a, l
   423C B7            [ 4]  254 	or	a, a
   423D 20 2F         [12]  255 	jr	NZ,00104$
   423F 21 02 04      [10]  256 	ld	hl, #0x0402
   4242 CD C4 46      [17]  257 	call	_cpct_isKeyPressed
   4245 7D            [ 4]  258 	ld	a, l
   4246 B7            [ 4]  259 	or	a, a
   4247 20 25         [12]  260 	jr	NZ,00104$
                            261 ;src/main.c:123: p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   4249 21 07 5E      [10]  262 	ld	hl, #0x5e07
   424C E5            [11]  263 	push	hl
   424D 21 00 C0      [10]  264 	ld	hl, #0xc000
   4250 E5            [11]  265 	push	hl
   4251 CD 81 4A      [17]  266 	call	_cpct_getScreenPtr
                            267 ;src/main.c:124: cpct_drawCharM0(p, 2,0, cpct_rand());
   4254 E5            [11]  268 	push	hl
   4255 CD B4 48      [17]  269 	call	_cpct_getRandom_mxor_u8
   4258 55            [ 4]  270 	ld	d, l
   4259 E1            [10]  271 	pop	hl
   425A 4D            [ 4]  272 	ld	c, l
   425B 44            [ 4]  273 	ld	b, h
   425C D5            [11]  274 	push	de
   425D 33            [ 6]  275 	inc	sp
   425E 21 02 00      [10]  276 	ld	hl, #0x0002
   4261 E5            [11]  277 	push	hl
   4262 C5            [11]  278 	push	bc
   4263 CD 0F 48      [17]  279 	call	_cpct_drawCharM0
   4266 F1            [10]  280 	pop	af
   4267 F1            [10]  281 	pop	af
   4268 33            [ 6]  282 	inc	sp
                            283 ;src/main.c:125: cpct_scanKeyboard_f();
   4269 CD D0 46      [17]  284 	call	_cpct_scanKeyboard_f
   426C 18 C7         [12]  285 	jr	00102$
   426E                     286 00104$:
                            287 ;src/main.c:133: __endasm;
   426E 01 0C BC      [10]  288 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   4271 ED 49         [12]  289 	out	(c),c ; le registre 12 du CRTC
   4273 01 30 BD      [10]  290 	ld	bc,#0xBD00+48
   4276 ED 49         [12]  291 	out	(c),c
                            292 ;src/main.c:135: cpct_setInterruptHandler(myInterruptHandler);
   4278 21 24 41      [10]  293 	ld	hl, #_myInterruptHandler
   427B CD A1 4A      [17]  294 	call	_cpct_setInterruptHandler
                            295 ;src/main.c:136: while (1) {}
   427E                     296 00106$:
   427E 18 FE         [12]  297 	jr	00106$
   4280                     298 ___str_0:
   4280 57 65 6C 63 6F 6D   299 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   428F 00                  300 	.db 0x00
   4290                     301 ___str_1:
   4290 50 72 65 73 73 20   302 	.ascii "Press ENTER."
        45 4E 54 45 52 2E
   429C 00                  303 	.db 0x00
                            304 	.area _CODE
                            305 	.area _INITIALIZER
                            306 	.area _CABS (ABS)
