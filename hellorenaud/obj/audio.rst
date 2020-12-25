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
   6565                      26 _i::
   6565                      27 	.ds 2
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
   4289                      56 _akp_musicInit::
                             57 ;src/audio.c:67: i=i+1;
   4289 FD 21 65 65   [14]   58 	ld	iy, #_i
   428D FD 34 00      [23]   59 	inc	0 (iy)
   4290 20 03         [12]   60 	jr	NZ,00103$
   4292 FD 34 01      [23]   61 	inc	1 (iy)
   4295                      62 00103$:
                             63 ;src/audio.c:117: __endasm;
                             64 ;;	backup Z80 state
   4295 F5            [11]   65 	push	af
   4296 C5            [11]   66 	push	bc
   4297 D5            [11]   67 	push	de
   4298 E5            [11]   68 	push	hl
   4299 DD E5         [15]   69 	push	ix
   429B FD E5         [15]   70 	push	iy
   429D D9            [ 4]   71 	exx
   429E 08            [ 4]   72 	ex	af, af' ;; '
   429F F5            [11]   73 	push	af
   42A0 C5            [11]   74 	push	bc
   42A1 D5            [11]   75 	push	de
   42A2 E5            [11]   76 	push	hl
   42A3 01 CD 42      [10]   77 	ld	bc,#_effets1 ;; OK
   42A6 ED 43 C9 42   [20]   78 	ld	(#_liste1),bc ;; OK
   42AA 01 0E 43      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   42AD ED 43 CB 42   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   42B1 01 00 70      [10]   82 	ld	bc,#0x7000
   42B4 11 C9 42      [10]   83 	ld	de,#_liste1 ;;sfx
   42B7 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   42BA E1            [10]   86 	pop	hl
   42BB D1            [10]   87 	pop	de
   42BC C1            [10]   88 	pop	bc
   42BD F1            [10]   89 	pop	af
   42BE 08            [ 4]   90 	ex	af, af' ;; '
   42BF D9            [ 4]   91 	exx
   42C0 FD E1         [14]   92 	pop	iy
   42C2 DD E1         [14]   93 	pop	ix
   42C4 E1            [10]   94 	pop	hl
   42C5 D1            [10]   95 	pop	de
   42C6 C1            [10]   96 	pop	bc
   42C7 F1            [10]   97 	pop	af
   42C8 C9            [10]   98 	ret
   42C9                      99 _liste1:
   42C9 00 00               100 	.dw #0x0000
   42CB                     101 _liste2:
   42CB 00 00               102 	.dw #0x0000
   42CD                     103 _effets1:
   42CD 00                  104 	.db #0x00	; 0
   42CE 3D                  105 	.db #0x3d	; 61
   42CF EF 00               106 	.dw #0x00ef
   42D1 39                  107 	.db #0x39	; 57	'9'
   42D2 EF 00               108 	.dw #0x00ef
   42D4 35                  109 	.db #0x35	; 53	'5'
   42D5 EF 00               110 	.dw #0x00ef
   42D7 31                  111 	.db #0x31	; 49	'1'
   42D8 EF 00               112 	.dw #0x00ef
   42DA C7                  113 	.db #0xc7	; 199
   42DB EF 00               114 	.dw #0x00ef
   42DD 29                  115 	.db #0x29	; 41
   42DE EF 00               116 	.dw #0x00ef
   42E0 25                  117 	.db #0x25	; 37
   42E1 EF 00               118 	.dw #0x00ef
   42E3 21                  119 	.db #0x21	; 33
   42E4 EF 00               120 	.dw #0x00ef
   42E6 1D                  121 	.db #0x1d	; 29
   42E7 EF 00               122 	.dw #0x00ef
   42E9 19                  123 	.db #0x19	; 25
   42EA EF 00               124 	.dw #0x00ef
   42EC 15                  125 	.db #0x15	; 21
   42ED 53 01               126 	.dw #0x0153
   42EF 11                  127 	.db #0x11	; 17
   42F0 EF 00               128 	.dw #0x00ef
   42F2 0D                  129 	.db #0x0d	; 13
   42F3 EF 00               130 	.dw #0x00ef
   42F5 09                  131 	.db #0x09	; 9
   42F6 EF 00               132 	.dw #0x00ef
   42F8 05                  133 	.db #0x05	; 5
   42F9 EF 00               134 	.dw #0x00ef
   42FB 04                  135 	.db #0x04	; 4
   42FC 00                  136 	.db #0x00	; 0
   42FD BD                  137 	.db #0xbd	; 189
   42FE 01                  138 	.db #0x01	; 1
   42FF 5F 00               139 	.dw #0x005f
   4301 BD                  140 	.db #0xbd	; 189
   4302 01                  141 	.db #0x01	; 1
   4303 63 00               142 	.dw #0x0063
   4305 B1                  143 	.db #0xb1	; 177
   4306 01                  144 	.db #0x01	; 1
   4307 66 00               145 	.dw #0x0066
   4309 AD                  146 	.db #0xad	; 173
   430A 01                  147 	.db #0x01	; 1
   430B 6A 00               148 	.dw #0x006a
   430D 04                  149 	.db #0x04	; 4
   430E                     150 _effets2:
   430E 00                  151 	.db #0x00	; 0
   430F BD                  152 	.db #0xbd	; 189
   4310 01                  153 	.db #0x01	; 1
   4311 2D 01               154 	.dw #0x012d
   4313 BD                  155 	.db #0xbd	; 189
   4314 08                  156 	.db #0x08	; 8
   4315 3F 01               157 	.dw #0x013f
   4317 B9                  158 	.db #0xb9	; 185
   4318 02                  159 	.db #0x02	; 2
   4319 92 01               160 	.dw #0x0192
   431B B5                  161 	.db #0xb5	; 181
   431C 10                  162 	.db #0x10	; 16
   431D D5 00               163 	.dw #0x00d5
   431F B1                  164 	.db #0xb1	; 177
   4320 02                  165 	.db #0x02	; 2
   4321 E1 00               166 	.dw #0x00e1
   4323 AD                  167 	.db #0xad	; 173
   4324 02                  168 	.db #0x02	; 2
   4325 EF 00               169 	.dw #0x00ef
   4327 A5                  170 	.db #0xa5	; 165
   4328 10                  171 	.db #0x10	; 16
   4329 66 01               172 	.dw #0x0166
   432B 9D                  173 	.db #0x9d	; 157
   432C 1F                  174 	.db #0x1f	; 31
   432D 77 00               175 	.dw #0x0077
   432F 99                  176 	.db #0x99	; 153
   4330 07                  177 	.db #0x07	; 7
   4331 50 00               178 	.dw #0x0050
   4333 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:120: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   4334                     184 _akp_musicPlay::
                            185 ;src/audio.c:153: __endasm;
                            186 ;;	backup Z80 state
   4334 F5            [11]  187 	push	af
   4335 C5            [11]  188 	push	bc
   4336 D5            [11]  189 	push	de
   4337 E5            [11]  190 	push	hl
   4338 DD E5         [15]  191 	push	ix
   433A FD E5         [15]  192 	push	iy
   433C D9            [ 4]  193 	exx
   433D 08            [ 4]  194 	ex	af, af' ;; '
   433E F5            [11]  195 	push	af
   433F C5            [11]  196 	push	bc
   4340 D5            [11]  197 	push	de
   4341 E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   4342 CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   4345 E1            [10]  202 	pop	hl
   4346 D1            [10]  203 	pop	de
   4347 C1            [10]  204 	pop	bc
   4348 F1            [10]  205 	pop	af
   4349 08            [ 4]  206 	ex	af, af' ;; '
   434A D9            [ 4]  207 	exx
   434B FD E1         [14]  208 	pop	iy
   434D DD E1         [14]  209 	pop	ix
   434F E1            [10]  210 	pop	hl
   4350 D1            [10]  211 	pop	de
   4351 C1            [10]  212 	pop	bc
   4352 F1            [10]  213 	pop	af
   4353 C9            [10]  214 	ret
                            215 ;src/audio.c:156: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   4354                     219 _akp_sfxPlay::
                            220 ;src/audio.c:189: __endasm;
                            221 ;;	backup Z80 state
   4354 F5            [11]  222 	push	af
   4355 C5            [11]  223 	push	bc
   4356 D5            [11]  224 	push	de
   4357 E5            [11]  225 	push	hl
   4358 DD E5         [15]  226 	push	ix
   435A FD E5         [15]  227 	push	iy
   435C D9            [ 4]  228 	exx
   435D 08            [ 4]  229 	ex	af, af' ;; '
   435E F5            [11]  230 	push	af
   435F C5            [11]  231 	push	bc
   4360 D5            [11]  232 	push	de
   4361 E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   4362 CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   4365 E1            [10]  237 	pop	hl
   4366 D1            [10]  238 	pop	de
   4367 C1            [10]  239 	pop	bc
   4368 F1            [10]  240 	pop	af
   4369 08            [ 4]  241 	ex	af, af' ;; '
   436A D9            [ 4]  242 	exx
   436B FD E1         [14]  243 	pop	iy
   436D DD E1         [14]  244 	pop	ix
   436F E1            [10]  245 	pop	hl
   4370 D1            [10]  246 	pop	de
   4371 C1            [10]  247 	pop	bc
   4372 F1            [10]  248 	pop	af
   4373 C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
