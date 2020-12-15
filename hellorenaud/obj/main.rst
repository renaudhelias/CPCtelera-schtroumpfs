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
   23B8                      46 _myInterruptHandler_i_1_80:
   23B8                      47 	.ds 1
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
                             72 ;src/main.c:42: void myInterruptHandler() {
                             73 ;	---------------------------------
                             74 ; Function myInterruptHandler
                             75 ; ---------------------------------
   0278                      76 _myInterruptHandler::
                             77 ;src/main.c:46: cpct_setBorder(i+1);
   0278 21 B8 23      [10]   78 	ld	hl,#_myInterruptHandler_i_1_80 + 0
   027B 46            [ 7]   79 	ld	b, (hl)
   027C 04            [ 4]   80 	inc	b
   027D C5            [11]   81 	push	bc
   027E 33            [ 6]   82 	inc	sp
   027F 3E 10         [ 7]   83 	ld	a, #0x10
   0281 F5            [11]   84 	push	af
   0282 33            [ 6]   85 	inc	sp
   0283 CD D2 1F      [17]   86 	call	_cpct_setPALColour
                             87 ;src/main.c:47: if (++i > 5) i=0;
   0286 FD 21 B8 23   [14]   88 	ld	iy, #_myInterruptHandler_i_1_80
   028A FD 34 00      [23]   89 	inc	0 (iy)
   028D 3E 05         [ 7]   90 	ld	a, #0x05
   028F FD 96 00      [19]   91 	sub	a, 0 (iy)
   0292 30 04         [12]   92 	jr	NC,00102$
   0294 FD 36 00 00   [19]   93 	ld	0 (iy), #0x00
   0298                      94 00102$:
                             95 ;src/main.c:50: if (i==2) {
   0298 3A B8 23      [13]   96 	ld	a,(#_myInterruptHandler_i_1_80 + 0)
   029B D6 02         [ 7]   97 	sub	a, #0x02
   029D C0            [11]   98 	ret	NZ
                             99 ;src/main.c:51: akp_musicPlay();
   029E CD 38 02      [17]  100 	call	_akp_musicPlay
   02A1 C9            [10]  101 	ret
   02A2                     102 _g_items_0:
   02A2 05                  103 	.db #0x05	; 5
   02A3 0F                  104 	.db #0x0f	; 15
   02A4 0F                  105 	.db #0x0f	; 15
   02A5 00                  106 	.db #0x00	; 0
   02A6 0F                  107 	.db #0x0f	; 15
   02A7 0F                  108 	.db #0x0f	; 15
   02A8 0F                  109 	.db #0x0f	; 15
   02A9 0A                  110 	.db #0x0a	; 10
   02AA 0F                  111 	.db #0x0f	; 15
   02AB 0A                  112 	.db #0x0a	; 10
   02AC 05                  113 	.db #0x05	; 5
   02AD 00                  114 	.db #0x00	; 0
   02AE 0F                  115 	.db #0x0f	; 15
   02AF 0A                  116 	.db #0x0a	; 10
   02B0 05                  117 	.db #0x05	; 5
   02B1 00                  118 	.db #0x00	; 0
   02B2 05                  119 	.db #0x05	; 5
   02B3 0F                  120 	.db #0x0f	; 15
   02B4 0A                  121 	.db #0x0a	; 10
   02B5 0A                  122 	.db #0x0a	; 10
   02B6 00                  123 	.db #0x00	; 0
   02B7 0F                  124 	.db #0x0f	; 15
   02B8 0F                  125 	.db #0x0f	; 15
   02B9 0A                  126 	.db #0x0a	; 10
   02BA 00                  127 	.db #0x00	; 0
   02BB 0A                  128 	.db #0x0a	; 10
   02BC 0A                  129 	.db #0x0a	; 10
   02BD 0A                  130 	.db #0x0a	; 10
   02BE 00                  131 	.db #0x00	; 0
   02BF 00                  132 	.db #0x00	; 0
   02C0 00                  133 	.db #0x00	; 0
   02C1 00                  134 	.db #0x00	; 0
                            135 ;src/main.c:56: void main(void) {
                            136 ;	---------------------------------
                            137 ; Function main
                            138 ; ---------------------------------
   02C2                     139 _main::
                            140 ;src/main.c:58: u8* sprite=g_items_0;
                            141 ;src/main.c:67: cpct_disableFirmware();
   02C2 CD EF 21      [17]  142 	call	_cpct_disableFirmware
                            143 ;src/main.c:71: bank4_4000();
   02C5 CD 7D 04      [17]  144 	call	_bank4_4000
                            145 ;src/main.c:72: bank0123();
   02C8 CD 71 04      [17]  146 	call	_bank0123
                            147 ;src/main.c:73: calqueC000();
   02CB CD 50 04      [17]  148 	call	_calqueC000
                            149 ;src/main.c:76: cpct_setVideoMode(0);
   02CE 2E 00         [ 7]  150 	ld	l, #0x00
   02D0 CD A8 21      [17]  151 	call	_cpct_setVideoMode
                            152 ;src/main.c:79: cpct_setBorder(HW_BLACK);
   02D3 21 10 14      [10]  153 	ld	hl, #0x1410
   02D6 E5            [11]  154 	push	hl
   02D7 CD D2 1F      [17]  155 	call	_cpct_setPALColour
                            156 ;src/main.c:80: cpct_setPalette(g_tile_palette, 6);
   02DA 21 06 00      [10]  157 	ld	hl, #0x0006
   02DD E5            [11]  158 	push	hl
   02DE 21 E7 04      [10]  159 	ld	hl, #_g_tile_palette
   02E1 E5            [11]  160 	push	hl
   02E2 CD 45 1F      [17]  161 	call	_cpct_setPalette
                            162 ;src/main.c:81: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   02E5 21 00 40      [10]  163 	ld	hl, #0x4000
   02E8 E5            [11]  164 	push	hl
   02E9 AF            [ 4]  165 	xor	a, a
   02EA F5            [11]  166 	push	af
   02EB 33            [ 6]  167 	inc	sp
   02EC 26 C0         [ 7]  168 	ld	h, #0xc0
   02EE E5            [11]  169 	push	hl
   02EF CD D2 21      [17]  170 	call	_cpct_memset
                            171 ;src/main.c:84: cpct_setVideoMemoryOffset(3);
   02F2 2E 03         [ 7]  172 	ld	l, #0x03
   02F4 CD DE 1F      [17]  173 	call	_cpct_setVideoMemoryOffset
                            174 ;src/main.c:87: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   02F7 21 0F 0F      [10]  175 	ld	hl, #0x0f0f
   02FA E5            [11]  176 	push	hl
   02FB 21 00 C0      [10]  177 	ld	hl, #0xc000
   02FE E5            [11]  178 	push	hl
   02FF CD D1 22      [17]  179 	call	_cpct_getScreenPtr
                            180 ;src/main.c:88: cpct_drawSprite(sprite, p, 4, 8);
   0302 E5            [11]  181 	push	hl
   0303 01 04 08      [10]  182 	ld	bc, #0x0804
   0306 C5            [11]  183 	push	bc
   0307 E5            [11]  184 	push	hl
   0308 01 A2 02      [10]  185 	ld	bc, #_g_items_0
   030B C5            [11]  186 	push	bc
   030C CD E7 1F      [17]  187 	call	_cpct_drawSprite
   030F 01 00 20      [10]  188 	ld	bc, #0x2000
   0312 C5            [11]  189 	push	bc
   0313 01 FF FF      [10]  190 	ld	bc, #0xffff
   0316 C5            [11]  191 	push	bc
   0317 01 00 C0      [10]  192 	ld	bc, #0xc000
   031A C5            [11]  193 	push	bc
   031B CD F8 20      [17]  194 	call	_cpct_memset_f64
   031E 01 A2 02      [10]  195 	ld	bc, #_g_items_0
   0321 C5            [11]  196 	push	bc
   0322 01 04 08      [10]  197 	ld	bc, #0x0804
   0325 C5            [11]  198 	push	bc
   0326 CD 64 21      [17]  199 	call	_cpct_hflipSpriteM0
   0329 E1            [10]  200 	pop	hl
                            201 ;src/main.c:96: cpct_drawSprite(sprite, p, 4, 8);
   032A 01 04 08      [10]  202 	ld	bc, #0x0804
   032D C5            [11]  203 	push	bc
   032E E5            [11]  204 	push	hl
   032F 21 A2 02      [10]  205 	ld	hl, #_g_items_0
   0332 E5            [11]  206 	push	hl
   0333 CD E7 1F      [17]  207 	call	_cpct_drawSprite
                            208 ;src/main.c:98: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   0336 21 0F 1F      [10]  209 	ld	hl, #0x1f0f
   0339 E5            [11]  210 	push	hl
   033A 21 00 C0      [10]  211 	ld	hl, #0xc000
   033D E5            [11]  212 	push	hl
   033E CD D1 22      [17]  213 	call	_cpct_getScreenPtr
                            214 ;src/main.c:100: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   0341 E5            [11]  215 	push	hl
   0342 21 02 03      [10]  216 	ld	hl, #0x0302
   0345 E5            [11]  217 	push	hl
   0346 CD B6 21      [17]  218 	call	_cpct_px2byteM0
   0349 55            [ 4]  219 	ld	d, l
   034A C1            [10]  220 	pop	bc
   034B 21 0A 14      [10]  221 	ld	hl, #0x140a
   034E E5            [11]  222 	push	hl
   034F D5            [11]  223 	push	de
   0350 33            [ 6]  224 	inc	sp
   0351 C5            [11]  225 	push	bc
   0352 CD FF 21      [17]  226 	call	_cpct_drawSolidBox
   0355 F1            [10]  227 	pop	af
                            228 ;src/main.c:103: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   0356 33            [ 6]  229 	inc	sp
   0357 21 09 4F      [10]  230 	ld	hl,#0x4f09
   035A E3            [19]  231 	ex	(sp),hl
   035B 21 00 C0      [10]  232 	ld	hl, #0xc000
   035E E5            [11]  233 	push	hl
   035F CD D1 22      [17]  234 	call	_cpct_getScreenPtr
                            235 ;src/main.c:104: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   0362 01 ED 04      [10]  236 	ld	bc, #_g_tile_schtroumpf+0
   0365 11 10 20      [10]  237 	ld	de, #0x2010
   0368 D5            [11]  238 	push	de
   0369 E5            [11]  239 	push	hl
   036A C5            [11]  240 	push	bc
   036B CD C9 20      [17]  241 	call	_cpct_drawSpriteMasked
                            242 ;src/main.c:106: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,120-1);
   036E 21 09 77      [10]  243 	ld	hl, #0x7709
   0371 E5            [11]  244 	push	hl
   0372 21 00 C0      [10]  245 	ld	hl, #0xc000
   0375 E5            [11]  246 	push	hl
   0376 CD D1 22      [17]  247 	call	_cpct_getScreenPtr
                            248 ;src/main.c:107: cpct_drawSprite(g_tile_fontmap20x22_00, p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   0379 01 ED 08      [10]  249 	ld	bc, #_g_tile_fontmap20x22_00+0
   037C 11 0A 16      [10]  250 	ld	de, #0x160a
   037F D5            [11]  251 	push	de
   0380 E5            [11]  252 	push	hl
   0381 C5            [11]  253 	push	bc
   0382 CD E7 1F      [17]  254 	call	_cpct_drawSprite
                            255 ;src/main.c:117: cpct_srand(77);
   0385 21 4D 00      [10]  256 	ld	hl,#0x004d
   0388 11 00 00      [10]  257 	ld	de,#0x0000
   038B CD 96 20      [17]  258 	call	_cpct_setSeed_mxor
   038E CD 9E 20      [17]  259 	call	_cpct_restoreState_mxor_u8
                            260 ;src/main.c:121: cpct_scanKeyboard_f();
   0391 CD 68 1F      [17]  261 	call	_cpct_scanKeyboard_f
                            262 ;src/main.c:122: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   0394                     263 00102$:
   0394 21 00 40      [10]  264 	ld	hl, #0x4000
   0397 CD 5C 1F      [17]  265 	call	_cpct_isKeyPressed
   039A 7D            [ 4]  266 	ld	a, l
   039B B7            [ 4]  267 	or	a, a
   039C 20 0F         [12]  268 	jr	NZ,00104$
   039E 21 02 04      [10]  269 	ld	hl, #0x0402
   03A1 CD 5C 1F      [17]  270 	call	_cpct_isKeyPressed
   03A4 7D            [ 4]  271 	ld	a, l
   03A5 B7            [ 4]  272 	or	a, a
   03A6 20 05         [12]  273 	jr	NZ,00104$
                            274 ;src/main.c:123: cpct_scanKeyboard_f();
   03A8 CD 68 1F      [17]  275 	call	_cpct_scanKeyboard_f
   03AB 18 E7         [12]  276 	jr	00102$
   03AD                     277 00104$:
                            278 ;src/main.c:127: akp_musicInit();
   03AD CD 8D 01      [17]  279 	call	_akp_musicInit
                            280 ;src/main.c:131: cpct_setVideoMemoryOffset(0);
   03B0 2E 00         [ 7]  281 	ld	l, #0x00
   03B2 CD DE 1F      [17]  282 	call	_cpct_setVideoMemoryOffset
                            283 ;src/main.c:132: calque4000();
   03B5 CD 5B 04      [17]  284 	call	_calque4000
                            285 ;src/main.c:134: cpct_setInterruptHandler(myInterruptHandler);
   03B8 21 78 02      [10]  286 	ld	hl, #_myInterruptHandler
   03BB CD F1 22      [17]  287 	call	_cpct_setInterruptHandler
                            288 ;src/main.c:135: while (1) {
   03BE                     289 00108$:
                            290 ;src/main.c:136: cpct_scanKeyboard_f();
   03BE CD 68 1F      [17]  291 	call	_cpct_scanKeyboard_f
                            292 ;src/main.c:137: if (cpct_isKeyPressed(Key_Space)) {
   03C1 21 05 80      [10]  293 	ld	hl, #0x8005
   03C4 CD 5C 1F      [17]  294 	call	_cpct_isKeyPressed
   03C7 7D            [ 4]  295 	ld	a, l
   03C8 B7            [ 4]  296 	or	a, a
   03C9 28 F3         [12]  297 	jr	Z,00108$
                            298 ;src/main.c:138: akp_sfxPlay();
   03CB CD 58 02      [17]  299 	call	_akp_sfxPlay
   03CE 18 EE         [12]  300 	jr	00108$
                            301 	.area _CODE
                            302 	.area _INITIALIZER
                            303 	.area _CABS (ABS)
