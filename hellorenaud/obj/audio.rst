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
   23B6                      26 _i::
   23B6                      27 	.ds 2
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
   018D                      56 _akp_musicInit::
                             57 ;src/audio.c:66: i=i+1;
   018D FD 21 B6 23   [14]   58 	ld	iy, #_i
   0191 FD 34 00      [23]   59 	inc	0 (iy)
   0194 20 03         [12]   60 	jr	NZ,00103$
   0196 FD 34 01      [23]   61 	inc	1 (iy)
   0199                      62 00103$:
                             63 ;src/audio.c:116: __endasm;
                             64 ;;	backup Z80 state
   0199 F5            [11]   65 	push	af
   019A C5            [11]   66 	push	bc
   019B D5            [11]   67 	push	de
   019C E5            [11]   68 	push	hl
   019D DD E5         [15]   69 	push	ix
   019F FD E5         [15]   70 	push	iy
   01A1 D9            [ 4]   71 	exx
   01A2 08            [ 4]   72 	ex	af, af' ;; '
   01A3 F5            [11]   73 	push	af
   01A4 C5            [11]   74 	push	bc
   01A5 D5            [11]   75 	push	de
   01A6 E5            [11]   76 	push	hl
   01A7 01 D1 01      [10]   77 	ld	bc,#_effets1 ;; OK
   01AA ED 43 CD 01   [20]   78 	ld	(#_liste1),bc ;; OK
   01AE 01 12 02      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   01B1 ED 43 CF 01   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   01B5 01 00 70      [10]   82 	ld	bc,#0x7000
   01B8 11 CD 01      [10]   83 	ld	de,#_liste1 ;;sfx
   01BB CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   01BE E1            [10]   86 	pop	hl
   01BF D1            [10]   87 	pop	de
   01C0 C1            [10]   88 	pop	bc
   01C1 F1            [10]   89 	pop	af
   01C2 08            [ 4]   90 	ex	af, af' ;; '
   01C3 D9            [ 4]   91 	exx
   01C4 FD E1         [14]   92 	pop	iy
   01C6 DD E1         [14]   93 	pop	ix
   01C8 E1            [10]   94 	pop	hl
   01C9 D1            [10]   95 	pop	de
   01CA C1            [10]   96 	pop	bc
   01CB F1            [10]   97 	pop	af
   01CC C9            [10]   98 	ret
   01CD                      99 _liste1:
   01CD 00 00               100 	.dw #0x0000
   01CF                     101 _liste2:
   01CF 00 00               102 	.dw #0x0000
   01D1                     103 _effets1:
   01D1 00                  104 	.db #0x00	; 0
   01D2 3D                  105 	.db #0x3d	; 61
   01D3 EF 00               106 	.dw #0x00ef
   01D5 39                  107 	.db #0x39	; 57	'9'
   01D6 EF 00               108 	.dw #0x00ef
   01D8 35                  109 	.db #0x35	; 53	'5'
   01D9 EF 00               110 	.dw #0x00ef
   01DB 31                  111 	.db #0x31	; 49	'1'
   01DC EF 00               112 	.dw #0x00ef
   01DE C7                  113 	.db #0xc7	; 199
   01DF EF 00               114 	.dw #0x00ef
   01E1 29                  115 	.db #0x29	; 41
   01E2 EF 00               116 	.dw #0x00ef
   01E4 25                  117 	.db #0x25	; 37
   01E5 EF 00               118 	.dw #0x00ef
   01E7 21                  119 	.db #0x21	; 33
   01E8 EF 00               120 	.dw #0x00ef
   01EA 1D                  121 	.db #0x1d	; 29
   01EB EF 00               122 	.dw #0x00ef
   01ED 19                  123 	.db #0x19	; 25
   01EE EF 00               124 	.dw #0x00ef
   01F0 15                  125 	.db #0x15	; 21
   01F1 53 01               126 	.dw #0x0153
   01F3 11                  127 	.db #0x11	; 17
   01F4 EF 00               128 	.dw #0x00ef
   01F6 0D                  129 	.db #0x0d	; 13
   01F7 EF 00               130 	.dw #0x00ef
   01F9 09                  131 	.db #0x09	; 9
   01FA EF 00               132 	.dw #0x00ef
   01FC 05                  133 	.db #0x05	; 5
   01FD EF 00               134 	.dw #0x00ef
   01FF 04                  135 	.db #0x04	; 4
   0200 00                  136 	.db #0x00	; 0
   0201 BD                  137 	.db #0xbd	; 189
   0202 01                  138 	.db #0x01	; 1
   0203 5F 00               139 	.dw #0x005f
   0205 BD                  140 	.db #0xbd	; 189
   0206 01                  141 	.db #0x01	; 1
   0207 63 00               142 	.dw #0x0063
   0209 B1                  143 	.db #0xb1	; 177
   020A 01                  144 	.db #0x01	; 1
   020B 66 00               145 	.dw #0x0066
   020D AD                  146 	.db #0xad	; 173
   020E 01                  147 	.db #0x01	; 1
   020F 6A 00               148 	.dw #0x006a
   0211 04                  149 	.db #0x04	; 4
   0212                     150 _effets2:
   0212 00                  151 	.db #0x00	; 0
   0213 BD                  152 	.db #0xbd	; 189
   0214 01                  153 	.db #0x01	; 1
   0215 2D 01               154 	.dw #0x012d
   0217 BD                  155 	.db #0xbd	; 189
   0218 08                  156 	.db #0x08	; 8
   0219 3F 01               157 	.dw #0x013f
   021B B9                  158 	.db #0xb9	; 185
   021C 02                  159 	.db #0x02	; 2
   021D 92 01               160 	.dw #0x0192
   021F B5                  161 	.db #0xb5	; 181
   0220 10                  162 	.db #0x10	; 16
   0221 D5 00               163 	.dw #0x00d5
   0223 B1                  164 	.db #0xb1	; 177
   0224 02                  165 	.db #0x02	; 2
   0225 E1 00               166 	.dw #0x00e1
   0227 AD                  167 	.db #0xad	; 173
   0228 02                  168 	.db #0x02	; 2
   0229 EF 00               169 	.dw #0x00ef
   022B A5                  170 	.db #0xa5	; 165
   022C 10                  171 	.db #0x10	; 16
   022D 66 01               172 	.dw #0x0166
   022F 9D                  173 	.db #0x9d	; 157
   0230 1F                  174 	.db #0x1f	; 31
   0231 77 00               175 	.dw #0x0077
   0233 99                  176 	.db #0x99	; 153
   0234 07                  177 	.db #0x07	; 7
   0235 50 00               178 	.dw #0x0050
   0237 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:119: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   0238                     184 _akp_musicPlay::
                            185 ;src/audio.c:152: __endasm;
                            186 ;;	backup Z80 state
   0238 F5            [11]  187 	push	af
   0239 C5            [11]  188 	push	bc
   023A D5            [11]  189 	push	de
   023B E5            [11]  190 	push	hl
   023C DD E5         [15]  191 	push	ix
   023E FD E5         [15]  192 	push	iy
   0240 D9            [ 4]  193 	exx
   0241 08            [ 4]  194 	ex	af, af' ;; '
   0242 F5            [11]  195 	push	af
   0243 C5            [11]  196 	push	bc
   0244 D5            [11]  197 	push	de
   0245 E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   0246 CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   0249 E1            [10]  202 	pop	hl
   024A D1            [10]  203 	pop	de
   024B C1            [10]  204 	pop	bc
   024C F1            [10]  205 	pop	af
   024D 08            [ 4]  206 	ex	af, af' ;; '
   024E D9            [ 4]  207 	exx
   024F FD E1         [14]  208 	pop	iy
   0251 DD E1         [14]  209 	pop	ix
   0253 E1            [10]  210 	pop	hl
   0254 D1            [10]  211 	pop	de
   0255 C1            [10]  212 	pop	bc
   0256 F1            [10]  213 	pop	af
   0257 C9            [10]  214 	ret
                            215 ;src/audio.c:155: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   0258                     219 _akp_sfxPlay::
                            220 ;src/audio.c:188: __endasm;
                            221 ;;	backup Z80 state
   0258 F5            [11]  222 	push	af
   0259 C5            [11]  223 	push	bc
   025A D5            [11]  224 	push	de
   025B E5            [11]  225 	push	hl
   025C DD E5         [15]  226 	push	ix
   025E FD E5         [15]  227 	push	iy
   0260 D9            [ 4]  228 	exx
   0261 08            [ 4]  229 	ex	af, af' ;; '
   0262 F5            [11]  230 	push	af
   0263 C5            [11]  231 	push	bc
   0264 D5            [11]  232 	push	de
   0265 E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   0266 CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   0269 E1            [10]  237 	pop	hl
   026A D1            [10]  238 	pop	de
   026B C1            [10]  239 	pop	bc
   026C F1            [10]  240 	pop	af
   026D 08            [ 4]  241 	ex	af, af' ;; '
   026E D9            [ 4]  242 	exx
   026F FD E1         [14]  243 	pop	iy
   0271 DD E1         [14]  244 	pop	ix
   0273 E1            [10]  245 	pop	hl
   0274 D1            [10]  246 	pop	de
   0275 C1            [10]  247 	pop	bc
   0276 F1            [10]  248 	pop	af
   0277 C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
