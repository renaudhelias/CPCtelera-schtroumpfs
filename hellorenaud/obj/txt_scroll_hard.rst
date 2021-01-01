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
                             13 	.globl _texte
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 ;src/txt_scroll_hard.c:13: void draw_char(u8 c, u8* image, u8* plot) {
                             46 ;	---------------------------------
                             47 ; Function draw_char
                             48 ; ---------------------------------
   0348                      49 _draw_char::
   0348 DD E5         [15]   50 	push	ix
   034A DD 21 00 00   [14]   51 	ld	ix,#0
   034E DD 39         [15]   52 	add	ix,sp
   0350 F5            [11]   53 	push	af
   0351 F5            [11]   54 	push	af
                             55 ;src/txt_scroll_hard.c:20: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
   0352 DD 4E 04      [19]   56 	ld	c, 4 (ix)
   0355 06 00         [ 7]   57 	ld	b, #0x00
   0357 69            [ 4]   58 	ld	l, c
   0358 60            [ 4]   59 	ld	h, b
   0359 29            [11]   60 	add	hl, hl
   035A 29            [11]   61 	add	hl, hl
   035B 09            [11]   62 	add	hl, bc
   035C 29            [11]   63 	add	hl, hl
   035D 29            [11]   64 	add	hl, hl
   035E 29            [11]   65 	add	hl, hl
   035F 29            [11]   66 	add	hl, hl
   0360 4D            [ 4]   67 	ld	c, l
   0361 44            [ 4]   68 	ld	b, h
   0362 21 01 78      [10]   69 	ld	hl, #0x7801
   0365 09            [11]   70 	add	hl,bc
   0366 EB            [ 4]   71 	ex	de,hl
   0367 DD 6E 07      [19]   72 	ld	l,7 (ix)
   036A DD 66 08      [19]   73 	ld	h,8 (ix)
   036D 19            [11]   74 	add	hl, de
   036E 54            [ 4]   75 	ld	d, h
                             76 ;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
                             77 ;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
   036F DD 7E 07      [19]   78 	ld	a, 7 (ix)
   0372 C6 00         [ 7]   79 	add	a, #0x00
   0374 6F            [ 4]   80 	ld	l, a
   0375 DD 7E 08      [19]   81 	ld	a, 8 (ix)
   0378 CE 40         [ 7]   82 	adc	a, #0x40
   037A 67            [ 4]   83 	ld	h, a
   037B 09            [11]   84 	add	hl,bc
   037C 4D            [ 4]   85 	ld	c, l
   037D 44            [ 4]   86 	ld	b, h
                             87 ;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
   037E 7A            [ 4]   88 	ld	a, d
   037F D6 40         [ 7]   89 	sub	a, #0x40
   0381 30 40         [12]   90 	jr	NC,00129$
                             91 ;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
   0383 DD 36 FC 00   [19]   92 	ld	-4 (ix), #0x00
                             93 ;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
   0387                      94 00123$:
   0387 DD 36 FD 00   [19]   95 	ld	-3 (ix), #0x00
   038B                      96 00111$:
                             97 ;src/txt_scroll_hard.c:24: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
   038B DD 7E FC      [19]   98 	ld	a, -4 (ix)
   038E E6 07         [ 7]   99 	and	a, #0x07
   0390 07            [ 4]  100 	rlca
   0391 07            [ 4]  101 	rlca
   0392 07            [ 4]  102 	rlca
   0393 E6 F8         [ 7]  103 	and	a, #0xf8
   0395 67            [ 4]  104 	ld	h, a
   0396 2E 00         [ 7]  105 	ld	l, #0x00
   0398 09            [11]  106 	add	hl, bc
   0399 DD 5E FD      [19]  107 	ld	e,-3 (ix)
   039C 16 00         [ 7]  108 	ld	d,#0x00
   039E 19            [11]  109 	add	hl, de
                            110 ;src/txt_scroll_hard.c:26: if (cur_plot<0x4000) {
                            111 ;src/txt_scroll_hard.c:27: cur_plot=cur_plot-0x4000;
   039F 7C            [ 4]  112 	ld	a,h
   03A0 FE 40         [ 7]  113 	cp	a,#0x40
   03A2 30 07         [12]  114 	jr	NC,00102$
   03A4 C6 C0         [ 7]  115 	add	a,#0xc0
   03A6 67            [ 4]  116 	ld	h, a
                            117 ;src/txt_scroll_hard.c:29: *cur_plot=0xF0;
   03A7 36 F0         [10]  118 	ld	(hl), #0xf0
   03A9 18 02         [12]  119 	jr	00112$
   03AB                     120 00102$:
                            121 ;src/txt_scroll_hard.c:31: *cur_plot=0xFF;
   03AB 36 FF         [10]  122 	ld	(hl), #0xff
   03AD                     123 00112$:
                            124 ;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
   03AD DD 34 FD      [23]  125 	inc	-3 (ix)
   03B0 DD 7E FD      [19]  126 	ld	a, -3 (ix)
   03B3 D6 02         [ 7]  127 	sub	a, #0x02
   03B5 38 D4         [12]  128 	jr	C,00111$
                            129 ;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
   03B7 DD 34 FC      [23]  130 	inc	-4 (ix)
   03BA DD 7E FC      [19]  131 	ld	a, -4 (ix)
   03BD D6 08         [ 7]  132 	sub	a, #0x08
   03BF 38 C6         [12]  133 	jr	C,00123$
   03C1 18 5C         [12]  134 	jr	00119$
                            135 ;src/txt_scroll_hard.c:36: for (y=0;y<8;y++) {
   03C3                     136 00129$:
   03C3 DD 36 FC 00   [19]  137 	ld	-4 (ix), #0x00
                            138 ;src/txt_scroll_hard.c:37: for (x=0;x<2;x++) {
   03C7                     139 00127$:
   03C7 DD 36 FD 00   [19]  140 	ld	-3 (ix), #0x00
   03CB                     141 00115$:
                            142 ;src/txt_scroll_hard.c:38: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
   03CB DD 7E FC      [19]  143 	ld	a, -4 (ix)
   03CE E6 07         [ 7]  144 	and	a, #0x07
   03D0 07            [ 4]  145 	rlca
   03D1 07            [ 4]  146 	rlca
   03D2 07            [ 4]  147 	rlca
   03D3 E6 F8         [ 7]  148 	and	a, #0xf8
   03D5 67            [ 4]  149 	ld	h, a
   03D6 2E 00         [ 7]  150 	ld	l, #0x00
   03D8 09            [11]  151 	add	hl, bc
   03D9 7D            [ 4]  152 	ld	a, l
   03DA DD 86 FD      [19]  153 	add	a, -3 (ix)
   03DD DD 77 FE      [19]  154 	ld	-2 (ix), a
   03E0 7C            [ 4]  155 	ld	a, h
   03E1 CE 00         [ 7]  156 	adc	a, #0x00
   03E3 DD 77 FF      [19]  157 	ld	-1 (ix), a
                            158 ;src/txt_scroll_hard.c:39: cur_image=image+(c*8+y)*2+x;
   03E6 DD 6E 04      [19]  159 	ld	l, 4 (ix)
   03E9 26 00         [ 7]  160 	ld	h, #0x00
   03EB 29            [11]  161 	add	hl, hl
   03EC 29            [11]  162 	add	hl, hl
   03ED 29            [11]  163 	add	hl, hl
   03EE DD 5E FC      [19]  164 	ld	e, -4 (ix)
   03F1 16 00         [ 7]  165 	ld	d, #0x00
   03F3 19            [11]  166 	add	hl, de
   03F4 29            [11]  167 	add	hl, hl
   03F5 EB            [ 4]  168 	ex	de,hl
   03F6 DD 6E 05      [19]  169 	ld	l,5 (ix)
   03F9 DD 66 06      [19]  170 	ld	h,6 (ix)
   03FC 19            [11]  171 	add	hl, de
   03FD DD 5E FD      [19]  172 	ld	e,-3 (ix)
   0400 16 00         [ 7]  173 	ld	d,#0x00
   0402 19            [11]  174 	add	hl, de
                            175 ;src/txt_scroll_hard.c:40: *cur_plot=*cur_image;
   0403 5E            [ 7]  176 	ld	e, (hl)
   0404 DD 6E FE      [19]  177 	ld	l,-2 (ix)
   0407 DD 66 FF      [19]  178 	ld	h,-1 (ix)
   040A 73            [ 7]  179 	ld	(hl), e
                            180 ;src/txt_scroll_hard.c:37: for (x=0;x<2;x++) {
   040B DD 34 FD      [23]  181 	inc	-3 (ix)
   040E DD 7E FD      [19]  182 	ld	a, -3 (ix)
   0411 D6 02         [ 7]  183 	sub	a, #0x02
   0413 38 B6         [12]  184 	jr	C,00115$
                            185 ;src/txt_scroll_hard.c:36: for (y=0;y<8;y++) {
   0415 DD 34 FC      [23]  186 	inc	-4 (ix)
   0418 DD 7E FC      [19]  187 	ld	a, -4 (ix)
   041B D6 08         [ 7]  188 	sub	a, #0x08
   041D 38 A8         [12]  189 	jr	C,00127$
   041F                     190 00119$:
   041F DD F9         [10]  191 	ld	sp, ix
   0421 DD E1         [14]  192 	pop	ix
   0423 C9            [10]  193 	ret
                            194 ;src/txt_scroll_hard.c:90: void scroll_hard(u16 step, u8* screen_plot_address) {
                            195 ;	---------------------------------
                            196 ; Function scroll_hard
                            197 ; ---------------------------------
   0424                     198 _scroll_hard::
   0424 DD E5         [15]  199 	push	ix
   0426 DD 21 00 00   [14]  200 	ld	ix,#0
   042A DD 39         [15]  201 	add	ix,sp
   042C F5            [11]  202 	push	af
                            203 ;src/txt_scroll_hard.c:96: u8* plot=screen_plot_address;
   042D DD 4E 06      [19]  204 	ld	c,6 (ix)
   0430 DD 46 07      [19]  205 	ld	b,7 (ix)
                            206 ;src/txt_scroll_hard.c:99: div=step/8;
   0433 DD 5E 04      [19]  207 	ld	e,4 (ix)
   0436 DD 56 05      [19]  208 	ld	d,5 (ix)
   0439 CB 3A         [ 8]  209 	srl	d
   043B CB 1B         [ 8]  210 	rr	e
   043D CB 3A         [ 8]  211 	srl	d
   043F CB 1B         [ 8]  212 	rr	e
   0441 CB 3A         [ 8]  213 	srl	d
   0443 CB 1B         [ 8]  214 	rr	e
                            215 ;src/txt_scroll_hard.c:100: mod=step%8;
   0445 DD 7E 04      [19]  216 	ld	a, 4 (ix)
   0448 E6 07         [ 7]  217 	and	a, #0x07
   044A DD 77 FE      [19]  218 	ld	-2 (ix), a
   044D DD 36 FF 00   [19]  219 	ld	-1 (ix), #0x00
                            220 ;src/txt_scroll_hard.c:101: div=div%128;
   0451 CB BB         [ 8]  221 	res	7, e
   0453 16 00         [ 7]  222 	ld	d, #0x00
                            223 ;src/txt_scroll_hard.c:102: if (texte[div]==' ') {
   0455 21 BD 04      [10]  224 	ld	hl, #_texte+0
   0458 19            [11]  225 	add	hl, de
   0459 5E            [ 7]  226 	ld	e, (hl)
   045A 7B            [ 4]  227 	ld	a, e
   045B D6 20         [ 7]  228 	sub	a, #0x20
   045D 20 05         [12]  229 	jr	NZ,00102$
                            230 ;src/txt_scroll_hard.c:103: o=0;
   045F 11 00 00      [10]  231 	ld	de, #0x0000
   0462 18 09         [12]  232 	jr	00103$
   0464                     233 00102$:
                            234 ;src/txt_scroll_hard.c:105: o=texte[div]-'?';
   0464 16 00         [ 7]  235 	ld	d, #0x00
   0466 7B            [ 4]  236 	ld	a, e
   0467 C6 C1         [ 7]  237 	add	a, #0xc1
   0469 5F            [ 4]  238 	ld	e, a
   046A 7A            [ 4]  239 	ld	a, d
   046B CE FF         [ 7]  240 	adc	a, #0xff
   046D                     241 00103$:
                            242 ;src/txt_scroll_hard.c:108: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   046D 21 3F 05      [10]  243 	ld	hl, #_g_tile_fontmap32x32plat_000
   0470 7B            [ 4]  244 	ld	a, e
   0471 87            [ 4]  245 	add	a, a
   0472 57            [ 4]  246 	ld	d, a
   0473 1E 00         [ 7]  247 	ld	e, #0x00
   0475 19            [11]  248 	add	hl,de
   0476 EB            [ 4]  249 	ex	de,hl
   0477 E1            [10]  250 	pop	hl
   0478 E5            [11]  251 	push	hl
   0479 29            [11]  252 	add	hl, hl
   047A 29            [11]  253 	add	hl, hl
   047B 29            [11]  254 	add	hl, hl
   047C 29            [11]  255 	add	hl, hl
   047D 29            [11]  256 	add	hl, hl
   047E 29            [11]  257 	add	hl, hl
   047F 19            [11]  258 	add	hl, de
                            259 ;src/txt_scroll_hard.c:112: draw_char(0,(u8*)pointeur, plot);
   0480 E5            [11]  260 	push	hl
   0481 C5            [11]  261 	push	bc
   0482 C5            [11]  262 	push	bc
   0483 E5            [11]  263 	push	hl
   0484 AF            [ 4]  264 	xor	a, a
   0485 F5            [11]  265 	push	af
   0486 33            [ 6]  266 	inc	sp
   0487 CD 48 03      [17]  267 	call	_draw_char
   048A F1            [10]  268 	pop	af
   048B F1            [10]  269 	pop	af
   048C 33            [ 6]  270 	inc	sp
   048D C1            [10]  271 	pop	bc
   048E E1            [10]  272 	pop	hl
                            273 ;src/txt_scroll_hard.c:113: draw_char(1,(u8*)pointeur, plot);
   048F E5            [11]  274 	push	hl
   0490 C5            [11]  275 	push	bc
   0491 C5            [11]  276 	push	bc
   0492 E5            [11]  277 	push	hl
   0493 3E 01         [ 7]  278 	ld	a, #0x01
   0495 F5            [11]  279 	push	af
   0496 33            [ 6]  280 	inc	sp
   0497 CD 48 03      [17]  281 	call	_draw_char
   049A F1            [10]  282 	pop	af
   049B F1            [10]  283 	pop	af
   049C 33            [ 6]  284 	inc	sp
   049D C1            [10]  285 	pop	bc
   049E E1            [10]  286 	pop	hl
                            287 ;src/txt_scroll_hard.c:114: draw_char(2,(u8*)pointeur, plot);
   049F E5            [11]  288 	push	hl
   04A0 C5            [11]  289 	push	bc
   04A1 C5            [11]  290 	push	bc
   04A2 E5            [11]  291 	push	hl
   04A3 3E 02         [ 7]  292 	ld	a, #0x02
   04A5 F5            [11]  293 	push	af
   04A6 33            [ 6]  294 	inc	sp
   04A7 CD 48 03      [17]  295 	call	_draw_char
   04AA F1            [10]  296 	pop	af
   04AB F1            [10]  297 	pop	af
   04AC 33            [ 6]  298 	inc	sp
   04AD C1            [10]  299 	pop	bc
   04AE E1            [10]  300 	pop	hl
                            301 ;src/txt_scroll_hard.c:115: draw_char(3,(u8*)pointeur, plot);
   04AF C5            [11]  302 	push	bc
   04B0 E5            [11]  303 	push	hl
   04B1 3E 03         [ 7]  304 	ld	a, #0x03
   04B3 F5            [11]  305 	push	af
   04B4 33            [ 6]  306 	inc	sp
   04B5 CD 48 03      [17]  307 	call	_draw_char
   04B8 DD F9         [10]  308 	ld	sp,ix
   04BA DD E1         [14]  309 	pop	ix
   04BC C9            [10]  310 	ret
   04BD                     311 _texte:
   04BD 57 45 20 57 49 53   312 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   04F9 41 4E 44 20 41 20   313 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   0535 44 46 47 20 20 20   314 	.ascii "DFG     "
        20 20
   053D 00                  315 	.db 0x00
   053E 00                  316 	.db 0x00
                            317 	.area _CODE
                            318 	.area _INITIALIZER
                            319 	.area _CABS (ABS)
