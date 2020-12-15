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
                             45 ;src/txt_scroll.c:6: void scroll(char * texte, unsigned int l, unsigned int step) {
                             46 ;	---------------------------------
                             47 ; Function scroll
                             48 ; ---------------------------------
   0138                      49 _scroll::
   0138 DD E5         [15]   50 	push	ix
   013A DD 21 00 00   [14]   51 	ld	ix,#0
   013E DD 39         [15]   52 	add	ix,sp
   0140 F5            [11]   53 	push	af
   0141 F5            [11]   54 	push	af
   0142 3B            [ 6]   55 	dec	sp
                             56 ;src/txt_scroll.c:10: for(c=step;c<G_TILE_FONTMAP20X22_00_W*l;c=c+1) {
   0143 DD 4E 08      [19]   57 	ld	c, 8 (ix)
   0146 41            [ 4]   58 	ld	b, c
   0147 DD 5E 06      [19]   59 	ld	e,6 (ix)
   014A DD 56 07      [19]   60 	ld	d,7 (ix)
   014D 6B            [ 4]   61 	ld	l, e
   014E 62            [ 4]   62 	ld	h, d
   014F 29            [11]   63 	add	hl, hl
   0150 29            [11]   64 	add	hl, hl
   0151 19            [11]   65 	add	hl, de
   0152 29            [11]   66 	add	hl, hl
   0153 EB            [ 4]   67 	ex	de,hl
   0154                      68 00108$:
   0154 68            [ 4]   69 	ld	l, b
   0155 26 00         [ 7]   70 	ld	h, #0x00
   0157 BF            [ 4]   71 	cp	a, a
   0158 ED 52         [15]   72 	sbc	hl, de
   015A D2 06 02      [10]   73 	jp	NC, 00110$
                             74 ;src/txt_scroll.c:11: if (c-step>SCREEN_WIDTH) {return;}
   015D 68            [ 4]   75 	ld	l, b
   015E 26 00         [ 7]   76 	ld	h, #0x00
   0160 7D            [ 4]   77 	ld	a, l
   0161 DD 96 08      [19]   78 	sub	a, 8 (ix)
   0164 6F            [ 4]   79 	ld	l, a
   0165 7C            [ 4]   80 	ld	a, h
   0166 DD 9E 09      [19]   81 	sbc	a, 9 (ix)
   0169 67            [ 4]   82 	ld	h, a
   016A 3E A0         [ 7]   83 	ld	a, #0xa0
   016C BD            [ 4]   84 	cp	a, l
   016D 3E 00         [ 7]   85 	ld	a, #0x00
   016F 9C            [ 4]   86 	sbc	a, h
   0170 DA 06 02      [10]   87 	jp	C,00110$
                             88 ;src/txt_scroll.c:12: if (texte[c]!=' ' && c%G_TILE_FONTMAP20X22_00_W==0) {
   0173 DD 7E 04      [19]   89 	ld	a, 4 (ix)
   0176 80            [ 4]   90 	add	a, b
   0177 6F            [ 4]   91 	ld	l, a
   0178 DD 7E 05      [19]   92 	ld	a, 5 (ix)
   017B CE 00         [ 7]   93 	adc	a, #0x00
   017D 67            [ 4]   94 	ld	h, a
   017E 7E            [ 7]   95 	ld	a, (hl)
   017F D6 20         [ 7]   96 	sub	a, #0x20
   0181 CA 02 02      [10]   97 	jp	Z,00109$
   0184 C5            [11]   98 	push	bc
   0185 D5            [11]   99 	push	de
   0186 3E 0A         [ 7]  100 	ld	a, #0x0a
   0188 F5            [11]  101 	push	af
   0189 33            [ 6]  102 	inc	sp
   018A C5            [11]  103 	push	bc
   018B 33            [ 6]  104 	inc	sp
   018C CD C4 21      [17]  105 	call	__moduchar
   018F F1            [10]  106 	pop	af
   0190 D1            [10]  107 	pop	de
   0191 C1            [10]  108 	pop	bc
   0192 7D            [ 4]  109 	ld	a, l
   0193 B7            [ 4]  110 	or	a, a
   0194 20 6C         [12]  111 	jr	NZ,00109$
                            112 ;src/txt_scroll.c:13: o=texte[c/G_TILE_FONTMAP20X22_00_W]-'A';
   0196 C5            [11]  113 	push	bc
   0197 D5            [11]  114 	push	de
   0198 3E 0A         [ 7]  115 	ld	a, #0x0a
   019A F5            [11]  116 	push	af
   019B 33            [ 6]  117 	inc	sp
   019C C5            [11]  118 	push	bc
   019D 33            [ 6]  119 	inc	sp
   019E CD E3 21      [17]  120 	call	__divuchar
   01A1 F1            [10]  121 	pop	af
   01A2 DD 75 FF      [19]  122 	ld	-1 (ix), l
   01A5 D1            [10]  123 	pop	de
   01A6 C1            [10]  124 	pop	bc
   01A7 DD 7E 04      [19]  125 	ld	a, 4 (ix)
   01AA DD 86 FF      [19]  126 	add	a, -1 (ix)
   01AD 6F            [ 4]  127 	ld	l, a
   01AE DD 7E 05      [19]  128 	ld	a, 5 (ix)
   01B1 CE 00         [ 7]  129 	adc	a, #0x00
   01B3 67            [ 4]  130 	ld	h, a
   01B4 6E            [ 7]  131 	ld	l, (hl)
   01B5 26 00         [ 7]  132 	ld	h, #0x00
   01B7 7D            [ 4]  133 	ld	a, l
   01B8 C6 BF         [ 7]  134 	add	a, #0xbf
   01BA DD 77 FB      [19]  135 	ld	-5 (ix), a
   01BD 7C            [ 4]  136 	ld	a, h
   01BE CE FF         [ 7]  137 	adc	a, #0xff
   01C0 DD 77 FC      [19]  138 	ld	-4 (ix), a
                            139 ;src/txt_scroll.c:14: p = cpct_getScreenPtr(CPCT_VMEM_START, c-step,120-1);
   01C3 78            [ 4]  140 	ld	a, b
   01C4 91            [ 4]  141 	sub	a, c
   01C5 67            [ 4]  142 	ld	h, a
   01C6 C5            [11]  143 	push	bc
   01C7 D5            [11]  144 	push	de
   01C8 3E 77         [ 7]  145 	ld	a, #0x77
   01CA F5            [11]  146 	push	af
   01CB 33            [ 6]  147 	inc	sp
   01CC E5            [11]  148 	push	hl
   01CD 33            [ 6]  149 	inc	sp
   01CE 21 00 C0      [10]  150 	ld	hl, #0xc000
   01D1 E5            [11]  151 	push	hl
   01D2 CD 61 24      [17]  152 	call	_cpct_getScreenPtr
   01D5 D1            [10]  153 	pop	de
   01D6 C1            [10]  154 	pop	bc
                            155 ;src/txt_scroll.c:15: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   01D7 E5            [11]  156 	push	hl
   01D8 FD E1         [14]  157 	pop	iy
   01DA E1            [10]  158 	pop	hl
   01DB E5            [11]  159 	push	hl
   01DC 29            [11]  160 	add	hl, hl
   01DD 3E F1         [ 7]  161 	ld	a, #<(_g_tile_tileset)
   01DF 85            [ 4]  162 	add	a, l
   01E0 6F            [ 4]  163 	ld	l, a
   01E1 3E 09         [ 7]  164 	ld	a, #>(_g_tile_tileset)
   01E3 8C            [ 4]  165 	adc	a, h
   01E4 67            [ 4]  166 	ld	h, a
   01E5 7E            [ 7]  167 	ld	a, (hl)
   01E6 23            [ 6]  168 	inc	hl
   01E7 66            [ 7]  169 	ld	h, (hl)
   01E8 DD 77 FD      [19]  170 	ld	-3 (ix), a
   01EB DD 74 FE      [19]  171 	ld	-2 (ix), h
   01EE C5            [11]  172 	push	bc
   01EF D5            [11]  173 	push	de
   01F0 21 0A 16      [10]  174 	ld	hl, #0x160a
   01F3 E5            [11]  175 	push	hl
   01F4 FD E5         [15]  176 	push	iy
   01F6 DD 6E FD      [19]  177 	ld	l,-3 (ix)
   01F9 DD 66 FE      [19]  178 	ld	h,-2 (ix)
   01FC E5            [11]  179 	push	hl
   01FD CD 1F 21      [17]  180 	call	_cpct_drawSprite
   0200 D1            [10]  181 	pop	de
   0201 C1            [10]  182 	pop	bc
   0202                     183 00109$:
                            184 ;src/txt_scroll.c:10: for(c=step;c<G_TILE_FONTMAP20X22_00_W*l;c=c+1) {
   0202 04            [ 4]  185 	inc	b
   0203 C3 54 01      [10]  186 	jp	00108$
   0206                     187 00110$:
   0206 DD F9         [10]  188 	ld	sp, ix
   0208 DD E1         [14]  189 	pop	ix
   020A C9            [10]  190 	ret
                            191 	.area _CODE
                            192 	.area _INITIALIZER
                            193 	.area _CABS (ABS)
