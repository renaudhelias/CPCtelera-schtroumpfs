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
                             21 	.globl _cpct_drawSolidBox
                             22 	.globl _cpct_drawSpriteMasked
                             23 	.globl _cpct_drawSprite
                             24 	.globl _cpct_px2byteM0
                             25 	.globl _cpct_isKeyPressed
                             26 	.globl _cpct_scanKeyboard_f
                             27 	.globl _cpct_memset
                             28 	.globl _cpct_disableFirmware
                             29 	.globl _g_items_0
                             30 ;--------------------------------------------------------
                             31 ; special function registers
                             32 ;--------------------------------------------------------
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DATA
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/main.c:34: void main(void) {
                             62 ;	---------------------------------
                             63 ; Function main
                             64 ; ---------------------------------
   4000                      65 _main::
   4000 DD E5         [15]   66 	push	ix
   4002 DD 21 00 00   [14]   67 	ld	ix,#0
   4006 DD 39         [15]   68 	add	ix,sp
   4008 21 F5 FF      [10]   69 	ld	hl, #-11
   400B 39            [11]   70 	add	hl, sp
   400C F9            [ 6]   71 	ld	sp, hl
                             72 ;src/main.c:37: u8* sprite=g_items_0;
                             73 ;src/main.c:42: cpct_disableFirmware();
   400D CD 6A 48      [17]   74 	call	_cpct_disableFirmware
                             75 ;src/main.c:43: cpct_setVideoMode(0);
   4010 2E 00         [ 7]   76 	ld	l, #0x00
   4012 CD 22 48      [17]   77 	call	_cpct_setVideoMode
                             78 ;src/main.c:44: cpct_setBorder(HW_BLACK);
   4015 21 10 14      [10]   79 	ld	hl, #0x1410
   4018 E5            [11]   80 	push	hl
   4019 CD 31 46      [17]   81 	call	_cpct_setPALColour
                             82 ;src/main.c:45: cpct_setPalette(g_tile_palette, 6);
   401C 21 06 00      [10]   83 	ld	hl, #0x0006
   401F E5            [11]   84 	push	hl
   4020 21 9E 41      [10]   85 	ld	hl, #_g_tile_palette
   4023 E5            [11]   86 	push	hl
   4024 CD A4 45      [17]   87 	call	_cpct_setPalette
                             88 ;src/main.c:46: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   4027 21 00 40      [10]   89 	ld	hl, #0x4000
   402A E5            [11]   90 	push	hl
   402B AF            [ 4]   91 	xor	a, a
   402C F5            [11]   92 	push	af
   402D 33            [ 6]   93 	inc	sp
   402E 26 C0         [ 7]   94 	ld	h, #0xc0
   4030 E5            [11]   95 	push	hl
   4031 CD 5C 48      [17]   96 	call	_cpct_memset
                             97 ;src/main.c:49: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   4034 21 14 58      [10]   98 	ld	hl, #0x5814
   4037 E5            [11]   99 	push	hl
   4038 21 00 C0      [10]  100 	ld	hl, #0xc000
   403B E5            [11]  101 	push	hl
   403C CD 33 49      [17]  102 	call	_cpct_getScreenPtr
   403F DD 75 FA      [19]  103 	ld	-6 (ix), l
   4042 DD 74 FB      [19]  104 	ld	-5 (ix), h
                            105 ;src/main.c:59: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   4045 21 0F 0F      [10]  106 	ld	hl, #0x0f0f
   4048 E5            [11]  107 	push	hl
   4049 21 00 C0      [10]  108 	ld	hl, #0xc000
   404C E5            [11]  109 	push	hl
   404D CD 33 49      [17]  110 	call	_cpct_getScreenPtr
                            111 ;src/main.c:60: cpct_drawSprite(sprite, p, 4, 8);
   4050 01 04 08      [10]  112 	ld	bc, #0x0804
   4053 C5            [11]  113 	push	bc
   4054 E5            [11]  114 	push	hl
   4055 21 6E 41      [10]  115 	ld	hl, #_g_items_0
   4058 E5            [11]  116 	push	hl
   4059 CD 61 46      [17]  117 	call	_cpct_drawSprite
                            118 ;src/main.c:62: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   405C 21 0F 1F      [10]  119 	ld	hl, #0x1f0f
   405F E5            [11]  120 	push	hl
   4060 21 00 C0      [10]  121 	ld	hl, #0xc000
   4063 E5            [11]  122 	push	hl
   4064 CD 33 49      [17]  123 	call	_cpct_getScreenPtr
                            124 ;src/main.c:63: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   4067 E5            [11]  125 	push	hl
   4068 21 02 03      [10]  126 	ld	hl, #0x0302
   406B E5            [11]  127 	push	hl
   406C CD 40 48      [17]  128 	call	_cpct_px2byteM0
   406F 55            [ 4]  129 	ld	d, l
   4070 C1            [10]  130 	pop	bc
   4071 21 0A 14      [10]  131 	ld	hl, #0x140a
   4074 E5            [11]  132 	push	hl
   4075 D5            [11]  133 	push	de
   4076 33            [ 6]  134 	inc	sp
   4077 C5            [11]  135 	push	bc
   4078 CD 7A 48      [17]  136 	call	_cpct_drawSolidBox
   407B F1            [10]  137 	pop	af
   407C F1            [10]  138 	pop	af
   407D 33            [ 6]  139 	inc	sp
                            140 ;src/main.c:67: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   407E DD 4E FA      [19]  141 	ld	c,-6 (ix)
   4081 DD 46 FB      [19]  142 	ld	b,-5 (ix)
   4084 21 02 00      [10]  143 	ld	hl, #0x0002
   4087 E5            [11]  144 	push	hl
   4088 C5            [11]  145 	push	bc
   4089 21 8E 41      [10]  146 	ld	hl, #___str_0
   408C E5            [11]  147 	push	hl
   408D CD 3D 46      [17]  148 	call	_cpct_drawStringM0
   4090 21 06 00      [10]  149 	ld	hl, #6
   4093 39            [11]  150 	add	hl, sp
   4094 F9            [ 6]  151 	ld	sp, hl
                            152 ;src/main.c:71: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   4095 21 09 4F      [10]  153 	ld	hl, #0x4f09
   4098 E5            [11]  154 	push	hl
   4099 21 00 C0      [10]  155 	ld	hl, #0xc000
   409C E5            [11]  156 	push	hl
   409D CD 33 49      [17]  157 	call	_cpct_getScreenPtr
                            158 ;src/main.c:72: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   40A0 01 A4 41      [10]  159 	ld	bc, #_g_tile_schtroumpf+0
   40A3 11 10 20      [10]  160 	ld	de, #0x2010
   40A6 D5            [11]  161 	push	de
   40A7 E5            [11]  162 	push	hl
   40A8 C5            [11]  163 	push	bc
   40A9 CD D0 47      [17]  164 	call	_cpct_drawSpriteMasked
                            165 ;src/main.c:75: while (1){
   40AC DD 77 FC      [19]  166 	ld	-4 (ix), a
   40AF DD 77 FD      [19]  167 	ld	-3 (ix), a
   40B2 DD 77 FE      [19]  168 	ld	-2 (ix), a
   40B5 DD 77 FF      [19]  169 	ld	-1 (ix), a
   40B8                     170 00116$:
                            171 ;src/main.c:76: seed++;
   40B8 DD 34 FC      [23]  172 	inc	-4 (ix)
   40BB 20 0D         [12]  173 	jr	NZ,00156$
   40BD DD 34 FD      [23]  174 	inc	-3 (ix)
   40C0 20 08         [12]  175 	jr	NZ,00156$
   40C2 DD 34 FE      [23]  176 	inc	-2 (ix)
   40C5 20 03         [12]  177 	jr	NZ,00156$
   40C7 DD 34 FF      [23]  178 	inc	-1 (ix)
   40CA                     179 00156$:
                            180 ;src/main.c:78: cpct_scanKeyboard_f();
   40CA CD C7 45      [17]  181 	call	_cpct_scanKeyboard_f
                            182 ;src/main.c:82: if      (cpct_isKeyPressed(Key_CursorRight) && pos < 0xFF ) ++pos; 
   40CD 21 00 02      [10]  183 	ld	hl, #0x0200
   40D0 CD BB 45      [17]  184 	call	_cpct_isKeyPressed
   40D3 7D            [ 4]  185 	ld	a, l
   40D4 B7            [ 4]  186 	or	a, a
   40D5 28 0C         [12]  187 	jr	Z,00105$
   40D7 DD 7E F9      [19]  188 	ld	a, -7 (ix)
   40DA D6 FF         [ 7]  189 	sub	a, #0xff
   40DC 30 05         [12]  190 	jr	NC,00105$
   40DE DD 34 F9      [23]  191 	inc	-7 (ix)
   40E1 18 13         [12]  192 	jr	00106$
   40E3                     193 00105$:
                            194 ;src/main.c:83: else if (cpct_isKeyPressed(Key_CursorLeft)  && pos > 0    ) --pos; 
   40E3 21 01 01      [10]  195 	ld	hl, #0x0101
   40E6 CD BB 45      [17]  196 	call	_cpct_isKeyPressed
   40E9 7D            [ 4]  197 	ld	a, l
   40EA B7            [ 4]  198 	or	a, a
   40EB 28 09         [12]  199 	jr	Z,00106$
   40ED DD 7E F9      [19]  200 	ld	a, -7 (ix)
   40F0 B7            [ 4]  201 	or	a, a
   40F1 28 03         [12]  202 	jr	Z,00106$
   40F3 DD 35 F9      [23]  203 	dec	-7 (ix)
   40F6                     204 00106$:
                            205 ;src/main.c:84: if      (cpct_isKeyPressed(Key_CursorUp)    && pos > 0    ) --pos;
   40F6 21 00 01      [10]  206 	ld	hl, #0x0100
   40F9 CD BB 45      [17]  207 	call	_cpct_isKeyPressed
   40FC 7D            [ 4]  208 	ld	a, l
   40FD B7            [ 4]  209 	or	a, a
   40FE 28 0B         [12]  210 	jr	Z,00112$
   4100 DD 7E F9      [19]  211 	ld	a, -7 (ix)
   4103 B7            [ 4]  212 	or	a, a
   4104 28 05         [12]  213 	jr	Z,00112$
   4106 DD 35 F9      [23]  214 	dec	-7 (ix)
   4109 18 14         [12]  215 	jr	00113$
   410B                     216 00112$:
                            217 ;src/main.c:85: else if (cpct_isKeyPressed(Key_CursorDown)  && pos < 0xFF ) ++pos;
   410B 21 00 04      [10]  218 	ld	hl, #0x0400
   410E CD BB 45      [17]  219 	call	_cpct_isKeyPressed
   4111 7D            [ 4]  220 	ld	a, l
   4112 B7            [ 4]  221 	or	a, a
   4113 28 0A         [12]  222 	jr	Z,00113$
   4115 DD 7E F9      [19]  223 	ld	a, -7 (ix)
   4118 D6 FF         [ 7]  224 	sub	a, #0xff
   411A 30 03         [12]  225 	jr	NC,00113$
   411C DD 34 F9      [23]  226 	inc	-7 (ix)
   411F                     227 00113$:
                            228 ;src/main.c:88: p = cpct_getScreenPtr(CPCT_VMEM_START, 32-1,16-1);
   411F 21 1F 0F      [10]  229 	ld	hl, #0x0f1f
   4122 E5            [11]  230 	push	hl
   4123 21 00 C0      [10]  231 	ld	hl, #0xc000
   4126 E5            [11]  232 	push	hl
   4127 CD 33 49      [17]  233 	call	_cpct_getScreenPtr
   412A 4D            [ 4]  234 	ld	c, l
   412B 44            [ 4]  235 	ld	b, h
                            236 ;src/main.c:89: cpct_drawCharM0(p, 2,0, pos);
   412C DD 7E F9      [19]  237 	ld	a, -7 (ix)
   412F F5            [11]  238 	push	af
   4130 33            [ 6]  239 	inc	sp
   4131 21 02 00      [10]  240 	ld	hl, #0x0002
   4134 E5            [11]  241 	push	hl
   4135 C5            [11]  242 	push	bc
   4136 CD 06 47      [17]  243 	call	_cpct_drawCharM0
   4139 F1            [10]  244 	pop	af
                            245 ;src/main.c:90: p  = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
   413A 33            [ 6]  246 	inc	sp
   413B 21 07 5E      [10]  247 	ld	hl,#0x5e07
   413E E3            [19]  248 	ex	(sp),hl
   413F 21 00 C0      [10]  249 	ld	hl, #0xc000
   4142 E5            [11]  250 	push	hl
   4143 CD 33 49      [17]  251 	call	_cpct_getScreenPtr
                            252 ;src/main.c:91: cpct_srand(seed);
   4146 E5            [11]  253 	push	hl
   4147 DD 6E FC      [19]  254 	ld	l, -4 (ix)
   414A DD 66 FD      [19]  255 	ld	h, -3 (ix)
   414D DD 5E FE      [19]  256 	ld	e, -2 (ix)
   4150 DD 56 FF      [19]  257 	ld	d, -1 (ix)
   4153 CD 9D 47      [17]  258 	call	_cpct_setSeed_mxor
   4156 CD A5 47      [17]  259 	call	_cpct_restoreState_mxor_u8
   4159 CD AB 47      [17]  260 	call	_cpct_getRandom_mxor_u8
   415C 55            [ 4]  261 	ld	d, l
   415D C1            [10]  262 	pop	bc
   415E D5            [11]  263 	push	de
   415F 33            [ 6]  264 	inc	sp
   4160 21 02 00      [10]  265 	ld	hl, #0x0002
   4163 E5            [11]  266 	push	hl
   4164 C5            [11]  267 	push	bc
   4165 CD 06 47      [17]  268 	call	_cpct_drawCharM0
   4168 F1            [10]  269 	pop	af
   4169 F1            [10]  270 	pop	af
   416A 33            [ 6]  271 	inc	sp
   416B C3 B8 40      [10]  272 	jp	00116$
   416E                     273 _g_items_0:
   416E 05                  274 	.db #0x05	; 5
   416F 0F                  275 	.db #0x0f	; 15
   4170 0F                  276 	.db #0x0f	; 15
   4171 00                  277 	.db #0x00	; 0
   4172 0F                  278 	.db #0x0f	; 15
   4173 0F                  279 	.db #0x0f	; 15
   4174 0F                  280 	.db #0x0f	; 15
   4175 0A                  281 	.db #0x0a	; 10
   4176 0F                  282 	.db #0x0f	; 15
   4177 0A                  283 	.db #0x0a	; 10
   4178 05                  284 	.db #0x05	; 5
   4179 00                  285 	.db #0x00	; 0
   417A 0F                  286 	.db #0x0f	; 15
   417B 0A                  287 	.db #0x0a	; 10
   417C 05                  288 	.db #0x05	; 5
   417D 00                  289 	.db #0x00	; 0
   417E 05                  290 	.db #0x05	; 5
   417F 0F                  291 	.db #0x0f	; 15
   4180 0A                  292 	.db #0x0a	; 10
   4181 0A                  293 	.db #0x0a	; 10
   4182 00                  294 	.db #0x00	; 0
   4183 0F                  295 	.db #0x0f	; 15
   4184 0F                  296 	.db #0x0f	; 15
   4185 0A                  297 	.db #0x0a	; 10
   4186 00                  298 	.db #0x00	; 0
   4187 0A                  299 	.db #0x0a	; 10
   4188 0A                  300 	.db #0x0a	; 10
   4189 0A                  301 	.db #0x0a	; 10
   418A 00                  302 	.db #0x00	; 0
   418B 00                  303 	.db #0x00	; 0
   418C 00                  304 	.db #0x00	; 0
   418D 00                  305 	.db #0x00	; 0
   418E                     306 ___str_0:
   418E 57 65 6C 63 6F 6D   307 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   419D 00                  308 	.db 0x00
                            309 	.area _CODE
                            310 	.area _INITIALIZER
                            311 	.area _CABS (ABS)
