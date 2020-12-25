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
   655F                      26 _i::
   655F                      27 	.ds 2
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
   4283                      56 _akp_musicInit::
                             57 ;src/audio.c:67: i=i+1;
   4283 FD 21 5F 65   [14]   58 	ld	iy, #_i
   4287 FD 34 00      [23]   59 	inc	0 (iy)
   428A 20 03         [12]   60 	jr	NZ,00103$
   428C FD 34 01      [23]   61 	inc	1 (iy)
   428F                      62 00103$:
                             63 ;src/audio.c:117: __endasm;
                             64 ;;	backup Z80 state
   428F F5            [11]   65 	push	af
   4290 C5            [11]   66 	push	bc
   4291 D5            [11]   67 	push	de
   4292 E5            [11]   68 	push	hl
   4293 DD E5         [15]   69 	push	ix
   4295 FD E5         [15]   70 	push	iy
   4297 D9            [ 4]   71 	exx
   4298 08            [ 4]   72 	ex	af, af' ;; '
   4299 F5            [11]   73 	push	af
   429A C5            [11]   74 	push	bc
   429B D5            [11]   75 	push	de
   429C E5            [11]   76 	push	hl
   429D 01 C7 42      [10]   77 	ld	bc,#_effets1 ;; OK
   42A0 ED 43 C3 42   [20]   78 	ld	(#_liste1),bc ;; OK
   42A4 01 08 43      [10]   79 	ld	bc,#_effets2 ;; #_effets2 ;; OK
   42A7 ED 43 C5 42   [20]   80 	ld	(#_liste2),bc ;; OK
                             81 ;;	AKG6000.BIN/exemple.asm
   42AB 01 00 70      [10]   82 	ld	bc,#0x7000
   42AE 11 C3 42      [10]   83 	ld	de,#_liste1 ;;sfx
   42B1 CD 00 60      [17]   84 	call	#0x6000
                             85 ;;	restore Z80 state
   42B4 E1            [10]   86 	pop	hl
   42B5 D1            [10]   87 	pop	de
   42B6 C1            [10]   88 	pop	bc
   42B7 F1            [10]   89 	pop	af
   42B8 08            [ 4]   90 	ex	af, af' ;; '
   42B9 D9            [ 4]   91 	exx
   42BA FD E1         [14]   92 	pop	iy
   42BC DD E1         [14]   93 	pop	ix
   42BE E1            [10]   94 	pop	hl
   42BF D1            [10]   95 	pop	de
   42C0 C1            [10]   96 	pop	bc
   42C1 F1            [10]   97 	pop	af
   42C2 C9            [10]   98 	ret
   42C3                      99 _liste1:
   42C3 00 00               100 	.dw #0x0000
   42C5                     101 _liste2:
   42C5 00 00               102 	.dw #0x0000
   42C7                     103 _effets1:
   42C7 00                  104 	.db #0x00	; 0
   42C8 3D                  105 	.db #0x3d	; 61
   42C9 EF 00               106 	.dw #0x00ef
   42CB 39                  107 	.db #0x39	; 57	'9'
   42CC EF 00               108 	.dw #0x00ef
   42CE 35                  109 	.db #0x35	; 53	'5'
   42CF EF 00               110 	.dw #0x00ef
   42D1 31                  111 	.db #0x31	; 49	'1'
   42D2 EF 00               112 	.dw #0x00ef
   42D4 C7                  113 	.db #0xc7	; 199
   42D5 EF 00               114 	.dw #0x00ef
   42D7 29                  115 	.db #0x29	; 41
   42D8 EF 00               116 	.dw #0x00ef
   42DA 25                  117 	.db #0x25	; 37
   42DB EF 00               118 	.dw #0x00ef
   42DD 21                  119 	.db #0x21	; 33
   42DE EF 00               120 	.dw #0x00ef
   42E0 1D                  121 	.db #0x1d	; 29
   42E1 EF 00               122 	.dw #0x00ef
   42E3 19                  123 	.db #0x19	; 25
   42E4 EF 00               124 	.dw #0x00ef
   42E6 15                  125 	.db #0x15	; 21
   42E7 53 01               126 	.dw #0x0153
   42E9 11                  127 	.db #0x11	; 17
   42EA EF 00               128 	.dw #0x00ef
   42EC 0D                  129 	.db #0x0d	; 13
   42ED EF 00               130 	.dw #0x00ef
   42EF 09                  131 	.db #0x09	; 9
   42F0 EF 00               132 	.dw #0x00ef
   42F2 05                  133 	.db #0x05	; 5
   42F3 EF 00               134 	.dw #0x00ef
   42F5 04                  135 	.db #0x04	; 4
   42F6 00                  136 	.db #0x00	; 0
   42F7 BD                  137 	.db #0xbd	; 189
   42F8 01                  138 	.db #0x01	; 1
   42F9 5F 00               139 	.dw #0x005f
   42FB BD                  140 	.db #0xbd	; 189
   42FC 01                  141 	.db #0x01	; 1
   42FD 63 00               142 	.dw #0x0063
   42FF B1                  143 	.db #0xb1	; 177
   4300 01                  144 	.db #0x01	; 1
   4301 66 00               145 	.dw #0x0066
   4303 AD                  146 	.db #0xad	; 173
   4304 01                  147 	.db #0x01	; 1
   4305 6A 00               148 	.dw #0x006a
   4307 04                  149 	.db #0x04	; 4
   4308                     150 _effets2:
   4308 00                  151 	.db #0x00	; 0
   4309 BD                  152 	.db #0xbd	; 189
   430A 01                  153 	.db #0x01	; 1
   430B 2D 01               154 	.dw #0x012d
   430D BD                  155 	.db #0xbd	; 189
   430E 08                  156 	.db #0x08	; 8
   430F 3F 01               157 	.dw #0x013f
   4311 B9                  158 	.db #0xb9	; 185
   4312 02                  159 	.db #0x02	; 2
   4313 92 01               160 	.dw #0x0192
   4315 B5                  161 	.db #0xb5	; 181
   4316 10                  162 	.db #0x10	; 16
   4317 D5 00               163 	.dw #0x00d5
   4319 B1                  164 	.db #0xb1	; 177
   431A 02                  165 	.db #0x02	; 2
   431B E1 00               166 	.dw #0x00e1
   431D AD                  167 	.db #0xad	; 173
   431E 02                  168 	.db #0x02	; 2
   431F EF 00               169 	.dw #0x00ef
   4321 A5                  170 	.db #0xa5	; 165
   4322 10                  171 	.db #0x10	; 16
   4323 66 01               172 	.dw #0x0166
   4325 9D                  173 	.db #0x9d	; 157
   4326 1F                  174 	.db #0x1f	; 31
   4327 77 00               175 	.dw #0x0077
   4329 99                  176 	.db #0x99	; 153
   432A 07                  177 	.db #0x07	; 7
   432B 50 00               178 	.dw #0x0050
   432D 04                  179 	.db #0x04	; 4
                            180 ;src/audio.c:120: void akp_musicPlay()
                            181 ;	---------------------------------
                            182 ; Function akp_musicPlay
                            183 ; ---------------------------------
   432E                     184 _akp_musicPlay::
                            185 ;src/audio.c:153: __endasm;
                            186 ;;	backup Z80 state
   432E F5            [11]  187 	push	af
   432F C5            [11]  188 	push	bc
   4330 D5            [11]  189 	push	de
   4331 E5            [11]  190 	push	hl
   4332 DD E5         [15]  191 	push	ix
   4334 FD E5         [15]  192 	push	iy
   4336 D9            [ 4]  193 	exx
   4337 08            [ 4]  194 	ex	af, af' ;; '
   4338 F5            [11]  195 	push	af
   4339 C5            [11]  196 	push	bc
   433A D5            [11]  197 	push	de
   433B E5            [11]  198 	push	hl
                            199 ;;	AKG6000.BIN/exemple.asm
   433C CD 03 60      [17]  200 	call	#0x6003
                            201 ;;	restore Z80 state
   433F E1            [10]  202 	pop	hl
   4340 D1            [10]  203 	pop	de
   4341 C1            [10]  204 	pop	bc
   4342 F1            [10]  205 	pop	af
   4343 08            [ 4]  206 	ex	af, af' ;; '
   4344 D9            [ 4]  207 	exx
   4345 FD E1         [14]  208 	pop	iy
   4347 DD E1         [14]  209 	pop	ix
   4349 E1            [10]  210 	pop	hl
   434A D1            [10]  211 	pop	de
   434B C1            [10]  212 	pop	bc
   434C F1            [10]  213 	pop	af
   434D C9            [10]  214 	ret
                            215 ;src/audio.c:156: void akp_sfxPlay()
                            216 ;	---------------------------------
                            217 ; Function akp_sfxPlay
                            218 ; ---------------------------------
   434E                     219 _akp_sfxPlay::
                            220 ;src/audio.c:189: __endasm;
                            221 ;;	backup Z80 state
   434E F5            [11]  222 	push	af
   434F C5            [11]  223 	push	bc
   4350 D5            [11]  224 	push	de
   4351 E5            [11]  225 	push	hl
   4352 DD E5         [15]  226 	push	ix
   4354 FD E5         [15]  227 	push	iy
   4356 D9            [ 4]  228 	exx
   4357 08            [ 4]  229 	ex	af, af' ;; '
   4358 F5            [11]  230 	push	af
   4359 C5            [11]  231 	push	bc
   435A D5            [11]  232 	push	de
   435B E5            [11]  233 	push	hl
                            234 ;;	AKG6000.BIN/exemple.asm
   435C CD 06 60      [17]  235 	call	#0x6006
                            236 ;;	restore Z80 state
   435F E1            [10]  237 	pop	hl
   4360 D1            [10]  238 	pop	de
   4361 C1            [10]  239 	pop	bc
   4362 F1            [10]  240 	pop	af
   4363 08            [ 4]  241 	ex	af, af' ;; '
   4364 D9            [ 4]  242 	exx
   4365 FD E1         [14]  243 	pop	iy
   4367 DD E1         [14]  244 	pop	ix
   4369 E1            [10]  245 	pop	hl
   436A D1            [10]  246 	pop	de
   436B C1            [10]  247 	pop	bc
   436C F1            [10]  248 	pop	af
   436D C9            [10]  249 	ret
                            250 	.area _CODE
                            251 	.area _INITIALIZER
                            252 	.area _CABS (ABS)
