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
                             17 	.globl _cpct_setVideoMemoryOffset
                             18 	.globl _cpct_setPALColour
                             19 	.globl _cpct_setPalette
                             20 	.globl _cpct_setVideoMode
                             21 	.globl _cpct_drawStringM0
                             22 	.globl _cpct_drawCharM0
                             23 	.globl _cpct_hflipSpriteM0
                             24 	.globl _cpct_drawSolidBox
                             25 	.globl _cpct_drawSpriteMasked
                             26 	.globl _cpct_drawSprite
                             27 	.globl _cpct_px2byteM0
                             28 	.globl _cpct_isKeyPressed
                             29 	.globl _cpct_scanKeyboard_f
                             30 	.globl _cpct_memset_f64
                             31 	.globl _cpct_setInterruptHandler
                             32 	.globl _cpct_disableFirmware
                             33 	.globl _g_items_0
                             34 ;--------------------------------------------------------
                             35 ; special function registers
                             36 ;--------------------------------------------------------
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DATA
   49F0                      41 _myInterruptHandler_i_1_78:
   49F0                      42 	.ds 1
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _INITIALIZED
                             47 ;--------------------------------------------------------
                             48 ; absolute external ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DABS (ABS)
                             51 ;--------------------------------------------------------
                             52 ; global & static initialisations
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _GSINIT
                             56 	.area _GSFINAL
                             57 	.area _GSINIT
                             58 ;--------------------------------------------------------
                             59 ; Home
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _HOME
                             63 ;--------------------------------------------------------
                             64 ; code
                             65 ;--------------------------------------------------------
                             66 	.area _CODE
                             67 ;src/main.c:35: void myInterruptHandler() {
                             68 ;	---------------------------------
                             69 ; Function myInterruptHandler
                             70 ; ---------------------------------
   4000                      71 _myInterruptHandler::
                             72 ;src/main.c:37: cpct_setBorder(i+1);
   4000 21 F0 49      [10]   73 	ld	hl,#_myInterruptHandler_i_1_78 + 0
   4003 46            [ 7]   74 	ld	b, (hl)
   4004 04            [ 4]   75 	inc	b
   4005 C5            [11]   76 	push	bc
   4006 33            [ 6]   77 	inc	sp
   4007 3E 10         [ 7]   78 	ld	a, #0x10
   4009 F5            [11]   79 	push	af
   400A 33            [ 6]   80 	inc	sp
   400B CD 1B 46      [17]   81 	call	_cpct_setPALColour
                             82 ;src/main.c:38: if (++i > 5) i=0;
   400E FD 21 F0 49   [14]   83 	ld	iy, #_myInterruptHandler_i_1_78
   4012 FD 34 00      [23]   84 	inc	0 (iy)
   4015 3E 05         [ 7]   85 	ld	a, #0x05
   4017 FD 96 00      [19]   86 	sub	a, 0 (iy)
   401A D0            [11]   87 	ret	NC
   401B FD 36 00 00   [19]   88 	ld	0 (iy), #0x00
   401F C9            [10]   89 	ret
   4020                      90 _g_items_0:
   4020 05                   91 	.db #0x05	; 5
   4021 0F                   92 	.db #0x0f	; 15
   4022 0F                   93 	.db #0x0f	; 15
   4023 00                   94 	.db #0x00	; 0
   4024 0F                   95 	.db #0x0f	; 15
   4025 0F                   96 	.db #0x0f	; 15
   4026 0F                   97 	.db #0x0f	; 15
   4027 0A                   98 	.db #0x0a	; 10
   4028 0F                   99 	.db #0x0f	; 15
   4029 0A                  100 	.db #0x0a	; 10
   402A 05                  101 	.db #0x05	; 5
   402B 00                  102 	.db #0x00	; 0
   402C 0F                  103 	.db #0x0f	; 15
   402D 0A                  104 	.db #0x0a	; 10
   402E 05                  105 	.db #0x05	; 5
   402F 00                  106 	.db #0x00	; 0
   4030 05                  107 	.db #0x05	; 5
   4031 0F                  108 	.db #0x0f	; 15
   4032 0A                  109 	.db #0x0a	; 10
   4033 0A                  110 	.db #0x0a	; 10
   4034 00                  111 	.db #0x00	; 0
   4035 0F                  112 	.db #0x0f	; 15
   4036 0F                  113 	.db #0x0f	; 15
   4037 0A                  114 	.db #0x0a	; 10
   4038 00                  115 	.db #0x00	; 0
   4039 0A                  116 	.db #0x0a	; 10
   403A 0A                  117 	.db #0x0a	; 10
   403B 0A                  118 	.db #0x0a	; 10
   403C 00                  119 	.db #0x00	; 0
   403D 00                  120 	.db #0x00	; 0
   403E 00                  121 	.db #0x00	; 0
   403F 00                  122 	.db #0x00	; 0
                            123 ;src/main.c:41: void main(void) {
                            124 ;	---------------------------------
                            125 ; Function main
                            126 ; ---------------------------------
   4040                     127 _main::
                            128 ;src/main.c:44: u8* sprite=g_items_0;
                            129 ;src/main.c:48: cpct_disableFirmware();
   4040 CD DB 48      [17]  130 	call	_cpct_disableFirmware
                            131 ;src/main.c:51: cpct_clearScreen_f64(0);
   4043 21 00 40      [10]  132 	ld	hl, #0x4000
   4046 E5            [11]  133 	push	hl
   4047 26 00         [ 7]  134 	ld	h, #0x00
   4049 E5            [11]  135 	push	hl
   404A 26 C0         [ 7]  136 	ld	h, #0xc0
   404C E5            [11]  137 	push	hl
   404D CD F2 47      [17]  138 	call	_cpct_memset_f64
                            139 ;src/main.c:52: cpct_setVideoMode(0);
   4050 2E 00         [ 7]  140 	ld	l, #0x00
   4052 CD A1 48      [17]  141 	call	_cpct_setVideoMode
                            142 ;src/main.c:53: cpct_setBorder(HW_BLACK);
   4055 21 10 14      [10]  143 	ld	hl, #0x1410
   4058 E5            [11]  144 	push	hl
   4059 CD 1B 46      [17]  145 	call	_cpct_setPALColour
                            146 ;src/main.c:54: cpct_setPalette(g_tile_palette, 6);
   405C 21 06 00      [10]  147 	ld	hl, #0x0006
   405F E5            [11]  148 	push	hl
   4060 21 88 41      [10]  149 	ld	hl, #_g_tile_palette
   4063 E5            [11]  150 	push	hl
   4064 CD 8E 45      [17]  151 	call	_cpct_setPalette
                            152 ;src/main.c:57: cpct_setVideoMemoryOffset(3);
   4067 2E 03         [ 7]  153 	ld	l, #0x03
   4069 CD 4B 46      [17]  154 	call	_cpct_setVideoMemoryOffset
                            155 ;src/main.c:60: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   406C 21 0F 0F      [10]  156 	ld	hl, #0x0f0f
   406F E5            [11]  157 	push	hl
   4070 21 00 C0      [10]  158 	ld	hl, #0xc000
   4073 E5            [11]  159 	push	hl
   4074 CD A4 49      [17]  160 	call	_cpct_getScreenPtr
                            161 ;src/main.c:61: cpct_drawSprite(sprite, p, 4, 8);
   4077 E5            [11]  162 	push	hl
   4078 01 04 08      [10]  163 	ld	bc, #0x0804
   407B C5            [11]  164 	push	bc
   407C E5            [11]  165 	push	hl
   407D 01 20 40      [10]  166 	ld	bc, #_g_items_0
   4080 C5            [11]  167 	push	bc
   4081 CD 54 46      [17]  168 	call	_cpct_drawSprite
   4084 01 00 40      [10]  169 	ld	bc, #0x4000
   4087 C5            [11]  170 	push	bc
   4088 01 FF FF      [10]  171 	ld	bc, #0xffff
   408B C5            [11]  172 	push	bc
   408C 01 00 C0      [10]  173 	ld	bc, #0xc000
   408F C5            [11]  174 	push	bc
   4090 CD F2 47      [17]  175 	call	_cpct_memset_f64
   4093 01 20 40      [10]  176 	ld	bc, #_g_items_0
   4096 C5            [11]  177 	push	bc
   4097 01 04 08      [10]  178 	ld	bc, #0x0804
   409A C5            [11]  179 	push	bc
   409B CD 5D 48      [17]  180 	call	_cpct_hflipSpriteM0
   409E E1            [10]  181 	pop	hl
                            182 ;src/main.c:68: cpct_drawSprite(sprite, p, 4, 8);
   409F 01 04 08      [10]  183 	ld	bc, #0x0804
   40A2 C5            [11]  184 	push	bc
   40A3 E5            [11]  185 	push	hl
   40A4 21 20 40      [10]  186 	ld	hl, #_g_items_0
   40A7 E5            [11]  187 	push	hl
   40A8 CD 54 46      [17]  188 	call	_cpct_drawSprite
                            189 ;src/main.c:70: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   40AB 21 0F 1F      [10]  190 	ld	hl, #0x1f0f
   40AE E5            [11]  191 	push	hl
   40AF 21 00 C0      [10]  192 	ld	hl, #0xc000
   40B2 E5            [11]  193 	push	hl
   40B3 CD A4 49      [17]  194 	call	_cpct_getScreenPtr
                            195 ;src/main.c:71: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   40B6 E5            [11]  196 	push	hl
   40B7 21 02 03      [10]  197 	ld	hl, #0x0302
   40BA E5            [11]  198 	push	hl
   40BB CD BF 48      [17]  199 	call	_cpct_px2byteM0
   40BE 55            [ 4]  200 	ld	d, l
   40BF C1            [10]  201 	pop	bc
   40C0 21 0A 14      [10]  202 	ld	hl, #0x140a
   40C3 E5            [11]  203 	push	hl
   40C4 D5            [11]  204 	push	de
   40C5 33            [ 6]  205 	inc	sp
   40C6 C5            [11]  206 	push	bc
   40C7 CD EB 48      [17]  207 	call	_cpct_drawSolidBox
   40CA F1            [10]  208 	pop	af
                            209 ;src/main.c:74: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   40CB 33            [ 6]  210 	inc	sp
   40CC 21 14 58      [10]  211 	ld	hl,#0x5814
   40CF E3            [19]  212 	ex	(sp),hl
   40D0 21 00 C0      [10]  213 	ld	hl, #0xc000
   40D3 E5            [11]  214 	push	hl
   40D4 CD A4 49      [17]  215 	call	_cpct_getScreenPtr
                            216 ;src/main.c:75: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   40D7 01 6B 41      [10]  217 	ld	bc, #___str_0+0
   40DA 11 02 00      [10]  218 	ld	de, #0x0002
   40DD D5            [11]  219 	push	de
   40DE E5            [11]  220 	push	hl
   40DF C5            [11]  221 	push	bc
   40E0 CD 27 46      [17]  222 	call	_cpct_drawStringM0
   40E3 21 06 00      [10]  223 	ld	hl, #6
   40E6 39            [11]  224 	add	hl, sp
   40E7 F9            [ 6]  225 	ld	sp, hl
                            226 ;src/main.c:78: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   40E8 21 09 4F      [10]  227 	ld	hl, #0x4f09
   40EB E5            [11]  228 	push	hl
   40EC 21 00 C0      [10]  229 	ld	hl, #0xc000
   40EF E5            [11]  230 	push	hl
   40F0 CD A4 49      [17]  231 	call	_cpct_getScreenPtr
                            232 ;src/main.c:79: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   40F3 01 8E 41      [10]  233 	ld	bc, #_g_tile_schtroumpf+0
   40F6 11 10 20      [10]  234 	ld	de, #0x2010
   40F9 D5            [11]  235 	push	de
   40FA E5            [11]  236 	push	hl
   40FB C5            [11]  237 	push	bc
   40FC CD C3 47      [17]  238 	call	_cpct_drawSpriteMasked
                            239 ;src/main.c:81: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
   40FF 21 0A 96      [10]  240 	ld	hl, #0x960a
   4102 E5            [11]  241 	push	hl
   4103 21 00 C0      [10]  242 	ld	hl, #0xc000
   4106 E5            [11]  243 	push	hl
   4107 CD A4 49      [17]  244 	call	_cpct_getScreenPtr
                            245 ;src/main.c:82: cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
   410A 01 7B 41      [10]  246 	ld	bc, #___str_1+0
   410D 11 03 02      [10]  247 	ld	de, #0x0203
   4110 D5            [11]  248 	push	de
   4111 E5            [11]  249 	push	hl
   4112 C5            [11]  250 	push	bc
   4113 CD 27 46      [17]  251 	call	_cpct_drawStringM0
   4116 21 06 00      [10]  252 	ld	hl, #6
   4119 39            [11]  253 	add	hl, sp
   411A F9            [ 6]  254 	ld	sp, hl
                            255 ;src/main.c:84: cpct_srand(77);
   411B 21 4D 00      [10]  256 	ld	hl,#0x004d
   411E 11 00 00      [10]  257 	ld	de,#0x0000
   4121 CD 90 47      [17]  258 	call	_cpct_setSeed_mxor
   4124 CD 98 47      [17]  259 	call	_cpct_restoreState_mxor_u8
                            260 ;src/main.c:86: cpct_scanKeyboard_f();
   4127 CD B1 45      [17]  261 	call	_cpct_scanKeyboard_f
                            262 ;src/main.c:87: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   412A                     263 00102$:
   412A 21 00 40      [10]  264 	ld	hl, #0x4000
   412D CD A5 45      [17]  265 	call	_cpct_isKeyPressed
   4130 7D            [ 4]  266 	ld	a, l
   4131 B7            [ 4]  267 	or	a, a
   4132 20 2F         [12]  268 	jr	NZ,00104$
   4134 21 02 04      [10]  269 	ld	hl, #0x0402
   4137 CD A5 45      [17]  270 	call	_cpct_isKeyPressed
   413A 7D            [ 4]  271 	ld	a, l
   413B B7            [ 4]  272 	or	a, a
   413C 20 25         [12]  273 	jr	NZ,00104$
                            274 ;src/main.c:88: p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   413E 21 07 5E      [10]  275 	ld	hl, #0x5e07
   4141 E5            [11]  276 	push	hl
   4142 21 00 C0      [10]  277 	ld	hl, #0xc000
   4145 E5            [11]  278 	push	hl
   4146 CD A4 49      [17]  279 	call	_cpct_getScreenPtr
                            280 ;src/main.c:89: cpct_drawCharM0(p, 2,0, cpct_rand());
   4149 E5            [11]  281 	push	hl
   414A CD 9E 47      [17]  282 	call	_cpct_getRandom_mxor_u8
   414D 55            [ 4]  283 	ld	d, l
   414E E1            [10]  284 	pop	hl
   414F 4D            [ 4]  285 	ld	c, l
   4150 44            [ 4]  286 	ld	b, h
   4151 D5            [11]  287 	push	de
   4152 33            [ 6]  288 	inc	sp
   4153 21 02 00      [10]  289 	ld	hl, #0x0002
   4156 E5            [11]  290 	push	hl
   4157 C5            [11]  291 	push	bc
   4158 CD F9 46      [17]  292 	call	_cpct_drawCharM0
   415B F1            [10]  293 	pop	af
   415C F1            [10]  294 	pop	af
   415D 33            [ 6]  295 	inc	sp
                            296 ;src/main.c:90: cpct_scanKeyboard_f();
   415E CD B1 45      [17]  297 	call	_cpct_scanKeyboard_f
   4161 18 C7         [12]  298 	jr	00102$
   4163                     299 00104$:
                            300 ;src/main.c:92: cpct_setInterruptHandler(myInterruptHandler);
   4163 21 00 40      [10]  301 	ld	hl, #_myInterruptHandler
   4166 CD C4 49      [17]  302 	call	_cpct_setInterruptHandler
                            303 ;src/main.c:93: while (1) {}
   4169                     304 00106$:
   4169 18 FE         [12]  305 	jr	00106$
   416B                     306 ___str_0:
   416B 57 65 6C 63 6F 6D   307 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   417A 00                  308 	.db 0x00
   417B                     309 ___str_1:
   417B 50 72 65 73 73 20   310 	.ascii "Press ENTER."
        45 4E 54 45 52 2E
   4187 00                  311 	.db 0x00
                            312 	.area _CODE
                            313 	.area _INITIALIZER
                            314 	.area _CABS (ABS)
