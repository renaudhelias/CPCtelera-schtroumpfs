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
                             13 	.globl _crtc
                             14 	.globl _monter
                             15 	.globl _bank4_4000
                             16 	.globl _bank0123
                             17 	.globl _calqueC000
                             18 	.globl _vsync
                             19 	.globl _cpct_restoreState_mxor_u8
                             20 	.globl _cpct_setSeed_mxor
                             21 	.globl _cpct_getScreenPtr
                             22 	.globl _cpct_setPALColour
                             23 	.globl _cpct_setPalette
                             24 	.globl _cpct_setVideoMode
                             25 	.globl _cpct_hflipSpriteM0
                             26 	.globl _cpct_drawSolidBox
                             27 	.globl _cpct_drawSpriteMasked
                             28 	.globl _cpct_drawSprite
                             29 	.globl _cpct_px2byteM0
                             30 	.globl _cpct_memset_f64
                             31 	.globl _cpct_memset
                             32 	.globl _cpct_setInterruptHandler
                             33 	.globl _screen_plot_address
                             34 	.globl _screen_location
                             35 	.globl _slow
                             36 	.globl _hOffset
                             37 	.globl _intCounter
                             38 	.globl _g_items_0
                             39 ;--------------------------------------------------------
                             40 ; special function registers
                             41 ;--------------------------------------------------------
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DATA
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _INITIALIZED
   26EB                      50 _intCounter::
   26EB                      51 	.ds 1
   26EC                      52 _hOffset::
   26EC                      53 	.ds 2
   26EE                      54 _slow::
   26EE                      55 	.ds 1
   26EF                      56 _screen_location::
   26EF                      57 	.ds 2
   26F1                      58 _screen_plot_address::
   26F1                      59 	.ds 2
                             60 ;--------------------------------------------------------
                             61 ; absolute external ram data
                             62 ;--------------------------------------------------------
                             63 	.area _DABS (ABS)
                             64 ;--------------------------------------------------------
                             65 ; global & static initialisations
                             66 ;--------------------------------------------------------
                             67 	.area _HOME
                             68 	.area _GSINIT
                             69 	.area _GSFINAL
                             70 	.area _GSINIT
                             71 ;--------------------------------------------------------
                             72 ; Home
                             73 ;--------------------------------------------------------
                             74 	.area _HOME
                             75 	.area _HOME
                             76 ;--------------------------------------------------------
                             77 ; code
                             78 ;--------------------------------------------------------
                             79 	.area _CODE
                             80 ;src/main.c:53: void monter(unsigned int c,u16 hScroll) {
                             81 ;	---------------------------------
                             82 ; Function monter
                             83 ; ---------------------------------
   055E                      84 _monter::
   055E DD E5         [15]   85 	push	ix
   0560 DD 21 00 00   [14]   86 	ld	ix,#0
   0564 DD 39         [15]   87 	add	ix,sp
   0566 F5            [11]   88 	push	af
   0567 F5            [11]   89 	push	af
                             90 ;src/main.c:56: for (l=0;l<8;l++) {
   0568 DD 4E 04      [19]   91 	ld	c,4 (ix)
   056B DD 46 05      [19]   92 	ld	b,5 (ix)
   056E 69            [ 4]   93 	ld	l, c
   056F 60            [ 4]   94 	ld	h, b
   0570 29            [11]   95 	add	hl, hl
   0571 29            [11]   96 	add	hl, hl
   0572 09            [11]   97 	add	hl, bc
   0573 29            [11]   98 	add	hl, hl
   0574 29            [11]   99 	add	hl, hl
   0575 29            [11]  100 	add	hl, hl
   0576 29            [11]  101 	add	hl, hl
   0577 DD 75 FE      [19]  102 	ld	-2 (ix), l
   057A DD 74 FF      [19]  103 	ld	-1 (ix), h
   057D 21 50 00      [10]  104 	ld	hl, #0x0050
   0580 E5            [11]  105 	push	hl
   0581 DD 6E 06      [19]  106 	ld	l,6 (ix)
   0584 DD 66 07      [19]  107 	ld	h,7 (ix)
   0587 E5            [11]  108 	push	hl
   0588 CD F7 25      [17]  109 	call	__moduint
   058B F1            [10]  110 	pop	af
   058C F1            [10]  111 	pop	af
   058D DD 74 FD      [19]  112 	ld	-3 (ix), h
   0590 DD 75 FC      [19]  113 	ld	-4 (ix), l
   0593 01 00 00      [10]  114 	ld	bc, #0x0000
   0596                     115 00102$:
                            116 ;src/main.c:58: plot_column=(u8 *)(0x4000 + l*0x800 + 80*c + hScroll%80);
   0596 79            [ 4]  117 	ld	a, c
   0597 07            [ 4]  118 	rlca
   0598 07            [ 4]  119 	rlca
   0599 07            [ 4]  120 	rlca
   059A E6 F8         [ 7]  121 	and	a, #0xf8
   059C 57            [ 4]  122 	ld	d, a
   059D 1E 00         [ 7]  123 	ld	e, #0x00
   059F 21 00 40      [10]  124 	ld	hl, #0x4000
   05A2 19            [11]  125 	add	hl, de
   05A3 DD 5E FE      [19]  126 	ld	e,-2 (ix)
   05A6 DD 56 FF      [19]  127 	ld	d,-1 (ix)
   05A9 19            [11]  128 	add	hl, de
   05AA D1            [10]  129 	pop	de
   05AB D5            [11]  130 	push	de
   05AC 19            [11]  131 	add	hl, de
   05AD EB            [ 4]  132 	ex	de,hl
                            133 ;src/main.c:60: *plot_column=*plot_column+0X33;
   05AE 1A            [ 7]  134 	ld	a, (de)
   05AF C6 33         [ 7]  135 	add	a, #0x33
   05B1 12            [ 7]  136 	ld	(de), a
                            137 ;src/main.c:62: plot_column=plot_column-1;
   05B2 1B            [ 6]  138 	dec	de
                            139 ;src/main.c:63: *plot_column=*plot_column+0X33;
   05B3 1A            [ 7]  140 	ld	a, (de)
   05B4 C6 33         [ 7]  141 	add	a, #0x33
   05B6 12            [ 7]  142 	ld	(de), a
                            143 ;src/main.c:56: for (l=0;l<8;l++) {
   05B7 03            [ 6]  144 	inc	bc
   05B8 79            [ 4]  145 	ld	a, c
   05B9 D6 08         [ 7]  146 	sub	a, #0x08
   05BB 78            [ 4]  147 	ld	a, b
   05BC DE 00         [ 7]  148 	sbc	a, #0x00
   05BE 38 D6         [12]  149 	jr	C,00102$
   05C0 DD F9         [10]  150 	ld	sp, ix
   05C2 DD E1         [14]  151 	pop	ix
   05C4 C9            [10]  152 	ret
   05C5                     153 _g_items_0:
   05C5 05                  154 	.db #0x05	; 5
   05C6 0F                  155 	.db #0x0f	; 15
   05C7 0F                  156 	.db #0x0f	; 15
   05C8 00                  157 	.db #0x00	; 0
   05C9 0F                  158 	.db #0x0f	; 15
   05CA 0F                  159 	.db #0x0f	; 15
   05CB 0F                  160 	.db #0x0f	; 15
   05CC 0A                  161 	.db #0x0a	; 10
   05CD 0F                  162 	.db #0x0f	; 15
   05CE 0A                  163 	.db #0x0a	; 10
   05CF 05                  164 	.db #0x05	; 5
   05D0 00                  165 	.db #0x00	; 0
   05D1 0F                  166 	.db #0x0f	; 15
   05D2 0A                  167 	.db #0x0a	; 10
   05D3 05                  168 	.db #0x05	; 5
   05D4 00                  169 	.db #0x00	; 0
   05D5 05                  170 	.db #0x05	; 5
   05D6 0F                  171 	.db #0x0f	; 15
   05D7 0A                  172 	.db #0x0a	; 10
   05D8 0A                  173 	.db #0x0a	; 10
   05D9 00                  174 	.db #0x00	; 0
   05DA 0F                  175 	.db #0x0f	; 15
   05DB 0F                  176 	.db #0x0f	; 15
   05DC 0A                  177 	.db #0x0a	; 10
   05DD 00                  178 	.db #0x00	; 0
   05DE 0A                  179 	.db #0x0a	; 10
   05DF 0A                  180 	.db #0x0a	; 10
   05E0 0A                  181 	.db #0x0a	; 10
   05E1 00                  182 	.db #0x00	; 0
   05E2 00                  183 	.db #0x00	; 0
   05E3 00                  184 	.db #0x00	; 0
   05E4 00                  185 	.db #0x00	; 0
                            186 ;src/main.c:73: void crtc(u16 R12R13) {
                            187 ;	---------------------------------
                            188 ; Function crtc
                            189 ; ---------------------------------
   05E5                     190 _crtc::
                            191 ;src/main.c:90: __endasm;
   05E5 DD E5         [15]  192 	push	ix
   05E7 DD 21 00 00   [14]  193 	ld	ix,#0
   05EB DD 39         [15]  194 	add	ix,sp
   05ED DD 66 05      [19]  195 	ld	h, 5 (ix)
   05F0 DD 6E 04      [19]  196 	ld	l, 4 (ix)
   05F3 01 0C BC      [10]  197 	ld	bc,#0xbc00+12
   05F6 ED 49         [12]  198 	out	(c),c
   05F8 04            [ 4]  199 	inc	b
   05F9 ED 61         [12]  200 	out	(c),h
   05FB 05            [ 4]  201 	dec	b
   05FC 0C            [ 4]  202 	inc	c
   05FD ED 49         [12]  203 	out	(c),c
   05FF 04            [ 4]  204 	inc	b
   0600 ED 69         [12]  205 	out	(c),l
   0602 DD E1         [14]  206 	pop	ix
   0604 C9            [10]  207 	ret
                            208 ;src/main.c:94: void myInterruptHandler() {
                            209 ;	---------------------------------
                            210 ; Function myInterruptHandler
                            211 ; ---------------------------------
   0605                     212 _myInterruptHandler::
                            213 ;src/main.c:97: intCounter=intCounter+1;
   0605 FD 21 EB 26   [14]  214 	ld	iy, #_intCounter
   0609 FD 34 00      [23]  215 	inc	0 (iy)
                            216 ;src/main.c:98: if (intCounter == 6) intCounter=0;
   060C FD 7E 00      [19]  217 	ld	a, 0 (iy)
   060F D6 06         [ 7]  218 	sub	a, #0x06
   0611 20 04         [12]  219 	jr	NZ,00102$
   0613 FD 36 00 00   [19]  220 	ld	0 (iy), #0x00
   0617                     221 00102$:
                            222 ;src/main.c:100: if (intCounter == 2) {
   0617 3A EB 26      [13]  223 	ld	a,(#_intCounter + 0)
   061A D6 02         [ 7]  224 	sub	a, #0x02
   061C 20 08         [12]  225 	jr	NZ,00104$
                            226 ;src/main.c:101: cpct_setBorder(2);
   061E 21 10 02      [10]  227 	ld	hl, #0x0210
   0621 E5            [11]  228 	push	hl
   0622 CD 1E 23      [17]  229 	call	_cpct_setPALColour
   0625 C9            [10]  230 	ret
   0626                     231 00104$:
                            232 ;src/main.c:103: cpct_setBorder(3);
   0626 21 10 03      [10]  233 	ld	hl, #0x0310
   0629 E5            [11]  234 	push	hl
   062A CD 1E 23      [17]  235 	call	_cpct_setPALColour
                            236 ;src/main.c:150: if (intCounter==3) {
   062D C9            [10]  237 	ret
                            238 ;src/main.c:159: void main(void) {
                            239 ;	---------------------------------
                            240 ; Function main
                            241 ; ---------------------------------
   062E                     242 _main::
   062E DD E5         [15]  243 	push	ix
   0630 F5            [11]  244 	push	af
                            245 ;src/main.c:161: int s=0;
   0631 21 00 00      [10]  246 	ld	hl, #0x0000
   0634 E3            [19]  247 	ex	(sp), hl
                            248 ;src/main.c:163: u8* sprite=g_items_0;
                            249 ;src/main.c:179: cpct_setInterruptHandler(myInterruptHandler);
   0635 21 05 06      [10]  250 	ld	hl, #_myInterruptHandler
   0638 CD 22 26      [17]  251 	call	_cpct_setInterruptHandler
                            252 ;src/main.c:183: bank4_4000();
   063B CD 0B 08      [17]  253 	call	_bank4_4000
                            254 ;src/main.c:184: bank0123();
   063E CD FF 07      [17]  255 	call	_bank0123
                            256 ;src/main.c:185: calqueC000();
   0641 CD DE 07      [17]  257 	call	_calqueC000
                            258 ;src/main.c:188: cpct_setVideoMode(0);
   0644 2E 00         [ 7]  259 	ld	l, #0x00
   0646 CD E1 24      [17]  260 	call	_cpct_setVideoMode
                            261 ;src/main.c:191: cpct_setBorder(HW_BLACK);
   0649 21 10 14      [10]  262 	ld	hl, #0x1410
   064C E5            [11]  263 	push	hl
   064D CD 1E 23      [17]  264 	call	_cpct_setPALColour
                            265 ;src/main.c:192: cpct_setPalette(g_tile_palette, 6);
   0650 21 06 00      [10]  266 	ld	hl, #0x0006
   0653 E5            [11]  267 	push	hl
   0654 21 75 08      [10]  268 	ld	hl, #_g_tile_palette
   0657 E5            [11]  269 	push	hl
   0658 CD 07 23      [17]  270 	call	_cpct_setPalette
                            271 ;src/main.c:193: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   065B 21 00 40      [10]  272 	ld	hl, #0x4000
   065E E5            [11]  273 	push	hl
   065F AF            [ 4]  274 	xor	a, a
   0660 F5            [11]  275 	push	af
   0661 33            [ 6]  276 	inc	sp
   0662 26 C0         [ 7]  277 	ld	h, #0xc0
   0664 E5            [11]  278 	push	hl
   0665 CD 0B 25      [17]  279 	call	_cpct_memset
                            280 ;src/main.c:198: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   0668 21 0F 0F      [10]  281 	ld	hl, #0x0f0f
   066B E5            [11]  282 	push	hl
   066C 21 00 C0      [10]  283 	ld	hl, #0xc000
   066F E5            [11]  284 	push	hl
   0670 CD 02 26      [17]  285 	call	_cpct_getScreenPtr
                            286 ;src/main.c:199: cpct_drawSprite(sprite, p, 4, 8);
   0673 E5            [11]  287 	push	hl
   0674 01 04 08      [10]  288 	ld	bc, #0x0804
   0677 C5            [11]  289 	push	bc
   0678 E5            [11]  290 	push	hl
   0679 01 C5 05      [10]  291 	ld	bc, #_g_items_0
   067C C5            [11]  292 	push	bc
   067D CD 2A 23      [17]  293 	call	_cpct_drawSprite
   0680 01 00 20      [10]  294 	ld	bc, #0x2000
   0683 C5            [11]  295 	push	bc
   0684 01 FF FF      [10]  296 	ld	bc, #0xffff
   0687 C5            [11]  297 	push	bc
   0688 01 00 C0      [10]  298 	ld	bc, #0xc000
   068B C5            [11]  299 	push	bc
   068C CD 31 24      [17]  300 	call	_cpct_memset_f64
   068F 01 C5 05      [10]  301 	ld	bc, #_g_items_0
   0692 C5            [11]  302 	push	bc
   0693 01 04 08      [10]  303 	ld	bc, #0x0804
   0696 C5            [11]  304 	push	bc
   0697 CD 9D 24      [17]  305 	call	_cpct_hflipSpriteM0
   069A E1            [10]  306 	pop	hl
                            307 ;src/main.c:207: cpct_drawSprite(sprite, p, 4, 8);
   069B 01 04 08      [10]  308 	ld	bc, #0x0804
   069E C5            [11]  309 	push	bc
   069F E5            [11]  310 	push	hl
   06A0 21 C5 05      [10]  311 	ld	hl, #_g_items_0
   06A3 E5            [11]  312 	push	hl
   06A4 CD 2A 23      [17]  313 	call	_cpct_drawSprite
                            314 ;src/main.c:209: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   06A7 21 0F 1F      [10]  315 	ld	hl, #0x1f0f
   06AA E5            [11]  316 	push	hl
   06AB 21 00 C0      [10]  317 	ld	hl, #0xc000
   06AE E5            [11]  318 	push	hl
   06AF CD 02 26      [17]  319 	call	_cpct_getScreenPtr
                            320 ;src/main.c:211: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   06B2 E5            [11]  321 	push	hl
   06B3 21 02 03      [10]  322 	ld	hl, #0x0302
   06B6 E5            [11]  323 	push	hl
   06B7 CD EF 24      [17]  324 	call	_cpct_px2byteM0
   06BA 55            [ 4]  325 	ld	d, l
   06BB C1            [10]  326 	pop	bc
   06BC 21 0A 14      [10]  327 	ld	hl, #0x140a
   06BF E5            [11]  328 	push	hl
   06C0 D5            [11]  329 	push	de
   06C1 33            [ 6]  330 	inc	sp
   06C2 C5            [11]  331 	push	bc
   06C3 CD 19 25      [17]  332 	call	_cpct_drawSolidBox
   06C6 F1            [10]  333 	pop	af
                            334 ;src/main.c:214: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   06C7 33            [ 6]  335 	inc	sp
   06C8 21 09 4F      [10]  336 	ld	hl,#0x4f09
   06CB E3            [19]  337 	ex	(sp),hl
   06CC 21 00 C0      [10]  338 	ld	hl, #0xc000
   06CF E5            [11]  339 	push	hl
   06D0 CD 02 26      [17]  340 	call	_cpct_getScreenPtr
                            341 ;src/main.c:215: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   06D3 01 7B 08      [10]  342 	ld	bc, #_g_tile_schtroumpf+0
   06D6 11 10 20      [10]  343 	ld	de, #0x2010
   06D9 D5            [11]  344 	push	de
   06DA E5            [11]  345 	push	hl
   06DB C5            [11]  346 	push	bc
   06DC CD 02 24      [17]  347 	call	_cpct_drawSpriteMasked
                            348 ;src/main.c:229: cpct_srand(77);
   06DF 21 4D 00      [10]  349 	ld	hl,#0x004d
   06E2 11 00 00      [10]  350 	ld	de,#0x0000
   06E5 CD CF 23      [17]  351 	call	_cpct_setSeed_mxor
   06E8 CD D7 23      [17]  352 	call	_cpct_restoreState_mxor_u8
                            353 ;src/main.c:252: while (1) {
   06EB                     354 00102$:
                            355 ;src/main.c:253: vsync();
   06EB CD 5E 07      [17]  356 	call	_vsync
                            357 ;src/main.c:255: screen_location++;
   06EE FD 21 EF 26   [14]  358 	ld	iy, #_screen_location
   06F2 FD 34 00      [23]  359 	inc	0 (iy)
   06F5 20 03         [12]  360 	jr	NZ,00110$
   06F7 FD 34 01      [23]  361 	inc	1 (iy)
   06FA                     362 00110$:
                            363 ;src/main.c:256: screen_location=((unsigned int)screen_location) & 0x13FF;
   06FA 2A EF 26      [16]  364 	ld	hl, (_screen_location)
   06FD 7C            [ 4]  365 	ld	a, h
   06FE E6 13         [ 7]  366 	and	a, #0x13
   0700 67            [ 4]  367 	ld	h, a
   0701 22 EF 26      [16]  368 	ld	(_screen_location), hl
                            369 ;src/main.c:257: crtc((u16)screen_location);
   0704 2A EF 26      [16]  370 	ld	hl, (_screen_location)
   0707 E5            [11]  371 	push	hl
   0708 CD E5 05      [17]  372 	call	_crtc
   070B F1            [10]  373 	pop	af
                            374 ;src/main.c:259: screen_plot_address++;
   070C FD 21 F1 26   [14]  375 	ld	iy, #_screen_plot_address
   0710 FD 34 00      [23]  376 	inc	0 (iy)
   0713 20 03         [12]  377 	jr	NZ,00111$
   0715 FD 34 01      [23]  378 	inc	1 (iy)
   0718                     379 00111$:
                            380 ;src/main.c:260: screen_plot_address++;
   0718 FD 34 00      [23]  381 	inc	0 (iy)
   071B 20 03         [12]  382 	jr	NZ,00112$
   071D FD 34 01      [23]  383 	inc	1 (iy)
   0720                     384 00112$:
                            385 ;src/main.c:261: screen_plot_address=((unsigned int)screen_plot_address) & 0x47FF;
   0720 2A F1 26      [16]  386 	ld	hl, (_screen_plot_address)
   0723 7C            [ 4]  387 	ld	a, h
   0724 E6 47         [ 7]  388 	and	a, #0x47
   0726 67            [ 4]  389 	ld	h, a
   0727 22 F1 26      [16]  390 	ld	(_screen_plot_address), hl
                            391 ;src/main.c:263: p = cpct_getScreenPtr(screen_plot_address, 0,0);
   072A 2A F1 26      [16]  392 	ld	hl, (_screen_plot_address)
   072D 01 00 00      [10]  393 	ld	bc, #0x0000
   0730 C5            [11]  394 	push	bc
   0731 E5            [11]  395 	push	hl
   0732 CD 02 26      [17]  396 	call	_cpct_getScreenPtr
                            397 ;src/main.c:264: s=(s+1)%32;
   0735 C1            [10]  398 	pop	bc
   0736 C5            [11]  399 	push	bc
   0737 03            [ 6]  400 	inc	bc
   0738 21 20 00      [10]  401 	ld	hl, #0x0020
   073B E5            [11]  402 	push	hl
   073C C5            [11]  403 	push	bc
   073D CD DE 25      [17]  404 	call	__modsint
   0740 F1            [10]  405 	pop	af
   0741 F1            [10]  406 	pop	af
   0742 33            [ 6]  407 	inc	sp
   0743 33            [ 6]  408 	inc	sp
   0744 E5            [11]  409 	push	hl
                            410 ;src/main.c:266: cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_00_W, G_TILE_SCHTROUMPF4X32_00_H);
   0745 ED 5B F1 26   [20]  411 	ld	de, (_screen_plot_address)
   0749 01 38 01      [10]  412 	ld	bc, #_g_tile_schtroumpf4x32_tileset+0
   074C E1            [10]  413 	pop	hl
   074D E5            [11]  414 	push	hl
   074E 29            [11]  415 	add	hl, hl
   074F 09            [11]  416 	add	hl, bc
   0750 4E            [ 7]  417 	ld	c, (hl)
   0751 23            [ 6]  418 	inc	hl
   0752 46            [ 7]  419 	ld	b, (hl)
   0753 21 02 08      [10]  420 	ld	hl, #0x0802
   0756 E5            [11]  421 	push	hl
   0757 D5            [11]  422 	push	de
   0758 C5            [11]  423 	push	bc
   0759 CD 2A 23      [17]  424 	call	_cpct_drawSprite
   075C 18 8D         [12]  425 	jr	00102$
                            426 	.area _CODE
                            427 	.area _INITIALIZER
   26F8                     428 __xinit__intCounter:
   26F8 00                  429 	.db #0x00	; 0
   26F9                     430 __xinit__hOffset:
   26F9 00 00               431 	.dw #0x0000
   26FB                     432 __xinit__slow:
   26FB 00                  433 	.db #0x00	; 0
   26FC                     434 __xinit__screen_location:
   26FC 00 10               435 	.dw #0x1000
   26FE                     436 __xinit__screen_plot_address:
   26FE 4E 40               437 	.dw #0x404e
                            438 	.area _CABS (ABS)
