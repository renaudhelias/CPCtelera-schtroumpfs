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
                             17 	.globl _akp_musicPlay
                             18 	.globl _akp_musicInit
                             19 	.globl _cpct_restoreState_mxor_u8
                             20 	.globl _cpct_setSeed_mxor
                             21 	.globl _cpct_getScreenPtr
                             22 	.globl _cpct_setVideoMemoryOffset
                             23 	.globl _cpct_setPALColour
                             24 	.globl _cpct_setPalette
                             25 	.globl _cpct_setVideoMode
                             26 	.globl _cpct_hflipSpriteM0
                             27 	.globl _cpct_drawSolidBox
                             28 	.globl _cpct_drawSpriteMasked
                             29 	.globl _cpct_drawSprite
                             30 	.globl _cpct_px2byteM0
                             31 	.globl _cpct_isKeyPressed
                             32 	.globl _cpct_scanKeyboard_f
                             33 	.globl _cpct_memset_f64
                             34 	.globl _cpct_memset
                             35 	.globl _cpct_setInterruptHandler
                             36 	.globl _cpct_disableFirmware
                             37 	.globl _g_items_0
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   0D27                      45 _myInterruptHandler_i_1_80:
   0D27                      46 	.ds 1
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _INITIALIZED
                             51 ;--------------------------------------------------------
                             52 ; absolute external ram data
                             53 ;--------------------------------------------------------
                             54 	.area _DABS (ABS)
                             55 ;--------------------------------------------------------
                             56 ; global & static initialisations
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _GSINIT
                             60 	.area _GSFINAL
                             61 	.area _GSINIT
                             62 ;--------------------------------------------------------
                             63 ; Home
                             64 ;--------------------------------------------------------
                             65 	.area _HOME
                             66 	.area _HOME
                             67 ;--------------------------------------------------------
                             68 ; code
                             69 ;--------------------------------------------------------
                             70 	.area _CODE
                             71 ;src/main.c:41: void myInterruptHandler() {
                             72 ;	---------------------------------
                             73 ; Function myInterruptHandler
                             74 ; ---------------------------------
   025C                      75 _myInterruptHandler::
                             76 ;src/main.c:45: cpct_setBorder(i+1);
   025C 21 27 0D      [10]   77 	ld	hl,#_myInterruptHandler_i_1_80 + 0
   025F 46            [ 7]   78 	ld	b, (hl)
   0260 04            [ 4]   79 	inc	b
   0261 C5            [11]   80 	push	bc
   0262 33            [ 6]   81 	inc	sp
   0263 3E 10         [ 7]   82 	ld	a, #0x10
   0265 F5            [11]   83 	push	af
   0266 33            [ 6]   84 	inc	sp
   0267 CD 41 09      [17]   85 	call	_cpct_setPALColour
                             86 ;src/main.c:46: if (++i > 5) i=0;
   026A FD 21 27 0D   [14]   87 	ld	iy, #_myInterruptHandler_i_1_80
   026E FD 34 00      [23]   88 	inc	0 (iy)
   0271 3E 05         [ 7]   89 	ld	a, #0x05
   0273 FD 96 00      [19]   90 	sub	a, 0 (iy)
   0276 30 04         [12]   91 	jr	NC,00102$
   0278 FD 36 00 00   [19]   92 	ld	0 (iy), #0x00
   027C                      93 00102$:
                             94 ;src/main.c:49: if (i==2) {
   027C 3A 27 0D      [13]   95 	ld	a,(#_myInterruptHandler_i_1_80 + 0)
   027F D6 02         [ 7]   96 	sub	a, #0x02
   0281 C0            [11]   97 	ret	NZ
                             98 ;src/main.c:50: akp_musicPlay();
   0282 CD 3C 02      [17]   99 	call	_akp_musicPlay
   0285 C9            [10]  100 	ret
   0286                     101 _g_items_0:
   0286 05                  102 	.db #0x05	; 5
   0287 0F                  103 	.db #0x0f	; 15
   0288 0F                  104 	.db #0x0f	; 15
   0289 00                  105 	.db #0x00	; 0
   028A 0F                  106 	.db #0x0f	; 15
   028B 0F                  107 	.db #0x0f	; 15
   028C 0F                  108 	.db #0x0f	; 15
   028D 0A                  109 	.db #0x0a	; 10
   028E 0F                  110 	.db #0x0f	; 15
   028F 0A                  111 	.db #0x0a	; 10
   0290 05                  112 	.db #0x05	; 5
   0291 00                  113 	.db #0x00	; 0
   0292 0F                  114 	.db #0x0f	; 15
   0293 0A                  115 	.db #0x0a	; 10
   0294 05                  116 	.db #0x05	; 5
   0295 00                  117 	.db #0x00	; 0
   0296 05                  118 	.db #0x05	; 5
   0297 0F                  119 	.db #0x0f	; 15
   0298 0A                  120 	.db #0x0a	; 10
   0299 0A                  121 	.db #0x0a	; 10
   029A 00                  122 	.db #0x00	; 0
   029B 0F                  123 	.db #0x0f	; 15
   029C 0F                  124 	.db #0x0f	; 15
   029D 0A                  125 	.db #0x0a	; 10
   029E 00                  126 	.db #0x00	; 0
   029F 0A                  127 	.db #0x0a	; 10
   02A0 0A                  128 	.db #0x0a	; 10
   02A1 0A                  129 	.db #0x0a	; 10
   02A2 00                  130 	.db #0x00	; 0
   02A3 00                  131 	.db #0x00	; 0
   02A4 00                  132 	.db #0x00	; 0
   02A5 00                  133 	.db #0x00	; 0
                            134 ;src/main.c:55: void main(void) {
                            135 ;	---------------------------------
                            136 ; Function main
                            137 ; ---------------------------------
   02A6                     138 _main::
                            139 ;src/main.c:57: u8* sprite=g_items_0;
                            140 ;src/main.c:66: cpct_disableFirmware();
   02A6 CD 5E 0B      [17]  141 	call	_cpct_disableFirmware
                            142 ;src/main.c:70: bank4_4000();
   02A9 CD 3A 04      [17]  143 	call	_bank4_4000
                            144 ;src/main.c:71: bank0123();
   02AC CD 2E 04      [17]  145 	call	_bank0123
                            146 ;src/main.c:72: calqueC000();
   02AF CD 0D 04      [17]  147 	call	_calqueC000
                            148 ;src/main.c:75: cpct_setVideoMode(0);
   02B2 2E 00         [ 7]  149 	ld	l, #0x00
   02B4 CD 17 0B      [17]  150 	call	_cpct_setVideoMode
                            151 ;src/main.c:78: cpct_setBorder(HW_BLACK);
   02B7 21 10 14      [10]  152 	ld	hl, #0x1410
   02BA E5            [11]  153 	push	hl
   02BB CD 41 09      [17]  154 	call	_cpct_setPALColour
                            155 ;src/main.c:79: cpct_setPalette(g_tile_palette, 16);
   02BE 21 10 00      [10]  156 	ld	hl, #0x0010
   02C1 E5            [11]  157 	push	hl
   02C2 21 A4 04      [10]  158 	ld	hl, #_g_tile_palette
   02C5 E5            [11]  159 	push	hl
   02C6 CD B4 08      [17]  160 	call	_cpct_setPalette
                            161 ;src/main.c:80: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   02C9 21 00 40      [10]  162 	ld	hl, #0x4000
   02CC E5            [11]  163 	push	hl
   02CD AF            [ 4]  164 	xor	a, a
   02CE F5            [11]  165 	push	af
   02CF 33            [ 6]  166 	inc	sp
   02D0 26 C0         [ 7]  167 	ld	h, #0xc0
   02D2 E5            [11]  168 	push	hl
   02D3 CD 41 0B      [17]  169 	call	_cpct_memset
                            170 ;src/main.c:83: cpct_setVideoMemoryOffset(3);
   02D6 2E 03         [ 7]  171 	ld	l, #0x03
   02D8 CD 4D 09      [17]  172 	call	_cpct_setVideoMemoryOffset
                            173 ;src/main.c:86: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   02DB 21 0F 0F      [10]  174 	ld	hl, #0x0f0f
   02DE E5            [11]  175 	push	hl
   02DF 21 00 C0      [10]  176 	ld	hl, #0xc000
   02E2 E5            [11]  177 	push	hl
   02E3 CD 40 0C      [17]  178 	call	_cpct_getScreenPtr
                            179 ;src/main.c:87: cpct_drawSprite(sprite, p, 4, 8);
   02E6 E5            [11]  180 	push	hl
   02E7 01 04 08      [10]  181 	ld	bc, #0x0804
   02EA C5            [11]  182 	push	bc
   02EB E5            [11]  183 	push	hl
   02EC 01 86 02      [10]  184 	ld	bc, #_g_items_0
   02EF C5            [11]  185 	push	bc
   02F0 CD 56 09      [17]  186 	call	_cpct_drawSprite
   02F3 01 00 20      [10]  187 	ld	bc, #0x2000
   02F6 C5            [11]  188 	push	bc
   02F7 01 FF FF      [10]  189 	ld	bc, #0xffff
   02FA C5            [11]  190 	push	bc
   02FB 01 00 C0      [10]  191 	ld	bc, #0xc000
   02FE C5            [11]  192 	push	bc
   02FF CD 67 0A      [17]  193 	call	_cpct_memset_f64
   0302 01 86 02      [10]  194 	ld	bc, #_g_items_0
   0305 C5            [11]  195 	push	bc
   0306 01 04 08      [10]  196 	ld	bc, #0x0804
   0309 C5            [11]  197 	push	bc
   030A CD D3 0A      [17]  198 	call	_cpct_hflipSpriteM0
   030D E1            [10]  199 	pop	hl
                            200 ;src/main.c:95: cpct_drawSprite(sprite, p, 4, 8);
   030E 01 04 08      [10]  201 	ld	bc, #0x0804
   0311 C5            [11]  202 	push	bc
   0312 E5            [11]  203 	push	hl
   0313 21 86 02      [10]  204 	ld	hl, #_g_items_0
   0316 E5            [11]  205 	push	hl
   0317 CD 56 09      [17]  206 	call	_cpct_drawSprite
                            207 ;src/main.c:97: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   031A 21 0F 1F      [10]  208 	ld	hl, #0x1f0f
   031D E5            [11]  209 	push	hl
   031E 21 00 C0      [10]  210 	ld	hl, #0xc000
   0321 E5            [11]  211 	push	hl
   0322 CD 40 0C      [17]  212 	call	_cpct_getScreenPtr
                            213 ;src/main.c:99: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0325 E5            [11]  214 	push	hl
   0326 21 02 03      [10]  215 	ld	hl, #0x0302
   0329 E5            [11]  216 	push	hl
   032A CD 25 0B      [17]  217 	call	_cpct_px2byteM0
   032D 55            [ 4]  218 	ld	d, l
   032E C1            [10]  219 	pop	bc
   032F 21 0A 14      [10]  220 	ld	hl, #0x140a
   0332 E5            [11]  221 	push	hl
   0333 D5            [11]  222 	push	de
   0334 33            [ 6]  223 	inc	sp
   0335 C5            [11]  224 	push	bc
   0336 CD 6E 0B      [17]  225 	call	_cpct_drawSolidBox
   0339 F1            [10]  226 	pop	af
                            227 ;src/main.c:102: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   033A 33            [ 6]  228 	inc	sp
   033B 21 09 4F      [10]  229 	ld	hl,#0x4f09
   033E E3            [19]  230 	ex	(sp),hl
   033F 21 00 C0      [10]  231 	ld	hl, #0xc000
   0342 E5            [11]  232 	push	hl
   0343 CD 40 0C      [17]  233 	call	_cpct_getScreenPtr
                            234 ;src/main.c:103: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   0346 01 B4 04      [10]  235 	ld	bc, #_g_tile_schtroumpf+0
   0349 11 10 20      [10]  236 	ld	de, #0x2010
   034C D5            [11]  237 	push	de
   034D E5            [11]  238 	push	hl
   034E C5            [11]  239 	push	bc
   034F CD 38 0A      [17]  240 	call	_cpct_drawSpriteMasked
                            241 ;src/main.c:112: cpct_srand(77);
   0352 21 4D 00      [10]  242 	ld	hl,#0x004d
   0355 11 00 00      [10]  243 	ld	de,#0x0000
   0358 CD 05 0A      [17]  244 	call	_cpct_setSeed_mxor
   035B CD 0D 0A      [17]  245 	call	_cpct_restoreState_mxor_u8
                            246 ;src/main.c:116: akp_musicInit();
   035E CD 8D 01      [17]  247 	call	_akp_musicInit
                            248 ;src/main.c:119: cpct_scanKeyboard_f();
   0361 CD D7 08      [17]  249 	call	_cpct_scanKeyboard_f
                            250 ;src/main.c:120: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   0364                     251 00102$:
   0364 21 00 40      [10]  252 	ld	hl, #0x4000
   0367 CD CB 08      [17]  253 	call	_cpct_isKeyPressed
   036A 7D            [ 4]  254 	ld	a, l
   036B B7            [ 4]  255 	or	a, a
   036C 20 0F         [12]  256 	jr	NZ,00104$
   036E 21 02 04      [10]  257 	ld	hl, #0x0402
   0371 CD CB 08      [17]  258 	call	_cpct_isKeyPressed
   0374 7D            [ 4]  259 	ld	a, l
   0375 B7            [ 4]  260 	or	a, a
   0376 20 05         [12]  261 	jr	NZ,00104$
                            262 ;src/main.c:121: cpct_scanKeyboard_f();
   0378 CD D7 08      [17]  263 	call	_cpct_scanKeyboard_f
   037B 18 E7         [12]  264 	jr	00102$
   037D                     265 00104$:
                            266 ;src/main.c:125: cpct_setVideoMemoryOffset(0);
   037D 2E 00         [ 7]  267 	ld	l, #0x00
   037F CD 4D 09      [17]  268 	call	_cpct_setVideoMemoryOffset
                            269 ;src/main.c:126: calque4000();
   0382 CD 18 04      [17]  270 	call	_calque4000
                            271 ;src/main.c:128: cpct_setInterruptHandler(myInterruptHandler);
   0385 21 5C 02      [10]  272 	ld	hl, #_myInterruptHandler
   0388 CD 60 0C      [17]  273 	call	_cpct_setInterruptHandler
                            274 ;src/main.c:129: while (1) {}
   038B                     275 00106$:
   038B 18 FE         [12]  276 	jr	00106$
                            277 	.area _CODE
                            278 	.area _INITIALIZER
                            279 	.area _CABS (ABS)
