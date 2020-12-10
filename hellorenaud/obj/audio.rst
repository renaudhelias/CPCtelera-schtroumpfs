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
                             14 	.globl _effets
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
   4AF1                      22 _i::
   4AF1                      23 	.ds 2
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _INITIALIZED
                             28 ;--------------------------------------------------------
                             29 ; absolute external ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DABS (ABS)
                             32 ;--------------------------------------------------------
                             33 ; global & static initialisations
                             34 ;--------------------------------------------------------
                             35 	.area _HOME
                             36 	.area _GSINIT
                             37 	.area _GSFINAL
                             38 	.area _GSINIT
                             39 ;--------------------------------------------------------
                             40 ; Home
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _HOME
                             44 ;--------------------------------------------------------
                             45 ; code
                             46 ;--------------------------------------------------------
                             47 	.area _CODE
                             48 ;src/audio.c:40: void akp_musicInit()
                             49 ;	---------------------------------
                             50 ; Function akp_musicInit
                             51 ; ---------------------------------
   4055                      52 _akp_musicInit::
                             53 ;src/audio.c:42: i=i+1;
   4055 FD 21 F1 4A   [14]   54 	ld	iy, #_i
   4059 FD 34 00      [23]   55 	inc	0 (iy)
   405C 20 03         [12]   56 	jr	NZ,00103$
   405E FD 34 01      [23]   57 	inc	1 (iy)
   4061                      58 00103$:
                             59 ;src/audio.c:102: __endasm;
                             60 ;;	backup Z80 state
   4061 F5            [11]   61 	push	af
   4062 C5            [11]   62 	push	bc
   4063 D5            [11]   63 	push	de
   4064 E5            [11]   64 	push	hl
   4065 DD E5         [15]   65 	push	ix
   4067 FD E5         [15]   66 	push	iy
   4069 D9            [ 4]   67 	exx
   406A 08            [ 4]   68 	ex	af, af' ;; '
   406B F5            [11]   69 	push	af
   406C C5            [11]   70 	push	bc
   406D D5            [11]   71 	push	de
   406E E5            [11]   72 	push	hl
   406F 01 9C 40      [10]   73 	ld	bc,#_effets ;; OK
   4072 21 9C 40      [10]   74 	ld	hl,#_effets ;; OK
   4075 ED 43 9C 40   [20]   75 	ld	(#_effets),bc ;; OK
   4079 03            [ 6]   76 	inc	bc
   407A 03            [ 6]   77 	inc	bc
   407B 11 40 00      [10]   78 	ld	de,#0x0040
   407E 19            [11]   79 	add	hl,de
   407F 7C            [ 4]   80 	ld	a,h
   4080 02            [ 7]   81 	ld	(bc),a
   4081 03            [ 6]   82 	inc	bc
   4082 7D            [ 4]   83 	ld	a,l
   4083 02            [ 7]   84 	ld	(bc),a
                             85 ;;	AKG6000.BIN/exemple.asm
   4084 01 00 70      [10]   86 	ld	bc,#0x7000
   4087 11 9C 40      [10]   87 	ld	de,#_effets ;;sfx
   408A CD 00 60      [17]   88 	call	#0x6000
                             89 ;;	restore Z80 state
   408D E1            [10]   90 	pop	hl
   408E D1            [10]   91 	pop	de
   408F C1            [10]   92 	pop	bc
   4090 F1            [10]   93 	pop	af
   4091 08            [ 4]   94 	ex	af, af' ;; '
   4092 D9            [ 4]   95 	exx
   4093 FD E1         [14]   96 	pop	iy
   4095 DD E1         [14]   97 	pop	ix
   4097 E1            [10]   98 	pop	hl
   4098 D1            [10]   99 	pop	de
   4099 C1            [10]  100 	pop	bc
   409A F1            [10]  101 	pop	af
   409B C9            [10]  102 	ret
   409C                     103 _effets:
   409C 00 00               104 	.dw #0x0000
   409E 00 00               105 	.dw #0x0000
   40A0 00                  106 	.db #0x00	; 0
   40A1 3D                  107 	.db #0x3d	; 61
   40A2 EF 00               108 	.dw #0x00ef
   40A4 39                  109 	.db #0x39	; 57	'9'
   40A5 EF 00               110 	.dw #0x00ef
   40A7 35                  111 	.db #0x35	; 53	'5'
   40A8 EF 00               112 	.dw #0x00ef
   40AA 04                  113 	.db #0x04	; 4
   40AB 00                  114 	.db #0x00	; 0
   40AC BD                  115 	.db #0xbd	; 189
   40AD 01                  116 	.db #0x01	; 1
   40AE 5F 00               117 	.dw #0x005f
   40B0 BD                  118 	.db #0xbd	; 189
   40B1 01                  119 	.db #0x01	; 1
   40B2 63 00               120 	.dw #0x0063
   40B4 B1                  121 	.db #0xb1	; 177
   40B5 01                  122 	.db #0x01	; 1
   40B6 66 00               123 	.dw #0x0066
   40B8 04                  124 	.db #0x04	; 4
   40B9 00                  125 	.db #0x00	; 0
   40BA 3D                  126 	.db #0x3d	; 61
   40BB EF 00               127 	.dw #0x00ef
   40BD 39                  128 	.db #0x39	; 57	'9'
   40BE EF 00               129 	.dw #0x00ef
   40C0 35                  130 	.db #0x35	; 53	'5'
   40C1 EF 00               131 	.dw #0x00ef
   40C3 04                  132 	.db #0x04	; 4
   40C4 01                  133 	.db #0x01	; 1
   40C5 BD                  134 	.db #0xbd	; 189
   40C6 01                  135 	.db #0x01	; 1
   40C7 2D 01               136 	.dw #0x012d
   40C9 BD                  137 	.db #0xbd	; 189
   40CA 08                  138 	.db #0x08	; 8
   40CB 3F 01               139 	.dw #0x013f
   40CD B9                  140 	.db #0xb9	; 185
   40CE 02                  141 	.db #0x02	; 2
   40CF 92 01               142 	.dw #0x0192
   40D1 04                  143 	.db #0x04	; 4
                            144 ;src/audio.c:105: void akp_musicPlay()
                            145 ;	---------------------------------
                            146 ; Function akp_musicPlay
                            147 ; ---------------------------------
   40D2                     148 _akp_musicPlay::
                            149 ;src/audio.c:138: __endasm;
                            150 ;;	backup Z80 state
   40D2 F5            [11]  151 	push	af
   40D3 C5            [11]  152 	push	bc
   40D4 D5            [11]  153 	push	de
   40D5 E5            [11]  154 	push	hl
   40D6 DD E5         [15]  155 	push	ix
   40D8 FD E5         [15]  156 	push	iy
   40DA D9            [ 4]  157 	exx
   40DB 08            [ 4]  158 	ex	af, af' ;; '
   40DC F5            [11]  159 	push	af
   40DD C5            [11]  160 	push	bc
   40DE D5            [11]  161 	push	de
   40DF E5            [11]  162 	push	hl
                            163 ;;	AKG6000.BIN/exemple.asm
   40E0 CD 03 60      [17]  164 	call	#0x6003
                            165 ;;	restore Z80 state
   40E3 E1            [10]  166 	pop	hl
   40E4 D1            [10]  167 	pop	de
   40E5 C1            [10]  168 	pop	bc
   40E6 F1            [10]  169 	pop	af
   40E7 08            [ 4]  170 	ex	af, af' ;; '
   40E8 D9            [ 4]  171 	exx
   40E9 FD E1         [14]  172 	pop	iy
   40EB DD E1         [14]  173 	pop	ix
   40ED E1            [10]  174 	pop	hl
   40EE D1            [10]  175 	pop	de
   40EF C1            [10]  176 	pop	bc
   40F0 F1            [10]  177 	pop	af
   40F1 C9            [10]  178 	ret
                            179 	.area _CODE
                            180 	.area _INITIALIZER
                            181 	.area _CABS (ABS)
