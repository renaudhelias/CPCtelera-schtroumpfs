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
   2505                      26 _i::
   2505                      27 	.ds 2
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
   0260                      56 _akp_musicInit::
                             57 ;src/audio.c:66: i=i+1;
   0260 FD 21 05 25   [14]   58 	ld	iy, #_i
   0264 FD 34 00      [23]   59 	inc	0 (iy)
   0267 20 03         [12]   60 	jr	NZ,00103$
   0269 FD 34 01      [23]   61 	inc	1 (iy)
   026C                      62 00103$:
                             63 ;src/audio.c:116: __endasm;
                             64 ;;	backup Z80 state
   026C F5            [11]   65 	push	af
   026D C5            [11]   66 	push	bc
   026E D5            [11]   67 	push	de
   026F E5            [11]   68 	push	hl
   0270 DD E5         [15]   69 	push	ix
   0272 FD E5         [15]   70 	push	iy
   0274 D9            [ 4]   71 	exx
   0275 08            [ 4]   72 	ex	af, af' ;; '
   0276 F5            [11]   73 	push	af
   0277 C5            [11]   74 	push	bc
   0278 D5            [11]   75 	push	de
   0279 E5            [11]   76 	push	hl
   027A 01 A4 02      [10]   77 	ld	bc,#_effets1 ;; OK
   027D ED 43 A0 02   [20]   78 	ld	(#_liste1),bc ;; OK
   0281 01 E5 02      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   0284 ED 43 A2 02   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   0288 01 00 70      [10]   82 	ld	bc,#0x7000
   028B 11 A0 02      [10]   83 	ld	de,#_liste1 ;;sfx
   028E CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   0291 E1            [10]   86 	pop	hl
   0292 D1            [10]   87 	pop	de
   0293 C1            [10]   88 	pop	bc
   0294 F1            [10]   89 	pop	af
   0295 08            [ 4]   90 	ex	af, af' ;; '
   0296 D9            [ 4]   91 	exx
   0297 FD E1         [14]   92 	pop	iy
   0299 DD E1         [14]   93 	pop	ix
   029B E1            [10]   94 	pop	hl
   029C D1            [10]   95 	pop	de
   029D C1            [10]   96 	pop	bc
   029E F1            [10]   97 	pop	af
   029F C9            [10]   98 	ret
   02A0                      99 _liste1:
   02A0 00 00               100 	.dw #0x0000
   02A2                     101 _liste2:
   02A2 00 00               102 	.dw #0x0000
   02A4                     103 _effets1:
   02A4 00                  104 	.db #0x00	; 0
   02A5 3D                  105 	.db #0x3d	; 61
   02A6 EF 00               106 	.dw #0x00ef
   02A8 39                  107 	.db #0x39	; 57	'9'
   02A9 EF 00               108 	.dw #0x00ef
   02AB 35                  109 	.db #0x35	; 53	'5'
   02AC EF 00               110 	.dw #0x00ef
   02AE 31                  111 	.db #0x31	; 49	'1'
   02AF EF 00               112 	.dw #0x00ef
   02B1 C7                  113 	.db #0xc7	; 199
   02B2 EF 00               114 	.dw #0x00ef
   02B4 29                  115 	.db #0x29	; 41
   02B5 EF 00               116 	.dw #0x00ef
   02B7 25                  117 	.db #0x25	; 37
   02B8 EF 00               118 	.dw #0x00ef
   02BA 21                  119 	.db #0x21	; 33
   02BB EF 00               120 	.dw #0x00ef
   02BD 1D                  121 	.db #0x1d	; 29
   02BE EF 00               122 	.dw #0x00ef
   02C0 19                  123 	.db #0x19	; 25
   02C1 EF 00               124 	.dw #0x00ef
   02C3 15                  125 	.db #0x15	; 21
   02C4 53 01               126 	.dw #0x0153
   02C6 11                  127 	.db #0x11	; 17
   02C7 EF 00               128 	.dw #0x00ef
   02C9 0D                  129 	.db #0x0d	; 13
   02CA EF 00               130 	.dw #0x00ef
   02CC 09                  131 	.db #0x09	; 9
   02CD EF 00               132 	.dw #0x00ef
   02CF 05                  133 	.db #0x05	; 5
   02D0 EF 00               134 	.dw #0x00ef
   02D2 04                  135 	.db #0x04	; 4
   02D3 00                  136 	.db #0x00	; 0
   02D4 BD                  137 	.db #0xbd	; 189
   02D5 01                  138 	.db #0x01	; 1
   02D6 5F 00               139 	.dw #0x005f
   02D8 BD                  140 	.db #0xbd	; 189
   02D9 01                  141 	.db #0x01	; 1
   02DA 63 00               142 	.dw #0x0063
   02DC B1                  143 	.db #0xb1	; 177
   02DD 01                  144 	.db #0x01	; 1
   02DE 66 00               145 	.dw #0x0066
   02E0 AD                  146 	.db #0xad	; 173
   02E1 01                  147 	.db #0x01	; 1
   02E2 6A 00               148 	.dw #0x006a
   02E4 04                  149 	.db #0x04	; 4
   02E5                     150 _effets2:
   02E5 00                  151 	.db #0x00	; 0
   02E6 BD                  152 	.db #0xbd	; 189
   02E7 01                  153 	.db #0x01	; 1
   02E8 2D 01               154 	.dw #0x012d
   02EA BD                  155 	.db #0xbd	; 189
   02EB 08                  156 	.db #0x08	; 8
   02EC 3F 01               157 	.dw #0x013f
   02EE B9                  158 	.db #0xb9	; 185
   02EF 02                  159 	.db #0x02	; 2
   02F0 92 01               160 	.dw #0x0192
   02F2 B5                  161 	.db #0xb5	; 181
   02F3 10                  162 	.db #0x10	; 16
   02F4 D5 00               163 	.dw #0x00d5
   02F6 B1                  164 	.db #0xb1	; 177
   02F7 02                  165 	.db #0x02	; 2
   02F8 E1 00               166 	.dw #0x00e1
   02FA AD                  167 	.db #0xad	; 173
   02FB 02                  168 	.db #0x02	; 2
   02FC EF 00               169 	.dw #0x00ef
   02FE A5                  170 	.db #0xa5	; 165
   02FF 10                  171 	.db #0x10	; 16
   0300 66 01               172 	.dw #0x0166
   0302 9D                  173 	.db #0x9d	; 157
   0303 1F                  174 	.db #0x1f	; 31
   0304 77 00               175 	.dw #0x0077
   0306 99                  176 	.db #0x99	; 153
   0307 07                  177 	.db #0x07	; 7
   0308 50 00               178 	.dw #0x0050
   030A 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:119: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   030B                     184 _akp_musicPlay::
                            185 ;src/audio.c:152: __endasm;
                            186 ;;	backup Z80 state
   030B F5            [11]  187 	push	af
   030C C5            [11]  188 	push	bc
   030D D5            [11]  189 	push	de
   030E E5            [11]  190 	push	hl
   030F DD E5         [15]  191 	push	ix
   0311 FD E5         [15]  192 	push	iy
   0313 D9            [ 4]  193 	exx
   0314 08            [ 4]  194 	ex	af, af' ;; '
   0315 F5            [11]  195 	push	af
   0316 C5            [11]  196 	push	bc
   0317 D5            [11]  197 	push	de
   0318 E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   0319 CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   031C E1            [10]  202 	pop	hl
   031D D1            [10]  203 	pop	de
   031E C1            [10]  204 	pop	bc
   031F F1            [10]  205 	pop	af
   0320 08            [ 4]  206 	ex	af, af' ;; '
   0321 D9            [ 4]  207 	exx
   0322 FD E1         [14]  208 	pop	iy
   0324 DD E1         [14]  209 	pop	ix
   0326 E1            [10]  210 	pop	hl
   0327 D1            [10]  211 	pop	de
   0328 C1            [10]  212 	pop	bc
   0329 F1            [10]  213 	pop	af
   032A C9            [10]  214 	ret
                            215 ;src/audio.c:155: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   032B                     219 _akp_sfxPlay::
                            220 ;src/audio.c:188: __endasm;
                            221 ;;	backup Z80 state
   032B F5            [11]  222 	push	af
   032C C5            [11]  223 	push	bc
   032D D5            [11]  224 	push	de
   032E E5            [11]  225 	push	hl
   032F DD E5         [15]  226 	push	ix
   0331 FD E5         [15]  227 	push	iy
   0333 D9            [ 4]  228 	exx
   0334 08            [ 4]  229 	ex	af, af' ;; '
   0335 F5            [11]  230 	push	af
   0336 C5            [11]  231 	push	bc
   0337 D5            [11]  232 	push	de
   0338 E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   0339 CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   033C E1            [10]  237 	pop	hl
   033D D1            [10]  238 	pop	de
   033E C1            [10]  239 	pop	bc
   033F F1            [10]  240 	pop	af
   0340 08            [ 4]  241 	ex	af, af' ;; '
   0341 D9            [ 4]  242 	exx
   0342 FD E1         [14]  243 	pop	iy
   0344 DD E1         [14]  244 	pop	ix
   0346 E1            [10]  245 	pop	hl
   0347 D1            [10]  246 	pop	de
   0348 C1            [10]  247 	pop	bc
   0349 F1            [10]  248 	pop	af
   034A C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
