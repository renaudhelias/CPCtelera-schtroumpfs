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
   25C4                      26 _i::
   25C4                      27 	.ds 2
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
                             52 ;src/audio.c:64: void akp_musicInit()
                             53 ;	---------------------------------
                             54 ; Function akp_musicInit
                             55 ; ---------------------------------
   0288                      56 _akp_musicInit::
                             57 ;src/audio.c:66: i=i+1;
   0288 FD 21 C4 25   [14]   58 	ld	iy, #_i
   028C FD 34 00      [23]   59 	inc	0 (iy)
   028F 20 03         [12]   60 	jr	NZ,00103$
   0291 FD 34 01      [23]   61 	inc	1 (iy)
   0294                      62 00103$:
                             63 ;src/audio.c:116: __endasm;
                             64 ;;	backup Z80 state
   0294 F5            [11]   65 	push	af
   0295 C5            [11]   66 	push	bc
   0296 D5            [11]   67 	push	de
   0297 E5            [11]   68 	push	hl
   0298 DD E5         [15]   69 	push	ix
   029A FD E5         [15]   70 	push	iy
   029C D9            [ 4]   71 	exx
   029D 08            [ 4]   72 	ex	af, af' ;; '
   029E F5            [11]   73 	push	af
   029F C5            [11]   74 	push	bc
   02A0 D5            [11]   75 	push	de
   02A1 E5            [11]   76 	push	hl
   02A2 01 CC 02      [10]   77 	ld	bc,#_effets1 ;; OK
   02A5 ED 43 C8 02   [20]   78 	ld	(#_liste1),bc ;; OK
   02A9 01 0D 03      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   02AC ED 43 CA 02   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   02B0 01 00 70      [10]   82 	ld	bc,#0x7000
   02B3 11 C8 02      [10]   83 	ld	de,#_liste1 ;;sfx
   02B6 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   02B9 E1            [10]   86 	pop	hl
   02BA D1            [10]   87 	pop	de
   02BB C1            [10]   88 	pop	bc
   02BC F1            [10]   89 	pop	af
   02BD 08            [ 4]   90 	ex	af, af' ;; '
   02BE D9            [ 4]   91 	exx
   02BF FD E1         [14]   92 	pop	iy
   02C1 DD E1         [14]   93 	pop	ix
   02C3 E1            [10]   94 	pop	hl
   02C4 D1            [10]   95 	pop	de
   02C5 C1            [10]   96 	pop	bc
   02C6 F1            [10]   97 	pop	af
   02C7 C9            [10]   98 	ret
   02C8                      99 _liste1:
   02C8 00 00               100 	.dw #0x0000
   02CA                     101 _liste2:
   02CA 00 00               102 	.dw #0x0000
   02CC                     103 _effets1:
   02CC 00                  104 	.db #0x00	; 0
   02CD 3D                  105 	.db #0x3d	; 61
   02CE EF 00               106 	.dw #0x00ef
   02D0 39                  107 	.db #0x39	; 57	'9'
   02D1 EF 00               108 	.dw #0x00ef
   02D3 35                  109 	.db #0x35	; 53	'5'
   02D4 EF 00               110 	.dw #0x00ef
   02D6 31                  111 	.db #0x31	; 49	'1'
   02D7 EF 00               112 	.dw #0x00ef
   02D9 C7                  113 	.db #0xc7	; 199
   02DA EF 00               114 	.dw #0x00ef
   02DC 29                  115 	.db #0x29	; 41
   02DD EF 00               116 	.dw #0x00ef
   02DF 25                  117 	.db #0x25	; 37
   02E0 EF 00               118 	.dw #0x00ef
   02E2 21                  119 	.db #0x21	; 33
   02E3 EF 00               120 	.dw #0x00ef
   02E5 1D                  121 	.db #0x1d	; 29
   02E6 EF 00               122 	.dw #0x00ef
   02E8 19                  123 	.db #0x19	; 25
   02E9 EF 00               124 	.dw #0x00ef
   02EB 15                  125 	.db #0x15	; 21
   02EC 53 01               126 	.dw #0x0153
   02EE 11                  127 	.db #0x11	; 17
   02EF EF 00               128 	.dw #0x00ef
   02F1 0D                  129 	.db #0x0d	; 13
   02F2 EF 00               130 	.dw #0x00ef
   02F4 09                  131 	.db #0x09	; 9
   02F5 EF 00               132 	.dw #0x00ef
   02F7 05                  133 	.db #0x05	; 5
   02F8 EF 00               134 	.dw #0x00ef
   02FA 04                  135 	.db #0x04	; 4
   02FB 00                  136 	.db #0x00	; 0
   02FC BD                  137 	.db #0xbd	; 189
   02FD 01                  138 	.db #0x01	; 1
   02FE 5F 00               139 	.dw #0x005f
   0300 BD                  140 	.db #0xbd	; 189
   0301 01                  141 	.db #0x01	; 1
   0302 63 00               142 	.dw #0x0063
   0304 B1                  143 	.db #0xb1	; 177
   0305 01                  144 	.db #0x01	; 1
   0306 66 00               145 	.dw #0x0066
   0308 AD                  146 	.db #0xad	; 173
   0309 01                  147 	.db #0x01	; 1
   030A 6A 00               148 	.dw #0x006a
   030C 04                  149 	.db #0x04	; 4
   030D                     150 _effets2:
   030D 00                  151 	.db #0x00	; 0
   030E BD                  152 	.db #0xbd	; 189
   030F 01                  153 	.db #0x01	; 1
   0310 2D 01               154 	.dw #0x012d
   0312 BD                  155 	.db #0xbd	; 189
   0313 08                  156 	.db #0x08	; 8
   0314 3F 01               157 	.dw #0x013f
   0316 B9                  158 	.db #0xb9	; 185
   0317 02                  159 	.db #0x02	; 2
   0318 92 01               160 	.dw #0x0192
   031A B5                  161 	.db #0xb5	; 181
   031B 10                  162 	.db #0x10	; 16
   031C D5 00               163 	.dw #0x00d5
   031E B1                  164 	.db #0xb1	; 177
   031F 02                  165 	.db #0x02	; 2
   0320 E1 00               166 	.dw #0x00e1
   0322 AD                  167 	.db #0xad	; 173
   0323 02                  168 	.db #0x02	; 2
   0324 EF 00               169 	.dw #0x00ef
   0326 A5                  170 	.db #0xa5	; 165
   0327 10                  171 	.db #0x10	; 16
   0328 66 01               172 	.dw #0x0166
   032A 9D                  173 	.db #0x9d	; 157
   032B 1F                  174 	.db #0x1f	; 31
   032C 77 00               175 	.dw #0x0077
   032E 99                  176 	.db #0x99	; 153
   032F 07                  177 	.db #0x07	; 7
   0330 50 00               178 	.dw #0x0050
   0332 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:119: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   0333                     184 _akp_musicPlay::
                            185 ;src/audio.c:152: __endasm;
                            186 ;;	backup Z80 state
   0333 F5            [11]  187 	push	af
   0334 C5            [11]  188 	push	bc
   0335 D5            [11]  189 	push	de
   0336 E5            [11]  190 	push	hl
   0337 DD E5         [15]  191 	push	ix
   0339 FD E5         [15]  192 	push	iy
   033B D9            [ 4]  193 	exx
   033C 08            [ 4]  194 	ex	af, af' ;; '
   033D F5            [11]  195 	push	af
   033E C5            [11]  196 	push	bc
   033F D5            [11]  197 	push	de
   0340 E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   0341 CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   0344 E1            [10]  202 	pop	hl
   0345 D1            [10]  203 	pop	de
   0346 C1            [10]  204 	pop	bc
   0347 F1            [10]  205 	pop	af
   0348 08            [ 4]  206 	ex	af, af' ;; '
   0349 D9            [ 4]  207 	exx
   034A FD E1         [14]  208 	pop	iy
   034C DD E1         [14]  209 	pop	ix
   034E E1            [10]  210 	pop	hl
   034F D1            [10]  211 	pop	de
   0350 C1            [10]  212 	pop	bc
   0351 F1            [10]  213 	pop	af
   0352 C9            [10]  214 	ret
                            215 ;src/audio.c:155: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   0353                     219 _akp_sfxPlay::
                            220 ;src/audio.c:188: __endasm;
                            221 ;;	backup Z80 state
   0353 F5            [11]  222 	push	af
   0354 C5            [11]  223 	push	bc
   0355 D5            [11]  224 	push	de
   0356 E5            [11]  225 	push	hl
   0357 DD E5         [15]  226 	push	ix
   0359 FD E5         [15]  227 	push	iy
   035B D9            [ 4]  228 	exx
   035C 08            [ 4]  229 	ex	af, af' ;; '
   035D F5            [11]  230 	push	af
   035E C5            [11]  231 	push	bc
   035F D5            [11]  232 	push	de
   0360 E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   0361 CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   0364 E1            [10]  237 	pop	hl
   0365 D1            [10]  238 	pop	de
   0366 C1            [10]  239 	pop	bc
   0367 F1            [10]  240 	pop	af
   0368 08            [ 4]  241 	ex	af, af' ;; '
   0369 D9            [ 4]  242 	exx
   036A FD E1         [14]  243 	pop	iy
   036C DD E1         [14]  244 	pop	ix
   036E E1            [10]  245 	pop	hl
   036F D1            [10]  246 	pop	de
   0370 C1            [10]  247 	pop	bc
   0371 F1            [10]  248 	pop	af
   0372 C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
