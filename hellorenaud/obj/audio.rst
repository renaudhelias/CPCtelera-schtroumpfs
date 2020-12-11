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
   4ACD                      23 _i::
   4ACD                      24 	.ds 2
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
   4055                      53 _akp_musicInit::
                             54 ;src/audio.c:53: i=i+1;
   4055 FD 21 CD 4A   [14]   55 	ld	iy, #_i
   4059 FD 34 00      [23]   56 	inc	0 (iy)
   405C 20 03         [12]   57 	jr	NZ,00103$
   405E FD 34 01      [23]   58 	inc	1 (iy)
   4061                      59 00103$:
                             60 ;src/audio.c:111: __endasm;
                             61 ;;	backup Z80 state
   4061 F5            [11]   62 	push	af
   4062 C5            [11]   63 	push	bc
   4063 D5            [11]   64 	push	de
   4064 E5            [11]   65 	push	hl
   4065 DD E5         [15]   66 	push	ix
   4067 FD E5         [15]   67 	push	iy
   4069 D9            [ 4]   68 	exx
   406A 08            [ 4]   69 	ex	af, af' ;; '
   406B F5            [11]   70 	push	af
   406C C5            [11]   71 	push	bc
   406D D5            [11]   72 	push	de
   406E E5            [11]   73 	push	hl
   406F 01 99 40      [10]   74 	ld	bc,#_effets1 ;; OK
   4072 ED 43 99 40   [20]   75 	ld	(#_effets1),bc ;; OK
   4076 03            [ 6]   76 	inc	bc
   4077 03            [ 6]   77 	inc	bc
   4078 11 DE 40      [10]   78 	ld	de,#_effets2
   407B 7A            [ 4]   79 	ld	a,d
   407C 02            [ 7]   80 	LD	(bc),a
   407D 03            [ 6]   81 	inc	bc
   407E 7B            [ 4]   82 	ld	a,e
   407F 02            [ 7]   83 	LD	(bc),a
   4080 03            [ 6]   84 	inc	bc
                             85 ;;	AKG6000.BIN/exemple.asm
   4081 01 00 70      [10]   86 	ld	bc,#0x7000
   4084 11 99 40      [10]   87 	ld	de,#_effets1 ;;sfx
   4087 CD 00 60      [17]   88 	call	#0x6000
                             89 ;;	restore Z80 state
   408A E1            [10]   90 	pop	hl
   408B D1            [10]   91 	pop	de
   408C C1            [10]   92 	pop	bc
   408D F1            [10]   93 	pop	af
   408E 08            [ 4]   94 	ex	af, af' ;; '
   408F D9            [ 4]   95 	exx
   4090 FD E1         [14]   96 	pop	iy
   4092 DD E1         [14]   97 	pop	ix
   4094 E1            [10]   98 	pop	hl
   4095 D1            [10]   99 	pop	de
   4096 C1            [10]  100 	pop	bc
   4097 F1            [10]  101 	pop	af
   4098 C9            [10]  102 	ret
   4099                     103 _effets1:
   4099 00 00               104 	.dw #0x0000
   409B 00 00               105 	.dw #0x0000
   409D 00                  106 	.db #0x00	; 0
   409E 3D                  107 	.db #0x3d	; 61
   409F EF 00               108 	.dw #0x00ef
   40A1 39                  109 	.db #0x39	; 57	'9'
   40A2 EF 00               110 	.dw #0x00ef
   40A4 35                  111 	.db #0x35	; 53	'5'
   40A5 EF 00               112 	.dw #0x00ef
   40A7 31                  113 	.db #0x31	; 49	'1'
   40A8 EF 00               114 	.dw #0x00ef
   40AA C7                  115 	.db #0xc7	; 199
   40AB EF 00               116 	.dw #0x00ef
   40AD 29                  117 	.db #0x29	; 41
   40AE EF 00               118 	.dw #0x00ef
   40B0 25                  119 	.db #0x25	; 37
   40B1 EF 00               120 	.dw #0x00ef
   40B3 21                  121 	.db #0x21	; 33
   40B4 EF 00               122 	.dw #0x00ef
   40B6 1D                  123 	.db #0x1d	; 29
   40B7 EF 00               124 	.dw #0x00ef
   40B9 19                  125 	.db #0x19	; 25
   40BA EF 00               126 	.dw #0x00ef
   40BC 15                  127 	.db #0x15	; 21
   40BD 53 01               128 	.dw #0x0153
   40BF 11                  129 	.db #0x11	; 17
   40C0 EF 00               130 	.dw #0x00ef
   40C2 0D                  131 	.db #0x0d	; 13
   40C3 EF 00               132 	.dw #0x00ef
   40C5 09                  133 	.db #0x09	; 9
   40C6 EF 00               134 	.dw #0x00ef
   40C8 05                  135 	.db #0x05	; 5
   40C9 EF 00               136 	.dw #0x00ef
   40CB 04                  137 	.db #0x04	; 4
   40CC 00                  138 	.db #0x00	; 0
   40CD BD                  139 	.db #0xbd	; 189
   40CE 01                  140 	.db #0x01	; 1
   40CF 5F 00               141 	.dw #0x005f
   40D1 BD                  142 	.db #0xbd	; 189
   40D2 01                  143 	.db #0x01	; 1
   40D3 63 00               144 	.dw #0x0063
   40D5 B1                  145 	.db #0xb1	; 177
   40D6 01                  146 	.db #0x01	; 1
   40D7 66 00               147 	.dw #0x0066
   40D9 AD                  148 	.db #0xad	; 173
   40DA 01                  149 	.db #0x01	; 1
   40DB 6A 00               150 	.dw #0x006a
   40DD 04                  151 	.db #0x04	; 4
   40DE                     152 _effets2:
   40DE 00                  153 	.db #0x00	; 0
   40DF BD                  154 	.db #0xbd	; 189
   40E0 01                  155 	.db #0x01	; 1
   40E1 2D 01               156 	.dw #0x012d
   40E3 BD                  157 	.db #0xbd	; 189
   40E4 08                  158 	.db #0x08	; 8
   40E5 3F 01               159 	.dw #0x013f
   40E7 B9                  160 	.db #0xb9	; 185
   40E8 02                  161 	.db #0x02	; 2
   40E9 92 01               162 	.dw #0x0192
   40EB B5                  163 	.db #0xb5	; 181
   40EC 10                  164 	.db #0x10	; 16
   40ED D5 00               165 	.dw #0x00d5
   40EF B1                  166 	.db #0xb1	; 177
   40F0 02                  167 	.db #0x02	; 2
   40F1 E1 00               168 	.dw #0x00e1
   40F3 AD                  169 	.db #0xad	; 173
   40F4 02                  170 	.db #0x02	; 2
   40F5 EF 00               171 	.dw #0x00ef
   40F7 A5                  172 	.db #0xa5	; 165
   40F8 10                  173 	.db #0x10	; 16
   40F9 66 01               174 	.dw #0x0166
   40FB 9D                  175 	.db #0x9d	; 157
   40FC 1F                  176 	.db #0x1f	; 31
   40FD 77 00               177 	.dw #0x0077
   40FF 99                  178 	.db #0x99	; 153
   4100 07                  179 	.db #0x07	; 7
   4101 50 00               180 	.dw #0x0050
   4103 04                  181 	.db #0x04	; 4
                            182 ;src/audio.c:114: void akp_musicPlay()
                            183 ;	---------------------------------
                            184 ; Function akp_musicPlay
                            185 ; ---------------------------------
   4104                     186 _akp_musicPlay::
                            187 ;src/audio.c:147: __endasm;
                            188 ;;	backup Z80 state
   4104 F5            [11]  189 	push	af
   4105 C5            [11]  190 	push	bc
   4106 D5            [11]  191 	push	de
   4107 E5            [11]  192 	push	hl
   4108 DD E5         [15]  193 	push	ix
   410A FD E5         [15]  194 	push	iy
   410C D9            [ 4]  195 	exx
   410D 08            [ 4]  196 	ex	af, af' ;; '
   410E F5            [11]  197 	push	af
   410F C5            [11]  198 	push	bc
   4110 D5            [11]  199 	push	de
   4111 E5            [11]  200 	push	hl
                            201 ;;	AKG6000.BIN/exemple.asm
   4112 CD 03 60      [17]  202 	call	#0x6003
                            203 ;;	restore Z80 state
   4115 E1            [10]  204 	pop	hl
   4116 D1            [10]  205 	pop	de
   4117 C1            [10]  206 	pop	bc
   4118 F1            [10]  207 	pop	af
   4119 08            [ 4]  208 	ex	af, af' ;; '
   411A D9            [ 4]  209 	exx
   411B FD E1         [14]  210 	pop	iy
   411D DD E1         [14]  211 	pop	ix
   411F E1            [10]  212 	pop	hl
   4120 D1            [10]  213 	pop	de
   4121 C1            [10]  214 	pop	bc
   4122 F1            [10]  215 	pop	af
   4123 C9            [10]  216 	ret
                            217 	.area _CODE
                            218 	.area _INITIALIZER
                            219 	.area _CABS (ABS)
