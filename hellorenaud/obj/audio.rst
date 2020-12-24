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
   23C0                      26 _i::
   23C0                      27 	.ds 2
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
   0443                      56 _akp_musicInit::
                             57 ;src/audio.c:67: i=i+1;
   0443 FD 21 C0 23   [14]   58 	ld	iy, #_i
   0447 FD 34 00      [23]   59 	inc	0 (iy)
   044A 20 03         [12]   60 	jr	NZ,00103$
   044C FD 34 01      [23]   61 	inc	1 (iy)
   044F                      62 00103$:
                             63 ;src/audio.c:117: __endasm;
                             64 ;;	backup Z80 state
   044F F5            [11]   65 	push	af
   0450 C5            [11]   66 	push	bc
   0451 D5            [11]   67 	push	de
   0452 E5            [11]   68 	push	hl
   0453 DD E5         [15]   69 	push	ix
   0455 FD E5         [15]   70 	push	iy
   0457 D9            [ 4]   71 	exx
   0458 08            [ 4]   72 	ex	af, af' ;; '
   0459 F5            [11]   73 	push	af
   045A C5            [11]   74 	push	bc
   045B D5            [11]   75 	push	de
   045C E5            [11]   76 	push	hl
   045D 01 87 04      [10]   77 	ld	bc,#_effets1 ;; OK
   0460 ED 43 83 04   [20]   78 	ld	(#_liste1),bc ;; OK
   0464 01 C8 04      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   0467 ED 43 85 04   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   046B 01 00 70      [10]   82 	ld	bc,#0x7000
   046E 11 83 04      [10]   83 	ld	de,#_liste1 ;;sfx
   0471 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   0474 E1            [10]   86 	pop	hl
   0475 D1            [10]   87 	pop	de
   0476 C1            [10]   88 	pop	bc
   0477 F1            [10]   89 	pop	af
   0478 08            [ 4]   90 	ex	af, af' ;; '
   0479 D9            [ 4]   91 	exx
   047A FD E1         [14]   92 	pop	iy
   047C DD E1         [14]   93 	pop	ix
   047E E1            [10]   94 	pop	hl
   047F D1            [10]   95 	pop	de
   0480 C1            [10]   96 	pop	bc
   0481 F1            [10]   97 	pop	af
   0482 C9            [10]   98 	ret
   0483                      99 _liste1:
   0483 00 00               100 	.dw #0x0000
   0485                     101 _liste2:
   0485 00 00               102 	.dw #0x0000
   0487                     103 _effets1:
   0487 00                  104 	.db #0x00	; 0
   0488 3D                  105 	.db #0x3d	; 61
   0489 EF 00               106 	.dw #0x00ef
   048B 39                  107 	.db #0x39	; 57	'9'
   048C EF 00               108 	.dw #0x00ef
   048E 35                  109 	.db #0x35	; 53	'5'
   048F EF 00               110 	.dw #0x00ef
   0491 31                  111 	.db #0x31	; 49	'1'
   0492 EF 00               112 	.dw #0x00ef
   0494 C7                  113 	.db #0xc7	; 199
   0495 EF 00               114 	.dw #0x00ef
   0497 29                  115 	.db #0x29	; 41
   0498 EF 00               116 	.dw #0x00ef
   049A 25                  117 	.db #0x25	; 37
   049B EF 00               118 	.dw #0x00ef
   049D 21                  119 	.db #0x21	; 33
   049E EF 00               120 	.dw #0x00ef
   04A0 1D                  121 	.db #0x1d	; 29
   04A1 EF 00               122 	.dw #0x00ef
   04A3 19                  123 	.db #0x19	; 25
   04A4 EF 00               124 	.dw #0x00ef
   04A6 15                  125 	.db #0x15	; 21
   04A7 53 01               126 	.dw #0x0153
   04A9 11                  127 	.db #0x11	; 17
   04AA EF 00               128 	.dw #0x00ef
   04AC 0D                  129 	.db #0x0d	; 13
   04AD EF 00               130 	.dw #0x00ef
   04AF 09                  131 	.db #0x09	; 9
   04B0 EF 00               132 	.dw #0x00ef
   04B2 05                  133 	.db #0x05	; 5
   04B3 EF 00               134 	.dw #0x00ef
   04B5 04                  135 	.db #0x04	; 4
   04B6 00                  136 	.db #0x00	; 0
   04B7 BD                  137 	.db #0xbd	; 189
   04B8 01                  138 	.db #0x01	; 1
   04B9 5F 00               139 	.dw #0x005f
   04BB BD                  140 	.db #0xbd	; 189
   04BC 01                  141 	.db #0x01	; 1
   04BD 63 00               142 	.dw #0x0063
   04BF B1                  143 	.db #0xb1	; 177
   04C0 01                  144 	.db #0x01	; 1
   04C1 66 00               145 	.dw #0x0066
   04C3 AD                  146 	.db #0xad	; 173
   04C4 01                  147 	.db #0x01	; 1
   04C5 6A 00               148 	.dw #0x006a
   04C7 04                  149 	.db #0x04	; 4
   04C8                     150 _effets2:
   04C8 00                  151 	.db #0x00	; 0
   04C9 BD                  152 	.db #0xbd	; 189
   04CA 01                  153 	.db #0x01	; 1
   04CB 2D 01               154 	.dw #0x012d
   04CD BD                  155 	.db #0xbd	; 189
   04CE 08                  156 	.db #0x08	; 8
   04CF 3F 01               157 	.dw #0x013f
   04D1 B9                  158 	.db #0xb9	; 185
   04D2 02                  159 	.db #0x02	; 2
   04D3 92 01               160 	.dw #0x0192
   04D5 B5                  161 	.db #0xb5	; 181
   04D6 10                  162 	.db #0x10	; 16
   04D7 D5 00               163 	.dw #0x00d5
   04D9 B1                  164 	.db #0xb1	; 177
   04DA 02                  165 	.db #0x02	; 2
   04DB E1 00               166 	.dw #0x00e1
   04DD AD                  167 	.db #0xad	; 173
   04DE 02                  168 	.db #0x02	; 2
   04DF EF 00               169 	.dw #0x00ef
   04E1 A5                  170 	.db #0xa5	; 165
   04E2 10                  171 	.db #0x10	; 16
   04E3 66 01               172 	.dw #0x0166
   04E5 9D                  173 	.db #0x9d	; 157
   04E6 1F                  174 	.db #0x1f	; 31
   04E7 77 00               175 	.dw #0x0077
   04E9 99                  176 	.db #0x99	; 153
   04EA 07                  177 	.db #0x07	; 7
   04EB 50 00               178 	.dw #0x0050
   04ED 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:120: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   04EE                     184 _akp_musicPlay::
                            185 ;src/audio.c:153: __endasm;
                            186 ;;	backup Z80 state
   04EE F5            [11]  187 	push	af
   04EF C5            [11]  188 	push	bc
   04F0 D5            [11]  189 	push	de
   04F1 E5            [11]  190 	push	hl
   04F2 DD E5         [15]  191 	push	ix
   04F4 FD E5         [15]  192 	push	iy
   04F6 D9            [ 4]  193 	exx
   04F7 08            [ 4]  194 	ex	af, af' ;; '
   04F8 F5            [11]  195 	push	af
   04F9 C5            [11]  196 	push	bc
   04FA D5            [11]  197 	push	de
   04FB E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   04FC CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   04FF E1            [10]  202 	pop	hl
   0500 D1            [10]  203 	pop	de
   0501 C1            [10]  204 	pop	bc
   0502 F1            [10]  205 	pop	af
   0503 08            [ 4]  206 	ex	af, af' ;; '
   0504 D9            [ 4]  207 	exx
   0505 FD E1         [14]  208 	pop	iy
   0507 DD E1         [14]  209 	pop	ix
   0509 E1            [10]  210 	pop	hl
   050A D1            [10]  211 	pop	de
   050B C1            [10]  212 	pop	bc
   050C F1            [10]  213 	pop	af
   050D C9            [10]  214 	ret
                            215 ;src/audio.c:156: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   050E                     219 _akp_sfxPlay::
                            220 ;src/audio.c:189: __endasm;
                            221 ;;	backup Z80 state
   050E F5            [11]  222 	push	af
   050F C5            [11]  223 	push	bc
   0510 D5            [11]  224 	push	de
   0511 E5            [11]  225 	push	hl
   0512 DD E5         [15]  226 	push	ix
   0514 FD E5         [15]  227 	push	iy
   0516 D9            [ 4]  228 	exx
   0517 08            [ 4]  229 	ex	af, af' ;; '
   0518 F5            [11]  230 	push	af
   0519 C5            [11]  231 	push	bc
   051A D5            [11]  232 	push	de
   051B E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   051C CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   051F E1            [10]  237 	pop	hl
   0520 D1            [10]  238 	pop	de
   0521 C1            [10]  239 	pop	bc
   0522 F1            [10]  240 	pop	af
   0523 08            [ 4]  241 	ex	af, af' ;; '
   0524 D9            [ 4]  242 	exx
   0525 FD E1         [14]  243 	pop	iy
   0527 DD E1         [14]  244 	pop	ix
   0529 E1            [10]  245 	pop	hl
   052A D1            [10]  246 	pop	de
   052B C1            [10]  247 	pop	bc
   052C F1            [10]  248 	pop	af
   052D C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
