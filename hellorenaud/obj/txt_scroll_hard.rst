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
   0350 21 F4 FF      [10]   53 	ld	hl, #-12
   0353 39            [11]   54 	add	hl, sp
   0354 F9            [ 6]   55 	ld	sp, hl
                             56 ;src/txt_scroll_hard.c:20: last_plot=plot+ 0x4000 +80u*c+ 0x3801;
   0355 DD 4E 04      [19]   57 	ld	c, 4 (ix)
   0358 06 00         [ 7]   58 	ld	b, #0x00
   035A 69            [ 4]   59 	ld	l, c
   035B 60            [ 4]   60 	ld	h, b
   035C 29            [11]   61 	add	hl, hl
   035D 29            [11]   62 	add	hl, hl
   035E 09            [11]   63 	add	hl, bc
   035F 29            [11]   64 	add	hl, hl
   0360 29            [11]   65 	add	hl, hl
   0361 29            [11]   66 	add	hl, hl
   0362 29            [11]   67 	add	hl, hl
   0363 4D            [ 4]   68 	ld	c, l
   0364 44            [ 4]   69 	ld	b, h
   0365 21 01 78      [10]   70 	ld	hl, #0x7801
   0368 09            [11]   71 	add	hl,bc
   0369 EB            [ 4]   72 	ex	de,hl
   036A DD 6E 07      [19]   73 	ld	l,7 (ix)
   036D DD 66 08      [19]   74 	ld	h,8 (ix)
   0370 19            [11]   75 	add	hl, de
                             76 ;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
   0371 DD 75 F6      [19]   77 	ld	-10 (ix), l
   0374 DD 74 F7      [19]   78 	ld	-9 (ix), h
                             79 ;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
   0377 DD 7E 07      [19]   80 	ld	a, 7 (ix)
   037A C6 00         [ 7]   81 	add	a, #0x00
   037C 5F            [ 4]   82 	ld	e, a
   037D DD 7E 08      [19]   83 	ld	a, 8 (ix)
   0380 CE 40         [ 7]   84 	adc	a, #0x40
   0382 57            [ 4]   85 	ld	d, a
                             86 ;src/txt_scroll_hard.c:25: cur_image=image+(c*8+((y+1)%8))*2+x;
   0383 DD 6E 04      [19]   87 	ld	l, 4 (ix)
   0386 26 00         [ 7]   88 	ld	h, #0x00
                             89 ;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
   0388 7B            [ 4]   90 	ld	a, e
   0389 81            [ 4]   91 	add	a, c
   038A DD 77 FE      [19]   92 	ld	-2 (ix), a
   038D 7A            [ 4]   93 	ld	a, d
   038E 88            [ 4]   94 	adc	a, b
   038F DD 77 FF      [19]   95 	ld	-1 (ix), a
                             96 ;src/txt_scroll_hard.c:25: cur_image=image+(c*8+((y+1)%8))*2+x;
   0392 29            [11]   97 	add	hl, hl
   0393 29            [11]   98 	add	hl, hl
   0394 29            [11]   99 	add	hl, hl
   0395 DD 75 F8      [19]  100 	ld	-8 (ix), l
   0398 DD 74 F9      [19]  101 	ld	-7 (ix), h
                            102 ;src/txt_scroll_hard.c:21: if (last_plot<0x4000) {
   039B DD 7E F7      [19]  103 	ld	a, -9 (ix)
   039E D6 40         [ 7]  104 	sub	a, #0x40
   03A0 D2 43 04      [10]  105 	jp	NC, 00128$
                            106 ;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
   03A3 DD 7E FE      [19]  107 	ld	a, -2 (ix)
   03A6 DD 77 F6      [19]  108 	ld	-10 (ix), a
   03A9 DD 7E FF      [19]  109 	ld	a, -1 (ix)
   03AC DD 77 F7      [19]  110 	ld	-9 (ix), a
   03AF DD 36 F4 00   [19]  111 	ld	-12 (ix), #0x00
                            112 ;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
   03B3                     113 00122$:
   03B3 DD 36 F5 00   [19]  114 	ld	-11 (ix), #0x00
   03B7                     115 00110$:
                            116 ;src/txt_scroll_hard.c:24: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
   03B7 DD 7E F4      [19]  117 	ld	a, -12 (ix)
   03BA E6 07         [ 7]  118 	and	a, #0x07
   03BC 07            [ 4]  119 	rlca
   03BD 07            [ 4]  120 	rlca
   03BE 07            [ 4]  121 	rlca
   03BF E6 F8         [ 7]  122 	and	a, #0xf8
   03C1 57            [ 4]  123 	ld	d, a
   03C2 1E 00         [ 7]  124 	ld	e, #0x00
   03C4 DD 6E F6      [19]  125 	ld	l,-10 (ix)
   03C7 DD 66 F7      [19]  126 	ld	h,-9 (ix)
   03CA 19            [11]  127 	add	hl, de
   03CB 7D            [ 4]  128 	ld	a, l
   03CC DD 86 F5      [19]  129 	add	a, -11 (ix)
   03CF DD 77 FC      [19]  130 	ld	-4 (ix), a
   03D2 7C            [ 4]  131 	ld	a, h
   03D3 CE 00         [ 7]  132 	adc	a, #0x00
   03D5 DD 77 FD      [19]  133 	ld	-3 (ix), a
                            134 ;src/txt_scroll_hard.c:25: cur_image=image+(c*8+((y+1)%8))*2+x;
   03D8 DD 4E F4      [19]  135 	ld	c, -12 (ix)
   03DB 06 00         [ 7]  136 	ld	b, #0x00
   03DD 03            [ 6]  137 	inc	bc
   03DE 21 08 00      [10]  138 	ld	hl, #0x0008
   03E1 E5            [11]  139 	push	hl
   03E2 C5            [11]  140 	push	bc
   03E3 CD CD 4B      [17]  141 	call	__modsint
   03E6 F1            [10]  142 	pop	af
   03E7 F1            [10]  143 	pop	af
   03E8 DD 5E F8      [19]  144 	ld	e,-8 (ix)
   03EB DD 56 F9      [19]  145 	ld	d,-7 (ix)
   03EE 19            [11]  146 	add	hl, de
   03EF 29            [11]  147 	add	hl, hl
   03F0 4D            [ 4]  148 	ld	c, l
   03F1 44            [ 4]  149 	ld	b, h
   03F2 DD 6E 05      [19]  150 	ld	l,5 (ix)
   03F5 DD 66 06      [19]  151 	ld	h,6 (ix)
   03F8 09            [11]  152 	add	hl, bc
   03F9 DD 7E F5      [19]  153 	ld	a, -11 (ix)
   03FC 85            [ 4]  154 	add	a, l
   03FD DD 77 FA      [19]  155 	ld	-6 (ix), a
   0400 3E 00         [ 7]  156 	ld	a, #0x00
   0402 8C            [ 4]  157 	adc	a, h
   0403 DD 77 FB      [19]  158 	ld	-5 (ix), a
                            159 ;src/txt_scroll_hard.c:27: if (cur_plot<0x4000) {
   0406 DD 7E FD      [19]  160 	ld	a, -3 (ix)
   0409 D6 40         [ 7]  161 	sub	a, #0x40
   040B 30 10         [12]  162 	jr	NC,00102$
                            163 ;src/txt_scroll_hard.c:28: cur_plot=cur_plot-0x4000;
   040D DD 7E FC      [19]  164 	ld	a, -4 (ix)
   0410 C6 00         [ 7]  165 	add	a, #0x00
   0412 DD 77 FC      [19]  166 	ld	-4 (ix), a
   0415 DD 7E FD      [19]  167 	ld	a, -3 (ix)
   0418 CE C0         [ 7]  168 	adc	a, #0xc0
   041A DD 77 FD      [19]  169 	ld	-3 (ix), a
   041D                     170 00102$:
                            171 ;src/txt_scroll_hard.c:30: *cur_plot=*cur_image;
   041D DD 6E FA      [19]  172 	ld	l,-6 (ix)
   0420 DD 66 FB      [19]  173 	ld	h,-5 (ix)
   0423 4E            [ 7]  174 	ld	c, (hl)
   0424 DD 6E FC      [19]  175 	ld	l,-4 (ix)
   0427 DD 66 FD      [19]  176 	ld	h,-3 (ix)
   042A 71            [ 7]  177 	ld	(hl), c
                            178 ;src/txt_scroll_hard.c:23: for (x=0;x<2;x++) {
   042B DD 34 F5      [23]  179 	inc	-11 (ix)
   042E DD 7E F5      [19]  180 	ld	a, -11 (ix)
   0431 D6 02         [ 7]  181 	sub	a, #0x02
   0433 DA B7 03      [10]  182 	jp	C, 00110$
                            183 ;src/txt_scroll_hard.c:22: for (y=0;y<8;y++) {
   0436 DD 34 F4      [23]  184 	inc	-12 (ix)
   0439 DD 7E F4      [19]  185 	ld	a, -12 (ix)
   043C D6 08         [ 7]  186 	sub	a, #0x08
   043E DA B3 03      [10]  187 	jp	C, 00122$
   0441 18 5E         [12]  188 	jr	00118$
                            189 ;src/txt_scroll_hard.c:34: for (y=0;y<8;y++) {
   0443                     190 00128$:
   0443 DD 7E FE      [19]  191 	ld	a, -2 (ix)
   0446 DD 77 FA      [19]  192 	ld	-6 (ix), a
   0449 DD 7E FF      [19]  193 	ld	a, -1 (ix)
   044C DD 77 FB      [19]  194 	ld	-5 (ix), a
   044F 0E 00         [ 7]  195 	ld	c, #0x00
                            196 ;src/txt_scroll_hard.c:35: for (x=0;x<2;x++) {
   0451                     197 00126$:
   0451 06 00         [ 7]  198 	ld	b, #0x00
   0453                     199 00114$:
                            200 ;src/txt_scroll_hard.c:36: cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
   0453 79            [ 4]  201 	ld	a, c
   0454 E6 07         [ 7]  202 	and	a, #0x07
   0456 07            [ 4]  203 	rlca
   0457 07            [ 4]  204 	rlca
   0458 07            [ 4]  205 	rlca
   0459 E6 F8         [ 7]  206 	and	a, #0xf8
   045B 57            [ 4]  207 	ld	d, a
   045C 1E 00         [ 7]  208 	ld	e, #0x00
   045E DD 6E FA      [19]  209 	ld	l,-6 (ix)
   0461 DD 66 FB      [19]  210 	ld	h,-5 (ix)
   0464 19            [11]  211 	add	hl, de
   0465 58            [ 4]  212 	ld	e,b
   0466 16 00         [ 7]  213 	ld	d,#0x00
   0468 19            [11]  214 	add	hl, de
   0469 EB            [ 4]  215 	ex	de,hl
                            216 ;src/txt_scroll_hard.c:37: cur_image=image+(c*8+y)*2+x;
   046A 69            [ 4]  217 	ld	l, c
   046B 26 00         [ 7]  218 	ld	h, #0x00
   046D DD 7E F8      [19]  219 	ld	a, -8 (ix)
   0470 85            [ 4]  220 	add	a, l
   0471 6F            [ 4]  221 	ld	l, a
   0472 DD 7E F9      [19]  222 	ld	a, -7 (ix)
   0475 8C            [ 4]  223 	adc	a, h
   0476 67            [ 4]  224 	ld	h, a
   0477 29            [11]  225 	add	hl, hl
   0478 DD 75 FC      [19]  226 	ld	-4 (ix), l
   047B DD 74 FD      [19]  227 	ld	-3 (ix), h
   047E DD 7E 05      [19]  228 	ld	a, 5 (ix)
   0481 DD 86 FC      [19]  229 	add	a, -4 (ix)
   0484 6F            [ 4]  230 	ld	l, a
   0485 DD 7E 06      [19]  231 	ld	a, 6 (ix)
   0488 DD 8E FD      [19]  232 	adc	a, -3 (ix)
   048B 67            [ 4]  233 	ld	h, a
   048C 7D            [ 4]  234 	ld	a, l
   048D 80            [ 4]  235 	add	a, b
   048E 6F            [ 4]  236 	ld	l, a
   048F 7C            [ 4]  237 	ld	a, h
   0490 CE 00         [ 7]  238 	adc	a, #0x00
   0492 67            [ 4]  239 	ld	h, a
                            240 ;src/txt_scroll_hard.c:38: *cur_plot=*cur_image;
   0493 7E            [ 7]  241 	ld	a, (hl)
   0494 12            [ 7]  242 	ld	(de), a
                            243 ;src/txt_scroll_hard.c:35: for (x=0;x<2;x++) {
   0495 04            [ 4]  244 	inc	b
   0496 78            [ 4]  245 	ld	a, b
   0497 D6 02         [ 7]  246 	sub	a, #0x02
   0499 38 B8         [12]  247 	jr	C,00114$
                            248 ;src/txt_scroll_hard.c:34: for (y=0;y<8;y++) {
   049B 0C            [ 4]  249 	inc	c
   049C 79            [ 4]  250 	ld	a, c
   049D D6 08         [ 7]  251 	sub	a, #0x08
   049F 38 B0         [12]  252 	jr	C,00126$
   04A1                     253 00118$:
   04A1 DD F9         [10]  254 	ld	sp, ix
   04A3 DD E1         [14]  255 	pop	ix
   04A5 C9            [10]  256 	ret
                            257 ;src/txt_scroll_hard.c:88: void scroll_hard(u16 step, u8* screen_plot_address) {
                            258 ;	---------------------------------
                            259 ; Function scroll_hard
                            260 ; ---------------------------------
   04A6                     261 _scroll_hard::
   04A6 DD E5         [15]  262 	push	ix
   04A8 DD 21 00 00   [14]  263 	ld	ix,#0
   04AC DD 39         [15]  264 	add	ix,sp
   04AE F5            [11]  265 	push	af
                            266 ;src/txt_scroll_hard.c:94: u8* plot=screen_plot_address;
   04AF DD 4E 06      [19]  267 	ld	c,6 (ix)
   04B2 DD 46 07      [19]  268 	ld	b,7 (ix)
                            269 ;src/txt_scroll_hard.c:97: div=step/8;
   04B5 DD 5E 04      [19]  270 	ld	e,4 (ix)
   04B8 DD 56 05      [19]  271 	ld	d,5 (ix)
   04BB CB 3A         [ 8]  272 	srl	d
   04BD CB 1B         [ 8]  273 	rr	e
   04BF CB 3A         [ 8]  274 	srl	d
   04C1 CB 1B         [ 8]  275 	rr	e
   04C3 CB 3A         [ 8]  276 	srl	d
   04C5 CB 1B         [ 8]  277 	rr	e
                            278 ;src/txt_scroll_hard.c:98: mod=step%8;
   04C7 DD 7E 04      [19]  279 	ld	a, 4 (ix)
   04CA E6 07         [ 7]  280 	and	a, #0x07
   04CC DD 77 FE      [19]  281 	ld	-2 (ix), a
   04CF DD 36 FF 00   [19]  282 	ld	-1 (ix), #0x00
                            283 ;src/txt_scroll_hard.c:99: div=div%128;
   04D3 CB BB         [ 8]  284 	res	7, e
   04D5 16 00         [ 7]  285 	ld	d, #0x00
                            286 ;src/txt_scroll_hard.c:100: if (texte[div]==' ') {
   04D7 21 3F 05      [10]  287 	ld	hl, #_texte+0
   04DA 19            [11]  288 	add	hl, de
   04DB 5E            [ 7]  289 	ld	e, (hl)
   04DC 7B            [ 4]  290 	ld	a, e
   04DD D6 20         [ 7]  291 	sub	a, #0x20
   04DF 20 05         [12]  292 	jr	NZ,00102$
                            293 ;src/txt_scroll_hard.c:101: o=0;
   04E1 11 00 00      [10]  294 	ld	de, #0x0000
   04E4 18 09         [12]  295 	jr	00103$
   04E6                     296 00102$:
                            297 ;src/txt_scroll_hard.c:103: o=texte[div]-'?';
   04E6 16 00         [ 7]  298 	ld	d, #0x00
   04E8 7B            [ 4]  299 	ld	a, e
   04E9 C6 C1         [ 7]  300 	add	a, #0xc1
   04EB 5F            [ 4]  301 	ld	e, a
   04EC 7A            [ 4]  302 	ld	a, d
   04ED CE FF         [ 7]  303 	adc	a, #0xff
   04EF                     304 00103$:
                            305 ;src/txt_scroll_hard.c:106: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   04EF 21 C1 05      [10]  306 	ld	hl, #_g_tile_fontmap32x32plat_000
   04F2 7B            [ 4]  307 	ld	a, e
   04F3 87            [ 4]  308 	add	a, a
   04F4 57            [ 4]  309 	ld	d, a
   04F5 1E 00         [ 7]  310 	ld	e, #0x00
   04F7 19            [11]  311 	add	hl,de
   04F8 EB            [ 4]  312 	ex	de,hl
   04F9 E1            [10]  313 	pop	hl
   04FA E5            [11]  314 	push	hl
   04FB 29            [11]  315 	add	hl, hl
   04FC 29            [11]  316 	add	hl, hl
   04FD 29            [11]  317 	add	hl, hl
   04FE 29            [11]  318 	add	hl, hl
   04FF 29            [11]  319 	add	hl, hl
   0500 29            [11]  320 	add	hl, hl
   0501 19            [11]  321 	add	hl, de
                            322 ;src/txt_scroll_hard.c:110: draw_char(0,(u8*)pointeur, plot);
   0502 E5            [11]  323 	push	hl
   0503 C5            [11]  324 	push	bc
   0504 C5            [11]  325 	push	bc
   0505 E5            [11]  326 	push	hl
   0506 AF            [ 4]  327 	xor	a, a
   0507 F5            [11]  328 	push	af
   0508 33            [ 6]  329 	inc	sp
   0509 CD 48 03      [17]  330 	call	_draw_char
   050C F1            [10]  331 	pop	af
   050D F1            [10]  332 	pop	af
   050E 33            [ 6]  333 	inc	sp
   050F C1            [10]  334 	pop	bc
   0510 E1            [10]  335 	pop	hl
                            336 ;src/txt_scroll_hard.c:111: draw_char(1,(u8*)pointeur, plot);
   0511 E5            [11]  337 	push	hl
   0512 C5            [11]  338 	push	bc
   0513 C5            [11]  339 	push	bc
   0514 E5            [11]  340 	push	hl
   0515 3E 01         [ 7]  341 	ld	a, #0x01
   0517 F5            [11]  342 	push	af
   0518 33            [ 6]  343 	inc	sp
   0519 CD 48 03      [17]  344 	call	_draw_char
   051C F1            [10]  345 	pop	af
   051D F1            [10]  346 	pop	af
   051E 33            [ 6]  347 	inc	sp
   051F C1            [10]  348 	pop	bc
   0520 E1            [10]  349 	pop	hl
                            350 ;src/txt_scroll_hard.c:112: draw_char(2,(u8*)pointeur, plot);
   0521 E5            [11]  351 	push	hl
   0522 C5            [11]  352 	push	bc
   0523 C5            [11]  353 	push	bc
   0524 E5            [11]  354 	push	hl
   0525 3E 02         [ 7]  355 	ld	a, #0x02
   0527 F5            [11]  356 	push	af
   0528 33            [ 6]  357 	inc	sp
   0529 CD 48 03      [17]  358 	call	_draw_char
   052C F1            [10]  359 	pop	af
   052D F1            [10]  360 	pop	af
   052E 33            [ 6]  361 	inc	sp
   052F C1            [10]  362 	pop	bc
   0530 E1            [10]  363 	pop	hl
                            364 ;src/txt_scroll_hard.c:113: draw_char(3,(u8*)pointeur, plot);
   0531 C5            [11]  365 	push	bc
   0532 E5            [11]  366 	push	hl
   0533 3E 03         [ 7]  367 	ld	a, #0x03
   0535 F5            [11]  368 	push	af
   0536 33            [ 6]  369 	inc	sp
   0537 CD 48 03      [17]  370 	call	_draw_char
   053A DD F9         [10]  371 	ld	sp,ix
   053C DD E1         [14]  372 	pop	ix
   053E C9            [10]  373 	ret
   053F                     374 _texte:
   053F 57 45 20 57 49 53   375 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   057B 41 4E 44 20 41 20   376 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   05B7 44 46 47 20 20 20   377 	.ascii "DFG     "
        20 20
   05BF 00                  378 	.db 0x00
   05C0 00                  379 	.db 0x00
                            380 	.area _CODE
                            381 	.area _INITIALIZER
                            382 	.area _CABS (ABS)
