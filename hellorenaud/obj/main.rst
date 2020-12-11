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
                             13 	.globl _bank0123
                             14 	.globl _calque4000
                             15 	.globl _calqueC000
                             16 	.globl _raster_halt
                             17 	.globl _cpct_restoreState_mxor_u8
                             18 	.globl _cpct_setSeed_mxor
                             19 	.globl _cpct_getRandom_mxor_u8
                             20 	.globl _cpct_getScreenPtr
                             21 	.globl _cpct_setVideoMemoryOffset
                             22 	.globl _cpct_setPALColour
                             23 	.globl _cpct_setPalette
                             24 	.globl _cpct_setVideoMode
                             25 	.globl _cpct_drawStringM0
                             26 	.globl _cpct_drawCharM0
                             27 	.globl _cpct_hflipSpriteM0
                             28 	.globl _cpct_drawSolidBox
                             29 	.globl _cpct_drawSpriteMasked
                             30 	.globl _cpct_drawSprite
                             31 	.globl _cpct_px2byteM0
                             32 	.globl _cpct_isKeyPressed
                             33 	.globl _cpct_scanKeyboard_f
                             34 	.globl _cpct_setStackLocation
                             35 	.globl _cpct_memset_f64
                             36 	.globl _cpct_setInterruptHandler
                             37 	.globl _g_items_0
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   6CDF                      45 _myInterruptHandler_i_1_80:
   6CDF                      46 	.ds 1
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
   6124                      75 _myInterruptHandler::
                             76 ;src/main.c:45: cpct_setBorder(i+1);
   6124 21 DF 6C      [10]   77 	ld	hl,#_myInterruptHandler_i_1_80 + 0
   6127 46            [ 7]   78 	ld	b, (hl)
   6128 04            [ 4]   79 	inc	b
   6129 C5            [11]   80 	push	bc
   612A 33            [ 6]   81 	inc	sp
   612B 3E 10         [ 7]   82 	ld	a, #0x10
   612D F5            [11]   83 	push	af
   612E 33            [ 6]   84 	inc	sp
   612F CD 62 68      [17]   85 	call	_cpct_setPALColour
                             86 ;src/main.c:46: if (++i > 5) i=0;
   6132 FD 21 DF 6C   [14]   87 	ld	iy, #_myInterruptHandler_i_1_80
   6136 FD 34 00      [23]   88 	inc	0 (iy)
   6139 3E 05         [ 7]   89 	ld	a, #0x05
   613B FD 96 00      [19]   90 	sub	a, 0 (iy)
   613E D0            [11]   91 	ret	NC
   613F FD 36 00 00   [19]   92 	ld	0 (iy), #0x00
   6143 C9            [10]   93 	ret
   6144                      94 _g_items_0:
   6144 05                   95 	.db #0x05	; 5
   6145 0F                   96 	.db #0x0f	; 15
   6146 0F                   97 	.db #0x0f	; 15
   6147 00                   98 	.db #0x00	; 0
   6148 0F                   99 	.db #0x0f	; 15
   6149 0F                  100 	.db #0x0f	; 15
   614A 0F                  101 	.db #0x0f	; 15
   614B 0A                  102 	.db #0x0a	; 10
   614C 0F                  103 	.db #0x0f	; 15
   614D 0A                  104 	.db #0x0a	; 10
   614E 05                  105 	.db #0x05	; 5
   614F 00                  106 	.db #0x00	; 0
   6150 0F                  107 	.db #0x0f	; 15
   6151 0A                  108 	.db #0x0a	; 10
   6152 05                  109 	.db #0x05	; 5
   6153 00                  110 	.db #0x00	; 0
   6154 05                  111 	.db #0x05	; 5
   6155 0F                  112 	.db #0x0f	; 15
   6156 0A                  113 	.db #0x0a	; 10
   6157 0A                  114 	.db #0x0a	; 10
   6158 00                  115 	.db #0x00	; 0
   6159 0F                  116 	.db #0x0f	; 15
   615A 0F                  117 	.db #0x0f	; 15
   615B 0A                  118 	.db #0x0a	; 10
   615C 00                  119 	.db #0x00	; 0
   615D 0A                  120 	.db #0x0a	; 10
   615E 0A                  121 	.db #0x0a	; 10
   615F 0A                  122 	.db #0x0a	; 10
   6160 00                  123 	.db #0x00	; 0
   6161 00                  124 	.db #0x00	; 0
   6162 00                  125 	.db #0x00	; 0
   6163 00                  126 	.db #0x00	; 0
                            127 ;src/main.c:55: void main(void) {
                            128 ;	---------------------------------
                            129 ; Function main
                            130 ; ---------------------------------
   6164                     131 _main::
                            132 ;src/main.c:58: u8* sprite=g_items_0;
                            133 ;src/main.c:71: raster_halt();
   6164 CD BC 62      [17]  134 	call	_raster_halt
                            135 ;src/main.c:72: cpct_setStackLocation(0x8000);
   6167 21 00 80      [10]  136 	ld	hl, #0x8000
   616A CD 81 6A      [17]  137 	call	_cpct_setStackLocation
                            138 ;src/main.c:77: bank0123();
   616D CD 4F 63      [17]  139 	call	_bank0123
                            140 ;src/main.c:78: calque4000();
   6170 CD 39 63      [17]  141 	call	_calque4000
                            142 ;src/main.c:82: cpct_setVideoMode(0);
   6173 2E 00         [ 7]  143 	ld	l, #0x00
   6175 CD ED 6A      [17]  144 	call	_cpct_setVideoMode
                            145 ;src/main.c:84: cpct_setBorder(HW_BLACK);
   6178 21 10 14      [10]  146 	ld	hl, #0x1410
   617B E5            [11]  147 	push	hl
   617C CD 62 68      [17]  148 	call	_cpct_setPALColour
                            149 ;src/main.c:85: cpct_setPalette(g_tile_palette, 16);
   617F 21 10 00      [10]  150 	ld	hl, #0x0010
   6182 E5            [11]  151 	push	hl
   6183 21 C5 63      [10]  152 	ld	hl, #_g_tile_palette
   6186 E5            [11]  153 	push	hl
   6187 CD D5 67      [17]  154 	call	_cpct_setPalette
                            155 ;src/main.c:89: cpct_setVideoMemoryOffset(3);
   618A 2E 03         [ 7]  156 	ld	l, #0x03
   618C CD 92 68      [17]  157 	call	_cpct_setVideoMemoryOffset
                            158 ;src/main.c:92: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   618F 21 0F 0F      [10]  159 	ld	hl, #0x0f0f
   6192 E5            [11]  160 	push	hl
   6193 21 00 C0      [10]  161 	ld	hl, #0xc000
   6196 E5            [11]  162 	push	hl
   6197 CD 08 6C      [17]  163 	call	_cpct_getScreenPtr
                            164 ;src/main.c:93: cpct_drawSprite(sprite, p, 4, 8);
   619A E5            [11]  165 	push	hl
   619B 01 04 08      [10]  166 	ld	bc, #0x0804
   619E C5            [11]  167 	push	bc
   619F E5            [11]  168 	push	hl
   61A0 01 44 61      [10]  169 	ld	bc, #_g_items_0
   61A3 C5            [11]  170 	push	bc
   61A4 CD 9B 68      [17]  171 	call	_cpct_drawSprite
   61A7 01 00 20      [10]  172 	ld	bc, #0x2000
   61AA C5            [11]  173 	push	bc
   61AB 01 FF FF      [10]  174 	ld	bc, #0xffff
   61AE C5            [11]  175 	push	bc
   61AF 01 00 C0      [10]  176 	ld	bc, #0xc000
   61B2 C5            [11]  177 	push	bc
   61B3 CD 39 6A      [17]  178 	call	_cpct_memset_f64
   61B6 01 44 61      [10]  179 	ld	bc, #_g_items_0
   61B9 C5            [11]  180 	push	bc
   61BA 01 04 08      [10]  181 	ld	bc, #0x0804
   61BD C5            [11]  182 	push	bc
   61BE CD A9 6A      [17]  183 	call	_cpct_hflipSpriteM0
   61C1 E1            [10]  184 	pop	hl
                            185 ;src/main.c:101: cpct_drawSprite(sprite, p, 4, 8);
   61C2 01 04 08      [10]  186 	ld	bc, #0x0804
   61C5 C5            [11]  187 	push	bc
   61C6 E5            [11]  188 	push	hl
   61C7 21 44 61      [10]  189 	ld	hl, #_g_items_0
   61CA E5            [11]  190 	push	hl
   61CB CD 9B 68      [17]  191 	call	_cpct_drawSprite
                            192 ;src/main.c:103: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   61CE 21 0F 1F      [10]  193 	ld	hl, #0x1f0f
   61D1 E5            [11]  194 	push	hl
   61D2 21 00 C0      [10]  195 	ld	hl, #0xc000
   61D5 E5            [11]  196 	push	hl
   61D6 CD 08 6C      [17]  197 	call	_cpct_getScreenPtr
                            198 ;src/main.c:104: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   61D9 E5            [11]  199 	push	hl
   61DA 21 02 03      [10]  200 	ld	hl, #0x0302
   61DD E5            [11]  201 	push	hl
   61DE CD 0B 6B      [17]  202 	call	_cpct_px2byteM0
   61E1 55            [ 4]  203 	ld	d, l
   61E2 C1            [10]  204 	pop	bc
   61E3 21 0A 14      [10]  205 	ld	hl, #0x140a
   61E6 E5            [11]  206 	push	hl
   61E7 D5            [11]  207 	push	de
   61E8 33            [ 6]  208 	inc	sp
   61E9 C5            [11]  209 	push	bc
   61EA CD 36 6B      [17]  210 	call	_cpct_drawSolidBox
   61ED F1            [10]  211 	pop	af
                            212 ;src/main.c:107: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   61EE 33            [ 6]  213 	inc	sp
   61EF 21 14 58      [10]  214 	ld	hl,#0x5814
   61F2 E3            [19]  215 	ex	(sp),hl
   61F3 21 00 C0      [10]  216 	ld	hl, #0xc000
   61F6 E5            [11]  217 	push	hl
   61F7 CD 08 6C      [17]  218 	call	_cpct_getScreenPtr
                            219 ;src/main.c:108: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   61FA 01 91 62      [10]  220 	ld	bc, #___str_0+0
   61FD 11 02 00      [10]  221 	ld	de, #0x0002
   6200 D5            [11]  222 	push	de
   6201 E5            [11]  223 	push	hl
   6202 C5            [11]  224 	push	bc
   6203 CD 6E 68      [17]  225 	call	_cpct_drawStringM0
   6206 21 06 00      [10]  226 	ld	hl, #6
   6209 39            [11]  227 	add	hl, sp
   620A F9            [ 6]  228 	ld	sp, hl
                            229 ;src/main.c:111: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   620B 21 09 4F      [10]  230 	ld	hl, #0x4f09
   620E E5            [11]  231 	push	hl
   620F 21 00 C0      [10]  232 	ld	hl, #0xc000
   6212 E5            [11]  233 	push	hl
   6213 CD 08 6C      [17]  234 	call	_cpct_getScreenPtr
                            235 ;src/main.c:112: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   6216 01 D5 63      [10]  236 	ld	bc, #_g_tile_schtroumpf+0
   6219 11 10 20      [10]  237 	ld	de, #0x2010
   621C D5            [11]  238 	push	de
   621D E5            [11]  239 	push	hl
   621E C5            [11]  240 	push	bc
   621F CD 0A 6A      [17]  241 	call	_cpct_drawSpriteMasked
                            242 ;src/main.c:114: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
   6222 21 0A 96      [10]  243 	ld	hl, #0x960a
   6225 E5            [11]  244 	push	hl
   6226 21 00 C0      [10]  245 	ld	hl, #0xc000
   6229 E5            [11]  246 	push	hl
   622A CD 08 6C      [17]  247 	call	_cpct_getScreenPtr
                            248 ;src/main.c:115: cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
   622D 01 A1 62      [10]  249 	ld	bc, #___str_1+0
   6230 11 03 02      [10]  250 	ld	de, #0x0203
   6233 D5            [11]  251 	push	de
   6234 E5            [11]  252 	push	hl
   6235 C5            [11]  253 	push	bc
   6236 CD 6E 68      [17]  254 	call	_cpct_drawStringM0
   6239 21 06 00      [10]  255 	ld	hl, #6
   623C 39            [11]  256 	add	hl, sp
   623D F9            [ 6]  257 	ld	sp, hl
                            258 ;src/main.c:117: cpct_srand(77);
   623E 21 4D 00      [10]  259 	ld	hl,#0x004d
   6241 11 00 00      [10]  260 	ld	de,#0x0000
   6244 CD D7 69      [17]  261 	call	_cpct_setSeed_mxor
   6247 CD DF 69      [17]  262 	call	_cpct_restoreState_mxor_u8
                            263 ;src/main.c:124: cpct_scanKeyboard_f();
   624A CD F8 67      [17]  264 	call	_cpct_scanKeyboard_f
                            265 ;src/main.c:125: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   624D                     266 00102$:
   624D 21 00 40      [10]  267 	ld	hl, #0x4000
   6250 CD EC 67      [17]  268 	call	_cpct_isKeyPressed
   6253 7D            [ 4]  269 	ld	a, l
   6254 B7            [ 4]  270 	or	a, a
   6255 20 2F         [12]  271 	jr	NZ,00104$
   6257 21 02 04      [10]  272 	ld	hl, #0x0402
   625A CD EC 67      [17]  273 	call	_cpct_isKeyPressed
   625D 7D            [ 4]  274 	ld	a, l
   625E B7            [ 4]  275 	or	a, a
   625F 20 25         [12]  276 	jr	NZ,00104$
                            277 ;src/main.c:126: p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   6261 21 07 5E      [10]  278 	ld	hl, #0x5e07
   6264 E5            [11]  279 	push	hl
   6265 21 00 C0      [10]  280 	ld	hl, #0xc000
   6268 E5            [11]  281 	push	hl
   6269 CD 08 6C      [17]  282 	call	_cpct_getScreenPtr
                            283 ;src/main.c:127: cpct_drawCharM0(p, 2,0, cpct_rand());
   626C E5            [11]  284 	push	hl
   626D CD E5 69      [17]  285 	call	_cpct_getRandom_mxor_u8
   6270 55            [ 4]  286 	ld	d, l
   6271 E1            [10]  287 	pop	hl
   6272 4D            [ 4]  288 	ld	c, l
   6273 44            [ 4]  289 	ld	b, h
   6274 D5            [11]  290 	push	de
   6275 33            [ 6]  291 	inc	sp
   6276 21 02 00      [10]  292 	ld	hl, #0x0002
   6279 E5            [11]  293 	push	hl
   627A C5            [11]  294 	push	bc
   627B CD 40 69      [17]  295 	call	_cpct_drawCharM0
   627E F1            [10]  296 	pop	af
   627F F1            [10]  297 	pop	af
   6280 33            [ 6]  298 	inc	sp
                            299 ;src/main.c:128: cpct_scanKeyboard_f();
   6281 CD F8 67      [17]  300 	call	_cpct_scanKeyboard_f
   6284 18 C7         [12]  301 	jr	00102$
   6286                     302 00104$:
                            303 ;src/main.c:130: calqueC000();
   6286 CD 2E 63      [17]  304 	call	_calqueC000
                            305 ;src/main.c:131: cpct_setInterruptHandler(myInterruptHandler);
   6289 21 24 61      [10]  306 	ld	hl, #_myInterruptHandler
   628C CD 28 6C      [17]  307 	call	_cpct_setInterruptHandler
                            308 ;src/main.c:132: while (1) {}
   628F                     309 00106$:
   628F 18 FE         [12]  310 	jr	00106$
   6291                     311 ___str_0:
   6291 57 65 6C 63 6F 6D   312 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   62A0 00                  313 	.db 0x00
   62A1                     314 ___str_1:
   62A1 50 72 65 73 73 20   315 	.ascii "Press ENTER."
        45 4E 54 45 52 2E
   62AD 00                  316 	.db 0x00
                            317 	.area _CODE
                            318 	.area _INITIALIZER
                            319 	.area _CABS (ABS)
