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
                             14 	.globl _wait_frame_flyback
                             15 	.globl _calque4000
                             16 	.globl _calqueC000
                             17 	.globl _rupture
                             18 	.globl _restoreVBL
                             19 	.globl _killVBL
                             20 	.globl _cpct_getScreenPtr
                             21 	.globl _cpct_setVideoMemoryOffset
                             22 	.globl _cpct_setPALColour
                             23 	.globl _cpct_setPalette
                             24 	.globl _cpct_setVideoMode
                             25 	.globl _cpct_hflipSpriteM0
                             26 	.globl _cpct_drawSolidBox
                             27 	.globl _cpct_drawSpriteMasked
                             28 	.globl _cpct_drawSprite
                             29 	.globl _cpct_px2byteM0
                             30 	.globl _cpct_memset_f64
                             31 	.globl _cpct_setInterruptHandler
                             32 	.globl _slow
                             33 	.globl _hOffset
                             34 	.globl _intCounter
                             35 	.globl _screen_plot_address
                             36 	.globl _screen_location
                             37 	.globl _g_items_0
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   2640                      45 _screen_location::
   2640                      46 	.ds 2
   2642                      47 _screen_plot_address::
   2642                      48 	.ds 2
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
   2646                      53 _intCounter::
   2646                      54 	.ds 1
   2647                      55 _hOffset::
   2647                      56 	.ds 2
   2649                      57 _slow::
   2649                      58 	.ds 1
                             59 ;--------------------------------------------------------
                             60 ; absolute external ram data
                             61 ;--------------------------------------------------------
                             62 	.area _DABS (ABS)
                             63 ;--------------------------------------------------------
                             64 ; global & static initialisations
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _GSINIT
                             68 	.area _GSFINAL
                             69 	.area _GSINIT
                             70 ;--------------------------------------------------------
                             71 ; Home
                             72 ;--------------------------------------------------------
                             73 	.area _HOME
                             74 	.area _HOME
                             75 ;--------------------------------------------------------
                             76 ; code
                             77 ;--------------------------------------------------------
                             78 	.area _CODE
                             79 ;src/main.c:67: void wait_frame_flyback() {
                             80 ;	---------------------------------
                             81 ; Function wait_frame_flyback
                             82 ; ---------------------------------
   052E                      83 _wait_frame_flyback::
                             84 ;src/main.c:73: __endasm;
   052E 06 F5         [ 7]   85 	ld	b,#0xf5 ;wait frame flyback
   0530                      86 	l1:
   0530 ED 78         [12]   87 	in a,(c)
   0532 1F            [ 4]   88 	rra
   0533 30 FB         [12]   89 	jr	nc,l1
   0535 C9            [10]   90 	ret
   0536                      91 _g_items_0:
   0536 05                   92 	.db #0x05	; 5
   0537 0F                   93 	.db #0x0f	; 15
   0538 0F                   94 	.db #0x0f	; 15
   0539 00                   95 	.db #0x00	; 0
   053A 0F                   96 	.db #0x0f	; 15
   053B 0F                   97 	.db #0x0f	; 15
   053C 0F                   98 	.db #0x0f	; 15
   053D 0A                   99 	.db #0x0a	; 10
   053E 0F                  100 	.db #0x0f	; 15
   053F 0A                  101 	.db #0x0a	; 10
   0540 05                  102 	.db #0x05	; 5
   0541 00                  103 	.db #0x00	; 0
   0542 0F                  104 	.db #0x0f	; 15
   0543 0A                  105 	.db #0x0a	; 10
   0544 05                  106 	.db #0x05	; 5
   0545 00                  107 	.db #0x00	; 0
   0546 05                  108 	.db #0x05	; 5
   0547 0F                  109 	.db #0x0f	; 15
   0548 0A                  110 	.db #0x0a	; 10
   0549 0A                  111 	.db #0x0a	; 10
   054A 00                  112 	.db #0x00	; 0
   054B 0F                  113 	.db #0x0f	; 15
   054C 0F                  114 	.db #0x0f	; 15
   054D 0A                  115 	.db #0x0a	; 10
   054E 00                  116 	.db #0x00	; 0
   054F 0A                  117 	.db #0x0a	; 10
   0550 0A                  118 	.db #0x0a	; 10
   0551 0A                  119 	.db #0x0a	; 10
   0552 00                  120 	.db #0x00	; 0
   0553 00                  121 	.db #0x00	; 0
   0554 00                  122 	.db #0x00	; 0
   0555 00                  123 	.db #0x00	; 0
                            124 ;src/main.c:76: void crtc(u8* R12R13) {
                            125 ;	---------------------------------
                            126 ; Function crtc
                            127 ; ---------------------------------
   0556                     128 _crtc::
                            129 ;src/main.c:93: __endasm;
   0556 DD E5         [15]  130 	push	ix
   0558 DD 21 00 00   [14]  131 	ld	ix,#0
   055C DD 39         [15]  132 	add	ix,sp
   055E DD 66 05      [19]  133 	ld	h, 5 (ix)
   0561 DD 6E 04      [19]  134 	ld	l, 4 (ix)
   0564 01 0C BC      [10]  135 	ld	bc,#0xbc00+12
   0567 ED 49         [12]  136 	out	(c),c
   0569 04            [ 4]  137 	inc	b
   056A ED 61         [12]  138 	out	(c),h
   056C 05            [ 4]  139 	dec	b
   056D 0C            [ 4]  140 	inc	c
   056E ED 49         [12]  141 	out	(c),c
   0570 04            [ 4]  142 	inc	b
   0571 ED 69         [12]  143 	out	(c),l
   0573 DD E1         [14]  144 	pop	ix
   0575 C9            [10]  145 	ret
                            146 ;src/main.c:106: void myInterruptHandler() {
                            147 ;	---------------------------------
                            148 ; Function myInterruptHandler
                            149 ; ---------------------------------
   0576                     150 _myInterruptHandler::
                            151 ;src/main.c:109: intCounter=intCounter+1;
   0576 FD 21 46 26   [14]  152 	ld	iy, #_intCounter
   057A FD 34 00      [23]  153 	inc	0 (iy)
                            154 ;src/main.c:110: if (intCounter == 6) intCounter=0;
   057D FD 7E 00      [19]  155 	ld	a, 0 (iy)
   0580 D6 06         [ 7]  156 	sub	a, #0x06
   0582 20 04         [12]  157 	jr	NZ,00102$
   0584 FD 36 00 00   [19]  158 	ld	0 (iy), #0x00
   0588                     159 00102$:
                            160 ;src/main.c:112: if (intCounter == 2) {
   0588 3A 46 26      [13]  161 	ld	a,(#_intCounter + 0)
   058B D6 02         [ 7]  162 	sub	a, #0x02
   058D 20 09         [12]  163 	jr	NZ,00104$
                            164 ;src/main.c:113: cpct_setBorder(2);
   058F 21 10 02      [10]  165 	ld	hl, #0x0210
   0592 E5            [11]  166 	push	hl
   0593 CD EB 22      [17]  167 	call	_cpct_setPALColour
   0596 18 07         [12]  168 	jr	00105$
   0598                     169 00104$:
                            170 ;src/main.c:115: cpct_setBorder(3);
   0598 21 10 03      [10]  171 	ld	hl, #0x0310
   059B E5            [11]  172 	push	hl
   059C CD EB 22      [17]  173 	call	_cpct_setPALColour
   059F                     174 00105$:
                            175 ;src/main.c:124: if (intCounter==5) {
   059F FD 21 46 26   [14]  176 	ld	iy, #_intCounter
   05A3 FD 7E 00      [19]  177 	ld	a, 0 (iy)
   05A6 D6 05         [ 7]  178 	sub	a, #0x05
   05A8 20 5B         [12]  179 	jr	NZ,00107$
                            180 ;src/main.c:154: __endasm;
   05AA 01 06 BC      [10]  181 	ld	bc,#0xbc06
   05AD ED 49         [12]  182 	out	(c),c
   05AF 01 04 BD      [10]  183 	ld	bc,#0xbd04
   05B2 ED 49         [12]  184 	out	(c),c
                            185 ;src/main.c:156: screen_location++;
   05B4 FD 21 40 26   [14]  186 	ld	iy, #_screen_location
   05B8 FD 34 00      [23]  187 	inc	0 (iy)
   05BB 20 03         [12]  188 	jr	NZ,00140$
   05BD FD 34 01      [23]  189 	inc	1 (iy)
   05C0                     190 00140$:
                            191 ;src/main.c:157: screen_location=(u8 *)(((unsigned int)screen_location) & 0x13FF);
   05C0 2A 40 26      [16]  192 	ld	hl, (_screen_location)
   05C3 7C            [ 4]  193 	ld	a, h
   05C4 E6 13         [ 7]  194 	and	a, #0x13
   05C6 67            [ 4]  195 	ld	h, a
   05C7 22 40 26      [16]  196 	ld	(_screen_location), hl
                            197 ;src/main.c:158: crtc(screen_location);
   05CA 2A 40 26      [16]  198 	ld	hl, (_screen_location)
   05CD E5            [11]  199 	push	hl
   05CE CD 56 05      [17]  200 	call	_crtc
   05D1 F1            [10]  201 	pop	af
                            202 ;src/main.c:160: screen_plot_address++;
   05D2 FD 21 42 26   [14]  203 	ld	iy, #_screen_plot_address
   05D6 FD 34 00      [23]  204 	inc	0 (iy)
   05D9 20 03         [12]  205 	jr	NZ,00141$
   05DB FD 34 01      [23]  206 	inc	1 (iy)
   05DE                     207 00141$:
                            208 ;src/main.c:161: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
   05DE 2A 42 26      [16]  209 	ld	hl, (_screen_plot_address)
   05E1 7C            [ 4]  210 	ld	a, h
   05E2 E6 47         [ 7]  211 	and	a, #0x47
   05E4 67            [ 4]  212 	ld	h, a
   05E5 22 42 26      [16]  213 	ld	(_screen_plot_address), hl
                            214 ;src/main.c:162: screen_plot_address++;
   05E8 FD 34 00      [23]  215 	inc	0 (iy)
   05EB 20 03         [12]  216 	jr	NZ,00142$
   05ED FD 34 01      [23]  217 	inc	1 (iy)
   05F0                     218 00142$:
                            219 ;src/main.c:163: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
   05F0 2A 42 26      [16]  220 	ld	hl, (_screen_plot_address)
   05F3 7C            [ 4]  221 	ld	a, h
   05F4 E6 47         [ 7]  222 	and	a, #0x47
   05F6 67            [ 4]  223 	ld	h, a
   05F7 22 42 26      [16]  224 	ld	(_screen_plot_address), hl
                            225 ;src/main.c:166: killVBL();
   05FA CD 06 04      [17]  226 	call	_killVBL
                            227 ;src/main.c:167: rupture(19-1);
   05FD 3E 12         [ 7]  228 	ld	a, #0x12
   05FF F5            [11]  229 	push	af
   0600 33            [ 6]  230 	inc	sp
   0601 CD 23 04      [17]  231 	call	_rupture
   0604 33            [ 6]  232 	inc	sp
   0605                     233 00107$:
                            234 ;src/main.c:172: if (intCounter==2) {
   0605 FD 21 46 26   [14]  235 	ld	iy, #_intCounter
   0609 FD 7E 00      [19]  236 	ld	a, 0 (iy)
   060C D6 02         [ 7]  237 	sub	a, #0x02
   060E 20 1A         [12]  238 	jr	NZ,00109$
                            239 ;src/main.c:178: __endasm;
   0610 01 06 BC      [10]  240 	ld	bc,#0xbc06
   0613 ED 49         [12]  241 	out	(c),c
   0615 01 19 BD      [10]  242 	ld	bc,#0xbd19
   0618 ED 49         [12]  243 	out	(c),c
                            244 ;src/main.c:179: calqueC000();
   061A CD AB 07      [17]  245 	call	_calqueC000
                            246 ;src/main.c:180: cpct_setVideoMemoryOffset(0);
   061D 2E 00         [ 7]  247 	ld	l, #0x00
   061F CD F7 22      [17]  248 	call	_cpct_setVideoMemoryOffset
                            249 ;src/main.c:181: rupture(7);
   0622 3E 07         [ 7]  250 	ld	a, #0x07
   0624 F5            [11]  251 	push	af
   0625 33            [ 6]  252 	inc	sp
   0626 CD 23 04      [17]  253 	call	_rupture
   0629 33            [ 6]  254 	inc	sp
   062A                     255 00109$:
                            256 ;src/main.c:184: if (intCounter==3) {
   062A 3A 46 26      [13]  257 	ld	a,(#_intCounter + 0)
   062D D6 03         [ 7]  258 	sub	a, #0x03
   062F C0            [11]  259 	ret	NZ
                            260 ;src/main.c:185: calqueC000();
   0630 CD AB 07      [17]  261 	call	_calqueC000
                            262 ;src/main.c:186: cpct_setVideoMemoryOffset(0);
   0633 2E 00         [ 7]  263 	ld	l, #0x00
   0635 CD F7 22      [17]  264 	call	_cpct_setVideoMemoryOffset
                            265 ;src/main.c:187: restoreVBL();
   0638 CD 17 04      [17]  266 	call	_restoreVBL
                            267 ;src/main.c:188: rupture(39-19-7+1);
   063B 3E 0E         [ 7]  268 	ld	a, #0x0e
   063D F5            [11]  269 	push	af
   063E 33            [ 6]  270 	inc	sp
   063F CD 23 04      [17]  271 	call	_rupture
   0642 33            [ 6]  272 	inc	sp
   0643 C9            [10]  273 	ret
                            274 ;src/main.c:193: void main(void) {
                            275 ;	---------------------------------
                            276 ; Function main
                            277 ; ---------------------------------
   0644                     278 _main::
   0644 DD E5         [15]  279 	push	ix
   0646 DD 21 00 00   [14]  280 	ld	ix,#0
   064A DD 39         [15]  281 	add	ix,sp
   064C F5            [11]  282 	push	af
   064D F5            [11]  283 	push	af
                            284 ;src/main.c:195: int s=0;
   064E DD 36 FE 00   [19]  285 	ld	-2 (ix), #0x00
   0652 DD 36 FF 00   [19]  286 	ld	-1 (ix), #0x00
                            287 ;src/main.c:197: u8* sprite=g_items_0;
                            288 ;src/main.c:213: cpct_setInterruptHandler(myInterruptHandler);
   0656 21 76 05      [10]  289 	ld	hl, #_myInterruptHandler
   0659 CD 7D 25      [17]  290 	call	_cpct_setInterruptHandler
                            291 ;src/main.c:223: cpct_setVideoMode(0);
   065C 2E 00         [ 7]  292 	ld	l, #0x00
   065E CD 61 24      [17]  293 	call	_cpct_setVideoMode
                            294 ;src/main.c:225: cpct_setBorder(HW_BLACK);
   0661 21 10 14      [10]  295 	ld	hl, #0x1410
   0664 E5            [11]  296 	push	hl
   0665 CD EB 22      [17]  297 	call	_cpct_setPALColour
                            298 ;src/main.c:227: cpct_setPalette(g_tile_palette, 6);
   0668 21 06 00      [10]  299 	ld	hl, #0x0006
   066B E5            [11]  300 	push	hl
   066C 21 42 08      [10]  301 	ld	hl, #_g_tile_palette
   066F E5            [11]  302 	push	hl
   0670 CD D4 22      [17]  303 	call	_cpct_setPalette
                            304 ;src/main.c:238: cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);
   0673 21 00 20      [10]  305 	ld	hl, #0x2000
   0676 E5            [11]  306 	push	hl
   0677 21 FF FF      [10]  307 	ld	hl, #0xffff
   067A E5            [11]  308 	push	hl
   067B 21 00 C0      [10]  309 	ld	hl, #0xc000
   067E E5            [11]  310 	push	hl
   067F CD D4 23      [17]  311 	call	_cpct_memset_f64
                            312 ;src/main.c:241: cpct_hflipSpriteM0(4, 8, sprite);
   0682 01 36 05      [10]  313 	ld	bc, #_g_items_0
   0685 C5            [11]  314 	push	bc
   0686 C5            [11]  315 	push	bc
   0687 21 04 08      [10]  316 	ld	hl, #0x0804
   068A E5            [11]  317 	push	hl
   068B CD 1D 24      [17]  318 	call	_cpct_hflipSpriteM0
   068E C1            [10]  319 	pop	bc
                            320 ;src/main.c:242: cpct_drawSprite(sprite, p, 4, 8);
   068F D1            [10]  321 	pop	de
   0690 D5            [11]  322 	push	de
   0691 21 04 08      [10]  323 	ld	hl, #0x0804
   0694 E5            [11]  324 	push	hl
   0695 D5            [11]  325 	push	de
   0696 C5            [11]  326 	push	bc
   0697 CD 00 23      [17]  327 	call	_cpct_drawSprite
                            328 ;src/main.c:244: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   069A 21 0F 1F      [10]  329 	ld	hl, #0x1f0f
   069D E5            [11]  330 	push	hl
   069E 21 00 C0      [10]  331 	ld	hl, #0xc000
   06A1 E5            [11]  332 	push	hl
   06A2 CD 5D 25      [17]  333 	call	_cpct_getScreenPtr
                            334 ;src/main.c:246: cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);
   06A5 E5            [11]  335 	push	hl
   06A6 21 02 03      [10]  336 	ld	hl, #0x0302
   06A9 E5            [11]  337 	push	hl
   06AA CD 6F 24      [17]  338 	call	_cpct_px2byteM0
   06AD 55            [ 4]  339 	ld	d, l
   06AE C1            [10]  340 	pop	bc
   06AF 21 0A 14      [10]  341 	ld	hl, #0x140a
   06B2 E5            [11]  342 	push	hl
   06B3 D5            [11]  343 	push	de
   06B4 33            [ 6]  344 	inc	sp
   06B5 C5            [11]  345 	push	bc
   06B6 CD 8B 24      [17]  346 	call	_cpct_drawSolidBox
   06B9 F1            [10]  347 	pop	af
   06BA F1            [10]  348 	pop	af
   06BB 33            [ 6]  349 	inc	sp
                            350 ;src/main.c:249: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   06BC 21 09 4F      [10]  351 	ld	hl, #0x4f09
   06BF E5            [11]  352 	push	hl
   06C0 21 00 C0      [10]  353 	ld	hl, #0xc000
   06C3 E5            [11]  354 	push	hl
   06C4 CD 5D 25      [17]  355 	call	_cpct_getScreenPtr
   06C7 33            [ 6]  356 	inc	sp
   06C8 33            [ 6]  357 	inc	sp
                            358 ;src/main.c:250: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   06C9 4D            [ 4]  359 	ld	c, l
   06CA 44            [ 4]  360 	ld	b, h
   06CB C5            [11]  361 	push	bc
   06CC 21 10 20      [10]  362 	ld	hl, #0x2010
   06CF E5            [11]  363 	push	hl
   06D0 C5            [11]  364 	push	bc
   06D1 21 48 08      [10]  365 	ld	hl, #_g_tile_schtroumpf
   06D4 E5            [11]  366 	push	hl
   06D5 CD A5 23      [17]  367 	call	_cpct_drawSpriteMasked
                            368 ;src/main.c:288: cpct_memset_f64(0x4000,0x00,0x4000); // SCR_VMEM, 0, 0x4000
   06D8 21 00 40      [10]  369 	ld	hl, #0x4000
   06DB E5            [11]  370 	push	hl
   06DC 26 00         [ 7]  371 	ld	h, #0x00
   06DE E5            [11]  372 	push	hl
   06DF 26 40         [ 7]  373 	ld	h, #0x40
   06E1 E5            [11]  374 	push	hl
   06E2 CD D4 23      [17]  375 	call	_cpct_memset_f64
                            376 ;src/main.c:298: calque4000(); // faut que le AND du début match
   06E5 CD B6 07      [17]  377 	call	_calque4000
                            378 ;src/main.c:300: screen_location=0x1000;
   06E8 21 00 10      [10]  379 	ld	hl, #0x1000
   06EB 22 40 26      [16]  380 	ld	(_screen_location), hl
                            381 ;src/main.c:301: screen_plot_address=0x4000+80-2;
   06EE 21 4E 40      [10]  382 	ld	hl, #0x404e
   06F1 22 42 26      [16]  383 	ld	(_screen_plot_address), hl
                            384 ;src/main.c:303: while (1) {
   06F4                     385 00102$:
                            386 ;src/main.c:306: wait_frame_flyback();
   06F4 CD 2E 05      [17]  387 	call	_wait_frame_flyback
                            388 ;src/main.c:311: s=(s+1)%8;
   06F7 DD 4E FE      [19]  389 	ld	c,-2 (ix)
   06FA DD 46 FF      [19]  390 	ld	b,-1 (ix)
   06FD 03            [ 6]  391 	inc	bc
   06FE 21 08 00      [10]  392 	ld	hl, #0x0008
   0701 E5            [11]  393 	push	hl
   0702 C5            [11]  394 	push	bc
   0703 CD 50 25      [17]  395 	call	__modsint
   0706 F1            [10]  396 	pop	af
   0707 F1            [10]  397 	pop	af
   0708 DD 75 FE      [19]  398 	ld	-2 (ix), l
   070B DD 74 FF      [19]  399 	ld	-1 (ix), h
                            400 ;src/main.c:312: cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_0_W, G_TILE_SCHTROUMPF4X32_0_H);
   070E ED 5B 42 26   [20]  401 	ld	de, (_screen_plot_address)
   0712 01 38 01      [10]  402 	ld	bc, #_g_tile_schtroumpf4x32_tileset+0
   0715 DD 6E FE      [19]  403 	ld	l,-2 (ix)
   0718 DD 66 FF      [19]  404 	ld	h,-1 (ix)
   071B 29            [11]  405 	add	hl, hl
   071C 09            [11]  406 	add	hl, bc
   071D 4E            [ 7]  407 	ld	c, (hl)
   071E 23            [ 6]  408 	inc	hl
   071F 46            [ 7]  409 	ld	b, (hl)
   0720 21 02 20      [10]  410 	ld	hl, #0x2002
   0723 E5            [11]  411 	push	hl
   0724 D5            [11]  412 	push	de
   0725 C5            [11]  413 	push	bc
   0726 CD 00 23      [17]  414 	call	_cpct_drawSprite
   0729 18 C9         [12]  415 	jr	00102$
                            416 	.area _CODE
                            417 	.area _INITIALIZER
   264F                     418 __xinit__intCounter:
   264F 00                  419 	.db #0x00	; 0
   2650                     420 __xinit__hOffset:
   2650 00 00               421 	.dw #0x0000
   2652                     422 __xinit__slow:
   2652 00                  423 	.db #0x00	; 0
                            424 	.area _CABS (ABS)
