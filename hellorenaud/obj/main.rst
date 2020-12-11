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
                             13 	.globl _calque4000
                             14 	.globl _calqueC000
                             15 	.globl _cpct_restoreState_mxor_u8
                             16 	.globl _cpct_setSeed_mxor
                             17 	.globl _cpct_getRandom_mxor_u8
                             18 	.globl _cpct_getScreenPtr
                             19 	.globl _cpct_setPALColour
                             20 	.globl _cpct_setPalette
                             21 	.globl _cpct_setVideoMode
                             22 	.globl _cpct_drawStringM0
                             23 	.globl _cpct_drawCharM0
                             24 	.globl _cpct_hflipSpriteM0
                             25 	.globl _cpct_drawSolidBox
                             26 	.globl _cpct_drawSpriteMasked
                             27 	.globl _cpct_drawSprite
                             28 	.globl _cpct_px2byteM0
                             29 	.globl _cpct_isKeyPressed
                             30 	.globl _cpct_scanKeyboard_f
                             31 	.globl _cpct_setStackLocation
                             32 	.globl _cpct_setInterruptHandler
                             33 	.globl _cpct_disableFirmware
                             34 	.globl _g_items_0
                             35 ;--------------------------------------------------------
                             36 ; special function registers
                             37 ;--------------------------------------------------------
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DATA
   4C85                      42 _myInterruptHandler_i_1_80:
   4C85                      43 	.ds 1
                             44 ;--------------------------------------------------------
                             45 ; ram data
                             46 ;--------------------------------------------------------
                             47 	.area _INITIALIZED
                             48 ;--------------------------------------------------------
                             49 ; absolute external ram data
                             50 ;--------------------------------------------------------
                             51 	.area _DABS (ABS)
                             52 ;--------------------------------------------------------
                             53 ; global & static initialisations
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _GSINIT
                             57 	.area _GSFINAL
                             58 	.area _GSINIT
                             59 ;--------------------------------------------------------
                             60 ; Home
                             61 ;--------------------------------------------------------
                             62 	.area _HOME
                             63 	.area _HOME
                             64 ;--------------------------------------------------------
                             65 ; code
                             66 ;--------------------------------------------------------
                             67 	.area _CODE
                             68 ;src/main.c:41: void myInterruptHandler() {
                             69 ;	---------------------------------
                             70 ; Function myInterruptHandler
                             71 ; ---------------------------------
   4124                      72 _myInterruptHandler::
                             73 ;src/main.c:45: cpct_setBorder(i+1);
   4124 21 85 4C      [10]   74 	ld	hl,#_myInterruptHandler_i_1_80 + 0
   4127 46            [ 7]   75 	ld	b, (hl)
   4128 04            [ 4]   76 	inc	b
   4129 C5            [11]   77 	push	bc
   412A 33            [ 6]   78 	inc	sp
   412B 3E 10         [ 7]   79 	ld	a, #0x10
   412D F5            [11]   80 	push	af
   412E 33            [ 6]   81 	inc	sp
   412F CD 49 48      [17]   82 	call	_cpct_setPALColour
                             83 ;src/main.c:46: if (++i > 5) i=0;
   4132 FD 21 85 4C   [14]   84 	ld	iy, #_myInterruptHandler_i_1_80
   4136 FD 34 00      [23]   85 	inc	0 (iy)
   4139 3E 05         [ 7]   86 	ld	a, #0x05
   413B FD 96 00      [19]   87 	sub	a, 0 (iy)
   413E D0            [11]   88 	ret	NC
   413F FD 36 00 00   [19]   89 	ld	0 (iy), #0x00
   4143 C9            [10]   90 	ret
   4144                      91 _g_items_0:
   4144 05                   92 	.db #0x05	; 5
   4145 0F                   93 	.db #0x0f	; 15
   4146 0F                   94 	.db #0x0f	; 15
   4147 00                   95 	.db #0x00	; 0
   4148 0F                   96 	.db #0x0f	; 15
   4149 0F                   97 	.db #0x0f	; 15
   414A 0F                   98 	.db #0x0f	; 15
   414B 0A                   99 	.db #0x0a	; 10
   414C 0F                  100 	.db #0x0f	; 15
   414D 0A                  101 	.db #0x0a	; 10
   414E 05                  102 	.db #0x05	; 5
   414F 00                  103 	.db #0x00	; 0
   4150 0F                  104 	.db #0x0f	; 15
   4151 0A                  105 	.db #0x0a	; 10
   4152 05                  106 	.db #0x05	; 5
   4153 00                  107 	.db #0x00	; 0
   4154 05                  108 	.db #0x05	; 5
   4155 0F                  109 	.db #0x0f	; 15
   4156 0A                  110 	.db #0x0a	; 10
   4157 0A                  111 	.db #0x0a	; 10
   4158 00                  112 	.db #0x00	; 0
   4159 0F                  113 	.db #0x0f	; 15
   415A 0F                  114 	.db #0x0f	; 15
   415B 0A                  115 	.db #0x0a	; 10
   415C 00                  116 	.db #0x00	; 0
   415D 0A                  117 	.db #0x0a	; 10
   415E 0A                  118 	.db #0x0a	; 10
   415F 0A                  119 	.db #0x0a	; 10
   4160 00                  120 	.db #0x00	; 0
   4161 00                  121 	.db #0x00	; 0
   4162 00                  122 	.db #0x00	; 0
   4163 00                  123 	.db #0x00	; 0
                            124 ;src/main.c:55: void main(void) {
                            125 ;	---------------------------------
                            126 ; Function main
                            127 ; ---------------------------------
   4164                     128 _main::
                            129 ;src/main.c:58: u8* sprite=g_items_0;
                            130 ;src/main.c:69: cpct_disableFirmware();
   4164 CD CC 4A      [17]  131 	call	_cpct_disableFirmware
                            132 ;src/main.c:70: cpct_setStackLocation(0x8000);
   4167 21 00 80      [10]  133 	ld	hl, #0x8000
   416A CD 17 4A      [17]  134 	call	_cpct_setStackLocation
                            135 ;src/main.c:76: calque4000();
   416D CD 20 43      [17]  136 	call	_calque4000
                            137 ;src/main.c:80: cpct_setVideoMode(0);
   4170 2E 00         [ 7]  138 	ld	l, #0x00
   4172 CD 83 4A      [17]  139 	call	_cpct_setVideoMode
                            140 ;src/main.c:82: cpct_setBorder(HW_BLACK);
   4175 21 10 14      [10]  141 	ld	hl, #0x1410
   4178 E5            [11]  142 	push	hl
   4179 CD 49 48      [17]  143 	call	_cpct_setPALColour
                            144 ;src/main.c:83: cpct_setPalette(g_tile_palette, 16);
   417C 21 10 00      [10]  145 	ld	hl, #0x0010
   417F E5            [11]  146 	push	hl
   4180 21 AC 43      [10]  147 	ld	hl, #_g_tile_palette
   4183 E5            [11]  148 	push	hl
   4184 CD BC 47      [17]  149 	call	_cpct_setPalette
                            150 ;src/main.c:90: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   4187 21 0F 0F      [10]  151 	ld	hl, #0x0f0f
   418A E5            [11]  152 	push	hl
   418B 21 00 C0      [10]  153 	ld	hl, #0xc000
   418E E5            [11]  154 	push	hl
   418F CD AE 4B      [17]  155 	call	_cpct_getScreenPtr
                            156 ;src/main.c:91: cpct_drawSprite(sprite, p, 4, 8);
   4192 01 44 41      [10]  157 	ld	bc, #_g_items_0
   4195 E5            [11]  158 	push	hl
   4196 C5            [11]  159 	push	bc
   4197 11 04 08      [10]  160 	ld	de, #0x0804
   419A D5            [11]  161 	push	de
   419B E5            [11]  162 	push	hl
   419C C5            [11]  163 	push	bc
   419D CD 79 48      [17]  164 	call	_cpct_drawSprite
   41A0 C1            [10]  165 	pop	bc
   41A1 C5            [11]  166 	push	bc
   41A2 C5            [11]  167 	push	bc
   41A3 11 04 08      [10]  168 	ld	de, #0x0804
   41A6 D5            [11]  169 	push	de
   41A7 CD 3F 4A      [17]  170 	call	_cpct_hflipSpriteM0
   41AA C1            [10]  171 	pop	bc
   41AB E1            [10]  172 	pop	hl
                            173 ;src/main.c:99: cpct_drawSprite(sprite, p, 4, 8);
   41AC 11 04 08      [10]  174 	ld	de, #0x0804
   41AF D5            [11]  175 	push	de
   41B0 E5            [11]  176 	push	hl
   41B1 C5            [11]  177 	push	bc
   41B2 CD 79 48      [17]  178 	call	_cpct_drawSprite
                            179 ;src/main.c:101: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   41B5 21 0F 1F      [10]  180 	ld	hl, #0x1f0f
   41B8 E5            [11]  181 	push	hl
   41B9 21 00 C0      [10]  182 	ld	hl, #0xc000
   41BC E5            [11]  183 	push	hl
   41BD CD AE 4B      [17]  184 	call	_cpct_getScreenPtr
                            185 ;src/main.c:102: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   41C0 E5            [11]  186 	push	hl
   41C1 21 02 03      [10]  187 	ld	hl, #0x0302
   41C4 E5            [11]  188 	push	hl
   41C5 CD A1 4A      [17]  189 	call	_cpct_px2byteM0
   41C8 55            [ 4]  190 	ld	d, l
   41C9 C1            [10]  191 	pop	bc
   41CA 21 0A 14      [10]  192 	ld	hl, #0x140a
   41CD E5            [11]  193 	push	hl
   41CE D5            [11]  194 	push	de
   41CF 33            [ 6]  195 	inc	sp
   41D0 C5            [11]  196 	push	bc
   41D1 CD DC 4A      [17]  197 	call	_cpct_drawSolidBox
   41D4 F1            [10]  198 	pop	af
                            199 ;src/main.c:105: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   41D5 33            [ 6]  200 	inc	sp
   41D6 21 14 58      [10]  201 	ld	hl,#0x5814
   41D9 E3            [19]  202 	ex	(sp),hl
   41DA 21 00 C0      [10]  203 	ld	hl, #0xc000
   41DD E5            [11]  204 	push	hl
   41DE CD AE 4B      [17]  205 	call	_cpct_getScreenPtr
                            206 ;src/main.c:106: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   41E1 01 78 42      [10]  207 	ld	bc, #___str_0+0
   41E4 11 02 00      [10]  208 	ld	de, #0x0002
   41E7 D5            [11]  209 	push	de
   41E8 E5            [11]  210 	push	hl
   41E9 C5            [11]  211 	push	bc
   41EA CD 55 48      [17]  212 	call	_cpct_drawStringM0
   41ED 21 06 00      [10]  213 	ld	hl, #6
   41F0 39            [11]  214 	add	hl, sp
   41F1 F9            [ 6]  215 	ld	sp, hl
                            216 ;src/main.c:109: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   41F2 21 09 4F      [10]  217 	ld	hl, #0x4f09
   41F5 E5            [11]  218 	push	hl
   41F6 21 00 C0      [10]  219 	ld	hl, #0xc000
   41F9 E5            [11]  220 	push	hl
   41FA CD AE 4B      [17]  221 	call	_cpct_getScreenPtr
                            222 ;src/main.c:110: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   41FD 01 BC 43      [10]  223 	ld	bc, #_g_tile_schtroumpf+0
   4200 11 10 20      [10]  224 	ld	de, #0x2010
   4203 D5            [11]  225 	push	de
   4204 E5            [11]  226 	push	hl
   4205 C5            [11]  227 	push	bc
   4206 CD E8 49      [17]  228 	call	_cpct_drawSpriteMasked
                            229 ;src/main.c:112: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
   4209 21 0A 96      [10]  230 	ld	hl, #0x960a
   420C E5            [11]  231 	push	hl
   420D 21 00 C0      [10]  232 	ld	hl, #0xc000
   4210 E5            [11]  233 	push	hl
   4211 CD AE 4B      [17]  234 	call	_cpct_getScreenPtr
                            235 ;src/main.c:113: cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
   4214 01 88 42      [10]  236 	ld	bc, #___str_1+0
   4217 11 03 02      [10]  237 	ld	de, #0x0203
   421A D5            [11]  238 	push	de
   421B E5            [11]  239 	push	hl
   421C C5            [11]  240 	push	bc
   421D CD 55 48      [17]  241 	call	_cpct_drawStringM0
   4220 21 06 00      [10]  242 	ld	hl, #6
   4223 39            [11]  243 	add	hl, sp
   4224 F9            [ 6]  244 	ld	sp, hl
                            245 ;src/main.c:115: cpct_srand(77);
   4225 21 4D 00      [10]  246 	ld	hl,#0x004d
   4228 11 00 00      [10]  247 	ld	de,#0x0000
   422B CD B5 49      [17]  248 	call	_cpct_setSeed_mxor
   422E CD BD 49      [17]  249 	call	_cpct_restoreState_mxor_u8
                            250 ;src/main.c:122: cpct_scanKeyboard_f();
   4231 CD DF 47      [17]  251 	call	_cpct_scanKeyboard_f
                            252 ;src/main.c:123: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   4234                     253 00102$:
   4234 21 00 40      [10]  254 	ld	hl, #0x4000
   4237 CD D3 47      [17]  255 	call	_cpct_isKeyPressed
   423A 7D            [ 4]  256 	ld	a, l
   423B B7            [ 4]  257 	or	a, a
   423C 20 2F         [12]  258 	jr	NZ,00104$
   423E 21 02 04      [10]  259 	ld	hl, #0x0402
   4241 CD D3 47      [17]  260 	call	_cpct_isKeyPressed
   4244 7D            [ 4]  261 	ld	a, l
   4245 B7            [ 4]  262 	or	a, a
   4246 20 25         [12]  263 	jr	NZ,00104$
                            264 ;src/main.c:124: p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   4248 21 07 5E      [10]  265 	ld	hl, #0x5e07
   424B E5            [11]  266 	push	hl
   424C 21 00 C0      [10]  267 	ld	hl, #0xc000
   424F E5            [11]  268 	push	hl
   4250 CD AE 4B      [17]  269 	call	_cpct_getScreenPtr
                            270 ;src/main.c:125: cpct_drawCharM0(p, 2,0, cpct_rand());
   4253 E5            [11]  271 	push	hl
   4254 CD C3 49      [17]  272 	call	_cpct_getRandom_mxor_u8
   4257 55            [ 4]  273 	ld	d, l
   4258 E1            [10]  274 	pop	hl
   4259 4D            [ 4]  275 	ld	c, l
   425A 44            [ 4]  276 	ld	b, h
   425B D5            [11]  277 	push	de
   425C 33            [ 6]  278 	inc	sp
   425D 21 02 00      [10]  279 	ld	hl, #0x0002
   4260 E5            [11]  280 	push	hl
   4261 C5            [11]  281 	push	bc
   4262 CD 1E 49      [17]  282 	call	_cpct_drawCharM0
   4265 F1            [10]  283 	pop	af
   4266 F1            [10]  284 	pop	af
   4267 33            [ 6]  285 	inc	sp
                            286 ;src/main.c:126: cpct_scanKeyboard_f();
   4268 CD DF 47      [17]  287 	call	_cpct_scanKeyboard_f
   426B 18 C7         [12]  288 	jr	00102$
   426D                     289 00104$:
                            290 ;src/main.c:128: calqueC000();
   426D CD 15 43      [17]  291 	call	_calqueC000
                            292 ;src/main.c:129: cpct_setInterruptHandler(myInterruptHandler);
   4270 21 24 41      [10]  293 	ld	hl, #_myInterruptHandler
   4273 CD CE 4B      [17]  294 	call	_cpct_setInterruptHandler
                            295 ;src/main.c:130: while (1) {}
   4276                     296 00106$:
   4276 18 FE         [12]  297 	jr	00106$
   4278                     298 ___str_0:
   4278 57 65 6C 63 6F 6D   299 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   4287 00                  300 	.db 0x00
   4288                     301 ___str_1:
   4288 50 72 65 73 73 20   302 	.ascii "Press ENTER."
        45 4E 54 45 52 2E
   4294 00                  303 	.db 0x00
                            304 	.area _CODE
                            305 	.area _INITIALIZER
                            306 	.area _CABS (ABS)
