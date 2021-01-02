                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module txt_scroll_hard
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _scroll_hard
                             12 	.globl _draw_char
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawTileAligned2x8_f
                             15 	.globl _firstPlotScreen2
                             16 	.globl _c_screen3
                             17 	.globl _plot_screen2
                             18 	.globl _texte
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   4C0F                      26 _plot_screen2::
   4C0F                      27 	.ds 2
   4C11                      28 _c_screen3::
   4C11                      29 	.ds 1
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
   4C16                      34 _firstPlotScreen2::
   4C16                      35 	.ds 1
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/txt_scroll_hard.c:16: u8 draw_char(u8 c, u8 ce2, u8* image, u8* plot) {
                             57 ;	---------------------------------
                             58 ; Function draw_char
                             59 ; ---------------------------------
   0348                      60 _draw_char::
   0348 DD E5         [15]   61 	push	ix
   034A DD 21 00 00   [14]   62 	ld	ix,#0
   034E DD 39         [15]   63 	add	ix,sp
   0350 F5            [11]   64 	push	af
                             65 ;src/txt_scroll_hard.c:24: u8 c_screen2=ce2;
   0351 DD 4E 05      [19]   66 	ld	c, 5 (ix)
                             67 ;src/txt_scroll_hard.c:25: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
   0354 DD 5E 04      [19]   68 	ld	e, 4 (ix)
   0357 16 00         [ 7]   69 	ld	d, #0x00
   0359 6B            [ 4]   70 	ld	l, e
   035A 62            [ 4]   71 	ld	h, d
   035B 29            [11]   72 	add	hl, hl
   035C 29            [11]   73 	add	hl, hl
   035D 19            [11]   74 	add	hl, de
   035E 29            [11]   75 	add	hl, hl
   035F 29            [11]   76 	add	hl, hl
   0360 29            [11]   77 	add	hl, hl
   0361 29            [11]   78 	add	hl, hl
   0362 EB            [ 4]   79 	ex	de,hl
   0363 21 01 78      [10]   80 	ld	hl, #0x7801
   0366 19            [11]   81 	add	hl,de
   0367 EB            [ 4]   82 	ex	de,hl
   0368 DD 6E 08      [19]   83 	ld	l,8 (ix)
   036B DD 66 09      [19]   84 	ld	h,9 (ix)
   036E 19            [11]   85 	add	hl, de
                             86 ;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
   036F 33            [ 6]   87 	inc	sp
   0370 33            [ 6]   88 	inc	sp
   0371 E5            [11]   89 	push	hl
                             90 ;src/txt_scroll_hard.c:71: cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
   0372 DD 6E 04      [19]   91 	ld	l, 4 (ix)
   0375 26 00         [ 7]   92 	ld	h, #0x00
   0377 29            [11]   93 	add	hl, hl
   0378 29            [11]   94 	add	hl, hl
   0379 29            [11]   95 	add	hl, hl
   037A 29            [11]   96 	add	hl, hl
   037B EB            [ 4]   97 	ex	de,hl
   037C DD 6E 06      [19]   98 	ld	l,6 (ix)
   037F DD 66 07      [19]   99 	ld	h,7 (ix)
   0382 19            [11]  100 	add	hl, de
   0383 EB            [ 4]  101 	ex	de,hl
                            102 ;src/txt_scroll_hard.c:27: if (last_plot<0x4000) {
   0384 DD 7E FF      [19]  103 	ld	a, -1 (ix)
   0387 D6 40         [ 7]  104 	sub	a, #0x40
   0389 30 48         [12]  105 	jr	NC,00106$
                            106 ;src/txt_scroll_hard.c:29: c_screen3=c;
   038B DD 46 04      [19]  107 	ld	b, 4 (ix)
                            108 ;src/txt_scroll_hard.c:28: if (c<c_screen3) {
   038E 21 11 4C      [10]  109 	ld	hl, #_c_screen3
   0391 DD 7E 04      [19]  110 	ld	a, 4 (ix)
   0394 96            [ 7]  111 	sub	a, (hl)
   0395 30 0A         [12]  112 	jr	NC,00102$
                            113 ;src/txt_scroll_hard.c:29: c_screen3=c;
   0397 21 11 4C      [10]  114 	ld	hl,#_c_screen3 + 0
   039A 70            [ 7]  115 	ld	(hl), b
                            116 ;src/txt_scroll_hard.c:30: plot_screen2=0x8000;
   039B 21 00 80      [10]  117 	ld	hl, #0x8000
   039E 22 0F 4C      [16]  118 	ld	(_plot_screen2), hl
   03A1                     119 00102$:
                            120 ;src/txt_scroll_hard.c:32: if (c<c_screen2) {
   03A1 DD 7E 04      [19]  121 	ld	a, 4 (ix)
   03A4 91            [ 4]  122 	sub	a, c
   03A5 30 01         [12]  123 	jr	NC,00104$
                            124 ;src/txt_scroll_hard.c:33: c_screen2=c;
   03A7 48            [ 4]  125 	ld	c, b
   03A8                     126 00104$:
                            127 ;src/txt_scroll_hard.c:51: p = cpct_getScreenPtr(plot_screen2+0x4000, 0,8*(c-c_screen2));
   03A8 DD 7E 04      [19]  128 	ld	a, 4 (ix)
   03AB 91            [ 4]  129 	sub	a, c
   03AC 07            [ 4]  130 	rlca
   03AD 07            [ 4]  131 	rlca
   03AE 07            [ 4]  132 	rlca
   03AF E6 F8         [ 7]  133 	and	a, #0xf8
   03B1 47            [ 4]  134 	ld	b, a
   03B2 FD 21 00 40   [14]  135 	ld	iy, #0x4000
   03B6 C5            [11]  136 	push	bc
   03B7 ED 4B 0F 4C   [20]  137 	ld	bc, (_plot_screen2)
   03BB FD 09         [15]  138 	add	iy, bc
   03BD C1            [10]  139 	pop	bc
   03BE C5            [11]  140 	push	bc
   03BF D5            [11]  141 	push	de
   03C0 C5            [11]  142 	push	bc
   03C1 33            [ 6]  143 	inc	sp
   03C2 AF            [ 4]  144 	xor	a, a
   03C3 F5            [11]  145 	push	af
   03C4 33            [ 6]  146 	inc	sp
   03C5 FD E5         [15]  147 	push	iy
   03C7 CD 69 4B      [17]  148 	call	_cpct_getScreenPtr
   03CA D1            [10]  149 	pop	de
   03CB E5            [11]  150 	push	hl
   03CC D5            [11]  151 	push	de
   03CD CD 89 4B      [17]  152 	call	_cpct_drawTileAligned2x8_f
   03D0 C1            [10]  153 	pop	bc
   03D1 18 28         [12]  154 	jr	00107$
   03D3                     155 00106$:
                            156 ;src/txt_scroll_hard.c:92: p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
   03D3 DD 7E 04      [19]  157 	ld	a, 4 (ix)
   03D6 07            [ 4]  158 	rlca
   03D7 07            [ 4]  159 	rlca
   03D8 07            [ 4]  160 	rlca
   03D9 E6 F8         [ 7]  161 	and	a, #0xf8
   03DB 67            [ 4]  162 	ld	h, a
   03DC DD 7E 08      [19]  163 	ld	a, 8 (ix)
   03DF C6 00         [ 7]  164 	add	a, #0x00
   03E1 6F            [ 4]  165 	ld	l, a
   03E2 DD 7E 09      [19]  166 	ld	a, 9 (ix)
   03E5 CE 40         [ 7]  167 	adc	a, #0x40
   03E7 47            [ 4]  168 	ld	b, a
   03E8 C5            [11]  169 	push	bc
   03E9 D5            [11]  170 	push	de
   03EA E5            [11]  171 	push	hl
   03EB 33            [ 6]  172 	inc	sp
   03EC AF            [ 4]  173 	xor	a, a
   03ED F5            [11]  174 	push	af
   03EE 33            [ 6]  175 	inc	sp
   03EF 60            [ 4]  176 	ld	h, b
   03F0 E5            [11]  177 	push	hl
   03F1 CD 69 4B      [17]  178 	call	_cpct_getScreenPtr
   03F4 D1            [10]  179 	pop	de
   03F5 E5            [11]  180 	push	hl
   03F6 D5            [11]  181 	push	de
   03F7 CD 89 4B      [17]  182 	call	_cpct_drawTileAligned2x8_f
   03FA C1            [10]  183 	pop	bc
   03FB                     184 00107$:
                            185 ;src/txt_scroll_hard.c:95: return c_screen2;
   03FB 69            [ 4]  186 	ld	l, c
   03FC DD F9         [10]  187 	ld	sp, ix
   03FE DD E1         [14]  188 	pop	ix
   0400 C9            [10]  189 	ret
                            190 ;src/txt_scroll_hard.c:106: void scroll_hard(u16 step, u8* screen_plot_address) {
                            191 ;	---------------------------------
                            192 ; Function scroll_hard
                            193 ; ---------------------------------
   0401                     194 _scroll_hard::
   0401 DD E5         [15]  195 	push	ix
   0403 DD 21 00 00   [14]  196 	ld	ix,#0
   0407 DD 39         [15]  197 	add	ix,sp
   0409 F5            [11]  198 	push	af
                            199 ;src/txt_scroll_hard.c:113: u8* plot=screen_plot_address;
   040A DD 4E 06      [19]  200 	ld	c,6 (ix)
   040D DD 46 07      [19]  201 	ld	b,7 (ix)
                            202 ;src/txt_scroll_hard.c:117: div=step/8;
   0410 DD 5E 04      [19]  203 	ld	e,4 (ix)
   0413 DD 56 05      [19]  204 	ld	d,5 (ix)
   0416 CB 3A         [ 8]  205 	srl	d
   0418 CB 1B         [ 8]  206 	rr	e
   041A CB 3A         [ 8]  207 	srl	d
   041C CB 1B         [ 8]  208 	rr	e
   041E CB 3A         [ 8]  209 	srl	d
   0420 CB 1B         [ 8]  210 	rr	e
                            211 ;src/txt_scroll_hard.c:118: mod=step%8;
   0422 DD 7E 04      [19]  212 	ld	a, 4 (ix)
   0425 E6 07         [ 7]  213 	and	a, #0x07
   0427 DD 77 FE      [19]  214 	ld	-2 (ix), a
   042A DD 36 FF 00   [19]  215 	ld	-1 (ix), #0x00
                            216 ;src/txt_scroll_hard.c:119: div=div%128;
   042E CB BB         [ 8]  217 	res	7, e
   0430 16 00         [ 7]  218 	ld	d, #0x00
                            219 ;src/txt_scroll_hard.c:120: if (texte[div]==' ') {
   0432 21 D0 04      [10]  220 	ld	hl, #_texte+0
   0435 19            [11]  221 	add	hl, de
   0436 5E            [ 7]  222 	ld	e, (hl)
   0437 7B            [ 4]  223 	ld	a, e
   0438 D6 20         [ 7]  224 	sub	a, #0x20
   043A 20 05         [12]  225 	jr	NZ,00102$
                            226 ;src/txt_scroll_hard.c:121: o=0;
   043C 11 00 00      [10]  227 	ld	de, #0x0000
   043F 18 09         [12]  228 	jr	00103$
   0441                     229 00102$:
                            230 ;src/txt_scroll_hard.c:123: o=texte[div]-'?';
   0441 16 00         [ 7]  231 	ld	d, #0x00
   0443 7B            [ 4]  232 	ld	a, e
   0444 C6 C1         [ 7]  233 	add	a, #0xc1
   0446 5F            [ 4]  234 	ld	e, a
   0447 7A            [ 4]  235 	ld	a, d
   0448 CE FF         [ 7]  236 	adc	a, #0xff
   044A                     237 00103$:
                            238 ;src/txt_scroll_hard.c:126: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   044A 21 52 05      [10]  239 	ld	hl, #_g_tile_fontmap32x32plat_000
   044D 7B            [ 4]  240 	ld	a, e
   044E 87            [ 4]  241 	add	a, a
   044F 57            [ 4]  242 	ld	d, a
   0450 1E 00         [ 7]  243 	ld	e, #0x00
   0452 19            [11]  244 	add	hl,de
   0453 EB            [ 4]  245 	ex	de,hl
   0454 E1            [10]  246 	pop	hl
   0455 E5            [11]  247 	push	hl
   0456 29            [11]  248 	add	hl, hl
   0457 29            [11]  249 	add	hl, hl
   0458 29            [11]  250 	add	hl, hl
   0459 29            [11]  251 	add	hl, hl
   045A 29            [11]  252 	add	hl, hl
   045B 29            [11]  253 	add	hl, hl
   045C 19            [11]  254 	add	hl,de
   045D EB            [ 4]  255 	ex	de,hl
                            256 ;src/txt_scroll_hard.c:130: ce2=draw_char(0,4,(u8*)pointeur, plot);
   045E C5            [11]  257 	push	bc
   045F D5            [11]  258 	push	de
   0460 C5            [11]  259 	push	bc
   0461 D5            [11]  260 	push	de
   0462 21 00 04      [10]  261 	ld	hl, #0x0400
   0465 E5            [11]  262 	push	hl
   0466 CD 48 03      [17]  263 	call	_draw_char
   0469 F1            [10]  264 	pop	af
   046A F1            [10]  265 	pop	af
   046B F1            [10]  266 	pop	af
   046C D1            [10]  267 	pop	de
   046D C1            [10]  268 	pop	bc
   046E 65            [ 4]  269 	ld	h, l
                            270 ;src/txt_scroll_hard.c:131: ce2=draw_char(1,ce2,(u8*)pointeur, plot);
   046F C5            [11]  271 	push	bc
   0470 D5            [11]  272 	push	de
   0471 C5            [11]  273 	push	bc
   0472 D5            [11]  274 	push	de
   0473 E5            [11]  275 	push	hl
   0474 33            [ 6]  276 	inc	sp
   0475 3E 01         [ 7]  277 	ld	a, #0x01
   0477 F5            [11]  278 	push	af
   0478 33            [ 6]  279 	inc	sp
   0479 CD 48 03      [17]  280 	call	_draw_char
   047C F1            [10]  281 	pop	af
   047D F1            [10]  282 	pop	af
   047E F1            [10]  283 	pop	af
   047F D1            [10]  284 	pop	de
   0480 C1            [10]  285 	pop	bc
   0481 65            [ 4]  286 	ld	h, l
                            287 ;src/txt_scroll_hard.c:132: ce2=draw_char(2,ce2,(u8*)pointeur, plot);
   0482 C5            [11]  288 	push	bc
   0483 D5            [11]  289 	push	de
   0484 C5            [11]  290 	push	bc
   0485 D5            [11]  291 	push	de
   0486 E5            [11]  292 	push	hl
   0487 33            [ 6]  293 	inc	sp
   0488 3E 02         [ 7]  294 	ld	a, #0x02
   048A F5            [11]  295 	push	af
   048B 33            [ 6]  296 	inc	sp
   048C CD 48 03      [17]  297 	call	_draw_char
   048F F1            [10]  298 	pop	af
   0490 F1            [10]  299 	pop	af
   0491 F1            [10]  300 	pop	af
   0492 D1            [10]  301 	pop	de
   0493 C1            [10]  302 	pop	bc
   0494 65            [ 4]  303 	ld	h, l
                            304 ;src/txt_scroll_hard.c:133: ce2=draw_char(3,ce2,(u8*)pointeur, plot);
   0495 C5            [11]  305 	push	bc
   0496 D5            [11]  306 	push	de
   0497 E5            [11]  307 	push	hl
   0498 33            [ 6]  308 	inc	sp
   0499 3E 03         [ 7]  309 	ld	a, #0x03
   049B F5            [11]  310 	push	af
   049C 33            [ 6]  311 	inc	sp
   049D CD 48 03      [17]  312 	call	_draw_char
   04A0 F1            [10]  313 	pop	af
   04A1 F1            [10]  314 	pop	af
   04A2 F1            [10]  315 	pop	af
                            316 ;src/txt_scroll_hard.c:134: if (ce2==4) {
   04A3 7D            [ 4]  317 	ld	a, l
   04A4 D6 04         [ 7]  318 	sub	a, #0x04
   04A6 20 0D         [12]  319 	jr	NZ,00105$
                            320 ;src/txt_scroll_hard.c:136: plot_screen2=0x8000;
   04A8 21 00 80      [10]  321 	ld	hl, #0x8000
   04AB 22 0F 4C      [16]  322 	ld	(_plot_screen2), hl
                            323 ;src/txt_scroll_hard.c:137: c_screen3=4;
   04AE 21 11 4C      [10]  324 	ld	hl,#_c_screen3 + 0
   04B1 36 04         [10]  325 	ld	(hl), #0x04
   04B3 18 16         [12]  326 	jr	00107$
   04B5                     327 00105$:
                            328 ;src/txt_scroll_hard.c:139: plot_screen2+=2;
   04B5 21 0F 4C      [10]  329 	ld	hl, #_plot_screen2
   04B8 7E            [ 7]  330 	ld	a, (hl)
   04B9 C6 02         [ 7]  331 	add	a, #0x02
   04BB 77            [ 7]  332 	ld	(hl), a
   04BC 23            [ 6]  333 	inc	hl
   04BD 7E            [ 7]  334 	ld	a, (hl)
   04BE CE 00         [ 7]  335 	adc	a, #0x00
   04C0 77            [ 7]  336 	ld	(hl), a
                            337 ;src/txt_scroll_hard.c:140: plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
   04C1 2A 0F 4C      [16]  338 	ld	hl, (_plot_screen2)
   04C4 7C            [ 4]  339 	ld	a, h
   04C5 E6 87         [ 7]  340 	and	a, #0x87
   04C7 67            [ 4]  341 	ld	h, a
   04C8 22 0F 4C      [16]  342 	ld	(_plot_screen2), hl
   04CB                     343 00107$:
   04CB DD F9         [10]  344 	ld	sp, ix
   04CD DD E1         [14]  345 	pop	ix
   04CF C9            [10]  346 	ret
   04D0                     347 _texte:
   04D0 57 45 20 57 49 53   348 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   050C 41 4E 44 20 41 20   349 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   0548 44 46 47 20 20 20   350 	.ascii "DFG     "
        20 20
   0550 00                  351 	.db 0x00
   0551 00                  352 	.db 0x00
                            353 	.area _CODE
                            354 	.area _INITIALIZER
   4C1E                     355 __xinit__firstPlotScreen2:
   4C1E 01                  356 	.db #0x01	; 1
                            357 	.area _CABS (ABS)
