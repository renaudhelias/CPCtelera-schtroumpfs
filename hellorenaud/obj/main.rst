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
                             13 	.globl _bank4_4000
                             14 	.globl _bank0123
                             15 	.globl _calque4000
                             16 	.globl _calqueC000
                             17 	.globl _cpct_restoreState_mxor_u8
                             18 	.globl _cpct_setSeed_mxor
                             19 	.globl _cpct_getScreenPtr
                             20 	.globl _cpct_setVideoMemoryOffset
                             21 	.globl _cpct_setPALColour
                             22 	.globl _cpct_setPalette
                             23 	.globl _cpct_setVideoMode
                             24 	.globl _cpct_hflipSpriteM0
                             25 	.globl _cpct_drawSolidBox
                             26 	.globl _cpct_drawSpriteMasked
                             27 	.globl _cpct_drawSprite
                             28 	.globl _cpct_px2byteM0
                             29 	.globl _cpct_isKeyPressed
                             30 	.globl _cpct_scanKeyboard_f
                             31 	.globl _cpct_memset_f64
                             32 	.globl _cpct_memset
                             33 	.globl _cpct_setInterruptHandler
                             34 	.globl _cpct_disableFirmware
                             35 	.globl _g_items_0
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   0D1A                      43 _myInterruptHandler_i_1_80:
   0D1A                      44 	.ds 1
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _INITIALIZED
                             49 ;--------------------------------------------------------
                             50 ; absolute external ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DABS (ABS)
                             53 ;--------------------------------------------------------
                             54 ; global & static initialisations
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _GSINIT
                             58 	.area _GSFINAL
                             59 	.area _GSINIT
                             60 ;--------------------------------------------------------
                             61 ; Home
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _HOME
                             65 ;--------------------------------------------------------
                             66 ; code
                             67 ;--------------------------------------------------------
                             68 	.area _CODE
                             69 ;src/main.c:41: void myInterruptHandler() {
                             70 ;	---------------------------------
                             71 ; Function myInterruptHandler
                             72 ; ---------------------------------
   025C                      73 _myInterruptHandler::
                             74 ;src/main.c:45: cpct_setBorder(i+1);
   025C 21 1A 0D      [10]   75 	ld	hl,#_myInterruptHandler_i_1_80 + 0
   025F 46            [ 7]   76 	ld	b, (hl)
   0260 04            [ 4]   77 	inc	b
   0261 C5            [11]   78 	push	bc
   0262 33            [ 6]   79 	inc	sp
   0263 3E 10         [ 7]   80 	ld	a, #0x10
   0265 F5            [11]   81 	push	af
   0266 33            [ 6]   82 	inc	sp
   0267 CD 34 09      [17]   83 	call	_cpct_setPALColour
                             84 ;src/main.c:46: if (++i > 5) i=0;
   026A FD 21 1A 0D   [14]   85 	ld	iy, #_myInterruptHandler_i_1_80
   026E FD 34 00      [23]   86 	inc	0 (iy)
   0271 3E 05         [ 7]   87 	ld	a, #0x05
   0273 FD 96 00      [19]   88 	sub	a, 0 (iy)
   0276 D0            [11]   89 	ret	NC
   0277 FD 36 00 00   [19]   90 	ld	0 (iy), #0x00
   027B C9            [10]   91 	ret
   027C                      92 _g_items_0:
   027C 05                   93 	.db #0x05	; 5
   027D 0F                   94 	.db #0x0f	; 15
   027E 0F                   95 	.db #0x0f	; 15
   027F 00                   96 	.db #0x00	; 0
   0280 0F                   97 	.db #0x0f	; 15
   0281 0F                   98 	.db #0x0f	; 15
   0282 0F                   99 	.db #0x0f	; 15
   0283 0A                  100 	.db #0x0a	; 10
   0284 0F                  101 	.db #0x0f	; 15
   0285 0A                  102 	.db #0x0a	; 10
   0286 05                  103 	.db #0x05	; 5
   0287 00                  104 	.db #0x00	; 0
   0288 0F                  105 	.db #0x0f	; 15
   0289 0A                  106 	.db #0x0a	; 10
   028A 05                  107 	.db #0x05	; 5
   028B 00                  108 	.db #0x00	; 0
   028C 05                  109 	.db #0x05	; 5
   028D 0F                  110 	.db #0x0f	; 15
   028E 0A                  111 	.db #0x0a	; 10
   028F 0A                  112 	.db #0x0a	; 10
   0290 00                  113 	.db #0x00	; 0
   0291 0F                  114 	.db #0x0f	; 15
   0292 0F                  115 	.db #0x0f	; 15
   0293 0A                  116 	.db #0x0a	; 10
   0294 00                  117 	.db #0x00	; 0
   0295 0A                  118 	.db #0x0a	; 10
   0296 0A                  119 	.db #0x0a	; 10
   0297 0A                  120 	.db #0x0a	; 10
   0298 00                  121 	.db #0x00	; 0
   0299 00                  122 	.db #0x00	; 0
   029A 00                  123 	.db #0x00	; 0
   029B 00                  124 	.db #0x00	; 0
                            125 ;src/main.c:55: void main(void) {
                            126 ;	---------------------------------
                            127 ; Function main
                            128 ; ---------------------------------
   029C                     129 _main::
                            130 ;src/main.c:57: u8* sprite=g_items_0;
                            131 ;src/main.c:66: cpct_disableFirmware();
   029C CD 51 0B      [17]  132 	call	_cpct_disableFirmware
                            133 ;src/main.c:70: bank4_4000();
   029F CD 2D 04      [17]  134 	call	_bank4_4000
                            135 ;src/main.c:71: bank0123();
   02A2 CD 21 04      [17]  136 	call	_bank0123
                            137 ;src/main.c:72: calqueC000();
   02A5 CD 00 04      [17]  138 	call	_calqueC000
                            139 ;src/main.c:75: cpct_setVideoMode(0);
   02A8 2E 00         [ 7]  140 	ld	l, #0x00
   02AA CD 0A 0B      [17]  141 	call	_cpct_setVideoMode
                            142 ;src/main.c:78: cpct_setBorder(HW_BLACK);
   02AD 21 10 14      [10]  143 	ld	hl, #0x1410
   02B0 E5            [11]  144 	push	hl
   02B1 CD 34 09      [17]  145 	call	_cpct_setPALColour
                            146 ;src/main.c:79: cpct_setPalette(g_tile_palette, 16);
   02B4 21 10 00      [10]  147 	ld	hl, #0x0010
   02B7 E5            [11]  148 	push	hl
   02B8 21 97 04      [10]  149 	ld	hl, #_g_tile_palette
   02BB E5            [11]  150 	push	hl
   02BC CD A7 08      [17]  151 	call	_cpct_setPalette
                            152 ;src/main.c:80: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   02BF 21 00 40      [10]  153 	ld	hl, #0x4000
   02C2 E5            [11]  154 	push	hl
   02C3 AF            [ 4]  155 	xor	a, a
   02C4 F5            [11]  156 	push	af
   02C5 33            [ 6]  157 	inc	sp
   02C6 26 C0         [ 7]  158 	ld	h, #0xc0
   02C8 E5            [11]  159 	push	hl
   02C9 CD 34 0B      [17]  160 	call	_cpct_memset
                            161 ;src/main.c:83: cpct_setVideoMemoryOffset(3);
   02CC 2E 03         [ 7]  162 	ld	l, #0x03
   02CE CD 40 09      [17]  163 	call	_cpct_setVideoMemoryOffset
                            164 ;src/main.c:86: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   02D1 21 0F 0F      [10]  165 	ld	hl, #0x0f0f
   02D4 E5            [11]  166 	push	hl
   02D5 21 00 C0      [10]  167 	ld	hl, #0xc000
   02D8 E5            [11]  168 	push	hl
   02D9 CD 33 0C      [17]  169 	call	_cpct_getScreenPtr
                            170 ;src/main.c:87: cpct_drawSprite(sprite, p, 4, 8);
   02DC E5            [11]  171 	push	hl
   02DD 01 04 08      [10]  172 	ld	bc, #0x0804
   02E0 C5            [11]  173 	push	bc
   02E1 E5            [11]  174 	push	hl
   02E2 01 7C 02      [10]  175 	ld	bc, #_g_items_0
   02E5 C5            [11]  176 	push	bc
   02E6 CD 49 09      [17]  177 	call	_cpct_drawSprite
   02E9 01 00 20      [10]  178 	ld	bc, #0x2000
   02EC C5            [11]  179 	push	bc
   02ED 01 FF FF      [10]  180 	ld	bc, #0xffff
   02F0 C5            [11]  181 	push	bc
   02F1 01 00 C0      [10]  182 	ld	bc, #0xc000
   02F4 C5            [11]  183 	push	bc
   02F5 CD 5A 0A      [17]  184 	call	_cpct_memset_f64
   02F8 01 7C 02      [10]  185 	ld	bc, #_g_items_0
   02FB C5            [11]  186 	push	bc
   02FC 01 04 08      [10]  187 	ld	bc, #0x0804
   02FF C5            [11]  188 	push	bc
   0300 CD C6 0A      [17]  189 	call	_cpct_hflipSpriteM0
   0303 E1            [10]  190 	pop	hl
                            191 ;src/main.c:95: cpct_drawSprite(sprite, p, 4, 8);
   0304 01 04 08      [10]  192 	ld	bc, #0x0804
   0307 C5            [11]  193 	push	bc
   0308 E5            [11]  194 	push	hl
   0309 21 7C 02      [10]  195 	ld	hl, #_g_items_0
   030C E5            [11]  196 	push	hl
   030D CD 49 09      [17]  197 	call	_cpct_drawSprite
                            198 ;src/main.c:97: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   0310 21 0F 1F      [10]  199 	ld	hl, #0x1f0f
   0313 E5            [11]  200 	push	hl
   0314 21 00 C0      [10]  201 	ld	hl, #0xc000
   0317 E5            [11]  202 	push	hl
   0318 CD 33 0C      [17]  203 	call	_cpct_getScreenPtr
                            204 ;src/main.c:99: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   031B E5            [11]  205 	push	hl
   031C 21 02 03      [10]  206 	ld	hl, #0x0302
   031F E5            [11]  207 	push	hl
   0320 CD 18 0B      [17]  208 	call	_cpct_px2byteM0
   0323 55            [ 4]  209 	ld	d, l
   0324 C1            [10]  210 	pop	bc
   0325 21 0A 14      [10]  211 	ld	hl, #0x140a
   0328 E5            [11]  212 	push	hl
   0329 D5            [11]  213 	push	de
   032A 33            [ 6]  214 	inc	sp
   032B C5            [11]  215 	push	bc
   032C CD 61 0B      [17]  216 	call	_cpct_drawSolidBox
   032F F1            [10]  217 	pop	af
                            218 ;src/main.c:102: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   0330 33            [ 6]  219 	inc	sp
   0331 21 09 4F      [10]  220 	ld	hl,#0x4f09
   0334 E3            [19]  221 	ex	(sp),hl
   0335 21 00 C0      [10]  222 	ld	hl, #0xc000
   0338 E5            [11]  223 	push	hl
   0339 CD 33 0C      [17]  224 	call	_cpct_getScreenPtr
                            225 ;src/main.c:103: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   033C 01 A7 04      [10]  226 	ld	bc, #_g_tile_schtroumpf+0
   033F 11 10 20      [10]  227 	ld	de, #0x2010
   0342 D5            [11]  228 	push	de
   0343 E5            [11]  229 	push	hl
   0344 C5            [11]  230 	push	bc
   0345 CD 2B 0A      [17]  231 	call	_cpct_drawSpriteMasked
                            232 ;src/main.c:112: cpct_srand(77);
   0348 21 4D 00      [10]  233 	ld	hl,#0x004d
   034B 11 00 00      [10]  234 	ld	de,#0x0000
   034E CD F8 09      [17]  235 	call	_cpct_setSeed_mxor
   0351 CD 00 0A      [17]  236 	call	_cpct_restoreState_mxor_u8
                            237 ;src/main.c:119: cpct_scanKeyboard_f();
   0354 CD CA 08      [17]  238 	call	_cpct_scanKeyboard_f
                            239 ;src/main.c:120: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   0357                     240 00102$:
   0357 21 00 40      [10]  241 	ld	hl, #0x4000
   035A CD BE 08      [17]  242 	call	_cpct_isKeyPressed
   035D 7D            [ 4]  243 	ld	a, l
   035E B7            [ 4]  244 	or	a, a
   035F 20 0F         [12]  245 	jr	NZ,00104$
   0361 21 02 04      [10]  246 	ld	hl, #0x0402
   0364 CD BE 08      [17]  247 	call	_cpct_isKeyPressed
   0367 7D            [ 4]  248 	ld	a, l
   0368 B7            [ 4]  249 	or	a, a
   0369 20 05         [12]  250 	jr	NZ,00104$
                            251 ;src/main.c:121: cpct_scanKeyboard_f();
   036B CD CA 08      [17]  252 	call	_cpct_scanKeyboard_f
   036E 18 E7         [12]  253 	jr	00102$
   0370                     254 00104$:
                            255 ;src/main.c:125: cpct_setVideoMemoryOffset(0);
   0370 2E 00         [ 7]  256 	ld	l, #0x00
   0372 CD 40 09      [17]  257 	call	_cpct_setVideoMemoryOffset
                            258 ;src/main.c:126: calque4000();
   0375 CD 0B 04      [17]  259 	call	_calque4000
                            260 ;src/main.c:128: cpct_setInterruptHandler(myInterruptHandler);
   0378 21 5C 02      [10]  261 	ld	hl, #_myInterruptHandler
   037B CD 53 0C      [17]  262 	call	_cpct_setInterruptHandler
                            263 ;src/main.c:129: while (1) {}
   037E                     264 00106$:
   037E 18 FE         [12]  265 	jr	00106$
                            266 	.area _CODE
                            267 	.area _INITIALIZER
                            268 	.area _CABS (ABS)
