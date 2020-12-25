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
                             11 	.globl _scroll
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
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
                             45 ;src/txt_scroll.c:11: void scroll(char * texte, unsigned int l, int step) {
                             46 ;	---------------------------------
                             47 ; Function scroll
                             48 ; ---------------------------------
   0348                      49 _scroll::
   0348 DD E5         [15]   50 	push	ix
   034A DD 21 00 00   [14]   51 	ld	ix,#0
   034E DD 39         [15]   52 	add	ix,sp
   0350 F5            [11]   53 	push	af
   0351 F5            [11]   54 	push	af
                             55 ;src/txt_scroll.c:18: c2=step+SCREEN_WIDTH; // on insère du vide au début de step
   0352 DD 7E 08      [19]   56 	ld	a, 8 (ix)
   0355 C6 50         [ 7]   57 	add	a, #0x50
   0357 4F            [ 4]   58 	ld	c, a
   0358 DD 7E 09      [19]   59 	ld	a, 9 (ix)
   035B CE 00         [ 7]   60 	adc	a, #0x00
   035D 47            [ 4]   61 	ld	b, a
                             62 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   035E DD 5E 06      [19]   63 	ld	e,6 (ix)
   0361 DD 56 07      [19]   64 	ld	d,7 (ix)
   0364 6B            [ 4]   65 	ld	l, e
   0365 62            [ 4]   66 	ld	h, d
   0366 29            [11]   67 	add	hl, hl
   0367 29            [11]   68 	add	hl, hl
   0368 19            [11]   69 	add	hl, de
   0369 29            [11]   70 	add	hl, hl
   036A DD 75 FE      [19]   71 	ld	-2 (ix), l
   036D DD 74 FF      [19]   72 	ld	-1 (ix), h
   0370 21 00 00      [10]   73 	ld	hl, #0x0000
   0373 E3            [19]   74 	ex	(sp), hl
   0374                      75 00111$:
                             76 ;src/txt_scroll.c:22: c2=c2+1;
   0374 03            [ 6]   77 	inc	bc
                             78 ;src/txt_scroll.c:24: if (c2 < 0) {continue;}
   0375 CB 78         [ 8]   79 	bit	7, b
   0377 20 6E         [12]   80 	jr	NZ,00109$
                             81 ;src/txt_scroll.c:25: if (c2 > l*G_TILE_FONTMAP20X22_00_W) {continue;}
   0379 59            [ 4]   82 	ld	e, c
   037A 50            [ 4]   83 	ld	d, b
   037B DD 7E FE      [19]   84 	ld	a, -2 (ix)
   037E 93            [ 4]   85 	sub	a, e
   037F DD 7E FF      [19]   86 	ld	a, -1 (ix)
   0382 9A            [ 4]   87 	sbc	a, d
   0383 38 62         [12]   88 	jr	C,00109$
                             89 ;src/txt_scroll.c:27: div=c2/G_TILE_FONTMAP20X22_00_W;
   0385 C5            [11]   90 	push	bc
   0386 21 0A 00      [10]   91 	ld	hl, #0x000a
   0389 E5            [11]   92 	push	hl
   038A C5            [11]   93 	push	bc
   038B CD 23 65      [17]   94 	call	__divsint
   038E F1            [10]   95 	pop	af
   038F F1            [10]   96 	pop	af
   0390 EB            [ 4]   97 	ex	de,hl
   0391 C1            [10]   98 	pop	bc
                             99 ;src/txt_scroll.c:28: mod=c2%G_TILE_FONTMAP20X22_00_W;
   0392 C5            [11]  100 	push	bc
   0393 D5            [11]  101 	push	de
   0394 21 0A 00      [10]  102 	ld	hl, #0x000a
   0397 E5            [11]  103 	push	hl
   0398 C5            [11]  104 	push	bc
                            105 ;src/txt_scroll.c:29: if (mod==0) {
   0399 CD F6 64      [17]  106 	call	__modsint
   039C F1            [10]  107 	pop	af
   039D F1            [10]  108 	pop	af
   039E D1            [10]  109 	pop	de
   039F C1            [10]  110 	pop	bc
   03A0 7C            [ 4]  111 	ld	a, h
   03A1 B5            [ 4]  112 	or	a,l
   03A2 20 43         [12]  113 	jr	NZ,00109$
                            114 ;src/txt_scroll.c:30: if (texte[div]!=' ') { // on zap les espaces FIXME mauvais pour le timing !
   03A4 DD 6E 04      [19]  115 	ld	l,4 (ix)
   03A7 DD 66 05      [19]  116 	ld	h,5 (ix)
   03AA 19            [11]  117 	add	hl, de
   03AB 5E            [ 7]  118 	ld	e, (hl)
   03AC 7B            [ 4]  119 	ld	a, e
   03AD D6 20         [ 7]  120 	sub	a, #0x20
   03AF 28 36         [12]  121 	jr	Z,00109$
                            122 ;src/txt_scroll.c:31: o=texte[div]-'A';
   03B1 16 00         [ 7]  123 	ld	d, #0x00
   03B3 7B            [ 4]  124 	ld	a, e
   03B4 C6 BF         [ 7]  125 	add	a, #0xbf
   03B6 5F            [ 4]  126 	ld	e, a
   03B7 7A            [ 4]  127 	ld	a, d
   03B8 CE FF         [ 7]  128 	adc	a, #0xff
   03BA 57            [ 4]  129 	ld	d, a
                            130 ;src/txt_scroll.c:33: p = cpct_getScreenPtr(CPCT_VMEM_START, c1,120-1);
   03BB DD 66 FC      [19]  131 	ld	h, -4 (ix)
   03BE C5            [11]  132 	push	bc
   03BF D5            [11]  133 	push	de
   03C0 3E 77         [ 7]  134 	ld	a, #0x77
   03C2 F5            [11]  135 	push	af
   03C3 33            [ 6]  136 	inc	sp
   03C4 E5            [11]  137 	push	hl
   03C5 33            [ 6]  138 	inc	sp
   03C6 21 00 C0      [10]  139 	ld	hl, #0xc000
   03C9 E5            [11]  140 	push	hl
   03CA CD 03 65      [17]  141 	call	_cpct_getScreenPtr
   03CD D1            [10]  142 	pop	de
   03CE C1            [10]  143 	pop	bc
                            144 ;src/txt_scroll.c:34: cpct_drawSprite(g_tile_fontmap20x22_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   03CF E5            [11]  145 	push	hl
   03D0 FD E1         [14]  146 	pop	iy
   03D2 EB            [ 4]  147 	ex	de,hl
   03D3 29            [11]  148 	add	hl, hl
   03D4 11 D2 4B      [10]  149 	ld	de, #_g_tile_fontmap20x22_tileset
   03D7 19            [11]  150 	add	hl, de
   03D8 5E            [ 7]  151 	ld	e, (hl)
   03D9 23            [ 6]  152 	inc	hl
   03DA 56            [ 7]  153 	ld	d, (hl)
   03DB C5            [11]  154 	push	bc
   03DC 21 0A 16      [10]  155 	ld	hl, #0x160a
   03DF E5            [11]  156 	push	hl
   03E0 FD E5         [15]  157 	push	iy
   03E2 D5            [11]  158 	push	de
   03E3 CD 8A 62      [17]  159 	call	_cpct_drawSprite
   03E6 C1            [10]  160 	pop	bc
   03E7                     161 00109$:
                            162 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   03E7 DD 34 FC      [23]  163 	inc	-4 (ix)
   03EA 20 03         [12]  164 	jr	NZ,00136$
   03EC DD 34 FD      [23]  165 	inc	-3 (ix)
   03EF                     166 00136$:
   03EF 3E 46         [ 7]  167 	ld	a, #0x46
   03F1 DD BE FC      [19]  168 	cp	a, -4 (ix)
   03F4 3E 00         [ 7]  169 	ld	a, #0x00
   03F6 DD 9E FD      [19]  170 	sbc	a, -3 (ix)
   03F9 E2 FE 03      [10]  171 	jp	PO, 00137$
   03FC EE 80         [ 7]  172 	xor	a, #0x80
   03FE                     173 00137$:
   03FE F2 74 03      [10]  174 	jp	P, 00111$
   0401 DD F9         [10]  175 	ld	sp, ix
   0403 DD E1         [14]  176 	pop	ix
   0405 C9            [10]  177 	ret
                            178 	.area _CODE
                            179 	.area _INITIALIZER
                            180 	.area _CABS (ABS)
