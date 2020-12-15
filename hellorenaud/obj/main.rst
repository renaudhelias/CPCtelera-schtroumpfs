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
                             17 	.globl _akp_sfxPlay
                             18 	.globl _akp_musicPlay
                             19 	.globl _akp_musicInit
                             20 	.globl _scroll
                             21 	.globl _cpct_restoreState_mxor_u8
                             22 	.globl _cpct_setSeed_mxor
                             23 	.globl _cpct_getScreenPtr
                             24 	.globl _cpct_setVideoMemoryOffset
                             25 	.globl _cpct_setPALColour
                             26 	.globl _cpct_setPalette
                             27 	.globl _cpct_setVideoMode
                             28 	.globl _cpct_hflipSpriteM0
                             29 	.globl _cpct_drawSolidBox
                             30 	.globl _cpct_drawSpriteMasked
                             31 	.globl _cpct_drawSprite
                             32 	.globl _cpct_px2byteM0
                             33 	.globl _cpct_isKeyPressed
                             34 	.globl _cpct_scanKeyboard_f
                             35 	.globl _cpct_memset_f64
                             36 	.globl _cpct_memset
                             37 	.globl _cpct_setInterruptHandler
                             38 	.globl _cpct_disableFirmware
                             39 	.globl _g_items_0
                             40 ;--------------------------------------------------------
                             41 ; special function registers
                             42 ;--------------------------------------------------------
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DATA
   246C                      47 _myInterruptHandler_i_1_81:
   246C                      48 	.ds 1
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
                             53 ;--------------------------------------------------------
                             54 ; absolute external ram data
                             55 ;--------------------------------------------------------
                             56 	.area _DABS (ABS)
                             57 ;--------------------------------------------------------
                             58 ; global & static initialisations
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _GSINIT
                             62 	.area _GSFINAL
                             63 	.area _GSINIT
                             64 ;--------------------------------------------------------
                             65 ; Home
                             66 ;--------------------------------------------------------
                             67 	.area _HOME
                             68 	.area _HOME
                             69 ;--------------------------------------------------------
                             70 ; code
                             71 ;--------------------------------------------------------
                             72 	.area _CODE
                             73 ;src/main.c:43: void myInterruptHandler() {
                             74 ;	---------------------------------
                             75 ; Function myInterruptHandler
                             76 ; ---------------------------------
   02E3                      77 _myInterruptHandler::
                             78 ;src/main.c:47: cpct_setBorder(i+1);
   02E3 21 6C 24      [10]   79 	ld	hl,#_myInterruptHandler_i_1_81 + 0
   02E6 46            [ 7]   80 	ld	b, (hl)
   02E7 04            [ 4]   81 	inc	b
   02E8 C5            [11]   82 	push	bc
   02E9 33            [ 6]   83 	inc	sp
   02EA 3E 10         [ 7]   84 	ld	a, #0x10
   02EC F5            [11]   85 	push	af
   02ED 33            [ 6]   86 	inc	sp
   02EE CD 86 20      [17]   87 	call	_cpct_setPALColour
                             88 ;src/main.c:48: if (++i > 5) i=0;
   02F1 FD 21 6C 24   [14]   89 	ld	iy, #_myInterruptHandler_i_1_81
   02F5 FD 34 00      [23]   90 	inc	0 (iy)
   02F8 3E 05         [ 7]   91 	ld	a, #0x05
   02FA FD 96 00      [19]   92 	sub	a, 0 (iy)
   02FD 30 04         [12]   93 	jr	NC,00102$
   02FF FD 36 00 00   [19]   94 	ld	0 (iy), #0x00
   0303                      95 00102$:
                             96 ;src/main.c:51: if (i==2) {
   0303 3A 6C 24      [13]   97 	ld	a,(#_myInterruptHandler_i_1_81 + 0)
   0306 D6 02         [ 7]   98 	sub	a, #0x02
   0308 C0            [11]   99 	ret	NZ
                            100 ;src/main.c:52: akp_musicPlay();
   0309 CD A3 02      [17]  101 	call	_akp_musicPlay
   030C C9            [10]  102 	ret
   030D                     103 _g_items_0:
   030D 05                  104 	.db #0x05	; 5
   030E 0F                  105 	.db #0x0f	; 15
   030F 0F                  106 	.db #0x0f	; 15
   0310 00                  107 	.db #0x00	; 0
   0311 0F                  108 	.db #0x0f	; 15
   0312 0F                  109 	.db #0x0f	; 15
   0313 0F                  110 	.db #0x0f	; 15
   0314 0A                  111 	.db #0x0a	; 10
   0315 0F                  112 	.db #0x0f	; 15
   0316 0A                  113 	.db #0x0a	; 10
   0317 05                  114 	.db #0x05	; 5
   0318 00                  115 	.db #0x00	; 0
   0319 0F                  116 	.db #0x0f	; 15
   031A 0A                  117 	.db #0x0a	; 10
   031B 05                  118 	.db #0x05	; 5
   031C 00                  119 	.db #0x00	; 0
   031D 05                  120 	.db #0x05	; 5
   031E 0F                  121 	.db #0x0f	; 15
   031F 0A                  122 	.db #0x0a	; 10
   0320 0A                  123 	.db #0x0a	; 10
   0321 00                  124 	.db #0x00	; 0
   0322 0F                  125 	.db #0x0f	; 15
   0323 0F                  126 	.db #0x0f	; 15
   0324 0A                  127 	.db #0x0a	; 10
   0325 00                  128 	.db #0x00	; 0
   0326 0A                  129 	.db #0x0a	; 10
   0327 0A                  130 	.db #0x0a	; 10
   0328 0A                  131 	.db #0x0a	; 10
   0329 00                  132 	.db #0x00	; 0
   032A 00                  133 	.db #0x00	; 0
   032B 00                  134 	.db #0x00	; 0
   032C 00                  135 	.db #0x00	; 0
                            136 ;src/main.c:57: void main(void) {
                            137 ;	---------------------------------
                            138 ; Function main
                            139 ; ---------------------------------
   032D                     140 _main::
                            141 ;src/main.c:59: u8* sprite=g_items_0;
                            142 ;src/main.c:68: cpct_disableFirmware();
   032D CD A3 22      [17]  143 	call	_cpct_disableFirmware
                            144 ;src/main.c:72: bank4_4000();
   0330 CD FD 04      [17]  145 	call	_bank4_4000
                            146 ;src/main.c:73: bank0123();
   0333 CD F1 04      [17]  147 	call	_bank0123
                            148 ;src/main.c:74: calqueC000();
   0336 CD D0 04      [17]  149 	call	_calqueC000
                            150 ;src/main.c:77: cpct_setVideoMode(0);
   0339 2E 00         [ 7]  151 	ld	l, #0x00
   033B CD 5C 22      [17]  152 	call	_cpct_setVideoMode
                            153 ;src/main.c:80: cpct_setBorder(HW_BLACK);
   033E 21 10 14      [10]  154 	ld	hl, #0x1410
   0341 E5            [11]  155 	push	hl
   0342 CD 86 20      [17]  156 	call	_cpct_setPALColour
                            157 ;src/main.c:81: cpct_setPalette(g_tile_palette, 6);
   0345 21 06 00      [10]  158 	ld	hl, #0x0006
   0348 E5            [11]  159 	push	hl
   0349 21 67 05      [10]  160 	ld	hl, #_g_tile_palette
   034C E5            [11]  161 	push	hl
   034D CD F9 1F      [17]  162 	call	_cpct_setPalette
                            163 ;src/main.c:82: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   0350 21 00 40      [10]  164 	ld	hl, #0x4000
   0353 E5            [11]  165 	push	hl
   0354 AF            [ 4]  166 	xor	a, a
   0355 F5            [11]  167 	push	af
   0356 33            [ 6]  168 	inc	sp
   0357 26 C0         [ 7]  169 	ld	h, #0xc0
   0359 E5            [11]  170 	push	hl
   035A CD 86 22      [17]  171 	call	_cpct_memset
                            172 ;src/main.c:85: cpct_setVideoMemoryOffset(3);
   035D 2E 03         [ 7]  173 	ld	l, #0x03
   035F CD 92 20      [17]  174 	call	_cpct_setVideoMemoryOffset
                            175 ;src/main.c:88: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   0362 21 0F 0F      [10]  176 	ld	hl, #0x0f0f
   0365 E5            [11]  177 	push	hl
   0366 21 00 C0      [10]  178 	ld	hl, #0xc000
   0369 E5            [11]  179 	push	hl
   036A CD 85 23      [17]  180 	call	_cpct_getScreenPtr
                            181 ;src/main.c:89: cpct_drawSprite(sprite, p, 4, 8);
   036D E5            [11]  182 	push	hl
   036E 01 04 08      [10]  183 	ld	bc, #0x0804
   0371 C5            [11]  184 	push	bc
   0372 E5            [11]  185 	push	hl
   0373 01 0D 03      [10]  186 	ld	bc, #_g_items_0
   0376 C5            [11]  187 	push	bc
   0377 CD 9B 20      [17]  188 	call	_cpct_drawSprite
   037A 01 00 20      [10]  189 	ld	bc, #0x2000
   037D C5            [11]  190 	push	bc
   037E 01 FF FF      [10]  191 	ld	bc, #0xffff
   0381 C5            [11]  192 	push	bc
   0382 01 00 C0      [10]  193 	ld	bc, #0xc000
   0385 C5            [11]  194 	push	bc
   0386 CD AC 21      [17]  195 	call	_cpct_memset_f64
   0389 01 0D 03      [10]  196 	ld	bc, #_g_items_0
   038C C5            [11]  197 	push	bc
   038D 01 04 08      [10]  198 	ld	bc, #0x0804
   0390 C5            [11]  199 	push	bc
   0391 CD 18 22      [17]  200 	call	_cpct_hflipSpriteM0
   0394 E1            [10]  201 	pop	hl
                            202 ;src/main.c:97: cpct_drawSprite(sprite, p, 4, 8);
   0395 01 04 08      [10]  203 	ld	bc, #0x0804
   0398 C5            [11]  204 	push	bc
   0399 E5            [11]  205 	push	hl
   039A 21 0D 03      [10]  206 	ld	hl, #_g_items_0
   039D E5            [11]  207 	push	hl
   039E CD 9B 20      [17]  208 	call	_cpct_drawSprite
                            209 ;src/main.c:99: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   03A1 21 0F 1F      [10]  210 	ld	hl, #0x1f0f
   03A4 E5            [11]  211 	push	hl
   03A5 21 00 C0      [10]  212 	ld	hl, #0xc000
   03A8 E5            [11]  213 	push	hl
   03A9 CD 85 23      [17]  214 	call	_cpct_getScreenPtr
                            215 ;src/main.c:101: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   03AC E5            [11]  216 	push	hl
   03AD 21 02 03      [10]  217 	ld	hl, #0x0302
   03B0 E5            [11]  218 	push	hl
   03B1 CD 6A 22      [17]  219 	call	_cpct_px2byteM0
   03B4 55            [ 4]  220 	ld	d, l
   03B5 C1            [10]  221 	pop	bc
   03B6 21 0A 14      [10]  222 	ld	hl, #0x140a
   03B9 E5            [11]  223 	push	hl
   03BA D5            [11]  224 	push	de
   03BB 33            [ 6]  225 	inc	sp
   03BC C5            [11]  226 	push	bc
   03BD CD B3 22      [17]  227 	call	_cpct_drawSolidBox
   03C0 F1            [10]  228 	pop	af
                            229 ;src/main.c:104: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   03C1 33            [ 6]  230 	inc	sp
   03C2 21 09 4F      [10]  231 	ld	hl,#0x4f09
   03C5 E3            [19]  232 	ex	(sp),hl
   03C6 21 00 C0      [10]  233 	ld	hl, #0xc000
   03C9 E5            [11]  234 	push	hl
   03CA CD 85 23      [17]  235 	call	_cpct_getScreenPtr
                            236 ;src/main.c:105: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   03CD 01 6D 05      [10]  237 	ld	bc, #_g_tile_schtroumpf+0
   03D0 11 10 20      [10]  238 	ld	de, #0x2010
   03D3 D5            [11]  239 	push	de
   03D4 E5            [11]  240 	push	hl
   03D5 C5            [11]  241 	push	bc
   03D6 CD 7D 21      [17]  242 	call	_cpct_drawSpriteMasked
                            243 ;src/main.c:107: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,120-1);
   03D9 21 09 77      [10]  244 	ld	hl, #0x7709
   03DC E5            [11]  245 	push	hl
   03DD 21 00 C0      [10]  246 	ld	hl, #0xc000
   03E0 E5            [11]  247 	push	hl
   03E1 CD 85 23      [17]  248 	call	_cpct_getScreenPtr
                            249 ;src/main.c:108: cpct_drawSprite(g_tile_fontmap20x22_00, p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   03E4 01 A1 09      [10]  250 	ld	bc, #_g_tile_fontmap20x22_00+0
   03E7 11 0A 16      [10]  251 	ld	de, #0x160a
   03EA D5            [11]  252 	push	de
   03EB E5            [11]  253 	push	hl
   03EC C5            [11]  254 	push	bc
   03ED CD 9B 20      [17]  255 	call	_cpct_drawSprite
                            256 ;src/main.c:110: scroll(" ABRUTI", 7);
   03F0 21 07 00      [10]  257 	ld	hl, #0x0007
   03F3 E5            [11]  258 	push	hl
   03F4 21 48 04      [10]  259 	ld	hl, #___str_0
   03F7 E5            [11]  260 	push	hl
   03F8 CD 38 01      [17]  261 	call	_scroll
   03FB F1            [10]  262 	pop	af
   03FC F1            [10]  263 	pop	af
                            264 ;src/main.c:119: cpct_srand(77);
   03FD 21 4D 00      [10]  265 	ld	hl,#0x004d
   0400 11 00 00      [10]  266 	ld	de,#0x0000
   0403 CD 4A 21      [17]  267 	call	_cpct_setSeed_mxor
   0406 CD 52 21      [17]  268 	call	_cpct_restoreState_mxor_u8
                            269 ;src/main.c:123: cpct_scanKeyboard_f();
   0409 CD 1C 20      [17]  270 	call	_cpct_scanKeyboard_f
                            271 ;src/main.c:124: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   040C                     272 00102$:
   040C 21 00 40      [10]  273 	ld	hl, #0x4000
   040F CD 10 20      [17]  274 	call	_cpct_isKeyPressed
   0412 7D            [ 4]  275 	ld	a, l
   0413 B7            [ 4]  276 	or	a, a
   0414 20 0F         [12]  277 	jr	NZ,00104$
   0416 21 02 04      [10]  278 	ld	hl, #0x0402
   0419 CD 10 20      [17]  279 	call	_cpct_isKeyPressed
   041C 7D            [ 4]  280 	ld	a, l
   041D B7            [ 4]  281 	or	a, a
   041E 20 05         [12]  282 	jr	NZ,00104$
                            283 ;src/main.c:125: cpct_scanKeyboard_f();
   0420 CD 1C 20      [17]  284 	call	_cpct_scanKeyboard_f
   0423 18 E7         [12]  285 	jr	00102$
   0425                     286 00104$:
                            287 ;src/main.c:129: akp_musicInit();
   0425 CD F8 01      [17]  288 	call	_akp_musicInit
                            289 ;src/main.c:133: cpct_setVideoMemoryOffset(0);
   0428 2E 00         [ 7]  290 	ld	l, #0x00
   042A CD 92 20      [17]  291 	call	_cpct_setVideoMemoryOffset
                            292 ;src/main.c:134: calque4000();
   042D CD DB 04      [17]  293 	call	_calque4000
                            294 ;src/main.c:136: cpct_setInterruptHandler(myInterruptHandler);
   0430 21 E3 02      [10]  295 	ld	hl, #_myInterruptHandler
   0433 CD A5 23      [17]  296 	call	_cpct_setInterruptHandler
                            297 ;src/main.c:137: while (1) {
   0436                     298 00108$:
                            299 ;src/main.c:138: cpct_scanKeyboard_f();
   0436 CD 1C 20      [17]  300 	call	_cpct_scanKeyboard_f
                            301 ;src/main.c:139: if (cpct_isKeyPressed(Key_Space)) {
   0439 21 05 80      [10]  302 	ld	hl, #0x8005
   043C CD 10 20      [17]  303 	call	_cpct_isKeyPressed
   043F 7D            [ 4]  304 	ld	a, l
   0440 B7            [ 4]  305 	or	a, a
   0441 28 F3         [12]  306 	jr	Z,00108$
                            307 ;src/main.c:140: akp_sfxPlay();
   0443 CD C3 02      [17]  308 	call	_akp_sfxPlay
   0446 18 EE         [12]  309 	jr	00108$
   0448                     310 ___str_0:
   0448 20 41 42 52 55 54   311 	.ascii " ABRUTI"
        49
   044F 00                  312 	.db 0x00
                            313 	.area _CODE
                            314 	.area _INITIALIZER
                            315 	.area _CABS (ABS)
