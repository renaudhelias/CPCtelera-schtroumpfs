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
                             45 ;src/txt_scroll.c:4: void scroll(char * texte, unsigned int l) {
                             46 ;	---------------------------------
                             47 ; Function scroll
                             48 ; ---------------------------------
   0138                      49 _scroll::
   0138 DD E5         [15]   50 	push	ix
   013A DD 21 00 00   [14]   51 	ld	ix,#0
   013E DD 39         [15]   52 	add	ix,sp
   0140 3B            [ 6]   53 	dec	sp
                             54 ;src/txt_scroll.c:8: for(c=0;c<l;c=c+1) {
   0141 DD 36 FF 00   [19]   55 	ld	-1 (ix), #0x00
   0145                      56 00105$:
   0145 DD 7E FF      [19]   57 	ld	a, -1 (ix)
   0148 06 00         [ 7]   58 	ld	b, #0x00
   014A DD 96 06      [19]   59 	sub	a, 6 (ix)
   014D 78            [ 4]   60 	ld	a, b
   014E DD 9E 07      [19]   61 	sbc	a, 7 (ix)
   0151 30 4C         [12]   62 	jr	NC,00107$
                             63 ;src/txt_scroll.c:9: if (texte[c]!=' ') {
   0153 DD 7E 04      [19]   64 	ld	a, 4 (ix)
   0156 DD 86 FF      [19]   65 	add	a, -1 (ix)
   0159 6F            [ 4]   66 	ld	l, a
   015A DD 7E 05      [19]   67 	ld	a, 5 (ix)
   015D CE 00         [ 7]   68 	adc	a, #0x00
   015F 67            [ 4]   69 	ld	h, a
   0160 4E            [ 7]   70 	ld	c, (hl)
   0161 79            [ 4]   71 	ld	a, c
   0162 D6 20         [ 7]   72 	sub	a, #0x20
   0164 28 34         [12]   73 	jr	Z,00106$
                             74 ;src/txt_scroll.c:10: o=texte[c]-'A';
   0166 06 00         [ 7]   75 	ld	b, #0x00
   0168 79            [ 4]   76 	ld	a, c
   0169 C6 BF         [ 7]   77 	add	a, #0xbf
   016B 4F            [ 4]   78 	ld	c, a
   016C 78            [ 4]   79 	ld	a, b
   016D CE FF         [ 7]   80 	adc	a, #0xff
   016F 47            [ 4]   81 	ld	b, a
                             82 ;src/txt_scroll.c:11: p = cpct_getScreenPtr(CPCT_VMEM_START, c*G_TILE_FONTMAP20X22_00_W,120-1);
   0170 DD 7E FF      [19]   83 	ld	a, -1 (ix)
   0173 5F            [ 4]   84 	ld	e, a
   0174 87            [ 4]   85 	add	a, a
   0175 87            [ 4]   86 	add	a, a
   0176 83            [ 4]   87 	add	a, e
   0177 87            [ 4]   88 	add	a, a
   0178 57            [ 4]   89 	ld	d, a
   0179 C5            [11]   90 	push	bc
   017A 3E 77         [ 7]   91 	ld	a, #0x77
   017C F5            [11]   92 	push	af
   017D 33            [ 6]   93 	inc	sp
   017E D5            [11]   94 	push	de
   017F 33            [ 6]   95 	inc	sp
   0180 21 00 C0      [10]   96 	ld	hl, #0xc000
   0183 E5            [11]   97 	push	hl
   0184 CD 85 23      [17]   98 	call	_cpct_getScreenPtr
   0187 EB            [ 4]   99 	ex	de,hl
                            100 ;src/txt_scroll.c:12: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   0188 E1            [10]  101 	pop	hl
   0189 29            [11]  102 	add	hl, hl
   018A 01 6D 09      [10]  103 	ld	bc, #_g_tile_tileset
   018D 09            [11]  104 	add	hl, bc
   018E 4E            [ 7]  105 	ld	c, (hl)
   018F 23            [ 6]  106 	inc	hl
   0190 46            [ 7]  107 	ld	b, (hl)
   0191 21 0A 16      [10]  108 	ld	hl, #0x160a
   0194 E5            [11]  109 	push	hl
   0195 D5            [11]  110 	push	de
   0196 C5            [11]  111 	push	bc
   0197 CD 9B 20      [17]  112 	call	_cpct_drawSprite
   019A                     113 00106$:
                            114 ;src/txt_scroll.c:8: for(c=0;c<l;c=c+1) {
   019A DD 34 FF      [23]  115 	inc	-1 (ix)
   019D 18 A6         [12]  116 	jr	00105$
   019F                     117 00107$:
   019F 33            [ 6]  118 	inc	sp
   01A0 DD E1         [14]  119 	pop	ix
   01A2 C9            [10]  120 	ret
                            121 	.area _CODE
                            122 	.area _INITIALIZER
                            123 	.area _CABS (ABS)
