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
                             15 	.globl _cpct_drawSprite
                             16 	.globl _cpct_memset_f64
                             17 	.globl _cpct_disableFirmware
                             18 	.globl _screen_plot_address
                             19 	.globl _screen_location
                             20 	.globl _g_items_0
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
   23AB                      32 _screen_location::
   23AB                      33 	.ds 2
   23AD                      34 _screen_plot_address::
   23AD                      35 	.ds 2
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/main.c:67: void wait_frame_flyback() {
                             57 ;	---------------------------------
                             58 ; Function wait_frame_flyback
                             59 ; ---------------------------------
   055E                      60 _wait_frame_flyback::
                             61 ;src/main.c:73: __endasm;
   055E 06 F5         [ 7]   62 	ld	b,#0xf5 ;wait frame flyback
   0560                      63 	l1:
   0560 ED 78         [12]   64 	in a,(c)
   0562 1F            [ 4]   65 	rra
   0563 30 FB         [12]   66 	jr	nc,l1
   0565 C9            [10]   67 	ret
   0566                      68 _g_items_0:
   0566 05                   69 	.db #0x05	; 5
   0567 0F                   70 	.db #0x0f	; 15
   0568 0F                   71 	.db #0x0f	; 15
   0569 00                   72 	.db #0x00	; 0
   056A 0F                   73 	.db #0x0f	; 15
   056B 0F                   74 	.db #0x0f	; 15
   056C 0F                   75 	.db #0x0f	; 15
   056D 0A                   76 	.db #0x0a	; 10
   056E 0F                   77 	.db #0x0f	; 15
   056F 0A                   78 	.db #0x0a	; 10
   0570 05                   79 	.db #0x05	; 5
   0571 00                   80 	.db #0x00	; 0
   0572 0F                   81 	.db #0x0f	; 15
   0573 0A                   82 	.db #0x0a	; 10
   0574 05                   83 	.db #0x05	; 5
   0575 00                   84 	.db #0x00	; 0
   0576 05                   85 	.db #0x05	; 5
   0577 0F                   86 	.db #0x0f	; 15
   0578 0A                   87 	.db #0x0a	; 10
   0579 0A                   88 	.db #0x0a	; 10
   057A 00                   89 	.db #0x00	; 0
   057B 0F                   90 	.db #0x0f	; 15
   057C 0F                   91 	.db #0x0f	; 15
   057D 0A                   92 	.db #0x0a	; 10
   057E 00                   93 	.db #0x00	; 0
   057F 0A                   94 	.db #0x0a	; 10
   0580 0A                   95 	.db #0x0a	; 10
   0581 0A                   96 	.db #0x0a	; 10
   0582 00                   97 	.db #0x00	; 0
   0583 00                   98 	.db #0x00	; 0
   0584 00                   99 	.db #0x00	; 0
   0585 00                  100 	.db #0x00	; 0
                            101 ;src/main.c:76: void crtc(u8* R12R13) {
                            102 ;	---------------------------------
                            103 ; Function crtc
                            104 ; ---------------------------------
   0586                     105 _crtc::
                            106 ;src/main.c:93: __endasm;
   0586 DD E5         [15]  107 	push	ix
   0588 DD 21 00 00   [14]  108 	ld	ix,#0
   058C DD 39         [15]  109 	add	ix,sp
   058E DD 66 05      [19]  110 	ld	h, 5 (ix)
   0591 DD 6E 04      [19]  111 	ld	l, 4 (ix)
   0594 01 0C BC      [10]  112 	ld	bc,#0xbc00+12
   0597 ED 49         [12]  113 	out	(c),c
   0599 04            [ 4]  114 	inc	b
   059A ED 61         [12]  115 	out	(c),h
   059C 05            [ 4]  116 	dec	b
   059D 0C            [ 4]  117 	inc	c
   059E ED 49         [12]  118 	out	(c),c
   05A0 04            [ 4]  119 	inc	b
   05A1 ED 69         [12]  120 	out	(c),l
   05A3 DD E1         [14]  121 	pop	ix
   05A5 C9            [10]  122 	ret
                            123 ;src/main.c:169: void main(void) {
                            124 ;	---------------------------------
                            125 ; Function main
                            126 ; ---------------------------------
   05A6                     127 _main::
   05A6 DD E5         [15]  128 	push	ix
   05A8 F5            [11]  129 	push	af
                            130 ;src/main.c:171: int s=0;
   05A9 21 00 00      [10]  131 	ld	hl, #0x0000
   05AC E3            [19]  132 	ex	(sp), hl
                            133 ;src/main.c:263: cpct_disableFirmware();
   05AD CD D5 22      [17]  134 	call	_cpct_disableFirmware
                            135 ;src/main.c:264: cpct_memset_f64(0x4000,0x00,0x4000); // SCR_VMEM, 0, 0x4000
   05B0 21 00 40      [10]  136 	ld	hl, #0x4000
   05B3 E5            [11]  137 	push	hl
   05B4 26 00         [ 7]  138 	ld	h, #0x00
   05B6 E5            [11]  139 	push	hl
   05B7 26 40         [ 7]  140 	ld	h, #0x40
   05B9 E5            [11]  141 	push	hl
   05BA CD 8C 22      [17]  142 	call	_cpct_memset_f64
                            143 ;src/main.c:274: calque4000(); // faut que le AND du début match
   05BD CD C9 06      [17]  144 	call	_calque4000
                            145 ;src/main.c:276: screen_location=0x1000;
   05C0 21 00 10      [10]  146 	ld	hl, #0x1000
   05C3 22 AB 23      [16]  147 	ld	(_screen_location), hl
                            148 ;src/main.c:277: screen_plot_address=0x4000+80-2;
   05C6 21 4E 40      [10]  149 	ld	hl, #0x404e
   05C9 22 AD 23      [16]  150 	ld	(_screen_plot_address), hl
                            151 ;src/main.c:279: while (1) {
   05CC                     152 00102$:
                            153 ;src/main.c:282: wait_frame_flyback();
   05CC CD 5E 05      [17]  154 	call	_wait_frame_flyback
                            155 ;src/main.c:283: screen_location++;
   05CF FD 21 AB 23   [14]  156 	ld	iy, #_screen_location
   05D3 FD 34 00      [23]  157 	inc	0 (iy)
   05D6 20 03         [12]  158 	jr	NZ,00110$
   05D8 FD 34 01      [23]  159 	inc	1 (iy)
   05DB                     160 00110$:
                            161 ;src/main.c:284: screen_location=(u8 *)(((unsigned int)screen_location) & 0x13FF);
   05DB 2A AB 23      [16]  162 	ld	hl, (_screen_location)
   05DE 7C            [ 4]  163 	ld	a, h
   05DF E6 13         [ 7]  164 	and	a, #0x13
   05E1 67            [ 4]  165 	ld	h, a
   05E2 22 AB 23      [16]  166 	ld	(_screen_location), hl
                            167 ;src/main.c:285: crtc(screen_location);
   05E5 2A AB 23      [16]  168 	ld	hl, (_screen_location)
   05E8 E5            [11]  169 	push	hl
   05E9 CD 86 05      [17]  170 	call	_crtc
   05EC F1            [10]  171 	pop	af
                            172 ;src/main.c:287: screen_plot_address++;
   05ED FD 21 AD 23   [14]  173 	ld	iy, #_screen_plot_address
   05F1 FD 34 00      [23]  174 	inc	0 (iy)
   05F4 20 03         [12]  175 	jr	NZ,00111$
   05F6 FD 34 01      [23]  176 	inc	1 (iy)
   05F9                     177 00111$:
                            178 ;src/main.c:288: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
   05F9 2A AD 23      [16]  179 	ld	hl, (_screen_plot_address)
   05FC 7C            [ 4]  180 	ld	a, h
   05FD E6 47         [ 7]  181 	and	a, #0x47
   05FF 67            [ 4]  182 	ld	h, a
   0600 22 AD 23      [16]  183 	ld	(_screen_plot_address), hl
                            184 ;src/main.c:289: screen_plot_address++;
   0603 FD 34 00      [23]  185 	inc	0 (iy)
   0606 20 03         [12]  186 	jr	NZ,00112$
   0608 FD 34 01      [23]  187 	inc	1 (iy)
   060B                     188 00112$:
                            189 ;src/main.c:290: screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x47FF);
   060B 2A AD 23      [16]  190 	ld	hl, (_screen_plot_address)
   060E 7C            [ 4]  191 	ld	a, h
   060F E6 47         [ 7]  192 	and	a, #0x47
   0611 67            [ 4]  193 	ld	h, a
   0612 22 AD 23      [16]  194 	ld	(_screen_plot_address), hl
                            195 ;src/main.c:295: s=(s+1)%32;
   0615 C1            [10]  196 	pop	bc
   0616 C5            [11]  197 	push	bc
   0617 03            [ 6]  198 	inc	bc
   0618 21 20 00      [10]  199 	ld	hl, #0x0020
   061B E5            [11]  200 	push	hl
   061C C5            [11]  201 	push	bc
   061D CD F2 22      [17]  202 	call	__modsint
   0620 F1            [10]  203 	pop	af
   0621 F1            [10]  204 	pop	af
   0622 33            [ 6]  205 	inc	sp
   0623 33            [ 6]  206 	inc	sp
   0624 E5            [11]  207 	push	hl
                            208 ;src/main.c:296: cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_00_W, G_TILE_SCHTROUMPF4X32_00_H);
   0625 ED 5B AD 23   [20]  209 	ld	de, (_screen_plot_address)
   0629 01 38 01      [10]  210 	ld	bc, #_g_tile_schtroumpf4x32_tileset+0
   062C E1            [10]  211 	pop	hl
   062D E5            [11]  212 	push	hl
   062E 29            [11]  213 	add	hl, hl
   062F 09            [11]  214 	add	hl, bc
   0630 4E            [ 7]  215 	ld	c, (hl)
   0631 23            [ 6]  216 	inc	hl
   0632 46            [ 7]  217 	ld	b, (hl)
   0633 21 02 08      [10]  218 	ld	hl, #0x0802
   0636 E5            [11]  219 	push	hl
   0637 D5            [11]  220 	push	de
   0638 C5            [11]  221 	push	bc
   0639 CD E7 21      [17]  222 	call	_cpct_drawSprite
   063C 18 8E         [12]  223 	jr	00102$
                            224 	.area _CODE
                            225 	.area _INITIALIZER
   23B4                     226 __xinit__screen_location:
   23B4 00 10               227 	.dw #0x1000
   23B6                     228 __xinit__screen_plot_address:
   23B6 4E 40               229 	.dw #0x404e
                            230 	.area _CABS (ABS)
