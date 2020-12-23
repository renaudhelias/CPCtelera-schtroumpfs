                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module txt_scroll
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _rupture
                             12 	.globl _restoreVBL
                             13 	.globl _killVBL
                             14 	.globl _scroll
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_drawSprite
                             17 	.globl _vblPosition
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
   23A9                      29 _vblPosition::
   23A9                      30 	.ds 2
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 ;src/txt_scroll.c:11: void scroll(char * texte, unsigned int l, int step) {
                             52 ;	---------------------------------
                             53 ; Function scroll
                             54 ; ---------------------------------
   0378                      55 _scroll::
   0378 DD E5         [15]   56 	push	ix
   037A DD 21 00 00   [14]   57 	ld	ix,#0
   037E DD 39         [15]   58 	add	ix,sp
   0380 F5            [11]   59 	push	af
   0381 F5            [11]   60 	push	af
                             61 ;src/txt_scroll.c:18: c2=step+SCREEN_WIDTH; // on insère du vide au début de step
   0382 DD 7E 08      [19]   62 	ld	a, 8 (ix)
   0385 C6 50         [ 7]   63 	add	a, #0x50
   0387 4F            [ 4]   64 	ld	c, a
   0388 DD 7E 09      [19]   65 	ld	a, 9 (ix)
   038B CE 00         [ 7]   66 	adc	a, #0x00
   038D 47            [ 4]   67 	ld	b, a
                             68 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   038E DD 5E 06      [19]   69 	ld	e,6 (ix)
   0391 DD 56 07      [19]   70 	ld	d,7 (ix)
   0394 6B            [ 4]   71 	ld	l, e
   0395 62            [ 4]   72 	ld	h, d
   0396 29            [11]   73 	add	hl, hl
   0397 29            [11]   74 	add	hl, hl
   0398 19            [11]   75 	add	hl, de
   0399 29            [11]   76 	add	hl, hl
   039A DD 75 FE      [19]   77 	ld	-2 (ix), l
   039D DD 74 FF      [19]   78 	ld	-1 (ix), h
   03A0 21 00 00      [10]   79 	ld	hl, #0x0000
   03A3 E3            [19]   80 	ex	(sp), hl
   03A4                      81 00111$:
                             82 ;src/txt_scroll.c:22: c2=c2+1;
   03A4 03            [ 6]   83 	inc	bc
                             84 ;src/txt_scroll.c:24: if (c2 < 0) {continue;}
   03A5 CB 78         [ 8]   85 	bit	7, b
   03A7 20 6E         [12]   86 	jr	NZ,00109$
                             87 ;src/txt_scroll.c:25: if (c2 > l*G_TILE_FONTMAP20X22_00_W) {continue;}
   03A9 59            [ 4]   88 	ld	e, c
   03AA 50            [ 4]   89 	ld	d, b
   03AB DD 7E FE      [19]   90 	ld	a, -2 (ix)
   03AE 93            [ 4]   91 	sub	a, e
   03AF DD 7E FF      [19]   92 	ld	a, -1 (ix)
   03B2 9A            [ 4]   93 	sbc	a, d
   03B3 38 62         [12]   94 	jr	C,00109$
                             95 ;src/txt_scroll.c:27: div=c2/G_TILE_FONTMAP20X22_00_W;
   03B5 C5            [11]   96 	push	bc
   03B6 21 0A 00      [10]   97 	ld	hl, #0x000a
   03B9 E5            [11]   98 	push	hl
   03BA C5            [11]   99 	push	bc
   03BB CD 1E 23      [17]  100 	call	__divsint
   03BE F1            [10]  101 	pop	af
   03BF F1            [10]  102 	pop	af
   03C0 EB            [ 4]  103 	ex	de,hl
   03C1 C1            [10]  104 	pop	bc
                            105 ;src/txt_scroll.c:28: mod=c2%G_TILE_FONTMAP20X22_00_W;
   03C2 C5            [11]  106 	push	bc
   03C3 D5            [11]  107 	push	de
   03C4 21 0A 00      [10]  108 	ld	hl, #0x000a
   03C7 E5            [11]  109 	push	hl
   03C8 C5            [11]  110 	push	bc
                            111 ;src/txt_scroll.c:29: if (mod==0) {
   03C9 CD F2 22      [17]  112 	call	__modsint
   03CC F1            [10]  113 	pop	af
   03CD F1            [10]  114 	pop	af
   03CE D1            [10]  115 	pop	de
   03CF C1            [10]  116 	pop	bc
   03D0 7C            [ 4]  117 	ld	a, h
   03D1 B5            [ 4]  118 	or	a,l
   03D2 20 43         [12]  119 	jr	NZ,00109$
                            120 ;src/txt_scroll.c:30: if (texte[div]!=' ') { // on zap les espaces FIXME mauvais pour le timing !
   03D4 DD 6E 04      [19]  121 	ld	l,4 (ix)
   03D7 DD 66 05      [19]  122 	ld	h,5 (ix)
   03DA 19            [11]  123 	add	hl, de
   03DB 5E            [ 7]  124 	ld	e, (hl)
   03DC 7B            [ 4]  125 	ld	a, e
   03DD D6 20         [ 7]  126 	sub	a, #0x20
   03DF 28 36         [12]  127 	jr	Z,00109$
                            128 ;src/txt_scroll.c:31: o=texte[div]-'A';
   03E1 16 00         [ 7]  129 	ld	d, #0x00
   03E3 7B            [ 4]  130 	ld	a, e
   03E4 C6 BF         [ 7]  131 	add	a, #0xbf
   03E6 5F            [ 4]  132 	ld	e, a
   03E7 7A            [ 4]  133 	ld	a, d
   03E8 CE FF         [ 7]  134 	adc	a, #0xff
   03EA 57            [ 4]  135 	ld	d, a
                            136 ;src/txt_scroll.c:33: p = cpct_getScreenPtr(CPCT_VMEM_START, c1,120-1);
   03EB DD 66 FC      [19]  137 	ld	h, -4 (ix)
   03EE C5            [11]  138 	push	bc
   03EF D5            [11]  139 	push	de
   03F0 3E 77         [ 7]  140 	ld	a, #0x77
   03F2 F5            [11]  141 	push	af
   03F3 33            [ 6]  142 	inc	sp
   03F4 E5            [11]  143 	push	hl
   03F5 33            [ 6]  144 	inc	sp
   03F6 21 00 C0      [10]  145 	ld	hl, #0xc000
   03F9 E5            [11]  146 	push	hl
   03FA CD FE 22      [17]  147 	call	_cpct_getScreenPtr
   03FD D1            [10]  148 	pop	de
   03FE C1            [10]  149 	pop	bc
                            150 ;src/txt_scroll.c:34: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   03FF E5            [11]  151 	push	hl
   0400 FD E1         [14]  152 	pop	iy
   0402 EB            [ 4]  153 	ex	de,hl
   0403 29            [11]  154 	add	hl, hl
   0404 11 5B 0B      [10]  155 	ld	de, #_g_tile_tileset
   0407 19            [11]  156 	add	hl, de
   0408 5E            [ 7]  157 	ld	e, (hl)
   0409 23            [ 6]  158 	inc	hl
   040A 56            [ 7]  159 	ld	d, (hl)
   040B C5            [11]  160 	push	bc
   040C 21 0A 16      [10]  161 	ld	hl, #0x160a
   040F E5            [11]  162 	push	hl
   0410 FD E5         [15]  163 	push	iy
   0412 D5            [11]  164 	push	de
   0413 CD E7 21      [17]  165 	call	_cpct_drawSprite
   0416 C1            [10]  166 	pop	bc
   0417                     167 00109$:
                            168 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   0417 DD 34 FC      [23]  169 	inc	-4 (ix)
   041A 20 03         [12]  170 	jr	NZ,00136$
   041C DD 34 FD      [23]  171 	inc	-3 (ix)
   041F                     172 00136$:
   041F 3E 46         [ 7]  173 	ld	a, #0x46
   0421 DD BE FC      [19]  174 	cp	a, -4 (ix)
   0424 3E 00         [ 7]  175 	ld	a, #0x00
   0426 DD 9E FD      [19]  176 	sbc	a, -3 (ix)
   0429 E2 2E 04      [10]  177 	jp	PO, 00137$
   042C EE 80         [ 7]  178 	xor	a, #0x80
   042E                     179 00137$:
   042E F2 A4 03      [10]  180 	jp	P, 00111$
   0431 DD F9         [10]  181 	ld	sp, ix
   0433 DD E1         [14]  182 	pop	ix
   0435 C9            [10]  183 	ret
                            184 ;src/txt_scroll.c:45: void killVBL() {
                            185 ;	---------------------------------
                            186 ; Function killVBL
                            187 ; ---------------------------------
   0436                     188 _killVBL::
                            189 ;src/txt_scroll.c:52: __endasm;
   0436 01 07 BC      [10]  190 	ld	bc,#0xbc07 ; Kill VBL
   0439 3E 7F         [ 7]  191 	ld	a,#0x7f
   043B ED 49         [12]  192 	out	(c),c
   043D 04            [ 4]  193 	inc	b
   043E ED 79         [12]  194 	out	(c),a
                            195 ;src/txt_scroll.c:53: vblPosition=37;
   0440 21 25 00      [10]  196 	ld	hl, #0x0025
   0443 22 A9 23      [16]  197 	ld	(_vblPosition), hl
   0446 C9            [10]  198 	ret
                            199 ;src/txt_scroll.c:56: void restoreVBL() {
                            200 ;	---------------------------------
                            201 ; Function restoreVBL
                            202 ; ---------------------------------
   0447                     203 _restoreVBL::
                            204 ;src/txt_scroll.c:63: __endasm;
   0447 01 07 BC      [10]  205 	ld	bc,#0xbc07 ; On repositionne la VBL
   044A 3A A9 23      [13]  206 	ld	a,(_vblPosition)
   044D ED 49         [12]  207 	out	(c),c
   044F 04            [ 4]  208 	inc	b
   0450 ED 79         [12]  209 	out	(c),a
   0452 C9            [10]  210 	ret
                            211 ;src/txt_scroll.c:69: void rupture(unsigned char nbCharLigne) {
                            212 ;	---------------------------------
                            213 ; Function rupture
                            214 ; ---------------------------------
   0453                     215 _rupture::
                            216 ;src/txt_scroll.c:80: __endasm;
   0453 01 04 BC      [10]  217 	ld	bc,#0xbc04 ; Rupture 1
                            218 ;;ld	a,(_nbCharLigne)
   0456 21 02 00      [10]  219 	ld	hl, #2+0
   0459 39            [11]  220 	add	hl, sp
   045A 7E            [ 7]  221 	ld	a, (hl)
   045B 3D            [ 4]  222 	dec	a
   045C ED 49         [12]  223 	out	(c),c
   045E 04            [ 4]  224 	inc	b
   045F ED 79         [12]  225 	out	(c),a
                            226 ;src/txt_scroll.c:81: vblPosition=vblPosition-nbCharLigne;
   0461 21 02 00      [10]  227 	ld	hl, #2+0
   0464 39            [11]  228 	add	hl, sp
   0465 4E            [ 7]  229 	ld	c, (hl)
   0466 06 00         [ 7]  230 	ld	b, #0x00
   0468 21 A9 23      [10]  231 	ld	hl, #_vblPosition
   046B 7E            [ 7]  232 	ld	a, (hl)
   046C 91            [ 4]  233 	sub	a, c
   046D 77            [ 7]  234 	ld	(hl), a
   046E 23            [ 6]  235 	inc	hl
   046F 7E            [ 7]  236 	ld	a, (hl)
   0470 98            [ 4]  237 	sbc	a, b
   0471 77            [ 7]  238 	ld	(hl), a
   0472 C9            [10]  239 	ret
                            240 	.area _CODE
                            241 	.area _INITIALIZER
   23B2                     242 __xinit__vblPosition:
   23B2 00 00               243 	.dw #0x0000
                            244 	.area _CABS (ABS)
