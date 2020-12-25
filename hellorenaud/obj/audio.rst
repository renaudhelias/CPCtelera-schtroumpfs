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
   64F6                      26 _i::
   64F6                      27 	.ds 2
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
   41E6                      56 _akp_musicInit::
                             57 ;src/audio.c:67: i=i+1;
   41E6 FD 21 F6 64   [14]   58 	ld	iy, #_i
   41EA FD 34 00      [23]   59 	inc	0 (iy)
   41ED 20 03         [12]   60 	jr	NZ,00103$
   41EF FD 34 01      [23]   61 	inc	1 (iy)
   41F2                      62 00103$:
                             63 ;src/audio.c:117: __endasm;
                             64 ;;	backup Z80 state
   41F2 F5            [11]   65 	push	af
   41F3 C5            [11]   66 	push	bc
   41F4 D5            [11]   67 	push	de
   41F5 E5            [11]   68 	push	hl
   41F6 DD E5         [15]   69 	push	ix
   41F8 FD E5         [15]   70 	push	iy
   41FA D9            [ 4]   71 	exx
   41FB 08            [ 4]   72 	ex	af, af' ;; '
   41FC F5            [11]   73 	push	af
   41FD C5            [11]   74 	push	bc
   41FE D5            [11]   75 	push	de
   41FF E5            [11]   76 	push	hl
   4200 01 2A 42      [10]   77 	ld	bc,#_effets1 ;; OK
   4203 ED 43 26 42   [20]   78 	ld	(#_liste1),bc ;; OK
   4207 01 6B 42      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   420A ED 43 28 42   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   420E 01 00 70      [10]   82 	ld	bc,#0x7000
   4211 11 26 42      [10]   83 	ld	de,#_liste1 ;;sfx
   4214 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   4217 E1            [10]   86 	pop	hl
   4218 D1            [10]   87 	pop	de
   4219 C1            [10]   88 	pop	bc
   421A F1            [10]   89 	pop	af
   421B 08            [ 4]   90 	ex	af, af' ;; '
   421C D9            [ 4]   91 	exx
   421D FD E1         [14]   92 	pop	iy
   421F DD E1         [14]   93 	pop	ix
   4221 E1            [10]   94 	pop	hl
   4222 D1            [10]   95 	pop	de
   4223 C1            [10]   96 	pop	bc
   4224 F1            [10]   97 	pop	af
   4225 C9            [10]   98 	ret
   4226                      99 _liste1:
   4226 00 00               100 	.dw #0x0000
   4228                     101 _liste2:
   4228 00 00               102 	.dw #0x0000
   422A                     103 _effets1:
   422A 00                  104 	.db #0x00	; 0
   422B 3D                  105 	.db #0x3d	; 61
   422C EF 00               106 	.dw #0x00ef
   422E 39                  107 	.db #0x39	; 57	'9'
   422F EF 00               108 	.dw #0x00ef
   4231 35                  109 	.db #0x35	; 53	'5'
   4232 EF 00               110 	.dw #0x00ef
   4234 31                  111 	.db #0x31	; 49	'1'
   4235 EF 00               112 	.dw #0x00ef
   4237 C7                  113 	.db #0xc7	; 199
   4238 EF 00               114 	.dw #0x00ef
   423A 29                  115 	.db #0x29	; 41
   423B EF 00               116 	.dw #0x00ef
   423D 25                  117 	.db #0x25	; 37
   423E EF 00               118 	.dw #0x00ef
   4240 21                  119 	.db #0x21	; 33
   4241 EF 00               120 	.dw #0x00ef
   4243 1D                  121 	.db #0x1d	; 29
   4244 EF 00               122 	.dw #0x00ef
   4246 19                  123 	.db #0x19	; 25
   4247 EF 00               124 	.dw #0x00ef
   4249 15                  125 	.db #0x15	; 21
   424A 53 01               126 	.dw #0x0153
   424C 11                  127 	.db #0x11	; 17
   424D EF 00               128 	.dw #0x00ef
   424F 0D                  129 	.db #0x0d	; 13
   4250 EF 00               130 	.dw #0x00ef
   4252 09                  131 	.db #0x09	; 9
   4253 EF 00               132 	.dw #0x00ef
   4255 05                  133 	.db #0x05	; 5
   4256 EF 00               134 	.dw #0x00ef
   4258 04                  135 	.db #0x04	; 4
   4259 00                  136 	.db #0x00	; 0
   425A BD                  137 	.db #0xbd	; 189
   425B 01                  138 	.db #0x01	; 1
   425C 5F 00               139 	.dw #0x005f
   425E BD                  140 	.db #0xbd	; 189
   425F 01                  141 	.db #0x01	; 1
   4260 63 00               142 	.dw #0x0063
   4262 B1                  143 	.db #0xb1	; 177
   4263 01                  144 	.db #0x01	; 1
   4264 66 00               145 	.dw #0x0066
   4266 AD                  146 	.db #0xad	; 173
   4267 01                  147 	.db #0x01	; 1
   4268 6A 00               148 	.dw #0x006a
   426A 04                  149 	.db #0x04	; 4
   426B                     150 _effets2:
   426B 00                  151 	.db #0x00	; 0
   426C BD                  152 	.db #0xbd	; 189
   426D 01                  153 	.db #0x01	; 1
   426E 2D 01               154 	.dw #0x012d
   4270 BD                  155 	.db #0xbd	; 189
   4271 08                  156 	.db #0x08	; 8
   4272 3F 01               157 	.dw #0x013f
   4274 B9                  158 	.db #0xb9	; 185
   4275 02                  159 	.db #0x02	; 2
   4276 92 01               160 	.dw #0x0192
   4278 B5                  161 	.db #0xb5	; 181
   4279 10                  162 	.db #0x10	; 16
   427A D5 00               163 	.dw #0x00d5
   427C B1                  164 	.db #0xb1	; 177
   427D 02                  165 	.db #0x02	; 2
   427E E1 00               166 	.dw #0x00e1
   4280 AD                  167 	.db #0xad	; 173
   4281 02                  168 	.db #0x02	; 2
   4282 EF 00               169 	.dw #0x00ef
   4284 A5                  170 	.db #0xa5	; 165
   4285 10                  171 	.db #0x10	; 16
   4286 66 01               172 	.dw #0x0166
   4288 9D                  173 	.db #0x9d	; 157
   4289 1F                  174 	.db #0x1f	; 31
   428A 77 00               175 	.dw #0x0077
   428C 99                  176 	.db #0x99	; 153
   428D 07                  177 	.db #0x07	; 7
   428E 50 00               178 	.dw #0x0050
   4290 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:120: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   4291                     184 _akp_musicPlay::
                            185 ;src/audio.c:153: __endasm;
                            186 ;;	backup Z80 state
   4291 F5            [11]  187 	push	af
   4292 C5            [11]  188 	push	bc
   4293 D5            [11]  189 	push	de
   4294 E5            [11]  190 	push	hl
   4295 DD E5         [15]  191 	push	ix
   4297 FD E5         [15]  192 	push	iy
   4299 D9            [ 4]  193 	exx
   429A 08            [ 4]  194 	ex	af, af' ;; '
   429B F5            [11]  195 	push	af
   429C C5            [11]  196 	push	bc
   429D D5            [11]  197 	push	de
   429E E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   429F CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   42A2 E1            [10]  202 	pop	hl
   42A3 D1            [10]  203 	pop	de
   42A4 C1            [10]  204 	pop	bc
   42A5 F1            [10]  205 	pop	af
   42A6 08            [ 4]  206 	ex	af, af' ;; '
   42A7 D9            [ 4]  207 	exx
   42A8 FD E1         [14]  208 	pop	iy
   42AA DD E1         [14]  209 	pop	ix
   42AC E1            [10]  210 	pop	hl
   42AD D1            [10]  211 	pop	de
   42AE C1            [10]  212 	pop	bc
   42AF F1            [10]  213 	pop	af
   42B0 C9            [10]  214 	ret
                            215 ;src/audio.c:156: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   42B1                     219 _akp_sfxPlay::
                            220 ;src/audio.c:189: __endasm;
                            221 ;;	backup Z80 state
   42B1 F5            [11]  222 	push	af
   42B2 C5            [11]  223 	push	bc
   42B3 D5            [11]  224 	push	de
   42B4 E5            [11]  225 	push	hl
   42B5 DD E5         [15]  226 	push	ix
   42B7 FD E5         [15]  227 	push	iy
   42B9 D9            [ 4]  228 	exx
   42BA 08            [ 4]  229 	ex	af, af' ;; '
   42BB F5            [11]  230 	push	af
   42BC C5            [11]  231 	push	bc
   42BD D5            [11]  232 	push	de
   42BE E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   42BF CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   42C2 E1            [10]  237 	pop	hl
   42C3 D1            [10]  238 	pop	de
   42C4 C1            [10]  239 	pop	bc
   42C5 F1            [10]  240 	pop	af
   42C6 08            [ 4]  241 	ex	af, af' ;; '
   42C7 D9            [ 4]  242 	exx
   42C8 FD E1         [14]  243 	pop	iy
   42CA DD E1         [14]  244 	pop	ix
   42CC E1            [10]  245 	pop	hl
   42CD D1            [10]  246 	pop	de
   42CE C1            [10]  247 	pop	bc
   42CF F1            [10]  248 	pop	af
   42D0 C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
