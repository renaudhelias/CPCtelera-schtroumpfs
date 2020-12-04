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
                             12 	.globl _cpct_restoreState_mxor_u8
                             13 	.globl _cpct_setSeed_mxor
                             14 	.globl _cpct_getRandom_mxor_u8
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_setPALColour
                             17 	.globl _cpct_setPalette
                             18 	.globl _cpct_setVideoMode
                             19 	.globl _cpct_drawStringM0
                             20 	.globl _cpct_drawCharM0
                             21 	.globl _cpct_hflipSpriteM0
                             22 	.globl _cpct_drawSolidBox
                             23 	.globl _cpct_drawSpriteMasked
                             24 	.globl _cpct_drawSprite
                             25 	.globl _cpct_px2byteM0
                             26 	.globl _cpct_isKeyPressed
                             27 	.globl _cpct_scanKeyboard_f
                             28 	.globl _cpct_memset_f64
                             29 	.globl _cpct_memset
                             30 	.globl _cpct_disableFirmware
                             31 	.globl _g_items_0
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
                             43 ;--------------------------------------------------------
                             44 ; absolute external ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DABS (ABS)
                             47 ;--------------------------------------------------------
                             48 ; global & static initialisations
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _GSINIT
                             52 	.area _GSFINAL
                             53 	.area _GSINIT
                             54 ;--------------------------------------------------------
                             55 ; Home
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _HOME
                             59 ;--------------------------------------------------------
                             60 ; code
                             61 ;--------------------------------------------------------
                             62 	.area _CODE
                             63 ;src/main.c:37: void main(void) {
                             64 ;	---------------------------------
                             65 ; Function main
                             66 ; ---------------------------------
   4000                      67 _main::
   4000 DD E5         [15]   68 	push	ix
   4002 DD 21 00 00   [14]   69 	ld	ix,#0
   4006 DD 39         [15]   70 	add	ix,sp
   4008 21 F5 FF      [10]   71 	ld	hl, #-11
   400B 39            [11]   72 	add	hl, sp
   400C F9            [ 6]   73 	ld	sp, hl
                             74 ;src/main.c:40: u8* sprite=g_items_0;
                             75 ;src/main.c:45: cpct_disableFirmware();
   400D CD 2B 49      [17]   76 	call	_cpct_disableFirmware
                             77 ;src/main.c:47: cpct_clearScreen_f64(0);
   4010 21 00 40      [10]   78 	ld	hl, #0x4000
   4013 E5            [11]   79 	push	hl
   4014 26 00         [ 7]   80 	ld	h, #0x00
   4016 E5            [11]   81 	push	hl
   4017 26 C0         [ 7]   82 	ld	h, #0xc0
   4019 E5            [11]   83 	push	hl
   401A CD 34 48      [17]   84 	call	_cpct_memset_f64
                             85 ;src/main.c:48: cpct_setVideoMode(0);
   401D 2E 00         [ 7]   86 	ld	l, #0x00
   401F CD E3 48      [17]   87 	call	_cpct_setVideoMode
                             88 ;src/main.c:49: cpct_setBorder(HW_BLACK);
   4022 21 10 14      [10]   89 	ld	hl, #0x1410
   4025 E5            [11]   90 	push	hl
   4026 CD 66 46      [17]   91 	call	_cpct_setPALColour
                             92 ;src/main.c:50: cpct_setPalette(g_tile_palette, 6);
   4029 21 06 00      [10]   93 	ld	hl, #0x0006
   402C E5            [11]   94 	push	hl
   402D 21 D3 41      [10]   95 	ld	hl, #_g_tile_palette
   4030 E5            [11]   96 	push	hl
   4031 CD D9 45      [17]   97 	call	_cpct_setPalette
                             98 ;src/main.c:51: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   4034 21 00 40      [10]   99 	ld	hl, #0x4000
   4037 E5            [11]  100 	push	hl
   4038 AF            [ 4]  101 	xor	a, a
   4039 F5            [11]  102 	push	af
   403A 33            [ 6]  103 	inc	sp
   403B 26 C0         [ 7]  104 	ld	h, #0xc0
   403D E5            [11]  105 	push	hl
   403E CD 1D 49      [17]  106 	call	_cpct_memset
                            107 ;src/main.c:54: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   4041 21 14 58      [10]  108 	ld	hl, #0x5814
   4044 E5            [11]  109 	push	hl
   4045 21 00 C0      [10]  110 	ld	hl, #0xc000
   4048 E5            [11]  111 	push	hl
   4049 CD F4 49      [17]  112 	call	_cpct_getScreenPtr
   404C DD 75 FA      [19]  113 	ld	-6 (ix), l
   404F DD 74 FB      [19]  114 	ld	-5 (ix), h
                            115 ;src/main.c:66: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   4052 21 0F 0F      [10]  116 	ld	hl, #0x0f0f
   4055 E5            [11]  117 	push	hl
   4056 21 00 C0      [10]  118 	ld	hl, #0xc000
   4059 E5            [11]  119 	push	hl
   405A CD F4 49      [17]  120 	call	_cpct_getScreenPtr
                            121 ;src/main.c:67: cpct_drawSprite(sprite, p, 4, 8);
   405D E5            [11]  122 	push	hl
   405E 01 04 08      [10]  123 	ld	bc, #0x0804
   4061 C5            [11]  124 	push	bc
   4062 E5            [11]  125 	push	hl
   4063 01 A3 41      [10]  126 	ld	bc, #_g_items_0
   4066 C5            [11]  127 	push	bc
   4067 CD 96 46      [17]  128 	call	_cpct_drawSprite
   406A 01 00 40      [10]  129 	ld	bc, #0x4000
   406D C5            [11]  130 	push	bc
   406E 01 FF FF      [10]  131 	ld	bc, #0xffff
   4071 C5            [11]  132 	push	bc
   4072 01 00 C0      [10]  133 	ld	bc, #0xc000
   4075 C5            [11]  134 	push	bc
   4076 CD 34 48      [17]  135 	call	_cpct_memset_f64
   4079 01 A3 41      [10]  136 	ld	bc, #_g_items_0
   407C C5            [11]  137 	push	bc
   407D 01 04 08      [10]  138 	ld	bc, #0x0804
   4080 C5            [11]  139 	push	bc
   4081 CD 9F 48      [17]  140 	call	_cpct_hflipSpriteM0
   4084 E1            [10]  141 	pop	hl
                            142 ;src/main.c:73: cpct_drawSprite(sprite, p, 4, 8);
   4085 01 04 08      [10]  143 	ld	bc, #0x0804
   4088 C5            [11]  144 	push	bc
   4089 E5            [11]  145 	push	hl
   408A 21 A3 41      [10]  146 	ld	hl, #_g_items_0
   408D E5            [11]  147 	push	hl
   408E CD 96 46      [17]  148 	call	_cpct_drawSprite
                            149 ;src/main.c:75: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   4091 21 0F 1F      [10]  150 	ld	hl, #0x1f0f
   4094 E5            [11]  151 	push	hl
   4095 21 00 C0      [10]  152 	ld	hl, #0xc000
   4098 E5            [11]  153 	push	hl
   4099 CD F4 49      [17]  154 	call	_cpct_getScreenPtr
                            155 ;src/main.c:76: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   409C E5            [11]  156 	push	hl
   409D 21 02 03      [10]  157 	ld	hl, #0x0302
   40A0 E5            [11]  158 	push	hl
   40A1 CD 01 49      [17]  159 	call	_cpct_px2byteM0
   40A4 55            [ 4]  160 	ld	d, l
   40A5 C1            [10]  161 	pop	bc
   40A6 21 0A 14      [10]  162 	ld	hl, #0x140a
   40A9 E5            [11]  163 	push	hl
   40AA D5            [11]  164 	push	de
   40AB 33            [ 6]  165 	inc	sp
   40AC C5            [11]  166 	push	bc
   40AD CD 3B 49      [17]  167 	call	_cpct_drawSolidBox
   40B0 F1            [10]  168 	pop	af
   40B1 F1            [10]  169 	pop	af
   40B2 33            [ 6]  170 	inc	sp
                            171 ;src/main.c:80: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   40B3 DD 4E FA      [19]  172 	ld	c,-6 (ix)
   40B6 DD 46 FB      [19]  173 	ld	b,-5 (ix)
   40B9 21 02 00      [10]  174 	ld	hl, #0x0002
   40BC E5            [11]  175 	push	hl
   40BD C5            [11]  176 	push	bc
   40BE 21 C3 41      [10]  177 	ld	hl, #___str_0
   40C1 E5            [11]  178 	push	hl
   40C2 CD 72 46      [17]  179 	call	_cpct_drawStringM0
   40C5 21 06 00      [10]  180 	ld	hl, #6
   40C8 39            [11]  181 	add	hl, sp
   40C9 F9            [ 6]  182 	ld	sp, hl
                            183 ;src/main.c:84: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   40CA 21 09 4F      [10]  184 	ld	hl, #0x4f09
   40CD E5            [11]  185 	push	hl
   40CE 21 00 C0      [10]  186 	ld	hl, #0xc000
   40D1 E5            [11]  187 	push	hl
   40D2 CD F4 49      [17]  188 	call	_cpct_getScreenPtr
                            189 ;src/main.c:85: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   40D5 01 D9 41      [10]  190 	ld	bc, #_g_tile_schtroumpf+0
   40D8 11 10 20      [10]  191 	ld	de, #0x2010
   40DB D5            [11]  192 	push	de
   40DC E5            [11]  193 	push	hl
   40DD C5            [11]  194 	push	bc
   40DE CD 05 48      [17]  195 	call	_cpct_drawSpriteMasked
                            196 ;src/main.c:88: while (1){
   40E1 DD 77 FC      [19]  197 	ld	-4 (ix), a
   40E4 DD 77 FD      [19]  198 	ld	-3 (ix), a
   40E7 DD 77 FE      [19]  199 	ld	-2 (ix), a
   40EA DD 77 FF      [19]  200 	ld	-1 (ix), a
   40ED                     201 00116$:
                            202 ;src/main.c:89: seed++;
   40ED DD 34 FC      [23]  203 	inc	-4 (ix)
   40F0 20 0D         [12]  204 	jr	NZ,00156$
   40F2 DD 34 FD      [23]  205 	inc	-3 (ix)
   40F5 20 08         [12]  206 	jr	NZ,00156$
   40F7 DD 34 FE      [23]  207 	inc	-2 (ix)
   40FA 20 03         [12]  208 	jr	NZ,00156$
   40FC DD 34 FF      [23]  209 	inc	-1 (ix)
   40FF                     210 00156$:
                            211 ;src/main.c:91: cpct_scanKeyboard_f();
   40FF CD FC 45      [17]  212 	call	_cpct_scanKeyboard_f
                            213 ;src/main.c:95: if      (cpct_isKeyPressed(Key_CursorRight) && pos < 0xFF ) ++pos; 
   4102 21 00 02      [10]  214 	ld	hl, #0x0200
   4105 CD F0 45      [17]  215 	call	_cpct_isKeyPressed
   4108 7D            [ 4]  216 	ld	a, l
   4109 B7            [ 4]  217 	or	a, a
   410A 28 0C         [12]  218 	jr	Z,00105$
   410C DD 7E F9      [19]  219 	ld	a, -7 (ix)
   410F D6 FF         [ 7]  220 	sub	a, #0xff
   4111 30 05         [12]  221 	jr	NC,00105$
   4113 DD 34 F9      [23]  222 	inc	-7 (ix)
   4116 18 13         [12]  223 	jr	00106$
   4118                     224 00105$:
                            225 ;src/main.c:96: else if (cpct_isKeyPressed(Key_CursorLeft)  && pos > 0    ) --pos; 
   4118 21 01 01      [10]  226 	ld	hl, #0x0101
   411B CD F0 45      [17]  227 	call	_cpct_isKeyPressed
   411E 7D            [ 4]  228 	ld	a, l
   411F B7            [ 4]  229 	or	a, a
   4120 28 09         [12]  230 	jr	Z,00106$
   4122 DD 7E F9      [19]  231 	ld	a, -7 (ix)
   4125 B7            [ 4]  232 	or	a, a
   4126 28 03         [12]  233 	jr	Z,00106$
   4128 DD 35 F9      [23]  234 	dec	-7 (ix)
   412B                     235 00106$:
                            236 ;src/main.c:97: if      (cpct_isKeyPressed(Key_CursorUp)    && pos > 0    ) --pos;
   412B 21 00 01      [10]  237 	ld	hl, #0x0100
   412E CD F0 45      [17]  238 	call	_cpct_isKeyPressed
   4131 7D            [ 4]  239 	ld	a, l
   4132 B7            [ 4]  240 	or	a, a
   4133 28 0B         [12]  241 	jr	Z,00112$
   4135 DD 7E F9      [19]  242 	ld	a, -7 (ix)
   4138 B7            [ 4]  243 	or	a, a
   4139 28 05         [12]  244 	jr	Z,00112$
   413B DD 35 F9      [23]  245 	dec	-7 (ix)
   413E 18 14         [12]  246 	jr	00113$
   4140                     247 00112$:
                            248 ;src/main.c:98: else if (cpct_isKeyPressed(Key_CursorDown)  && pos < 0xFF ) ++pos;
   4140 21 00 04      [10]  249 	ld	hl, #0x0400
   4143 CD F0 45      [17]  250 	call	_cpct_isKeyPressed
   4146 7D            [ 4]  251 	ld	a, l
   4147 B7            [ 4]  252 	or	a, a
   4148 28 0A         [12]  253 	jr	Z,00113$
   414A DD 7E F9      [19]  254 	ld	a, -7 (ix)
   414D D6 FF         [ 7]  255 	sub	a, #0xff
   414F 30 03         [12]  256 	jr	NC,00113$
   4151 DD 34 F9      [23]  257 	inc	-7 (ix)
   4154                     258 00113$:
                            259 ;src/main.c:101: p = cpct_getScreenPtr(CPCT_VMEM_START, 32-1,16-1);
   4154 21 1F 0F      [10]  260 	ld	hl, #0x0f1f
   4157 E5            [11]  261 	push	hl
   4158 21 00 C0      [10]  262 	ld	hl, #0xc000
   415B E5            [11]  263 	push	hl
   415C CD F4 49      [17]  264 	call	_cpct_getScreenPtr
   415F 4D            [ 4]  265 	ld	c, l
   4160 44            [ 4]  266 	ld	b, h
                            267 ;src/main.c:102: cpct_drawCharM0(p, 2,0, pos);
   4161 DD 7E F9      [19]  268 	ld	a, -7 (ix)
   4164 F5            [11]  269 	push	af
   4165 33            [ 6]  270 	inc	sp
   4166 21 02 00      [10]  271 	ld	hl, #0x0002
   4169 E5            [11]  272 	push	hl
   416A C5            [11]  273 	push	bc
   416B CD 3B 47      [17]  274 	call	_cpct_drawCharM0
   416E F1            [10]  275 	pop	af
                            276 ;src/main.c:103: p  = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   416F 33            [ 6]  277 	inc	sp
   4170 21 07 5E      [10]  278 	ld	hl,#0x5e07
   4173 E3            [19]  279 	ex	(sp),hl
   4174 21 00 C0      [10]  280 	ld	hl, #0xc000
   4177 E5            [11]  281 	push	hl
   4178 CD F4 49      [17]  282 	call	_cpct_getScreenPtr
                            283 ;src/main.c:104: cpct_srand(seed);
   417B E5            [11]  284 	push	hl
   417C DD 6E FC      [19]  285 	ld	l, -4 (ix)
   417F DD 66 FD      [19]  286 	ld	h, -3 (ix)
   4182 DD 5E FE      [19]  287 	ld	e, -2 (ix)
   4185 DD 56 FF      [19]  288 	ld	d, -1 (ix)
   4188 CD D2 47      [17]  289 	call	_cpct_setSeed_mxor
   418B CD DA 47      [17]  290 	call	_cpct_restoreState_mxor_u8
   418E CD E0 47      [17]  291 	call	_cpct_getRandom_mxor_u8
   4191 55            [ 4]  292 	ld	d, l
   4192 C1            [10]  293 	pop	bc
   4193 D5            [11]  294 	push	de
   4194 33            [ 6]  295 	inc	sp
   4195 21 02 00      [10]  296 	ld	hl, #0x0002
   4198 E5            [11]  297 	push	hl
   4199 C5            [11]  298 	push	bc
   419A CD 3B 47      [17]  299 	call	_cpct_drawCharM0
   419D F1            [10]  300 	pop	af
   419E F1            [10]  301 	pop	af
   419F 33            [ 6]  302 	inc	sp
   41A0 C3 ED 40      [10]  303 	jp	00116$
   41A3                     304 _g_items_0:
   41A3 05                  305 	.db #0x05	; 5
   41A4 0F                  306 	.db #0x0f	; 15
   41A5 0F                  307 	.db #0x0f	; 15
   41A6 00                  308 	.db #0x00	; 0
   41A7 0F                  309 	.db #0x0f	; 15
   41A8 0F                  310 	.db #0x0f	; 15
   41A9 0F                  311 	.db #0x0f	; 15
   41AA 0A                  312 	.db #0x0a	; 10
   41AB 0F                  313 	.db #0x0f	; 15
   41AC 0A                  314 	.db #0x0a	; 10
   41AD 05                  315 	.db #0x05	; 5
   41AE 00                  316 	.db #0x00	; 0
   41AF 0F                  317 	.db #0x0f	; 15
   41B0 0A                  318 	.db #0x0a	; 10
   41B1 05                  319 	.db #0x05	; 5
   41B2 00                  320 	.db #0x00	; 0
   41B3 05                  321 	.db #0x05	; 5
   41B4 0F                  322 	.db #0x0f	; 15
   41B5 0A                  323 	.db #0x0a	; 10
   41B6 0A                  324 	.db #0x0a	; 10
   41B7 00                  325 	.db #0x00	; 0
   41B8 0F                  326 	.db #0x0f	; 15
   41B9 0F                  327 	.db #0x0f	; 15
   41BA 0A                  328 	.db #0x0a	; 10
   41BB 00                  329 	.db #0x00	; 0
   41BC 0A                  330 	.db #0x0a	; 10
   41BD 0A                  331 	.db #0x0a	; 10
   41BE 0A                  332 	.db #0x0a	; 10
   41BF 00                  333 	.db #0x00	; 0
   41C0 00                  334 	.db #0x00	; 0
   41C1 00                  335 	.db #0x00	; 0
   41C2 00                  336 	.db #0x00	; 0
   41C3                     337 ___str_0:
   41C3 57 65 6C 63 6F 6D   338 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   41D2 00                  339 	.db 0x00
                            340 	.area _CODE
                            341 	.area _INITIALIZER
                            342 	.area _CABS (ABS)
