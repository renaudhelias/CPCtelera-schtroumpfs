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
                             20 	.globl _cpct_restoreState_mxor_u8
                             21 	.globl _cpct_setSeed_mxor
                             22 	.globl _cpct_getScreenPtr
                             23 	.globl _cpct_setVideoMemoryOffset
                             24 	.globl _cpct_setPALColour
                             25 	.globl _cpct_setPalette
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_hflipSpriteM0
                             28 	.globl _cpct_drawSolidBox
                             29 	.globl _cpct_drawSpriteMasked
                             30 	.globl _cpct_drawSprite
                             31 	.globl _cpct_px2byteM0
                             32 	.globl _cpct_isKeyPressed
                             33 	.globl _cpct_scanKeyboard_f
                             34 	.globl _cpct_memset_f64
                             35 	.globl _cpct_memset
                             36 	.globl _cpct_setInterruptHandler
                             37 	.globl _cpct_disableFirmware
                             38 	.globl _g_items_0
                             39 ;--------------------------------------------------------
                             40 ; special function registers
                             41 ;--------------------------------------------------------
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DATA
   0D57                      46 _myInterruptHandler_i_1_80:
   0D57                      47 	.ds 1
                             48 ;--------------------------------------------------------
                             49 ; ram data
                             50 ;--------------------------------------------------------
                             51 	.area _INITIALIZED
                             52 ;--------------------------------------------------------
                             53 ; absolute external ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DABS (ABS)
                             56 ;--------------------------------------------------------
                             57 ; global & static initialisations
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _GSINIT
                             61 	.area _GSFINAL
                             62 	.area _GSINIT
                             63 ;--------------------------------------------------------
                             64 ; Home
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _HOME
                             68 ;--------------------------------------------------------
                             69 ; code
                             70 ;--------------------------------------------------------
                             71 	.area _CODE
                             72 ;src/main.c:41: void myInterruptHandler() {
                             73 ;	---------------------------------
                             74 ; Function myInterruptHandler
                             75 ; ---------------------------------
   027C                      76 _myInterruptHandler::
                             77 ;src/main.c:45: cpct_setBorder(i+1);
   027C 21 57 0D      [10]   78 	ld	hl,#_myInterruptHandler_i_1_80 + 0
   027F 46            [ 7]   79 	ld	b, (hl)
   0280 04            [ 4]   80 	inc	b
   0281 C5            [11]   81 	push	bc
   0282 33            [ 6]   82 	inc	sp
   0283 3E 10         [ 7]   83 	ld	a, #0x10
   0285 F5            [11]   84 	push	af
   0286 33            [ 6]   85 	inc	sp
   0287 CD 71 09      [17]   86 	call	_cpct_setPALColour
                             87 ;src/main.c:46: if (++i > 5) i=0;
   028A FD 21 57 0D   [14]   88 	ld	iy, #_myInterruptHandler_i_1_80
   028E FD 34 00      [23]   89 	inc	0 (iy)
   0291 3E 05         [ 7]   90 	ld	a, #0x05
   0293 FD 96 00      [19]   91 	sub	a, 0 (iy)
   0296 30 04         [12]   92 	jr	NC,00102$
   0298 FD 36 00 00   [19]   93 	ld	0 (iy), #0x00
   029C                      94 00102$:
                             95 ;src/main.c:49: if (i==2) {
   029C 3A 57 0D      [13]   96 	ld	a,(#_myInterruptHandler_i_1_80 + 0)
   029F D6 02         [ 7]   97 	sub	a, #0x02
   02A1 C0            [11]   98 	ret	NZ
                             99 ;src/main.c:50: akp_musicPlay();
   02A2 CD 3C 02      [17]  100 	call	_akp_musicPlay
   02A5 C9            [10]  101 	ret
   02A6                     102 _g_items_0:
   02A6 05                  103 	.db #0x05	; 5
   02A7 0F                  104 	.db #0x0f	; 15
   02A8 0F                  105 	.db #0x0f	; 15
   02A9 00                  106 	.db #0x00	; 0
   02AA 0F                  107 	.db #0x0f	; 15
   02AB 0F                  108 	.db #0x0f	; 15
   02AC 0F                  109 	.db #0x0f	; 15
   02AD 0A                  110 	.db #0x0a	; 10
   02AE 0F                  111 	.db #0x0f	; 15
   02AF 0A                  112 	.db #0x0a	; 10
   02B0 05                  113 	.db #0x05	; 5
   02B1 00                  114 	.db #0x00	; 0
   02B2 0F                  115 	.db #0x0f	; 15
   02B3 0A                  116 	.db #0x0a	; 10
   02B4 05                  117 	.db #0x05	; 5
   02B5 00                  118 	.db #0x00	; 0
   02B6 05                  119 	.db #0x05	; 5
   02B7 0F                  120 	.db #0x0f	; 15
   02B8 0A                  121 	.db #0x0a	; 10
   02B9 0A                  122 	.db #0x0a	; 10
   02BA 00                  123 	.db #0x00	; 0
   02BB 0F                  124 	.db #0x0f	; 15
   02BC 0F                  125 	.db #0x0f	; 15
   02BD 0A                  126 	.db #0x0a	; 10
   02BE 00                  127 	.db #0x00	; 0
   02BF 0A                  128 	.db #0x0a	; 10
   02C0 0A                  129 	.db #0x0a	; 10
   02C1 0A                  130 	.db #0x0a	; 10
   02C2 00                  131 	.db #0x00	; 0
   02C3 00                  132 	.db #0x00	; 0
   02C4 00                  133 	.db #0x00	; 0
   02C5 00                  134 	.db #0x00	; 0
                            135 ;src/main.c:55: void main(void) {
                            136 ;	---------------------------------
                            137 ; Function main
                            138 ; ---------------------------------
   02C6                     139 _main::
                            140 ;src/main.c:57: u8* sprite=g_items_0;
                            141 ;src/main.c:66: cpct_disableFirmware();
   02C6 CD 8E 0B      [17]  142 	call	_cpct_disableFirmware
                            143 ;src/main.c:70: bank4_4000();
   02C9 CD 6A 04      [17]  144 	call	_bank4_4000
                            145 ;src/main.c:71: bank0123();
   02CC CD 5E 04      [17]  146 	call	_bank0123
                            147 ;src/main.c:72: calqueC000();
   02CF CD 3D 04      [17]  148 	call	_calqueC000
                            149 ;src/main.c:75: cpct_setVideoMode(0);
   02D2 2E 00         [ 7]  150 	ld	l, #0x00
   02D4 CD 47 0B      [17]  151 	call	_cpct_setVideoMode
                            152 ;src/main.c:78: cpct_setBorder(HW_BLACK);
   02D7 21 10 14      [10]  153 	ld	hl, #0x1410
   02DA E5            [11]  154 	push	hl
   02DB CD 71 09      [17]  155 	call	_cpct_setPALColour
                            156 ;src/main.c:79: cpct_setPalette(g_tile_palette, 16);
   02DE 21 10 00      [10]  157 	ld	hl, #0x0010
   02E1 E5            [11]  158 	push	hl
   02E2 21 D4 04      [10]  159 	ld	hl, #_g_tile_palette
   02E5 E5            [11]  160 	push	hl
   02E6 CD E4 08      [17]  161 	call	_cpct_setPalette
                            162 ;src/main.c:80: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   02E9 21 00 40      [10]  163 	ld	hl, #0x4000
   02EC E5            [11]  164 	push	hl
   02ED AF            [ 4]  165 	xor	a, a
   02EE F5            [11]  166 	push	af
   02EF 33            [ 6]  167 	inc	sp
   02F0 26 C0         [ 7]  168 	ld	h, #0xc0
   02F2 E5            [11]  169 	push	hl
   02F3 CD 71 0B      [17]  170 	call	_cpct_memset
                            171 ;src/main.c:83: cpct_setVideoMemoryOffset(3);
   02F6 2E 03         [ 7]  172 	ld	l, #0x03
   02F8 CD 7D 09      [17]  173 	call	_cpct_setVideoMemoryOffset
                            174 ;src/main.c:86: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   02FB 21 0F 0F      [10]  175 	ld	hl, #0x0f0f
   02FE E5            [11]  176 	push	hl
   02FF 21 00 C0      [10]  177 	ld	hl, #0xc000
   0302 E5            [11]  178 	push	hl
   0303 CD 70 0C      [17]  179 	call	_cpct_getScreenPtr
                            180 ;src/main.c:87: cpct_drawSprite(sprite, p, 4, 8);
   0306 E5            [11]  181 	push	hl
   0307 01 04 08      [10]  182 	ld	bc, #0x0804
   030A C5            [11]  183 	push	bc
   030B E5            [11]  184 	push	hl
   030C 01 A6 02      [10]  185 	ld	bc, #_g_items_0
   030F C5            [11]  186 	push	bc
   0310 CD 86 09      [17]  187 	call	_cpct_drawSprite
   0313 01 00 20      [10]  188 	ld	bc, #0x2000
   0316 C5            [11]  189 	push	bc
   0317 01 FF FF      [10]  190 	ld	bc, #0xffff
   031A C5            [11]  191 	push	bc
   031B 01 00 C0      [10]  192 	ld	bc, #0xc000
   031E C5            [11]  193 	push	bc
   031F CD 97 0A      [17]  194 	call	_cpct_memset_f64
   0322 01 A6 02      [10]  195 	ld	bc, #_g_items_0
   0325 C5            [11]  196 	push	bc
   0326 01 04 08      [10]  197 	ld	bc, #0x0804
   0329 C5            [11]  198 	push	bc
   032A CD 03 0B      [17]  199 	call	_cpct_hflipSpriteM0
   032D E1            [10]  200 	pop	hl
                            201 ;src/main.c:95: cpct_drawSprite(sprite, p, 4, 8);
   032E 01 04 08      [10]  202 	ld	bc, #0x0804
   0331 C5            [11]  203 	push	bc
   0332 E5            [11]  204 	push	hl
   0333 21 A6 02      [10]  205 	ld	hl, #_g_items_0
   0336 E5            [11]  206 	push	hl
   0337 CD 86 09      [17]  207 	call	_cpct_drawSprite
                            208 ;src/main.c:97: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   033A 21 0F 1F      [10]  209 	ld	hl, #0x1f0f
   033D E5            [11]  210 	push	hl
   033E 21 00 C0      [10]  211 	ld	hl, #0xc000
   0341 E5            [11]  212 	push	hl
   0342 CD 70 0C      [17]  213 	call	_cpct_getScreenPtr
                            214 ;src/main.c:99: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0345 E5            [11]  215 	push	hl
   0346 21 02 03      [10]  216 	ld	hl, #0x0302
   0349 E5            [11]  217 	push	hl
   034A CD 55 0B      [17]  218 	call	_cpct_px2byteM0
   034D 55            [ 4]  219 	ld	d, l
   034E C1            [10]  220 	pop	bc
   034F 21 0A 14      [10]  221 	ld	hl, #0x140a
   0352 E5            [11]  222 	push	hl
   0353 D5            [11]  223 	push	de
   0354 33            [ 6]  224 	inc	sp
   0355 C5            [11]  225 	push	bc
   0356 CD 9E 0B      [17]  226 	call	_cpct_drawSolidBox
   0359 F1            [10]  227 	pop	af
                            228 ;src/main.c:102: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   035A 33            [ 6]  229 	inc	sp
   035B 21 09 4F      [10]  230 	ld	hl,#0x4f09
   035E E3            [19]  231 	ex	(sp),hl
   035F 21 00 C0      [10]  232 	ld	hl, #0xc000
   0362 E5            [11]  233 	push	hl
   0363 CD 70 0C      [17]  234 	call	_cpct_getScreenPtr
                            235 ;src/main.c:103: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   0366 01 E4 04      [10]  236 	ld	bc, #_g_tile_schtroumpf+0
   0369 11 10 20      [10]  237 	ld	de, #0x2010
   036C D5            [11]  238 	push	de
   036D E5            [11]  239 	push	hl
   036E C5            [11]  240 	push	bc
   036F CD 68 0A      [17]  241 	call	_cpct_drawSpriteMasked
                            242 ;src/main.c:112: cpct_srand(77);
   0372 21 4D 00      [10]  243 	ld	hl,#0x004d
   0375 11 00 00      [10]  244 	ld	de,#0x0000
   0378 CD 35 0A      [17]  245 	call	_cpct_setSeed_mxor
   037B CD 3D 0A      [17]  246 	call	_cpct_restoreState_mxor_u8
                            247 ;src/main.c:116: cpct_scanKeyboard_f();
   037E CD 07 09      [17]  248 	call	_cpct_scanKeyboard_f
                            249 ;src/main.c:117: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   0381                     250 00102$:
   0381 21 00 40      [10]  251 	ld	hl, #0x4000
   0384 CD FB 08      [17]  252 	call	_cpct_isKeyPressed
   0387 7D            [ 4]  253 	ld	a, l
   0388 B7            [ 4]  254 	or	a, a
   0389 20 0F         [12]  255 	jr	NZ,00104$
   038B 21 02 04      [10]  256 	ld	hl, #0x0402
   038E CD FB 08      [17]  257 	call	_cpct_isKeyPressed
   0391 7D            [ 4]  258 	ld	a, l
   0392 B7            [ 4]  259 	or	a, a
   0393 20 05         [12]  260 	jr	NZ,00104$
                            261 ;src/main.c:118: cpct_scanKeyboard_f();
   0395 CD 07 09      [17]  262 	call	_cpct_scanKeyboard_f
   0398 18 E7         [12]  263 	jr	00102$
   039A                     264 00104$:
                            265 ;src/main.c:122: akp_musicInit();
   039A CD 8D 01      [17]  266 	call	_akp_musicInit
                            267 ;src/main.c:126: cpct_setVideoMemoryOffset(0);
   039D 2E 00         [ 7]  268 	ld	l, #0x00
   039F CD 7D 09      [17]  269 	call	_cpct_setVideoMemoryOffset
                            270 ;src/main.c:127: calque4000();
   03A2 CD 48 04      [17]  271 	call	_calque4000
                            272 ;src/main.c:129: cpct_setInterruptHandler(myInterruptHandler);
   03A5 21 7C 02      [10]  273 	ld	hl, #_myInterruptHandler
   03A8 CD 90 0C      [17]  274 	call	_cpct_setInterruptHandler
                            275 ;src/main.c:130: while (1) {
   03AB                     276 00108$:
                            277 ;src/main.c:131: cpct_scanKeyboard_f();
   03AB CD 07 09      [17]  278 	call	_cpct_scanKeyboard_f
                            279 ;src/main.c:132: if (cpct_isKeyPressed(Key_Space)) {
   03AE 21 05 80      [10]  280 	ld	hl, #0x8005
   03B1 CD FB 08      [17]  281 	call	_cpct_isKeyPressed
   03B4 7D            [ 4]  282 	ld	a, l
   03B5 B7            [ 4]  283 	or	a, a
   03B6 28 F3         [12]  284 	jr	Z,00108$
                            285 ;src/main.c:133: akp_sfxPlay();
   03B8 CD 5C 02      [17]  286 	call	_akp_sfxPlay
   03BB 18 EE         [12]  287 	jr	00108$
                            288 	.area _CODE
                            289 	.area _INITIALIZER
                            290 	.area _CABS (ABS)
