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
                             45 ;src/txt_scroll.c:11: void scroll(char * texte, unsigned int l, int step) {//step 160 200
                             46 ;	---------------------------------
                             47 ; Function scroll
                             48 ; ---------------------------------
   0138                      49 _scroll::
   0138 DD E5         [15]   50 	push	ix
   013A DD 21 00 00   [14]   51 	ld	ix,#0
   013E DD 39         [15]   52 	add	ix,sp
   0140 F5            [11]   53 	push	af
   0141 F5            [11]   54 	push	af
                             55 ;src/txt_scroll.c:18: c2=step+SCREEN_WIDTH; // on insère du vide au début de step
   0142 DD 7E 08      [19]   56 	ld	a, 8 (ix)
   0145 C6 50         [ 7]   57 	add	a, #0x50
   0147 4F            [ 4]   58 	ld	c, a
   0148 DD 7E 09      [19]   59 	ld	a, 9 (ix)
   014B CE 00         [ 7]   60 	adc	a, #0x00
   014D 47            [ 4]   61 	ld	b, a
                             62 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   014E DD 5E 06      [19]   63 	ld	e,6 (ix)
   0151 DD 56 07      [19]   64 	ld	d,7 (ix)
   0154 6B            [ 4]   65 	ld	l, e
   0155 62            [ 4]   66 	ld	h, d
   0156 29            [11]   67 	add	hl, hl
   0157 29            [11]   68 	add	hl, hl
   0158 19            [11]   69 	add	hl, de
   0159 29            [11]   70 	add	hl, hl
   015A DD 75 FE      [19]   71 	ld	-2 (ix), l
   015D DD 74 FF      [19]   72 	ld	-1 (ix), h
   0160 21 00 00      [10]   73 	ld	hl, #0x0000
   0163 E3            [19]   74 	ex	(sp), hl
   0164                      75 00111$:
                             76 ;src/txt_scroll.c:22: c2=c2+1;
   0164 03            [ 6]   77 	inc	bc
                             78 ;src/txt_scroll.c:24: if (c2 < 0) {continue;}
   0165 CB 78         [ 8]   79 	bit	7, b
   0167 20 6E         [12]   80 	jr	NZ,00109$
                             81 ;src/txt_scroll.c:25: if (c2 > l*G_TILE_FONTMAP20X22_00_W) {continue;}
   0169 59            [ 4]   82 	ld	e, c
   016A 50            [ 4]   83 	ld	d, b
   016B DD 7E FE      [19]   84 	ld	a, -2 (ix)
   016E 93            [ 4]   85 	sub	a, e
   016F DD 7E FF      [19]   86 	ld	a, -1 (ix)
   0172 9A            [ 4]   87 	sbc	a, d
   0173 38 62         [12]   88 	jr	C,00109$
                             89 ;src/txt_scroll.c:27: div=c2/G_TILE_FONTMAP20X22_00_W;
   0175 C5            [11]   90 	push	bc
   0176 21 0A 00      [10]   91 	ld	hl, #0x000a
   0179 E5            [11]   92 	push	hl
   017A C5            [11]   93 	push	bc
   017B CD 99 24      [17]   94 	call	__divsint
   017E F1            [10]   95 	pop	af
   017F F1            [10]   96 	pop	af
   0180 EB            [ 4]   97 	ex	de,hl
   0181 C1            [10]   98 	pop	bc
                             99 ;src/txt_scroll.c:28: mod=c2%G_TILE_FONTMAP20X22_00_W;
   0182 C5            [11]  100 	push	bc
   0183 D5            [11]  101 	push	de
   0184 21 0A 00      [10]  102 	ld	hl, #0x000a
   0187 E5            [11]  103 	push	hl
   0188 C5            [11]  104 	push	bc
                            105 ;src/txt_scroll.c:29: if (mod==0) {
   0189 CD 44 24      [17]  106 	call	__modsint
   018C F1            [10]  107 	pop	af
   018D F1            [10]  108 	pop	af
   018E D1            [10]  109 	pop	de
   018F C1            [10]  110 	pop	bc
   0190 7C            [ 4]  111 	ld	a, h
   0191 B5            [ 4]  112 	or	a,l
   0192 20 43         [12]  113 	jr	NZ,00109$
                            114 ;src/txt_scroll.c:30: if (texte[div]!=' ') {
   0194 DD 6E 04      [19]  115 	ld	l,4 (ix)
   0197 DD 66 05      [19]  116 	ld	h,5 (ix)
   019A 19            [11]  117 	add	hl, de
   019B 5E            [ 7]  118 	ld	e, (hl)
   019C 7B            [ 4]  119 	ld	a, e
   019D D6 20         [ 7]  120 	sub	a, #0x20
   019F 28 36         [12]  121 	jr	Z,00109$
                            122 ;src/txt_scroll.c:31: o=texte[div]-'A';
   01A1 16 00         [ 7]  123 	ld	d, #0x00
   01A3 7B            [ 4]  124 	ld	a, e
   01A4 C6 BF         [ 7]  125 	add	a, #0xbf
   01A6 5F            [ 4]  126 	ld	e, a
   01A7 7A            [ 4]  127 	ld	a, d
   01A8 CE FF         [ 7]  128 	adc	a, #0xff
   01AA 57            [ 4]  129 	ld	d, a
                            130 ;src/txt_scroll.c:33: p = cpct_getScreenPtr(CPCT_VMEM_START, c1,120-1);
   01AB DD 66 FC      [19]  131 	ld	h, -4 (ix)
   01AE C5            [11]  132 	push	bc
   01AF D5            [11]  133 	push	de
   01B0 3E 77         [ 7]  134 	ld	a, #0x77
   01B2 F5            [11]  135 	push	af
   01B3 33            [ 6]  136 	inc	sp
   01B4 E5            [11]  137 	push	hl
   01B5 33            [ 6]  138 	inc	sp
   01B6 21 00 C0      [10]  139 	ld	hl, #0xc000
   01B9 E5            [11]  140 	push	hl
   01BA CD 51 24      [17]  141 	call	_cpct_getScreenPtr
   01BD D1            [10]  142 	pop	de
   01BE C1            [10]  143 	pop	bc
                            144 ;src/txt_scroll.c:34: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   01BF E5            [11]  145 	push	hl
   01C0 FD E1         [14]  146 	pop	iy
   01C2 EB            [ 4]  147 	ex	de,hl
   01C3 29            [11]  148 	add	hl, hl
   01C4 11 49 0A      [10]  149 	ld	de, #_g_tile_tileset
   01C7 19            [11]  150 	add	hl, de
   01C8 5E            [ 7]  151 	ld	e, (hl)
   01C9 23            [ 6]  152 	inc	hl
   01CA 56            [ 7]  153 	ld	d, (hl)
   01CB C5            [11]  154 	push	bc
   01CC 21 0A 16      [10]  155 	ld	hl, #0x160a
   01CF E5            [11]  156 	push	hl
   01D0 FD E5         [15]  157 	push	iy
   01D2 D5            [11]  158 	push	de
   01D3 CD 77 21      [17]  159 	call	_cpct_drawSprite
   01D6 C1            [10]  160 	pop	bc
   01D7                     161 00109$:
                            162 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   01D7 DD 34 FC      [23]  163 	inc	-4 (ix)
   01DA 20 03         [12]  164 	jr	NZ,00136$
   01DC DD 34 FD      [23]  165 	inc	-3 (ix)
   01DF                     166 00136$:
   01DF 3E 46         [ 7]  167 	ld	a, #0x46
   01E1 DD BE FC      [19]  168 	cp	a, -4 (ix)
   01E4 3E 00         [ 7]  169 	ld	a, #0x00
   01E6 DD 9E FD      [19]  170 	sbc	a, -3 (ix)
   01E9 E2 EE 01      [10]  171 	jp	PO, 00137$
   01EC EE 80         [ 7]  172 	xor	a, #0x80
   01EE                     173 00137$:
   01EE F2 64 01      [10]  174 	jp	P, 00111$
   01F1 DD F9         [10]  175 	ld	sp, ix
   01F3 DD E1         [14]  176 	pop	ix
   01F5 C9            [10]  177 	ret
                            178 	.area _CODE
                            179 	.area _INITIALIZER
                            180 	.area _CABS (ABS)
