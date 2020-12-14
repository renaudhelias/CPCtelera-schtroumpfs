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
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
   0D55                      24 _i::
   0D55                      25 	.ds 2
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _INITIALIZED
                             30 ;--------------------------------------------------------
                             31 ; absolute external ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DABS (ABS)
                             34 ;--------------------------------------------------------
                             35 ; global & static initialisations
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _GSINIT
                             39 	.area _GSFINAL
                             40 	.area _GSINIT
                             41 ;--------------------------------------------------------
                             42 ; Home
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _HOME
                             46 ;--------------------------------------------------------
                             47 ; code
                             48 ;--------------------------------------------------------
                             49 	.area _CODE
                             50 ;src/audio.c:51: void akp_musicInit()
                             51 ;	---------------------------------
                             52 ; Function akp_musicInit
                             53 ; ---------------------------------
   018D                      54 _akp_musicInit::
                             55 ;src/audio.c:53: i=i+1;
   018D FD 21 55 0D   [14]   56 	ld	iy, #_i
   0191 FD 34 00      [23]   57 	inc	0 (iy)
   0194 20 03         [12]   58 	jr	NZ,00103$
   0196 FD 34 01      [23]   59 	inc	1 (iy)
   0199                      60 00103$:
                             61 ;src/audio.c:111: __endasm;
                             62 ;;	backup Z80 state
   0199 F5            [11]   63 	push	af
   019A C5            [11]   64 	push	bc
   019B D5            [11]   65 	push	de
   019C E5            [11]   66 	push	hl
   019D DD E5         [15]   67 	push	ix
   019F FD E5         [15]   68 	push	iy
   01A1 D9            [ 4]   69 	exx
   01A2 08            [ 4]   70 	ex	af, af' ;; '
   01A3 F5            [11]   71 	push	af
   01A4 C5            [11]   72 	push	bc
   01A5 D5            [11]   73 	push	de
   01A6 E5            [11]   74 	push	hl
   01A7 01 D1 01      [10]   75 	ld	bc,#_effets1 ;; OK
   01AA ED 43 D1 01   [20]   76 	ld	(#_effets1),bc ;; OK
   01AE 03            [ 6]   77 	inc	bc
   01AF 03            [ 6]   78 	inc	bc
   01B0 11 16 02      [10]   79 	ld	de,#_effets2
   01B3 7A            [ 4]   80 	ld	a,d
   01B4 02            [ 7]   81 	LD	(bc),a
   01B5 03            [ 6]   82 	inc	bc
   01B6 7B            [ 4]   83 	ld	a,e
   01B7 02            [ 7]   84 	LD	(bc),a
   01B8 03            [ 6]   85 	inc	bc
                             86 ;;	AKG6000.BIN/exemple.asm
   01B9 01 00 70      [10]   87 	ld	bc,#0x7000
   01BC 11 D1 01      [10]   88 	ld	de,#_effets1 ;;sfx
   01BF CD 00 60      [17]   89 	call	#0x6000
                             90 ;;	restore Z80 state
   01C2 E1            [10]   91 	pop	hl
   01C3 D1            [10]   92 	pop	de
   01C4 C1            [10]   93 	pop	bc
   01C5 F1            [10]   94 	pop	af
   01C6 08            [ 4]   95 	ex	af, af' ;; '
   01C7 D9            [ 4]   96 	exx
   01C8 FD E1         [14]   97 	pop	iy
   01CA DD E1         [14]   98 	pop	ix
   01CC E1            [10]   99 	pop	hl
   01CD D1            [10]  100 	pop	de
   01CE C1            [10]  101 	pop	bc
   01CF F1            [10]  102 	pop	af
   01D0 C9            [10]  103 	ret
   01D1                     104 _effets1:
   01D1 00 00               105 	.dw #0x0000
   01D3 00 00               106 	.dw #0x0000
   01D5 00                  107 	.db #0x00	; 0
   01D6 3D                  108 	.db #0x3d	; 61
   01D7 EF 00               109 	.dw #0x00ef
   01D9 39                  110 	.db #0x39	; 57	'9'
   01DA EF 00               111 	.dw #0x00ef
   01DC 35                  112 	.db #0x35	; 53	'5'
   01DD EF 00               113 	.dw #0x00ef
   01DF 31                  114 	.db #0x31	; 49	'1'
   01E0 EF 00               115 	.dw #0x00ef
   01E2 C7                  116 	.db #0xc7	; 199
   01E3 EF 00               117 	.dw #0x00ef
   01E5 29                  118 	.db #0x29	; 41
   01E6 EF 00               119 	.dw #0x00ef
   01E8 25                  120 	.db #0x25	; 37
   01E9 EF 00               121 	.dw #0x00ef
   01EB 21                  122 	.db #0x21	; 33
   01EC EF 00               123 	.dw #0x00ef
   01EE 1D                  124 	.db #0x1d	; 29
   01EF EF 00               125 	.dw #0x00ef
   01F1 19                  126 	.db #0x19	; 25
   01F2 EF 00               127 	.dw #0x00ef
   01F4 15                  128 	.db #0x15	; 21
   01F5 53 01               129 	.dw #0x0153
   01F7 11                  130 	.db #0x11	; 17
   01F8 EF 00               131 	.dw #0x00ef
   01FA 0D                  132 	.db #0x0d	; 13
   01FB EF 00               133 	.dw #0x00ef
   01FD 09                  134 	.db #0x09	; 9
   01FE EF 00               135 	.dw #0x00ef
   0200 05                  136 	.db #0x05	; 5
   0201 EF 00               137 	.dw #0x00ef
   0203 04                  138 	.db #0x04	; 4
   0204 00                  139 	.db #0x00	; 0
   0205 BD                  140 	.db #0xbd	; 189
   0206 01                  141 	.db #0x01	; 1
   0207 5F 00               142 	.dw #0x005f
   0209 BD                  143 	.db #0xbd	; 189
   020A 01                  144 	.db #0x01	; 1
   020B 63 00               145 	.dw #0x0063
   020D B1                  146 	.db #0xb1	; 177
   020E 01                  147 	.db #0x01	; 1
   020F 66 00               148 	.dw #0x0066
   0211 AD                  149 	.db #0xad	; 173
   0212 01                  150 	.db #0x01	; 1
   0213 6A 00               151 	.dw #0x006a
   0215 04                  152 	.db #0x04	; 4
   0216                     153 _effets2:
   0216 00                  154 	.db #0x00	; 0
   0217 BD                  155 	.db #0xbd	; 189
   0218 01                  156 	.db #0x01	; 1
   0219 2D 01               157 	.dw #0x012d
   021B BD                  158 	.db #0xbd	; 189
   021C 08                  159 	.db #0x08	; 8
   021D 3F 01               160 	.dw #0x013f
   021F B9                  161 	.db #0xb9	; 185
   0220 02                  162 	.db #0x02	; 2
   0221 92 01               163 	.dw #0x0192
   0223 B5                  164 	.db #0xb5	; 181
   0224 10                  165 	.db #0x10	; 16
   0225 D5 00               166 	.dw #0x00d5
   0227 B1                  167 	.db #0xb1	; 177
   0228 02                  168 	.db #0x02	; 2
   0229 E1 00               169 	.dw #0x00e1
   022B AD                  170 	.db #0xad	; 173
   022C 02                  171 	.db #0x02	; 2
   022D EF 00               172 	.dw #0x00ef
   022F A5                  173 	.db #0xa5	; 165
   0230 10                  174 	.db #0x10	; 16
   0231 66 01               175 	.dw #0x0166
   0233 9D                  176 	.db #0x9d	; 157
   0234 1F                  177 	.db #0x1f	; 31
   0235 77 00               178 	.dw #0x0077
   0237 99                  179 	.db #0x99	; 153
   0238 07                  180 	.db #0x07	; 7
   0239 50 00               181 	.dw #0x0050
   023B 04                  182 	.db #0x04	; 4
                            183 ;src/audio.c:114: void akp_musicPlay()
                            184 ;	---------------------------------
                            185 ; Function akp_musicPlay
                            186 ; ---------------------------------
   023C                     187 _akp_musicPlay::
                            188 ;src/audio.c:147: __endasm;
                            189 ;;	backup Z80 state
   023C F5            [11]  190 	push	af
   023D C5            [11]  191 	push	bc
   023E D5            [11]  192 	push	de
   023F E5            [11]  193 	push	hl
   0240 DD E5         [15]  194 	push	ix
   0242 FD E5         [15]  195 	push	iy
   0244 D9            [ 4]  196 	exx
   0245 08            [ 4]  197 	ex	af, af' ;; '
   0246 F5            [11]  198 	push	af
   0247 C5            [11]  199 	push	bc
   0248 D5            [11]  200 	push	de
   0249 E5            [11]  201 	push	hl
                            202 ;;	AKG6000.BIN/exemple.asm
   024A CD 03 60      [17]  203 	call	#0x6003
                            204 ;;	restore Z80 state
   024D E1            [10]  205 	pop	hl
   024E D1            [10]  206 	pop	de
   024F C1            [10]  207 	pop	bc
   0250 F1            [10]  208 	pop	af
   0251 08            [ 4]  209 	ex	af, af' ;; '
   0252 D9            [ 4]  210 	exx
   0253 FD E1         [14]  211 	pop	iy
   0255 DD E1         [14]  212 	pop	ix
   0257 E1            [10]  213 	pop	hl
   0258 D1            [10]  214 	pop	de
   0259 C1            [10]  215 	pop	bc
   025A F1            [10]  216 	pop	af
   025B C9            [10]  217 	ret
                            218 ;src/audio.c:150: void akp_sfxPlay()
                            219 ;	---------------------------------
                            220 ; Function akp_sfxPlay
                            221 ; ---------------------------------
   025C                     222 _akp_sfxPlay::
                            223 ;src/audio.c:183: __endasm;
                            224 ;;	backup Z80 state
   025C F5            [11]  225 	push	af
   025D C5            [11]  226 	push	bc
   025E D5            [11]  227 	push	de
   025F E5            [11]  228 	push	hl
   0260 DD E5         [15]  229 	push	ix
   0262 FD E5         [15]  230 	push	iy
   0264 D9            [ 4]  231 	exx
   0265 08            [ 4]  232 	ex	af, af' ;; '
   0266 F5            [11]  233 	push	af
   0267 C5            [11]  234 	push	bc
   0268 D5            [11]  235 	push	de
   0269 E5            [11]  236 	push	hl
                            237 ;;	AKG6000.BIN/exemple.asm
   026A CD 06 60      [17]  238 	call	#0x6006
                            239 ;;	restore Z80 state
   026D E1            [10]  240 	pop	hl
   026E D1            [10]  241 	pop	de
   026F C1            [10]  242 	pop	bc
   0270 F1            [10]  243 	pop	af
   0271 08            [ 4]  244 	ex	af, af' ;; '
   0272 D9            [ 4]  245 	exx
   0273 FD E1         [14]  246 	pop	iy
   0275 DD E1         [14]  247 	pop	ix
   0277 E1            [10]  248 	pop	hl
   0278 D1            [10]  249 	pop	de
   0279 C1            [10]  250 	pop	bc
   027A F1            [10]  251 	pop	af
   027B C9            [10]  252 	ret
                            253 	.area _CODE
                            254 	.area _INITIALIZER
                            255 	.area _CABS (ABS)
