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
                             11 	.globl _akp_musicPlay
                             12 	.globl _akp_musicInit
                             13 	.globl _i
                             14 	.globl _effets2
                             15 	.globl _effets1
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
   0D25                      23 _i::
   0D25                      24 	.ds 2
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/audio.c:51: void akp_musicInit()
                             50 ;	---------------------------------
                             51 ; Function akp_musicInit
                             52 ; ---------------------------------
   018D                      53 _akp_musicInit::
                             54 ;src/audio.c:53: i=i+1;
   018D FD 21 25 0D   [14]   55 	ld	iy, #_i
   0191 FD 34 00      [23]   56 	inc	0 (iy)
   0194 20 03         [12]   57 	jr	NZ,00103$
   0196 FD 34 01      [23]   58 	inc	1 (iy)
   0199                      59 00103$:
                             60 ;src/audio.c:111: __endasm;
                             61 ;;	backup Z80 state
   0199 F5            [11]   62 	push	af
   019A C5            [11]   63 	push	bc
   019B D5            [11]   64 	push	de
   019C E5            [11]   65 	push	hl
   019D DD E5         [15]   66 	push	ix
   019F FD E5         [15]   67 	push	iy
   01A1 D9            [ 4]   68 	exx
   01A2 08            [ 4]   69 	ex	af, af' ;; '
   01A3 F5            [11]   70 	push	af
   01A4 C5            [11]   71 	push	bc
   01A5 D5            [11]   72 	push	de
   01A6 E5            [11]   73 	push	hl
   01A7 01 D1 01      [10]   74 	ld	bc,#_effets1 ;; OK
   01AA ED 43 D1 01   [20]   75 	ld	(#_effets1),bc ;; OK
   01AE 03            [ 6]   76 	inc	bc
   01AF 03            [ 6]   77 	inc	bc
   01B0 11 16 02      [10]   78 	ld	de,#_effets2
   01B3 7A            [ 4]   79 	ld	a,d
   01B4 02            [ 7]   80 	LD	(bc),a
   01B5 03            [ 6]   81 	inc	bc
   01B6 7B            [ 4]   82 	ld	a,e
   01B7 02            [ 7]   83 	LD	(bc),a
   01B8 03            [ 6]   84 	inc	bc
                             85 ;;	AKG6000.BIN/exemple.asm
   01B9 01 00 70      [10]   86 	ld	bc,#0x7000
   01BC 11 D1 01      [10]   87 	ld	de,#_effets1 ;;sfx
   01BF CD 00 60      [17]   88 	call	#0x6000
                             89 ;;	restore Z80 state
   01C2 E1            [10]   90 	pop	hl
   01C3 D1            [10]   91 	pop	de
   01C4 C1            [10]   92 	pop	bc
   01C5 F1            [10]   93 	pop	af
   01C6 08            [ 4]   94 	ex	af, af' ;; '
   01C7 D9            [ 4]   95 	exx
   01C8 FD E1         [14]   96 	pop	iy
   01CA DD E1         [14]   97 	pop	ix
   01CC E1            [10]   98 	pop	hl
   01CD D1            [10]   99 	pop	de
   01CE C1            [10]  100 	pop	bc
   01CF F1            [10]  101 	pop	af
   01D0 C9            [10]  102 	ret
   01D1                     103 _effets1:
   01D1 00 00               104 	.dw #0x0000
   01D3 00 00               105 	.dw #0x0000
   01D5 00                  106 	.db #0x00	; 0
   01D6 3D                  107 	.db #0x3d	; 61
   01D7 EF 00               108 	.dw #0x00ef
   01D9 39                  109 	.db #0x39	; 57	'9'
   01DA EF 00               110 	.dw #0x00ef
   01DC 35                  111 	.db #0x35	; 53	'5'
   01DD EF 00               112 	.dw #0x00ef
   01DF 31                  113 	.db #0x31	; 49	'1'
   01E0 EF 00               114 	.dw #0x00ef
   01E2 C7                  115 	.db #0xc7	; 199
   01E3 EF 00               116 	.dw #0x00ef
   01E5 29                  117 	.db #0x29	; 41
   01E6 EF 00               118 	.dw #0x00ef
   01E8 25                  119 	.db #0x25	; 37
   01E9 EF 00               120 	.dw #0x00ef
   01EB 21                  121 	.db #0x21	; 33
   01EC EF 00               122 	.dw #0x00ef
   01EE 1D                  123 	.db #0x1d	; 29
   01EF EF 00               124 	.dw #0x00ef
   01F1 19                  125 	.db #0x19	; 25
   01F2 EF 00               126 	.dw #0x00ef
   01F4 15                  127 	.db #0x15	; 21
   01F5 53 01               128 	.dw #0x0153
   01F7 11                  129 	.db #0x11	; 17
   01F8 EF 00               130 	.dw #0x00ef
   01FA 0D                  131 	.db #0x0d	; 13
   01FB EF 00               132 	.dw #0x00ef
   01FD 09                  133 	.db #0x09	; 9
   01FE EF 00               134 	.dw #0x00ef
   0200 05                  135 	.db #0x05	; 5
   0201 EF 00               136 	.dw #0x00ef
   0203 04                  137 	.db #0x04	; 4
   0204 00                  138 	.db #0x00	; 0
   0205 BD                  139 	.db #0xbd	; 189
   0206 01                  140 	.db #0x01	; 1
   0207 5F 00               141 	.dw #0x005f
   0209 BD                  142 	.db #0xbd	; 189
   020A 01                  143 	.db #0x01	; 1
   020B 63 00               144 	.dw #0x0063
   020D B1                  145 	.db #0xb1	; 177
   020E 01                  146 	.db #0x01	; 1
   020F 66 00               147 	.dw #0x0066
   0211 AD                  148 	.db #0xad	; 173
   0212 01                  149 	.db #0x01	; 1
   0213 6A 00               150 	.dw #0x006a
   0215 04                  151 	.db #0x04	; 4
   0216                     152 _effets2:
   0216 00                  153 	.db #0x00	; 0
   0217 BD                  154 	.db #0xbd	; 189
   0218 01                  155 	.db #0x01	; 1
   0219 2D 01               156 	.dw #0x012d
   021B BD                  157 	.db #0xbd	; 189
   021C 08                  158 	.db #0x08	; 8
   021D 3F 01               159 	.dw #0x013f
   021F B9                  160 	.db #0xb9	; 185
   0220 02                  161 	.db #0x02	; 2
   0221 92 01               162 	.dw #0x0192
   0223 B5                  163 	.db #0xb5	; 181
   0224 10                  164 	.db #0x10	; 16
   0225 D5 00               165 	.dw #0x00d5
   0227 B1                  166 	.db #0xb1	; 177
   0228 02                  167 	.db #0x02	; 2
   0229 E1 00               168 	.dw #0x00e1
   022B AD                  169 	.db #0xad	; 173
   022C 02                  170 	.db #0x02	; 2
   022D EF 00               171 	.dw #0x00ef
   022F A5                  172 	.db #0xa5	; 165
   0230 10                  173 	.db #0x10	; 16
   0231 66 01               174 	.dw #0x0166
   0233 9D                  175 	.db #0x9d	; 157
   0234 1F                  176 	.db #0x1f	; 31
   0235 77 00               177 	.dw #0x0077
   0237 99                  178 	.db #0x99	; 153
   0238 07                  179 	.db #0x07	; 7
   0239 50 00               180 	.dw #0x0050
   023B 04                  181 	.db #0x04	; 4
                            182 ;src/audio.c:114: void akp_musicPlay()
                            183 ;	---------------------------------
                            184 ; Function akp_musicPlay
                            185 ; ---------------------------------
   023C                     186 _akp_musicPlay::
                            187 ;src/audio.c:147: __endasm;
                            188 ;;	backup Z80 state
   023C F5            [11]  189 	push	af
   023D C5            [11]  190 	push	bc
   023E D5            [11]  191 	push	de
   023F E5            [11]  192 	push	hl
   0240 DD E5         [15]  193 	push	ix
   0242 FD E5         [15]  194 	push	iy
   0244 D9            [ 4]  195 	exx
   0245 08            [ 4]  196 	ex	af, af' ;; '
   0246 F5            [11]  197 	push	af
   0247 C5            [11]  198 	push	bc
   0248 D5            [11]  199 	push	de
   0249 E5            [11]  200 	push	hl
                            201 ;;	AKG6000.BIN/exemple.asm
   024A CD 03 60      [17]  202 	call	#0x6003
                            203 ;;	restore Z80 state
   024D E1            [10]  204 	pop	hl
   024E D1            [10]  205 	pop	de
   024F C1            [10]  206 	pop	bc
   0250 F1            [10]  207 	pop	af
   0251 08            [ 4]  208 	ex	af, af' ;; '
   0252 D9            [ 4]  209 	exx
   0253 FD E1         [14]  210 	pop	iy
   0255 DD E1         [14]  211 	pop	ix
   0257 E1            [10]  212 	pop	hl
   0258 D1            [10]  213 	pop	de
   0259 C1            [10]  214 	pop	bc
   025A F1            [10]  215 	pop	af
   025B C9            [10]  216 	ret
                            217 	.area _CODE
                            218 	.area _INITIALIZER
                            219 	.area _CABS (ABS)
