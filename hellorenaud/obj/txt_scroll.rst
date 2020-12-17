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
   259A                      29 _vblPosition::
   259A                      30 	.ds 2
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
   0138                      55 _scroll::
   0138 DD E5         [15]   56 	push	ix
   013A DD 21 00 00   [14]   57 	ld	ix,#0
   013E DD 39         [15]   58 	add	ix,sp
   0140 F5            [11]   59 	push	af
   0141 F5            [11]   60 	push	af
                             61 ;src/txt_scroll.c:18: c2=step+SCREEN_WIDTH; // on insère du vide au début de step
   0142 DD 7E 08      [19]   62 	ld	a, 8 (ix)
   0145 C6 50         [ 7]   63 	add	a, #0x50
   0147 4F            [ 4]   64 	ld	c, a
   0148 DD 7E 09      [19]   65 	ld	a, 9 (ix)
   014B CE 00         [ 7]   66 	adc	a, #0x00
   014D 47            [ 4]   67 	ld	b, a
                             68 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   014E DD 5E 06      [19]   69 	ld	e,6 (ix)
   0151 DD 56 07      [19]   70 	ld	d,7 (ix)
   0154 6B            [ 4]   71 	ld	l, e
   0155 62            [ 4]   72 	ld	h, d
   0156 29            [11]   73 	add	hl, hl
   0157 29            [11]   74 	add	hl, hl
   0158 19            [11]   75 	add	hl, de
   0159 29            [11]   76 	add	hl, hl
   015A DD 75 FE      [19]   77 	ld	-2 (ix), l
   015D DD 74 FF      [19]   78 	ld	-1 (ix), h
   0160 21 00 00      [10]   79 	ld	hl, #0x0000
   0163 E3            [19]   80 	ex	(sp), hl
   0164                      81 00111$:
                             82 ;src/txt_scroll.c:22: c2=c2+1;
   0164 03            [ 6]   83 	inc	bc
                             84 ;src/txt_scroll.c:24: if (c2 < 0) {continue;}
   0165 CB 78         [ 8]   85 	bit	7, b
   0167 20 6E         [12]   86 	jr	NZ,00109$
                             87 ;src/txt_scroll.c:25: if (c2 > l*G_TILE_FONTMAP20X22_00_W) {continue;}
   0169 59            [ 4]   88 	ld	e, c
   016A 50            [ 4]   89 	ld	d, b
   016B DD 7E FE      [19]   90 	ld	a, -2 (ix)
   016E 93            [ 4]   91 	sub	a, e
   016F DD 7E FF      [19]   92 	ld	a, -1 (ix)
   0172 9A            [ 4]   93 	sbc	a, d
   0173 38 62         [12]   94 	jr	C,00109$
                             95 ;src/txt_scroll.c:27: div=c2/G_TILE_FONTMAP20X22_00_W;
   0175 C5            [11]   96 	push	bc
   0176 21 0A 00      [10]   97 	ld	hl, #0x000a
   0179 E5            [11]   98 	push	hl
   017A C5            [11]   99 	push	bc
   017B CD FB 24      [17]  100 	call	__divsint
   017E F1            [10]  101 	pop	af
   017F F1            [10]  102 	pop	af
   0180 EB            [ 4]  103 	ex	de,hl
   0181 C1            [10]  104 	pop	bc
                            105 ;src/txt_scroll.c:28: mod=c2%G_TILE_FONTMAP20X22_00_W;
   0182 C5            [11]  106 	push	bc
   0183 D5            [11]  107 	push	de
   0184 21 0A 00      [10]  108 	ld	hl, #0x000a
   0187 E5            [11]  109 	push	hl
   0188 C5            [11]  110 	push	bc
                            111 ;src/txt_scroll.c:29: if (mod==0) {
   0189 CD A6 24      [17]  112 	call	__modsint
   018C F1            [10]  113 	pop	af
   018D F1            [10]  114 	pop	af
   018E D1            [10]  115 	pop	de
   018F C1            [10]  116 	pop	bc
   0190 7C            [ 4]  117 	ld	a, h
   0191 B5            [ 4]  118 	or	a,l
   0192 20 43         [12]  119 	jr	NZ,00109$
                            120 ;src/txt_scroll.c:30: if (texte[div]!=' ') { // on zap les espaces FIXME mauvais pour le timing !
   0194 DD 6E 04      [19]  121 	ld	l,4 (ix)
   0197 DD 66 05      [19]  122 	ld	h,5 (ix)
   019A 19            [11]  123 	add	hl, de
   019B 5E            [ 7]  124 	ld	e, (hl)
   019C 7B            [ 4]  125 	ld	a, e
   019D D6 20         [ 7]  126 	sub	a, #0x20
   019F 28 36         [12]  127 	jr	Z,00109$
                            128 ;src/txt_scroll.c:31: o=texte[div]-'A';
   01A1 16 00         [ 7]  129 	ld	d, #0x00
   01A3 7B            [ 4]  130 	ld	a, e
   01A4 C6 BF         [ 7]  131 	add	a, #0xbf
   01A6 5F            [ 4]  132 	ld	e, a
   01A7 7A            [ 4]  133 	ld	a, d
   01A8 CE FF         [ 7]  134 	adc	a, #0xff
   01AA 57            [ 4]  135 	ld	d, a
                            136 ;src/txt_scroll.c:33: p = cpct_getScreenPtr(CPCT_VMEM_START, c1,120-1);
   01AB DD 66 FC      [19]  137 	ld	h, -4 (ix)
   01AE C5            [11]  138 	push	bc
   01AF D5            [11]  139 	push	de
   01B0 3E 77         [ 7]  140 	ld	a, #0x77
   01B2 F5            [11]  141 	push	af
   01B3 33            [ 6]  142 	inc	sp
   01B4 E5            [11]  143 	push	hl
   01B5 33            [ 6]  144 	inc	sp
   01B6 21 00 C0      [10]  145 	ld	hl, #0xc000
   01B9 E5            [11]  146 	push	hl
   01BA CD B3 24      [17]  147 	call	_cpct_getScreenPtr
   01BD D1            [10]  148 	pop	de
   01BE C1            [10]  149 	pop	bc
                            150 ;src/txt_scroll.c:34: cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
   01BF E5            [11]  151 	push	hl
   01C0 FD E1         [14]  152 	pop	iy
   01C2 EB            [ 4]  153 	ex	de,hl
   01C3 29            [11]  154 	add	hl, hl
   01C4 11 AB 0A      [10]  155 	ld	de, #_g_tile_tileset
   01C7 19            [11]  156 	add	hl, de
   01C8 5E            [ 7]  157 	ld	e, (hl)
   01C9 23            [ 6]  158 	inc	hl
   01CA 56            [ 7]  159 	ld	d, (hl)
   01CB C5            [11]  160 	push	bc
   01CC 21 0A 16      [10]  161 	ld	hl, #0x160a
   01CF E5            [11]  162 	push	hl
   01D0 FD E5         [15]  163 	push	iy
   01D2 D5            [11]  164 	push	de
   01D3 CD D9 21      [17]  165 	call	_cpct_drawSprite
   01D6 C1            [10]  166 	pop	bc
   01D7                     167 00109$:
                            168 ;src/txt_scroll.c:20: for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
   01D7 DD 34 FC      [23]  169 	inc	-4 (ix)
   01DA 20 03         [12]  170 	jr	NZ,00136$
   01DC DD 34 FD      [23]  171 	inc	-3 (ix)
   01DF                     172 00136$:
   01DF 3E 46         [ 7]  173 	ld	a, #0x46
   01E1 DD BE FC      [19]  174 	cp	a, -4 (ix)
   01E4 3E 00         [ 7]  175 	ld	a, #0x00
   01E6 DD 9E FD      [19]  176 	sbc	a, -3 (ix)
   01E9 E2 EE 01      [10]  177 	jp	PO, 00137$
   01EC EE 80         [ 7]  178 	xor	a, #0x80
   01EE                     179 00137$:
   01EE F2 64 01      [10]  180 	jp	P, 00111$
   01F1 DD F9         [10]  181 	ld	sp, ix
   01F3 DD E1         [14]  182 	pop	ix
   01F5 C9            [10]  183 	ret
                            184 ;src/txt_scroll.c:45: void killVBL() {
                            185 ;	---------------------------------
                            186 ; Function killVBL
                            187 ; ---------------------------------
   01F6                     188 _killVBL::
                            189 ;src/txt_scroll.c:52: __endasm;
   01F6 01 07 BC      [10]  190 	ld	bc,#0xbc07 ; Kill VBL
   01F9 3E 7F         [ 7]  191 	ld	a,#0x7f
   01FB ED 49         [12]  192 	out	(c),c
   01FD 04            [ 4]  193 	inc	b
   01FE ED 79         [12]  194 	out	(c),a
                            195 ;src/txt_scroll.c:53: vblPosition=37;
   0200 21 25 00      [10]  196 	ld	hl, #0x0025
   0203 22 9A 25      [16]  197 	ld	(_vblPosition), hl
   0206 C9            [10]  198 	ret
                            199 ;src/txt_scroll.c:56: void restoreVBL() {
                            200 ;	---------------------------------
                            201 ; Function restoreVBL
                            202 ; ---------------------------------
   0207                     203 _restoreVBL::
                            204 ;src/txt_scroll.c:63: __endasm;
   0207 01 07 BC      [10]  205 	ld	bc,#0xbc07 ; On repositionne la VBL
   020A 3A 9A 25      [13]  206 	ld	a,(_vblPosition)
   020D ED 49         [12]  207 	out	(c),c
   020F 04            [ 4]  208 	inc	b
   0210 ED 79         [12]  209 	out	(c),a
   0212 C9            [10]  210 	ret
                            211 ;src/txt_scroll.c:69: void rupture(unsigned char nbCharLigne) {
                            212 ;	---------------------------------
                            213 ; Function rupture
                            214 ; ---------------------------------
   0213                     215 _rupture::
                            216 ;src/txt_scroll.c:80: __endasm;
   0213 01 04 BC      [10]  217 	ld	bc,#0xbc04 ; Rupture 1
                            218 ;;ld	a,(_nbCharLigne)
   0216 21 02 00      [10]  219 	ld	hl, #2+0
   0219 39            [11]  220 	add	hl, sp
   021A 7E            [ 7]  221 	ld	a, (hl)
   021B 3D            [ 4]  222 	dec	a
   021C ED 49         [12]  223 	out	(c),c
   021E 04            [ 4]  224 	inc	b
   021F ED 79         [12]  225 	out	(c),a
                            226 ;src/txt_scroll.c:81: vblPosition=vblPosition-nbCharLigne;
   0221 21 02 00      [10]  227 	ld	hl, #2+0
   0224 39            [11]  228 	add	hl, sp
   0225 4E            [ 7]  229 	ld	c, (hl)
   0226 06 00         [ 7]  230 	ld	b, #0x00
   0228 21 9A 25      [10]  231 	ld	hl, #_vblPosition
   022B 7E            [ 7]  232 	ld	a, (hl)
   022C 91            [ 4]  233 	sub	a, c
   022D 77            [ 7]  234 	ld	(hl), a
   022E 23            [ 6]  235 	inc	hl
   022F 7E            [ 7]  236 	ld	a, (hl)
   0230 98            [ 4]  237 	sbc	a, b
   0231 77            [ 7]  238 	ld	(hl), a
   0232 C9            [10]  239 	ret
                            240 	.area _CODE
                            241 	.area _INITIALIZER
   25A1                     242 __xinit__vblPosition:
   25A1 00 00               243 	.dw #0x0000
                            244 	.area _CABS (ABS)
