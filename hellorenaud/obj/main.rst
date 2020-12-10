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
   4AF3                      41 _myInterruptHandler_i_1_79:
   4AF3                      42 	.ds 1
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
                             67 ;src/main.c:41: void myInterruptHandler() {
                             68 ;	---------------------------------
                             69 ; Function myInterruptHandler
                             70 ; ---------------------------------
   40F2                      71 _myInterruptHandler::
                             72 ;src/main.c:45: cpct_setBorder(i+1);
   40F2 21 F3 4A      [10]   73 	ld	hl,#_myInterruptHandler_i_1_79 + 0
   40F5 46            [ 7]   74 	ld	b, (hl)
   40F6 04            [ 4]   75 	inc	b
   40F7 C5            [11]   76 	push	bc
   40F8 33            [ 6]   77 	inc	sp
   40F9 3E 10         [ 7]   78 	ld	a, #0x10
   40FB F5            [11]   79 	push	af
   40FC 33            [ 6]   80 	inc	sp
   40FD CD 0D 47      [17]   81 	call	_cpct_setPALColour
                             82 ;src/main.c:46: if (++i > 5) i=0;
   4100 FD 21 F3 4A   [14]   83 	ld	iy, #_myInterruptHandler_i_1_79
   4104 FD 34 00      [23]   84 	inc	0 (iy)
   4107 3E 05         [ 7]   85 	ld	a, #0x05
   4109 FD 96 00      [19]   86 	sub	a, 0 (iy)
   410C D0            [11]   87 	ret	NC
   410D FD 36 00 00   [19]   88 	ld	0 (iy), #0x00
   4111 C9            [10]   89 	ret
   4112                      90 _g_items_0:
   4112 05                   91 	.db #0x05	; 5
   4113 0F                   92 	.db #0x0f	; 15
   4114 0F                   93 	.db #0x0f	; 15
   4115 00                   94 	.db #0x00	; 0
   4116 0F                   95 	.db #0x0f	; 15
   4117 0F                   96 	.db #0x0f	; 15
   4118 0F                   97 	.db #0x0f	; 15
   4119 0A                   98 	.db #0x0a	; 10
   411A 0F                   99 	.db #0x0f	; 15
   411B 0A                  100 	.db #0x0a	; 10
   411C 05                  101 	.db #0x05	; 5
   411D 00                  102 	.db #0x00	; 0
   411E 0F                  103 	.db #0x0f	; 15
   411F 0A                  104 	.db #0x0a	; 10
   4120 05                  105 	.db #0x05	; 5
   4121 00                  106 	.db #0x00	; 0
   4122 05                  107 	.db #0x05	; 5
   4123 0F                  108 	.db #0x0f	; 15
   4124 0A                  109 	.db #0x0a	; 10
   4125 0A                  110 	.db #0x0a	; 10
   4126 00                  111 	.db #0x00	; 0
   4127 0F                  112 	.db #0x0f	; 15
   4128 0F                  113 	.db #0x0f	; 15
   4129 0A                  114 	.db #0x0a	; 10
   412A 00                  115 	.db #0x00	; 0
   412B 0A                  116 	.db #0x0a	; 10
   412C 0A                  117 	.db #0x0a	; 10
   412D 0A                  118 	.db #0x0a	; 10
   412E 00                  119 	.db #0x00	; 0
   412F 00                  120 	.db #0x00	; 0
   4130 00                  121 	.db #0x00	; 0
   4131 00                  122 	.db #0x00	; 0
                            123 ;src/main.c:55: void main(void) {
                            124 ;	---------------------------------
                            125 ; Function main
                            126 ; ---------------------------------
   4132                     127 _main::
                            128 ;src/main.c:58: u8* sprite=g_items_0;
                            129 ;src/main.c:62: cpct_disableFirmware();
   4132 CD DC 49      [17]  130 	call	_cpct_disableFirmware
                            131 ;src/main.c:65: cpct_clearScreen_f64(0);
   4135 21 00 40      [10]  132 	ld	hl, #0x4000
   4138 E5            [11]  133 	push	hl
   4139 26 00         [ 7]  134 	ld	h, #0x00
   413B E5            [11]  135 	push	hl
   413C 26 C0         [ 7]  136 	ld	h, #0xc0
   413E E5            [11]  137 	push	hl
   413F CD E4 48      [17]  138 	call	_cpct_memset_f64
                            139 ;src/main.c:66: cpct_setVideoMode(0);
   4142 2E 00         [ 7]  140 	ld	l, #0x00
   4144 CD 93 49      [17]  141 	call	_cpct_setVideoMode
                            142 ;src/main.c:67: cpct_setBorder(HW_BLACK);
   4147 21 10 14      [10]  143 	ld	hl, #0x1410
   414A E5            [11]  144 	push	hl
   414B CD 0D 47      [17]  145 	call	_cpct_setPALColour
                            146 ;src/main.c:68: cpct_setPalette(g_tile_palette, 6);
   414E 21 06 00      [10]  147 	ld	hl, #0x0006
   4151 E5            [11]  148 	push	hl
   4152 21 7A 42      [10]  149 	ld	hl, #_g_tile_palette
   4155 E5            [11]  150 	push	hl
   4156 CD 80 46      [17]  151 	call	_cpct_setPalette
                            152 ;src/main.c:72: cpct_setVideoMemoryOffset(3);
   4159 2E 03         [ 7]  153 	ld	l, #0x03
   415B CD 3D 47      [17]  154 	call	_cpct_setVideoMemoryOffset
                            155 ;src/main.c:75: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   415E 21 0F 0F      [10]  156 	ld	hl, #0x0f0f
   4161 E5            [11]  157 	push	hl
   4162 21 00 C0      [10]  158 	ld	hl, #0xc000
   4165 E5            [11]  159 	push	hl
   4166 CD A5 4A      [17]  160 	call	_cpct_getScreenPtr
                            161 ;src/main.c:76: cpct_drawSprite(sprite, p, 4, 8);
   4169 E5            [11]  162 	push	hl
   416A 01 04 08      [10]  163 	ld	bc, #0x0804
   416D C5            [11]  164 	push	bc
   416E E5            [11]  165 	push	hl
   416F 01 12 41      [10]  166 	ld	bc, #_g_items_0
   4172 C5            [11]  167 	push	bc
   4173 CD 46 47      [17]  168 	call	_cpct_drawSprite
   4176 01 00 40      [10]  169 	ld	bc, #0x4000
   4179 C5            [11]  170 	push	bc
   417A 01 FF FF      [10]  171 	ld	bc, #0xffff
   417D C5            [11]  172 	push	bc
   417E 01 00 C0      [10]  173 	ld	bc, #0xc000
   4181 C5            [11]  174 	push	bc
   4182 CD E4 48      [17]  175 	call	_cpct_memset_f64
   4185 01 12 41      [10]  176 	ld	bc, #_g_items_0
   4188 C5            [11]  177 	push	bc
   4189 01 04 08      [10]  178 	ld	bc, #0x0804
   418C C5            [11]  179 	push	bc
   418D CD 4F 49      [17]  180 	call	_cpct_hflipSpriteM0
   4190 E1            [10]  181 	pop	hl
                            182 ;src/main.c:83: cpct_drawSprite(sprite, p, 4, 8);
   4191 01 04 08      [10]  183 	ld	bc, #0x0804
   4194 C5            [11]  184 	push	bc
   4195 E5            [11]  185 	push	hl
   4196 21 12 41      [10]  186 	ld	hl, #_g_items_0
   4199 E5            [11]  187 	push	hl
   419A CD 46 47      [17]  188 	call	_cpct_drawSprite
                            189 ;src/main.c:85: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   419D 21 0F 1F      [10]  190 	ld	hl, #0x1f0f
   41A0 E5            [11]  191 	push	hl
   41A1 21 00 C0      [10]  192 	ld	hl, #0xc000
   41A4 E5            [11]  193 	push	hl
   41A5 CD A5 4A      [17]  194 	call	_cpct_getScreenPtr
                            195 ;src/main.c:86: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   41A8 E5            [11]  196 	push	hl
   41A9 21 02 03      [10]  197 	ld	hl, #0x0302
   41AC E5            [11]  198 	push	hl
   41AD CD B1 49      [17]  199 	call	_cpct_px2byteM0
   41B0 55            [ 4]  200 	ld	d, l
   41B1 C1            [10]  201 	pop	bc
   41B2 21 0A 14      [10]  202 	ld	hl, #0x140a
   41B5 E5            [11]  203 	push	hl
   41B6 D5            [11]  204 	push	de
   41B7 33            [ 6]  205 	inc	sp
   41B8 C5            [11]  206 	push	bc
   41B9 CD EC 49      [17]  207 	call	_cpct_drawSolidBox
   41BC F1            [10]  208 	pop	af
                            209 ;src/main.c:89: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   41BD 33            [ 6]  210 	inc	sp
   41BE 21 14 58      [10]  211 	ld	hl,#0x5814
   41C1 E3            [19]  212 	ex	(sp),hl
   41C2 21 00 C0      [10]  213 	ld	hl, #0xc000
   41C5 E5            [11]  214 	push	hl
   41C6 CD A5 4A      [17]  215 	call	_cpct_getScreenPtr
                            216 ;src/main.c:90: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   41C9 01 5D 42      [10]  217 	ld	bc, #___str_0+0
   41CC 11 02 00      [10]  218 	ld	de, #0x0002
   41CF D5            [11]  219 	push	de
   41D0 E5            [11]  220 	push	hl
   41D1 C5            [11]  221 	push	bc
   41D2 CD 19 47      [17]  222 	call	_cpct_drawStringM0
   41D5 21 06 00      [10]  223 	ld	hl, #6
   41D8 39            [11]  224 	add	hl, sp
   41D9 F9            [ 6]  225 	ld	sp, hl
                            226 ;src/main.c:93: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   41DA 21 09 4F      [10]  227 	ld	hl, #0x4f09
   41DD E5            [11]  228 	push	hl
   41DE 21 00 C0      [10]  229 	ld	hl, #0xc000
   41E1 E5            [11]  230 	push	hl
   41E2 CD A5 4A      [17]  231 	call	_cpct_getScreenPtr
                            232 ;src/main.c:94: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   41E5 01 80 42      [10]  233 	ld	bc, #_g_tile_schtroumpf+0
   41E8 11 10 20      [10]  234 	ld	de, #0x2010
   41EB D5            [11]  235 	push	de
   41EC E5            [11]  236 	push	hl
   41ED C5            [11]  237 	push	bc
   41EE CD B5 48      [17]  238 	call	_cpct_drawSpriteMasked
                            239 ;src/main.c:96: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
   41F1 21 0A 96      [10]  240 	ld	hl, #0x960a
   41F4 E5            [11]  241 	push	hl
   41F5 21 00 C0      [10]  242 	ld	hl, #0xc000
   41F8 E5            [11]  243 	push	hl
   41F9 CD A5 4A      [17]  244 	call	_cpct_getScreenPtr
                            245 ;src/main.c:97: cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
   41FC 01 6D 42      [10]  246 	ld	bc, #___str_1+0
   41FF 11 03 02      [10]  247 	ld	de, #0x0203
   4202 D5            [11]  248 	push	de
   4203 E5            [11]  249 	push	hl
   4204 C5            [11]  250 	push	bc
   4205 CD 19 47      [17]  251 	call	_cpct_drawStringM0
   4208 21 06 00      [10]  252 	ld	hl, #6
   420B 39            [11]  253 	add	hl, sp
   420C F9            [ 6]  254 	ld	sp, hl
                            255 ;src/main.c:99: cpct_srand(77);
   420D 21 4D 00      [10]  256 	ld	hl,#0x004d
   4210 11 00 00      [10]  257 	ld	de,#0x0000
   4213 CD 82 48      [17]  258 	call	_cpct_setSeed_mxor
   4216 CD 8A 48      [17]  259 	call	_cpct_restoreState_mxor_u8
                            260 ;src/main.c:108: cpct_scanKeyboard_f();
   4219 CD A3 46      [17]  261 	call	_cpct_scanKeyboard_f
                            262 ;src/main.c:109: while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
   421C                     263 00102$:
   421C 21 00 40      [10]  264 	ld	hl, #0x4000
   421F CD 97 46      [17]  265 	call	_cpct_isKeyPressed
   4222 7D            [ 4]  266 	ld	a, l
   4223 B7            [ 4]  267 	or	a, a
   4224 20 2F         [12]  268 	jr	NZ,00104$
   4226 21 02 04      [10]  269 	ld	hl, #0x0402
   4229 CD 97 46      [17]  270 	call	_cpct_isKeyPressed
   422C 7D            [ 4]  271 	ld	a, l
   422D B7            [ 4]  272 	or	a, a
   422E 20 25         [12]  273 	jr	NZ,00104$
                            274 ;src/main.c:110: p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   4230 21 07 5E      [10]  275 	ld	hl, #0x5e07
   4233 E5            [11]  276 	push	hl
   4234 21 00 C0      [10]  277 	ld	hl, #0xc000
   4237 E5            [11]  278 	push	hl
   4238 CD A5 4A      [17]  279 	call	_cpct_getScreenPtr
                            280 ;src/main.c:111: cpct_drawCharM0(p, 2,0, cpct_rand());
   423B E5            [11]  281 	push	hl
   423C CD 90 48      [17]  282 	call	_cpct_getRandom_mxor_u8
   423F 55            [ 4]  283 	ld	d, l
   4240 E1            [10]  284 	pop	hl
   4241 4D            [ 4]  285 	ld	c, l
   4242 44            [ 4]  286 	ld	b, h
   4243 D5            [11]  287 	push	de
   4244 33            [ 6]  288 	inc	sp
   4245 21 02 00      [10]  289 	ld	hl, #0x0002
   4248 E5            [11]  290 	push	hl
   4249 C5            [11]  291 	push	bc
   424A CD EB 47      [17]  292 	call	_cpct_drawCharM0
   424D F1            [10]  293 	pop	af
   424E F1            [10]  294 	pop	af
   424F 33            [ 6]  295 	inc	sp
                            296 ;src/main.c:112: cpct_scanKeyboard_f();
   4250 CD A3 46      [17]  297 	call	_cpct_scanKeyboard_f
   4253 18 C7         [12]  298 	jr	00102$
   4255                     299 00104$:
                            300 ;src/main.c:114: cpct_setInterruptHandler(myInterruptHandler);
   4255 21 F2 40      [10]  301 	ld	hl, #_myInterruptHandler
   4258 CD C5 4A      [17]  302 	call	_cpct_setInterruptHandler
                            303 ;src/main.c:115: while (1) {}
   425B                     304 00106$:
   425B 18 FE         [12]  305 	jr	00106$
   425D                     306 ___str_0:
   425D 57 65 6C 63 6F 6D   307 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   426C 00                  308 	.db 0x00
   426D                     309 ___str_1:
   426D 50 72 65 73 73 20   310 	.ascii "Press ENTER."
        45 4E 54 45 52 2E
   4279 00                  311 	.db 0x00
                            312 	.area _CODE
                            313 	.area _INITIALIZER
                            314 	.area _CABS (ABS)
