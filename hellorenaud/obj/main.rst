                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _crtc
                             13 	.globl _wait_frame_flyback
                             14 	.globl _calque4000
                             15 	.globl _cpct_setPALColour
                             16 	.globl _cpct_setPalette
                             17 	.globl _cpct_setVideoMode
                             18 	.globl _cpct_drawSprite
                             19 	.globl _cpct_memset_f64
                             20 	.globl _cpct_disableFirmware
                             21 	.globl _screen_plot_address
                             22 	.globl _screen_location
                             23 	.globl _g_items_0
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
   23C4                      35 _screen_location::
   23C4                      36 	.ds 2
   23C6                      37 _screen_plot_address::
   23C6                      38 	.ds 2
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/main.c:67: void wait_frame_flyback() {
                             60 ;	---------------------------------
                             61 ; Function wait_frame_flyback
                             62 ; ---------------------------------
   052E                      63 _wait_frame_flyback::
                             64 ;src/main.c:73: __endasm;
   052E 06 F5         [ 7]   65 	ld	b,#0xf5 ;wait frame flyback
   0530                      66 	l1:
   0530 ED 78         [12]   67 	in a,(c)
   0532 1F            [ 4]   68 	rra
   0533 30 FB         [12]   69 	jr	nc,l1
   0535 C9            [10]   70 	ret
   0536                      71 _g_items_0:
   0536 05                   72 	.db #0x05	; 5
   0537 0F                   73 	.db #0x0f	; 15
   0538 0F                   74 	.db #0x0f	; 15
   0539 00                   75 	.db #0x00	; 0
   053A 0F                   76 	.db #0x0f	; 15
   053B 0F                   77 	.db #0x0f	; 15
   053C 0F                   78 	.db #0x0f	; 15
   053D 0A                   79 	.db #0x0a	; 10
   053E 0F                   80 	.db #0x0f	; 15
   053F 0A                   81 	.db #0x0a	; 10
   0540 05                   82 	.db #0x05	; 5
   0541 00                   83 	.db #0x00	; 0
   0542 0F                   84 	.db #0x0f	; 15
   0543 0A                   85 	.db #0x0a	; 10
   0544 05                   86 	.db #0x05	; 5
   0545 00                   87 	.db #0x00	; 0
   0546 05                   88 	.db #0x05	; 5
   0547 0F                   89 	.db #0x0f	; 15
   0548 0A                   90 	.db #0x0a	; 10
   0549 0A                   91 	.db #0x0a	; 10
   054A 00                   92 	.db #0x00	; 0
   054B 0F                   93 	.db #0x0f	; 15
   054C 0F                   94 	.db #0x0f	; 15
   054D 0A                   95 	.db #0x0a	; 10
   054E 00                   96 	.db #0x00	; 0
   054F 0A                   97 	.db #0x0a	; 10
   0550 0A                   98 	.db #0x0a	; 10
   0551 0A                   99 	.db #0x0a	; 10
   0552 00                  100 	.db #0x00	; 0
   0553 00                  101 	.db #0x00	; 0
   0554 00                  102 	.db #0x00	; 0
   0555 00                  103 	.db #0x00	; 0
                            104 ;src/main.c:76: void crtc(u8* R12R13) {
                            105 ;	---------------------------------
                            106 ; Function crtc
                            107 ; ---------------------------------
   0556                     108 _crtc::
                            109 ;src/main.c:93: __endasm;
   0556 DD E5         [15]  110 	push	ix
   0558 DD 21 00 00   [14]  111 	ld	ix,#0
   055C DD 39         [15]  112 	add	ix,sp
   055E DD 66 05      [19]  113 	ld	h, 5 (ix)
   0561 DD 6E 04      [19]  114 	ld	l, 4 (ix)
   0564 01 0C BC      [10]  115 	ld	bc,#0xbc00+12
   0567 ED 49         [12]  116 	out	(c),c
   0569 04            [ 4]  117 	inc	b
   056A ED 61         [12]  118 	out	(c),h
   056C 05            [ 4]  119 	dec	b
   056D 0C            [ 4]  120 	inc	c
   056E ED 49         [12]  121 	out	(c),c
   0570 04            [ 4]  122 	inc	b
   0571 ED 69         [12]  123 	out	(c),l
   0573 DD E1         [14]  124 	pop	ix
   0575 C9            [10]  125 	ret
                            126 ;src/main.c:169: void main(void) {
                            127 ;	---------------------------------
                            128 ; Function main
                            129 ; ---------------------------------
   0576                     130 _main::
   0576 DD E5         [15]  131 	push	ix
   0578 F5            [11]  132 	push	af
                            133 ;src/main.c:171: int s=0;
   0579 21 00 00      [10]  134 	ld	hl, #0x0000
   057C E3            [19]  135 	ex	(sp), hl
                            136 ;src/main.c:186: cpct_disableFirmware();
   057D CD ED 22      [17]  137 	call	_cpct_disableFirmware
                            138 ;src/main.c:199: cpct_setVideoMode(0);
   0580 2E 00         [ 7]  139 	ld	l, #0x00
   0582 CD DF 22      [17]  140 	call	_cpct_setVideoMode
                            141 ;src/main.c:201: cpct_setBorder(HW_BLACK);
   0585 21 10 14      [10]  142 	ld	hl, #0x1410
   0588 E5            [11]  143 	push	hl
   0589 CD E5 21      [17]  144 	call	_cpct_setPALColour
                            145 ;src/main.c:203: cpct_setPalette(g_tile_palette, 6);
   058C 21 06 00      [10]  146 	ld	hl, #0x0006
   058F E5            [11]  147 	push	hl
   0590 21 3C 07      [10]  148 	ld	hl, #_g_tile_palette
   0593 E5            [11]  149 	push	hl
   0594 CD CE 21      [17]  150 	call	_cpct_setPalette
                            151 ;src/main.c:264: cpct_memset_f64(0x4000,0x00,0x4000); // SCR_VMEM, 0, 0x4000
   0597 21 00 40      [10]  152 	ld	hl, #0x4000
   059A E5            [11]  153 	push	hl
   059B 26 00         [ 7]  154 	ld	h, #0x00
   059D E5            [11]  155 	push	hl
   059E 26 40         [ 7]  156 	ld	h, #0x40
   05A0 E5            [11]  157 	push	hl
   05A1 CD 96 22      [17]  158 	call	_cpct_memset_f64
                            159 ;src/main.c:274: calque4000(); // faut que le AND du début match
   05A4 CD B0 06      [17]  160 	call	_calque4000
                            161 ;src/main.c:276: screen_location=0x1000;
   05A7 21 00 10      [10]  162 	ld	hl, #0x1000
   05AA 22 C4 23      [16]  163 	ld	(_screen_location), hl
                            164 ;src/main.c:277: screen_plot_address=0x4000+80-2;
   05AD 21 4E 40      [10]  165 	ld	hl, #0x404e
   05B0 22 C6 23      [16]  166 	ld	(_screen_plot_address), hl
                            167 ;src/main.c:279: while (1) {
   05B3                     168 00102$:
                            169 ;src/main.c:282: wait_frame_flyback();
   05B3 CD 2E 05      [17]  170 	call	_wait_frame_flyback
                            171 ;src/main.c:283: screen_location++;
   05B6 FD 21 C4 23   [14]  172 	ld	iy, #_screen_location
   05BA FD 34 00      [23]  173 	inc	0 (iy)
   05BD 20 03         [12]  174 	jr	NZ,00110$
   05BF FD 34 01      [23]  175 	inc	1 (iy)
   05C2                     176 00110$:
                            177 ;src/main.c:284: screen_location=(u8 *)(((unsigned int)screen_location) & 0x13FF);
   05C2 2A C4 23      [16]  178 	ld	hl, (_screen_location)
   05C5 7C            [ 4]  179 	ld	a, h
   05C6 E6 13         [ 7]  180 	and	a, #0x13
   05C8 67            [ 4]  181 	ld	h, a
   05C9 22 C4 23      [16]  182 	ld	(_screen_location), hl
                            183 ;src/main.c:285: crtc(screen_location);
   05CC 2A C4 23      [16]  184 	ld	hl, (_screen_location)
   05CF E5            [11]  185 	push	hl
   05D0 CD 56 05      [17]  186 	call	_crtc
   05D3 F1            [10]  187 	pop	af
                            188 ;src/main.c:287: screen_plot_address++;
   05D4 FD 21 C6 23   [14]  189 	ld	iy, #_screen_plot_address
   05D8 FD 34 00      [23]  190 	inc	0 (iy)
   05DB 20 03         [12]  191 	jr	NZ,00111$
   05DD FD 34 01      [23]  192 	inc	1 (iy)
   05E0                     193 00111$:
                            194 ;src/main.c:288: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
   05E0 2A C6 23      [16]  195 	ld	hl, (_screen_plot_address)
   05E3 7C            [ 4]  196 	ld	a, h
   05E4 E6 47         [ 7]  197 	and	a, #0x47
   05E6 67            [ 4]  198 	ld	h, a
   05E7 22 C6 23      [16]  199 	ld	(_screen_plot_address), hl
                            200 ;src/main.c:289: screen_plot_address++;
   05EA FD 34 00      [23]  201 	inc	0 (iy)
   05ED 20 03         [12]  202 	jr	NZ,00112$
   05EF FD 34 01      [23]  203 	inc	1 (iy)
   05F2                     204 00112$:
                            205 ;src/main.c:290: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
   05F2 2A C6 23      [16]  206 	ld	hl, (_screen_plot_address)
   05F5 7C            [ 4]  207 	ld	a, h
   05F6 E6 47         [ 7]  208 	and	a, #0x47
   05F8 67            [ 4]  209 	ld	h, a
   05F9 22 C6 23      [16]  210 	ld	(_screen_plot_address), hl
                            211 ;src/main.c:295: s=(s+1)%8;
   05FC C1            [10]  212 	pop	bc
   05FD C5            [11]  213 	push	bc
   05FE 03            [ 6]  214 	inc	bc
   05FF 21 08 00      [10]  215 	ld	hl, #0x0008
   0602 E5            [11]  216 	push	hl
   0603 C5            [11]  217 	push	bc
   0604 CD 0A 23      [17]  218 	call	__modsint
   0607 F1            [10]  219 	pop	af
   0608 F1            [10]  220 	pop	af
   0609 33            [ 6]  221 	inc	sp
   060A 33            [ 6]  222 	inc	sp
   060B E5            [11]  223 	push	hl
                            224 ;src/main.c:296: cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_0_W, G_TILE_SCHTROUMPF4X32_0_H);
   060C ED 5B C6 23   [20]  225 	ld	de, (_screen_plot_address)
   0610 01 38 01      [10]  226 	ld	bc, #_g_tile_schtroumpf4x32_tileset+0
   0613 E1            [10]  227 	pop	hl
   0614 E5            [11]  228 	push	hl
   0615 29            [11]  229 	add	hl, hl
   0616 09            [11]  230 	add	hl, bc
   0617 4E            [ 7]  231 	ld	c, (hl)
   0618 23            [ 6]  232 	inc	hl
   0619 46            [ 7]  233 	ld	b, (hl)
   061A 21 02 20      [10]  234 	ld	hl, #0x2002
   061D E5            [11]  235 	push	hl
   061E D5            [11]  236 	push	de
   061F C5            [11]  237 	push	bc
   0620 CD F1 21      [17]  238 	call	_cpct_drawSprite
   0623 18 8E         [12]  239 	jr	00102$
                            240 	.area _CODE
                            241 	.area _INITIALIZER
   23CD                     242 __xinit__screen_location:
   23CD 00 10               243 	.dw #0x1000
   23CF                     244 __xinit__screen_plot_address:
   23CF 4E 40               245 	.dw #0x404e
                            246 	.area _CABS (ABS)
