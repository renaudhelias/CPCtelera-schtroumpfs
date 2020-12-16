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
   2513                      26 _i::
   2513                      27 	.ds 2
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
   024B                      56 _akp_musicInit::
                             57 ;src/audio.c:66: i=i+1;
   024B FD 21 13 25   [14]   58 	ld	iy, #_i
   024F FD 34 00      [23]   59 	inc	0 (iy)
   0252 20 03         [12]   60 	jr	NZ,00103$
   0254 FD 34 01      [23]   61 	inc	1 (iy)
   0257                      62 00103$:
                             63 ;src/audio.c:116: __endasm;
                             64 ;;	backup Z80 state
   0257 F5            [11]   65 	push	af
   0258 C5            [11]   66 	push	bc
   0259 D5            [11]   67 	push	de
   025A E5            [11]   68 	push	hl
   025B DD E5         [15]   69 	push	ix
   025D FD E5         [15]   70 	push	iy
   025F D9            [ 4]   71 	exx
   0260 08            [ 4]   72 	ex	af, af' ;; '
   0261 F5            [11]   73 	push	af
   0262 C5            [11]   74 	push	bc
   0263 D5            [11]   75 	push	de
   0264 E5            [11]   76 	push	hl
   0265 01 8F 02      [10]   77 	ld	bc,#_effets1 ;; OK
   0268 ED 43 8B 02   [20]   78 	ld	(#_liste1),bc ;; OK
   026C 01 D0 02      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   026F ED 43 8D 02   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   0273 01 00 70      [10]   82 	ld	bc,#0x7000
   0276 11 8B 02      [10]   83 	ld	de,#_liste1 ;;sfx
   0279 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   027C E1            [10]   86 	pop	hl
   027D D1            [10]   87 	pop	de
   027E C1            [10]   88 	pop	bc
   027F F1            [10]   89 	pop	af
   0280 08            [ 4]   90 	ex	af, af' ;; '
   0281 D9            [ 4]   91 	exx
   0282 FD E1         [14]   92 	pop	iy
   0284 DD E1         [14]   93 	pop	ix
   0286 E1            [10]   94 	pop	hl
   0287 D1            [10]   95 	pop	de
   0288 C1            [10]   96 	pop	bc
   0289 F1            [10]   97 	pop	af
   028A C9            [10]   98 	ret
   028B                      99 _liste1:
   028B 00 00               100 	.dw #0x0000
   028D                     101 _liste2:
   028D 00 00               102 	.dw #0x0000
   028F                     103 _effets1:
   028F 00                  104 	.db #0x00	; 0
   0290 3D                  105 	.db #0x3d	; 61
   0291 EF 00               106 	.dw #0x00ef
   0293 39                  107 	.db #0x39	; 57	'9'
   0294 EF 00               108 	.dw #0x00ef
   0296 35                  109 	.db #0x35	; 53	'5'
   0297 EF 00               110 	.dw #0x00ef
   0299 31                  111 	.db #0x31	; 49	'1'
   029A EF 00               112 	.dw #0x00ef
   029C C7                  113 	.db #0xc7	; 199
   029D EF 00               114 	.dw #0x00ef
   029F 29                  115 	.db #0x29	; 41
   02A0 EF 00               116 	.dw #0x00ef
   02A2 25                  117 	.db #0x25	; 37
   02A3 EF 00               118 	.dw #0x00ef
   02A5 21                  119 	.db #0x21	; 33
   02A6 EF 00               120 	.dw #0x00ef
   02A8 1D                  121 	.db #0x1d	; 29
   02A9 EF 00               122 	.dw #0x00ef
   02AB 19                  123 	.db #0x19	; 25
   02AC EF 00               124 	.dw #0x00ef
   02AE 15                  125 	.db #0x15	; 21
   02AF 53 01               126 	.dw #0x0153
   02B1 11                  127 	.db #0x11	; 17
   02B2 EF 00               128 	.dw #0x00ef
   02B4 0D                  129 	.db #0x0d	; 13
   02B5 EF 00               130 	.dw #0x00ef
   02B7 09                  131 	.db #0x09	; 9
   02B8 EF 00               132 	.dw #0x00ef
   02BA 05                  133 	.db #0x05	; 5
   02BB EF 00               134 	.dw #0x00ef
   02BD 04                  135 	.db #0x04	; 4
   02BE 00                  136 	.db #0x00	; 0
   02BF BD                  137 	.db #0xbd	; 189
   02C0 01                  138 	.db #0x01	; 1
   02C1 5F 00               139 	.dw #0x005f
   02C3 BD                  140 	.db #0xbd	; 189
   02C4 01                  141 	.db #0x01	; 1
   02C5 63 00               142 	.dw #0x0063
   02C7 B1                  143 	.db #0xb1	; 177
   02C8 01                  144 	.db #0x01	; 1
   02C9 66 00               145 	.dw #0x0066
   02CB AD                  146 	.db #0xad	; 173
   02CC 01                  147 	.db #0x01	; 1
   02CD 6A 00               148 	.dw #0x006a
   02CF 04                  149 	.db #0x04	; 4
   02D0                     150 _effets2:
   02D0 00                  151 	.db #0x00	; 0
   02D1 BD                  152 	.db #0xbd	; 189
   02D2 01                  153 	.db #0x01	; 1
   02D3 2D 01               154 	.dw #0x012d
   02D5 BD                  155 	.db #0xbd	; 189
   02D6 08                  156 	.db #0x08	; 8
   02D7 3F 01               157 	.dw #0x013f
   02D9 B9                  158 	.db #0xb9	; 185
   02DA 02                  159 	.db #0x02	; 2
   02DB 92 01               160 	.dw #0x0192
   02DD B5                  161 	.db #0xb5	; 181
   02DE 10                  162 	.db #0x10	; 16
   02DF D5 00               163 	.dw #0x00d5
   02E1 B1                  164 	.db #0xb1	; 177
   02E2 02                  165 	.db #0x02	; 2
   02E3 E1 00               166 	.dw #0x00e1
   02E5 AD                  167 	.db #0xad	; 173
   02E6 02                  168 	.db #0x02	; 2
   02E7 EF 00               169 	.dw #0x00ef
   02E9 A5                  170 	.db #0xa5	; 165
   02EA 10                  171 	.db #0x10	; 16
   02EB 66 01               172 	.dw #0x0166
   02ED 9D                  173 	.db #0x9d	; 157
   02EE 1F                  174 	.db #0x1f	; 31
   02EF 77 00               175 	.dw #0x0077
   02F1 99                  176 	.db #0x99	; 153
   02F2 07                  177 	.db #0x07	; 7
   02F3 50 00               178 	.dw #0x0050
   02F5 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:119: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   02F6                     184 _akp_musicPlay::
                            185 ;src/audio.c:152: __endasm;
                            186 ;;	backup Z80 state
   02F6 F5            [11]  187 	push	af
   02F7 C5            [11]  188 	push	bc
   02F8 D5            [11]  189 	push	de
   02F9 E5            [11]  190 	push	hl
   02FA DD E5         [15]  191 	push	ix
   02FC FD E5         [15]  192 	push	iy
   02FE D9            [ 4]  193 	exx
   02FF 08            [ 4]  194 	ex	af, af' ;; '
   0300 F5            [11]  195 	push	af
   0301 C5            [11]  196 	push	bc
   0302 D5            [11]  197 	push	de
   0303 E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   0304 CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   0307 E1            [10]  202 	pop	hl
   0308 D1            [10]  203 	pop	de
   0309 C1            [10]  204 	pop	bc
   030A F1            [10]  205 	pop	af
   030B 08            [ 4]  206 	ex	af, af' ;; '
   030C D9            [ 4]  207 	exx
   030D FD E1         [14]  208 	pop	iy
   030F DD E1         [14]  209 	pop	ix
   0311 E1            [10]  210 	pop	hl
   0312 D1            [10]  211 	pop	de
   0313 C1            [10]  212 	pop	bc
   0314 F1            [10]  213 	pop	af
   0315 C9            [10]  214 	ret
                            215 ;src/audio.c:155: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   0316                     219 _akp_sfxPlay::
                            220 ;src/audio.c:188: __endasm;
                            221 ;;	backup Z80 state
   0316 F5            [11]  222 	push	af
   0317 C5            [11]  223 	push	bc
   0318 D5            [11]  224 	push	de
   0319 E5            [11]  225 	push	hl
   031A DD E5         [15]  226 	push	ix
   031C FD E5         [15]  227 	push	iy
   031E D9            [ 4]  228 	exx
   031F 08            [ 4]  229 	ex	af, af' ;; '
   0320 F5            [11]  230 	push	af
   0321 C5            [11]  231 	push	bc
   0322 D5            [11]  232 	push	de
   0323 E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   0324 CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   0327 E1            [10]  237 	pop	hl
   0328 D1            [10]  238 	pop	de
   0329 C1            [10]  239 	pop	bc
   032A F1            [10]  240 	pop	af
   032B 08            [ 4]  241 	ex	af, af' ;; '
   032C D9            [ 4]  242 	exx
   032D FD E1         [14]  243 	pop	iy
   032F DD E1         [14]  244 	pop	ix
   0331 E1            [10]  245 	pop	hl
   0332 D1            [10]  246 	pop	de
   0333 C1            [10]  247 	pop	bc
   0334 F1            [10]  248 	pop	af
   0335 C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
