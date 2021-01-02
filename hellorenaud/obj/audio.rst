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
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 ;src/audio.c:10: void akp_musicInit()
                             46 ;	---------------------------------
                             47 ; Function akp_musicInit
                             48 ; ---------------------------------
   41C1                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   41C1 F5            [11]   52 	push	af
   41C2 C5            [11]   53 	push	bc
   41C3 D5            [11]   54 	push	de
   41C4 E5            [11]   55 	push	hl
   41C5 DD E5         [15]   56 	push	ix
   41C7 FD E5         [15]   57 	push	iy
   41C9 D9            [ 4]   58 	exx
   41CA 08            [ 4]   59 	ex	af, af' ;; '
   41CB F5            [11]   60 	push	af
   41CC C5            [11]   61 	push	bc
   41CD D5            [11]   62 	push	de
   41CE E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   41CF 01 00 D0      [10]   65 	ld	bc,#0xD000
   41D2 CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   41D5 E1            [10]   68 	pop	hl
   41D6 D1            [10]   69 	pop	de
   41D7 C1            [10]   70 	pop	bc
   41D8 F1            [10]   71 	pop	af
   41D9 08            [ 4]   72 	ex	af, af' ;; '
   41DA D9            [ 4]   73 	exx
   41DB FD E1         [14]   74 	pop	iy
   41DD DD E1         [14]   75 	pop	ix
   41DF E1            [10]   76 	pop	hl
   41E0 D1            [10]   77 	pop	de
   41E1 C1            [10]   78 	pop	bc
   41E2 F1            [10]   79 	pop	af
   41E3 C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   41E4                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   41E4 F5            [11]   88 	push	af
   41E5 C5            [11]   89 	push	bc
   41E6 D5            [11]   90 	push	de
   41E7 E5            [11]   91 	push	hl
   41E8 DD E5         [15]   92 	push	ix
   41EA FD E5         [15]   93 	push	iy
   41EC D9            [ 4]   94 	exx
   41ED 08            [ 4]   95 	ex	af, af' ;; '
   41EE F5            [11]   96 	push	af
   41EF C5            [11]   97 	push	bc
   41F0 D5            [11]   98 	push	de
   41F1 E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   41F2 CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   41F5 E1            [10]  103 	pop	hl
   41F6 D1            [10]  104 	pop	de
   41F7 C1            [10]  105 	pop	bc
   41F8 F1            [10]  106 	pop	af
   41F9 08            [ 4]  107 	ex	af, af' ;; '
   41FA D9            [ 4]  108 	exx
   41FB FD E1         [14]  109 	pop	iy
   41FD DD E1         [14]  110 	pop	ix
   41FF E1            [10]  111 	pop	hl
   4200 D1            [10]  112 	pop	de
   4201 C1            [10]  113 	pop	bc
   4202 F1            [10]  114 	pop	af
   4203 C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   4204                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   4204 F5            [11]  123 	push	af
   4205 C5            [11]  124 	push	bc
   4206 D5            [11]  125 	push	de
   4207 E5            [11]  126 	push	hl
   4208 DD E5         [15]  127 	push	ix
   420A FD E5         [15]  128 	push	iy
   420C D9            [ 4]  129 	exx
   420D 08            [ 4]  130 	ex	af, af' ;; '
   420E F5            [11]  131 	push	af
   420F C5            [11]  132 	push	bc
   4210 D5            [11]  133 	push	de
   4211 E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   4212 CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   4215 E1            [10]  138 	pop	hl
   4216 D1            [10]  139 	pop	de
   4217 C1            [10]  140 	pop	bc
   4218 F1            [10]  141 	pop	af
   4219 08            [ 4]  142 	ex	af, af' ;; '
   421A D9            [ 4]  143 	exx
   421B FD E1         [14]  144 	pop	iy
   421D DD E1         [14]  145 	pop	ix
   421F E1            [10]  146 	pop	hl
   4220 D1            [10]  147 	pop	de
   4221 C1            [10]  148 	pop	bc
   4222 F1            [10]  149 	pop	af
   4223 C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
