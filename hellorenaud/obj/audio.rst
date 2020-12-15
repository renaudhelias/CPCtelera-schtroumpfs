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
   246A                      26 _i::
   246A                      27 	.ds 2
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
   01F8                      56 _akp_musicInit::
                             57 ;src/audio.c:66: i=i+1;
   01F8 FD 21 6A 24   [14]   58 	ld	iy, #_i
   01FC FD 34 00      [23]   59 	inc	0 (iy)
   01FF 20 03         [12]   60 	jr	NZ,00103$
   0201 FD 34 01      [23]   61 	inc	1 (iy)
   0204                      62 00103$:
                             63 ;src/audio.c:116: __endasm;
                             64 ;;	backup Z80 state
   0204 F5            [11]   65 	push	af
   0205 C5            [11]   66 	push	bc
   0206 D5            [11]   67 	push	de
   0207 E5            [11]   68 	push	hl
   0208 DD E5         [15]   69 	push	ix
   020A FD E5         [15]   70 	push	iy
   020C D9            [ 4]   71 	exx
   020D 08            [ 4]   72 	ex	af, af' ;; '
   020E F5            [11]   73 	push	af
   020F C5            [11]   74 	push	bc
   0210 D5            [11]   75 	push	de
   0211 E5            [11]   76 	push	hl
   0212 01 3C 02      [10]   77 	ld	bc,#_effets1 ;; OK
   0215 ED 43 38 02   [20]   78 	ld	(#_liste1),bc ;; OK
   0219 01 7D 02      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   021C ED 43 3A 02   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   0220 01 00 70      [10]   82 	ld	bc,#0x7000
   0223 11 38 02      [10]   83 	ld	de,#_liste1 ;;sfx
   0226 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   0229 E1            [10]   86 	pop	hl
   022A D1            [10]   87 	pop	de
   022B C1            [10]   88 	pop	bc
   022C F1            [10]   89 	pop	af
   022D 08            [ 4]   90 	ex	af, af' ;; '
   022E D9            [ 4]   91 	exx
   022F FD E1         [14]   92 	pop	iy
   0231 DD E1         [14]   93 	pop	ix
   0233 E1            [10]   94 	pop	hl
   0234 D1            [10]   95 	pop	de
   0235 C1            [10]   96 	pop	bc
   0236 F1            [10]   97 	pop	af
   0237 C9            [10]   98 	ret
   0238                      99 _liste1:
   0238 00 00               100 	.dw #0x0000
   023A                     101 _liste2:
   023A 00 00               102 	.dw #0x0000
   023C                     103 _effets1:
   023C 00                  104 	.db #0x00	; 0
   023D 3D                  105 	.db #0x3d	; 61
   023E EF 00               106 	.dw #0x00ef
   0240 39                  107 	.db #0x39	; 57	'9'
   0241 EF 00               108 	.dw #0x00ef
   0243 35                  109 	.db #0x35	; 53	'5'
   0244 EF 00               110 	.dw #0x00ef
   0246 31                  111 	.db #0x31	; 49	'1'
   0247 EF 00               112 	.dw #0x00ef
   0249 C7                  113 	.db #0xc7	; 199
   024A EF 00               114 	.dw #0x00ef
   024C 29                  115 	.db #0x29	; 41
   024D EF 00               116 	.dw #0x00ef
   024F 25                  117 	.db #0x25	; 37
   0250 EF 00               118 	.dw #0x00ef
   0252 21                  119 	.db #0x21	; 33
   0253 EF 00               120 	.dw #0x00ef
   0255 1D                  121 	.db #0x1d	; 29
   0256 EF 00               122 	.dw #0x00ef
   0258 19                  123 	.db #0x19	; 25
   0259 EF 00               124 	.dw #0x00ef
   025B 15                  125 	.db #0x15	; 21
   025C 53 01               126 	.dw #0x0153
   025E 11                  127 	.db #0x11	; 17
   025F EF 00               128 	.dw #0x00ef
   0261 0D                  129 	.db #0x0d	; 13
   0262 EF 00               130 	.dw #0x00ef
   0264 09                  131 	.db #0x09	; 9
   0265 EF 00               132 	.dw #0x00ef
   0267 05                  133 	.db #0x05	; 5
   0268 EF 00               134 	.dw #0x00ef
   026A 04                  135 	.db #0x04	; 4
   026B 00                  136 	.db #0x00	; 0
   026C BD                  137 	.db #0xbd	; 189
   026D 01                  138 	.db #0x01	; 1
   026E 5F 00               139 	.dw #0x005f
   0270 BD                  140 	.db #0xbd	; 189
   0271 01                  141 	.db #0x01	; 1
   0272 63 00               142 	.dw #0x0063
   0274 B1                  143 	.db #0xb1	; 177
   0275 01                  144 	.db #0x01	; 1
   0276 66 00               145 	.dw #0x0066
   0278 AD                  146 	.db #0xad	; 173
   0279 01                  147 	.db #0x01	; 1
   027A 6A 00               148 	.dw #0x006a
   027C 04                  149 	.db #0x04	; 4
   027D                     150 _effets2:
   027D 00                  151 	.db #0x00	; 0
   027E BD                  152 	.db #0xbd	; 189
   027F 01                  153 	.db #0x01	; 1
   0280 2D 01               154 	.dw #0x012d
   0282 BD                  155 	.db #0xbd	; 189
   0283 08                  156 	.db #0x08	; 8
   0284 3F 01               157 	.dw #0x013f
   0286 B9                  158 	.db #0xb9	; 185
   0287 02                  159 	.db #0x02	; 2
   0288 92 01               160 	.dw #0x0192
   028A B5                  161 	.db #0xb5	; 181
   028B 10                  162 	.db #0x10	; 16
   028C D5 00               163 	.dw #0x00d5
   028E B1                  164 	.db #0xb1	; 177
   028F 02                  165 	.db #0x02	; 2
   0290 E1 00               166 	.dw #0x00e1
   0292 AD                  167 	.db #0xad	; 173
   0293 02                  168 	.db #0x02	; 2
   0294 EF 00               169 	.dw #0x00ef
   0296 A5                  170 	.db #0xa5	; 165
   0297 10                  171 	.db #0x10	; 16
   0298 66 01               172 	.dw #0x0166
   029A 9D                  173 	.db #0x9d	; 157
   029B 1F                  174 	.db #0x1f	; 31
   029C 77 00               175 	.dw #0x0077
   029E 99                  176 	.db #0x99	; 153
   029F 07                  177 	.db #0x07	; 7
   02A0 50 00               178 	.dw #0x0050
   02A2 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:119: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   02A3                     184 _akp_musicPlay::
                            185 ;src/audio.c:152: __endasm;
                            186 ;;	backup Z80 state
   02A3 F5            [11]  187 	push	af
   02A4 C5            [11]  188 	push	bc
   02A5 D5            [11]  189 	push	de
   02A6 E5            [11]  190 	push	hl
   02A7 DD E5         [15]  191 	push	ix
   02A9 FD E5         [15]  192 	push	iy
   02AB D9            [ 4]  193 	exx
   02AC 08            [ 4]  194 	ex	af, af' ;; '
   02AD F5            [11]  195 	push	af
   02AE C5            [11]  196 	push	bc
   02AF D5            [11]  197 	push	de
   02B0 E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   02B1 CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   02B4 E1            [10]  202 	pop	hl
   02B5 D1            [10]  203 	pop	de
   02B6 C1            [10]  204 	pop	bc
   02B7 F1            [10]  205 	pop	af
   02B8 08            [ 4]  206 	ex	af, af' ;; '
   02B9 D9            [ 4]  207 	exx
   02BA FD E1         [14]  208 	pop	iy
   02BC DD E1         [14]  209 	pop	ix
   02BE E1            [10]  210 	pop	hl
   02BF D1            [10]  211 	pop	de
   02C0 C1            [10]  212 	pop	bc
   02C1 F1            [10]  213 	pop	af
   02C2 C9            [10]  214 	ret
                            215 ;src/audio.c:155: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   02C3                     219 _akp_sfxPlay::
                            220 ;src/audio.c:188: __endasm;
                            221 ;;	backup Z80 state
   02C3 F5            [11]  222 	push	af
   02C4 C5            [11]  223 	push	bc
   02C5 D5            [11]  224 	push	de
   02C6 E5            [11]  225 	push	hl
   02C7 DD E5         [15]  226 	push	ix
   02C9 FD E5         [15]  227 	push	iy
   02CB D9            [ 4]  228 	exx
   02CC 08            [ 4]  229 	ex	af, af' ;; '
   02CD F5            [11]  230 	push	af
   02CE C5            [11]  231 	push	bc
   02CF D5            [11]  232 	push	de
   02D0 E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   02D1 CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   02D4 E1            [10]  237 	pop	hl
   02D5 D1            [10]  238 	pop	de
   02D6 C1            [10]  239 	pop	bc
   02D7 F1            [10]  240 	pop	af
   02D8 08            [ 4]  241 	ex	af, af' ;; '
   02D9 D9            [ 4]  242 	exx
   02DA FD E1         [14]  243 	pop	iy
   02DC DD E1         [14]  244 	pop	ix
   02DE E1            [10]  245 	pop	hl
   02DF D1            [10]  246 	pop	de
   02E0 C1            [10]  247 	pop	bc
   02E1 F1            [10]  248 	pop	af
   02E2 C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
