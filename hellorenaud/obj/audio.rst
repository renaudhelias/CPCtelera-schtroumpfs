                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module audio
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _akp_sfxPlay
                             12 	.globl _akp_musicPlay
                             13 	.globl _akp_musicInit
                             14 	.globl _i
                             15 	.globl _effets2
                             16 	.globl _effets1
                             17 	.globl _liste2
                             18 	.globl _liste1
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   23A7                      26 _i::
   23A7                      27 	.ds 2
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/audio.c:65: void akp_musicInit()
                             53 ;	---------------------------------
                             54 ; Function akp_musicInit
                             55 ; ---------------------------------
   0473                      56 _akp_musicInit::
                             57 ;src/audio.c:67: i=i+1;
   0473 FD 21 A7 23   [14]   58 	ld	iy, #_i
   0477 FD 34 00      [23]   59 	inc	0 (iy)
   047A 20 03         [12]   60 	jr	NZ,00103$
   047C FD 34 01      [23]   61 	inc	1 (iy)
   047F                      62 00103$:
                             63 ;src/audio.c:117: __endasm;
                             64 ;;	backup Z80 state
   047F F5            [11]   65 	push	af
   0480 C5            [11]   66 	push	bc
   0481 D5            [11]   67 	push	de
   0482 E5            [11]   68 	push	hl
   0483 DD E5         [15]   69 	push	ix
   0485 FD E5         [15]   70 	push	iy
   0487 D9            [ 4]   71 	exx
   0488 08            [ 4]   72 	ex	af, af' ;; '
   0489 F5            [11]   73 	push	af
   048A C5            [11]   74 	push	bc
   048B D5            [11]   75 	push	de
   048C E5            [11]   76 	push	hl
   048D 01 B7 04      [10]   77 	ld	bc,#_effets1 ;; OK
   0490 ED 43 B3 04   [20]   78 	ld	(#_liste1),bc ;; OK
   0494 01 F8 04      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   0497 ED 43 B5 04   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   049B 01 00 70      [10]   82 	ld	bc,#0x7000
   049E 11 B3 04      [10]   83 	ld	de,#_liste1 ;;sfx
   04A1 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   04A4 E1            [10]   86 	pop	hl
   04A5 D1            [10]   87 	pop	de
   04A6 C1            [10]   88 	pop	bc
   04A7 F1            [10]   89 	pop	af
   04A8 08            [ 4]   90 	ex	af, af' ;; '
   04A9 D9            [ 4]   91 	exx
   04AA FD E1         [14]   92 	pop	iy
   04AC DD E1         [14]   93 	pop	ix
   04AE E1            [10]   94 	pop	hl
   04AF D1            [10]   95 	pop	de
   04B0 C1            [10]   96 	pop	bc
   04B1 F1            [10]   97 	pop	af
   04B2 C9            [10]   98 	ret
   04B3                      99 _liste1:
   04B3 00 00               100 	.dw #0x0000
   04B5                     101 _liste2:
   04B5 00 00               102 	.dw #0x0000
   04B7                     103 _effets1:
   04B7 00                  104 	.db #0x00	; 0
   04B8 3D                  105 	.db #0x3d	; 61
   04B9 EF 00               106 	.dw #0x00ef
   04BB 39                  107 	.db #0x39	; 57	'9'
   04BC EF 00               108 	.dw #0x00ef
   04BE 35                  109 	.db #0x35	; 53	'5'
   04BF EF 00               110 	.dw #0x00ef
   04C1 31                  111 	.db #0x31	; 49	'1'
   04C2 EF 00               112 	.dw #0x00ef
   04C4 C7                  113 	.db #0xc7	; 199
   04C5 EF 00               114 	.dw #0x00ef
   04C7 29                  115 	.db #0x29	; 41
   04C8 EF 00               116 	.dw #0x00ef
   04CA 25                  117 	.db #0x25	; 37
   04CB EF 00               118 	.dw #0x00ef
   04CD 21                  119 	.db #0x21	; 33
   04CE EF 00               120 	.dw #0x00ef
   04D0 1D                  121 	.db #0x1d	; 29
   04D1 EF 00               122 	.dw #0x00ef
   04D3 19                  123 	.db #0x19	; 25
   04D4 EF 00               124 	.dw #0x00ef
   04D6 15                  125 	.db #0x15	; 21
   04D7 53 01               126 	.dw #0x0153
   04D9 11                  127 	.db #0x11	; 17
   04DA EF 00               128 	.dw #0x00ef
   04DC 0D                  129 	.db #0x0d	; 13
   04DD EF 00               130 	.dw #0x00ef
   04DF 09                  131 	.db #0x09	; 9
   04E0 EF 00               132 	.dw #0x00ef
   04E2 05                  133 	.db #0x05	; 5
   04E3 EF 00               134 	.dw #0x00ef
   04E5 04                  135 	.db #0x04	; 4
   04E6 00                  136 	.db #0x00	; 0
   04E7 BD                  137 	.db #0xbd	; 189
   04E8 01                  138 	.db #0x01	; 1
   04E9 5F 00               139 	.dw #0x005f
   04EB BD                  140 	.db #0xbd	; 189
   04EC 01                  141 	.db #0x01	; 1
   04ED 63 00               142 	.dw #0x0063
   04EF B1                  143 	.db #0xb1	; 177
   04F0 01                  144 	.db #0x01	; 1
   04F1 66 00               145 	.dw #0x0066
   04F3 AD                  146 	.db #0xad	; 173
   04F4 01                  147 	.db #0x01	; 1
   04F5 6A 00               148 	.dw #0x006a
   04F7 04                  149 	.db #0x04	; 4
   04F8                     150 _effets2:
   04F8 00                  151 	.db #0x00	; 0
   04F9 BD                  152 	.db #0xbd	; 189
   04FA 01                  153 	.db #0x01	; 1
   04FB 2D 01               154 	.dw #0x012d
   04FD BD                  155 	.db #0xbd	; 189
   04FE 08                  156 	.db #0x08	; 8
   04FF 3F 01               157 	.dw #0x013f
   0501 B9                  158 	.db #0xb9	; 185
   0502 02                  159 	.db #0x02	; 2
   0503 92 01               160 	.dw #0x0192
   0505 B5                  161 	.db #0xb5	; 181
   0506 10                  162 	.db #0x10	; 16
   0507 D5 00               163 	.dw #0x00d5
   0509 B1                  164 	.db #0xb1	; 177
   050A 02                  165 	.db #0x02	; 2
   050B E1 00               166 	.dw #0x00e1
   050D AD                  167 	.db #0xad	; 173
   050E 02                  168 	.db #0x02	; 2
   050F EF 00               169 	.dw #0x00ef
   0511 A5                  170 	.db #0xa5	; 165
   0512 10                  171 	.db #0x10	; 16
   0513 66 01               172 	.dw #0x0166
   0515 9D                  173 	.db #0x9d	; 157
   0516 1F                  174 	.db #0x1f	; 31
   0517 77 00               175 	.dw #0x0077
   0519 99                  176 	.db #0x99	; 153
   051A 07                  177 	.db #0x07	; 7
   051B 50 00               178 	.dw #0x0050
   051D 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:120: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   051E                     184 _akp_musicPlay::
                            185 ;src/audio.c:153: __endasm;
                            186 ;;	backup Z80 state
   051E F5            [11]  187 	push	af
   051F C5            [11]  188 	push	bc
   0520 D5            [11]  189 	push	de
   0521 E5            [11]  190 	push	hl
   0522 DD E5         [15]  191 	push	ix
   0524 FD E5         [15]  192 	push	iy
   0526 D9            [ 4]  193 	exx
   0527 08            [ 4]  194 	ex	af, af' ;; '
   0528 F5            [11]  195 	push	af
   0529 C5            [11]  196 	push	bc
   052A D5            [11]  197 	push	de
   052B E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   052C CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   052F E1            [10]  202 	pop	hl
   0530 D1            [10]  203 	pop	de
   0531 C1            [10]  204 	pop	bc
   0532 F1            [10]  205 	pop	af
   0533 08            [ 4]  206 	ex	af, af' ;; '
   0534 D9            [ 4]  207 	exx
   0535 FD E1         [14]  208 	pop	iy
   0537 DD E1         [14]  209 	pop	ix
   0539 E1            [10]  210 	pop	hl
   053A D1            [10]  211 	pop	de
   053B C1            [10]  212 	pop	bc
   053C F1            [10]  213 	pop	af
   053D C9            [10]  214 	ret
                            215 ;src/audio.c:156: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   053E                     219 _akp_sfxPlay::
                            220 ;src/audio.c:189: __endasm;
                            221 ;;	backup Z80 state
   053E F5            [11]  222 	push	af
   053F C5            [11]  223 	push	bc
   0540 D5            [11]  224 	push	de
   0541 E5            [11]  225 	push	hl
   0542 DD E5         [15]  226 	push	ix
   0544 FD E5         [15]  227 	push	iy
   0546 D9            [ 4]  228 	exx
   0547 08            [ 4]  229 	ex	af, af' ;; '
   0548 F5            [11]  230 	push	af
   0549 C5            [11]  231 	push	bc
   054A D5            [11]  232 	push	de
   054B E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   054C CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   054F E1            [10]  237 	pop	hl
   0550 D1            [10]  238 	pop	de
   0551 C1            [10]  239 	pop	bc
   0552 F1            [10]  240 	pop	af
   0553 08            [ 4]  241 	ex	af, af' ;; '
   0554 D9            [ 4]  242 	exx
   0555 FD E1         [14]  243 	pop	iy
   0557 DD E1         [14]  244 	pop	ix
   0559 E1            [10]  245 	pop	hl
   055A D1            [10]  246 	pop	de
   055B C1            [10]  247 	pop	bc
   055C F1            [10]  248 	pop	af
   055D C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
