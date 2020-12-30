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
                             12 	.globl _draw
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
                             45 ;src/txt_scroll_hard.c:11: void draw(u8* image, u8* plot, u8 width, u8 height) {
                             46 ;	---------------------------------
                             47 ; Function draw
                             48 ; ---------------------------------
   0348                      49 _draw::
   0348 DD E5         [15]   50 	push	ix
   034A DD 21 00 00   [14]   51 	ld	ix,#0
   034E DD 39         [15]   52 	add	ix,sp
   0350 21 FA FF      [10]   53 	ld	hl, #-6
   0353 39            [11]   54 	add	hl, sp
   0354 F9            [ 6]   55 	ld	sp, hl
                             56 ;src/txt_scroll_hard.c:17: for (y=0;y<height;y++) {
   0355 DD 7E 06      [19]   57 	ld	a, 6 (ix)
   0358 C6 00         [ 7]   58 	add	a, #0x00
   035A DD 77 FE      [19]   59 	ld	-2 (ix), a
   035D DD 7E 07      [19]   60 	ld	a, 7 (ix)
   0360 CE 40         [ 7]   61 	adc	a, #0x40
   0362 DD 77 FF      [19]   62 	ld	-1 (ix), a
   0365 1E 00         [ 7]   63 	ld	e, #0x00
   0367                      64 00110$:
   0367 7B            [ 4]   65 	ld	a, e
   0368 DD 96 09      [19]   66 	sub	a, 9 (ix)
   036B D2 0C 04      [10]   67 	jp	NC, 00112$
                             68 ;src/txt_scroll_hard.c:18: for (x=0;x<width;x++) {
   036E D5            [11]   69 	push	de
   036F DD 66 08      [19]   70 	ld	h, 8 (ix)
   0372 2E 00         [ 7]   71 	ld	l, #0x00
   0374 55            [ 4]   72 	ld	d, l
   0375 06 08         [ 7]   73 	ld	b, #0x08
   0377                      74 00136$:
   0377 29            [11]   75 	add	hl, hl
   0378 30 01         [12]   76 	jr	NC,00137$
   037A 19            [11]   77 	add	hl, de
   037B                      78 00137$:
   037B 10 FA         [13]   79 	djnz	00136$
   037D D1            [10]   80 	pop	de
   037E 4D            [ 4]   81 	ld	c, l
   037F 44            [ 4]   82 	ld	b, h
   0380 DD 7E 04      [19]   83 	ld	a, 4 (ix)
   0383 81            [ 4]   84 	add	a, c
   0384 DD 77 FC      [19]   85 	ld	-4 (ix), a
   0387 DD 7E 05      [19]   86 	ld	a, 5 (ix)
   038A 88            [ 4]   87 	adc	a, b
   038B DD 77 FD      [19]   88 	ld	-3 (ix), a
   038E 0E 00         [ 7]   89 	ld	c, #0x00
   0390                      90 00107$:
   0390 79            [ 4]   91 	ld	a, c
   0391 DD 96 08      [19]   92 	sub	a, 8 (ix)
   0394 30 72         [12]   93 	jr	NC,00111$
                             94 ;src/txt_scroll_hard.c:19: cur_plot=plot+ 0x4000 +((y / 8u) * 80u) + ((y % 8u) * 2048u) + x;
   0396 43            [ 4]   95 	ld	b, e
   0397 16 00         [ 7]   96 	ld	d, #0x00
   0399 68            [ 4]   97 	ld	l, b
   039A 62            [ 4]   98 	ld	h, d
   039B CB 3C         [ 8]   99 	srl	h
   039D CB 1D         [ 8]  100 	rr	l
   039F CB 3C         [ 8]  101 	srl	h
   03A1 CB 1D         [ 8]  102 	rr	l
   03A3 CB 3C         [ 8]  103 	srl	h
   03A5 CB 1D         [ 8]  104 	rr	l
   03A7 D5            [11]  105 	push	de
   03A8 5D            [ 4]  106 	ld	e, l
   03A9 54            [ 4]  107 	ld	d, h
   03AA 29            [11]  108 	add	hl, hl
   03AB 29            [11]  109 	add	hl, hl
   03AC 19            [11]  110 	add	hl, de
   03AD 29            [11]  111 	add	hl, hl
   03AE 29            [11]  112 	add	hl, hl
   03AF 29            [11]  113 	add	hl, hl
   03B0 29            [11]  114 	add	hl, hl
   03B1 D1            [10]  115 	pop	de
   03B2 DD 7E FE      [19]  116 	ld	a, -2 (ix)
   03B5 85            [ 4]  117 	add	a, l
   03B6 DD 77 FA      [19]  118 	ld	-6 (ix), a
   03B9 DD 7E FF      [19]  119 	ld	a, -1 (ix)
   03BC 8C            [ 4]  120 	adc	a, h
   03BD DD 77 FB      [19]  121 	ld	-5 (ix), a
   03C0 78            [ 4]  122 	ld	a, b
   03C1 E6 07         [ 7]  123 	and	a, #0x07
   03C3 07            [ 4]  124 	rlca
   03C4 07            [ 4]  125 	rlca
   03C5 07            [ 4]  126 	rlca
   03C6 E6 F8         [ 7]  127 	and	a, #0xf8
   03C8 6F            [ 4]  128 	ld	l, a
   03C9 06 00         [ 7]  129 	ld	b, #0x00
   03CB DD 7E FA      [19]  130 	ld	a, -6 (ix)
   03CE 80            [ 4]  131 	add	a, b
   03CF 47            [ 4]  132 	ld	b, a
   03D0 DD 7E FB      [19]  133 	ld	a, -5 (ix)
   03D3 8D            [ 4]  134 	adc	a, l
   03D4 57            [ 4]  135 	ld	d, a
   03D5 78            [ 4]  136 	ld	a, b
   03D6 81            [ 4]  137 	add	a, c
   03D7 DD 77 FA      [19]  138 	ld	-6 (ix), a
   03DA 7A            [ 4]  139 	ld	a, d
   03DB CE 00         [ 7]  140 	adc	a, #0x00
   03DD DD 77 FB      [19]  141 	ld	-5 (ix), a
                            142 ;src/txt_scroll_hard.c:20: cur_image=image+y*width+x;
   03E0 DD 6E FC      [19]  143 	ld	l,-4 (ix)
   03E3 DD 66 FD      [19]  144 	ld	h,-3 (ix)
   03E6 06 00         [ 7]  145 	ld	b, #0x00
   03E8 09            [11]  146 	add	hl, bc
                            147 ;src/txt_scroll_hard.c:21: if (cur_plot<0x4000) {
   03E9 DD 56 FB      [19]  148 	ld	d, -5 (ix)
   03EC 7A            [ 4]  149 	ld	a, d
   03ED D6 40         [ 7]  150 	sub	a, #0x40
   03EF 30 10         [12]  151 	jr	NC,00102$
                            152 ;src/txt_scroll_hard.c:22: cur_plot=cur_plot-0x4000;
   03F1 DD 7E FA      [19]  153 	ld	a, -6 (ix)
   03F4 C6 00         [ 7]  154 	add	a, #0x00
   03F6 6F            [ 4]  155 	ld	l, a
   03F7 DD 7E FB      [19]  156 	ld	a, -5 (ix)
   03FA CE C0         [ 7]  157 	adc	a, #0xc0
   03FC 67            [ 4]  158 	ld	h, a
                            159 ;src/txt_scroll_hard.c:24: *cur_plot=0xF0;
   03FD 36 F0         [10]  160 	ld	(hl), #0xf0
   03FF 18 04         [12]  161 	jr	00108$
   0401                     162 00102$:
                            163 ;src/txt_scroll_hard.c:26: *cur_plot=*cur_image;
   0401 46            [ 7]  164 	ld	b, (hl)
   0402 E1            [10]  165 	pop	hl
   0403 E5            [11]  166 	push	hl
   0404 70            [ 7]  167 	ld	(hl), b
   0405                     168 00108$:
                            169 ;src/txt_scroll_hard.c:18: for (x=0;x<width;x++) {
   0405 0C            [ 4]  170 	inc	c
   0406 18 88         [12]  171 	jr	00107$
   0408                     172 00111$:
                            173 ;src/txt_scroll_hard.c:17: for (y=0;y<height;y++) {
   0408 1C            [ 4]  174 	inc	e
   0409 C3 67 03      [10]  175 	jp	00110$
   040C                     176 00112$:
   040C DD F9         [10]  177 	ld	sp, ix
   040E DD E1         [14]  178 	pop	ix
   0410 C9            [10]  179 	ret
                            180 ;src/txt_scroll_hard.c:76: void scroll_hard(u16 step, u8* screen_plot_address) {
                            181 ;	---------------------------------
                            182 ; Function scroll_hard
                            183 ; ---------------------------------
   0411                     184 _scroll_hard::
   0411 DD E5         [15]  185 	push	ix
   0413 DD 21 00 00   [14]  186 	ld	ix,#0
   0417 DD 39         [15]  187 	add	ix,sp
   0419 F5            [11]  188 	push	af
                            189 ;src/txt_scroll_hard.c:82: u8* plot=screen_plot_address;
   041A DD 4E 06      [19]  190 	ld	c,6 (ix)
   041D DD 46 07      [19]  191 	ld	b,7 (ix)
                            192 ;src/txt_scroll_hard.c:85: div=step/8;
   0420 DD 5E 04      [19]  193 	ld	e,4 (ix)
   0423 DD 56 05      [19]  194 	ld	d,5 (ix)
   0426 CB 3A         [ 8]  195 	srl	d
   0428 CB 1B         [ 8]  196 	rr	e
   042A CB 3A         [ 8]  197 	srl	d
   042C CB 1B         [ 8]  198 	rr	e
   042E CB 3A         [ 8]  199 	srl	d
   0430 CB 1B         [ 8]  200 	rr	e
                            201 ;src/txt_scroll_hard.c:86: mod=step%8;
   0432 DD 7E 04      [19]  202 	ld	a, 4 (ix)
   0435 E6 07         [ 7]  203 	and	a, #0x07
   0437 DD 77 FE      [19]  204 	ld	-2 (ix), a
   043A DD 36 FF 00   [19]  205 	ld	-1 (ix), #0x00
                            206 ;src/txt_scroll_hard.c:87: div=div%128;
   043E CB BB         [ 8]  207 	res	7, e
   0440 16 00         [ 7]  208 	ld	d, #0x00
                            209 ;src/txt_scroll_hard.c:88: if (texte[div]==' ') {
   0442 21 80 04      [10]  210 	ld	hl, #_texte+0
   0445 19            [11]  211 	add	hl, de
   0446 5E            [ 7]  212 	ld	e, (hl)
   0447 7B            [ 4]  213 	ld	a, e
   0448 D6 20         [ 7]  214 	sub	a, #0x20
   044A 20 05         [12]  215 	jr	NZ,00102$
                            216 ;src/txt_scroll_hard.c:89: o=0;
   044C 11 00 00      [10]  217 	ld	de, #0x0000
   044F 18 09         [12]  218 	jr	00103$
   0451                     219 00102$:
                            220 ;src/txt_scroll_hard.c:91: o=texte[div]-'?';
   0451 16 00         [ 7]  221 	ld	d, #0x00
   0453 7B            [ 4]  222 	ld	a, e
   0454 C6 C1         [ 7]  223 	add	a, #0xc1
   0456 5F            [ 4]  224 	ld	e, a
   0457 7A            [ 4]  225 	ld	a, d
   0458 CE FF         [ 7]  226 	adc	a, #0xff
   045A                     227 00103$:
                            228 ;src/txt_scroll_hard.c:94: pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);
   045A 21 02 05      [10]  229 	ld	hl, #_g_tile_fontmap32x32plat_000
   045D 7B            [ 4]  230 	ld	a, e
   045E 87            [ 4]  231 	add	a, a
   045F 57            [ 4]  232 	ld	d, a
   0460 1E 00         [ 7]  233 	ld	e, #0x00
   0462 19            [11]  234 	add	hl,de
   0463 EB            [ 4]  235 	ex	de,hl
   0464 E1            [10]  236 	pop	hl
   0465 E5            [11]  237 	push	hl
   0466 29            [11]  238 	add	hl, hl
   0467 29            [11]  239 	add	hl, hl
   0468 29            [11]  240 	add	hl, hl
   0469 29            [11]  241 	add	hl, hl
   046A 29            [11]  242 	add	hl, hl
   046B 29            [11]  243 	add	hl, hl
   046C 19            [11]  244 	add	hl, de
                            245 ;src/txt_scroll_hard.c:98: draw((u8*)pointeur, plot, 2, 32);
   046D 11 02 20      [10]  246 	ld	de, #0x2002
   0470 D5            [11]  247 	push	de
   0471 C5            [11]  248 	push	bc
   0472 E5            [11]  249 	push	hl
   0473 CD 48 03      [17]  250 	call	_draw
   0476 21 06 00      [10]  251 	ld	hl, #6
   0479 39            [11]  252 	add	hl, sp
   047A F9            [ 6]  253 	ld	sp, hl
   047B DD F9         [10]  254 	ld	sp, ix
   047D DD E1         [14]  255 	pop	ix
   047F C9            [10]  256 	ret
   0480                     257 _texte:
   0480 57 45 20 57 49 53   258 	.ascii "WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS "
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
        57 45 20 57 49 53
        48 20 59 4F 55 20
        41 20 4D 45 52 52
        59 20 43 48 52 49
        53 54 4D 41 53 20
   04BC 41 4E 44 20 41 20   259 	.ascii "AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQS"
        48 41 50 50 59 20
        4E 45 57 20 59 45
        41 52 20 46 52 4F
        4D 20 54 48 53 46
        20 41 4E 44 20 54
        45 54 41 4C 41 42
        20 20 20 20 20 20
        41 5A 45 52 54 59
        55 49 4F 50 51 53
   04F8 44 46 47 20 20 20   260 	.ascii "DFG     "
        20 20
   0500 00                  261 	.db 0x00
   0501 00                  262 	.db 0x00
                            263 	.area _CODE
                            264 	.area _INITIALIZER
                            265 	.area _CABS (ABS)
