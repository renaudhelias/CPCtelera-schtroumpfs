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
   40AD                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   40AD F5            [11]   52 	push	af
   40AE C5            [11]   53 	push	bc
   40AF D5            [11]   54 	push	de
   40B0 E5            [11]   55 	push	hl
   40B1 DD E5         [15]   56 	push	ix
   40B3 FD E5         [15]   57 	push	iy
   40B5 D9            [ 4]   58 	exx
   40B6 08            [ 4]   59 	ex	af, af' ;; '
   40B7 F5            [11]   60 	push	af
   40B8 C5            [11]   61 	push	bc
   40B9 D5            [11]   62 	push	de
   40BA E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   40BB 01 00 D0      [10]   65 	ld	bc,#0xD000
   40BE CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   40C1 E1            [10]   68 	pop	hl
   40C2 D1            [10]   69 	pop	de
   40C3 C1            [10]   70 	pop	bc
   40C4 F1            [10]   71 	pop	af
   40C5 08            [ 4]   72 	ex	af, af' ;; '
   40C6 D9            [ 4]   73 	exx
   40C7 FD E1         [14]   74 	pop	iy
   40C9 DD E1         [14]   75 	pop	ix
   40CB E1            [10]   76 	pop	hl
   40CC D1            [10]   77 	pop	de
   40CD C1            [10]   78 	pop	bc
   40CE F1            [10]   79 	pop	af
   40CF C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   40D0                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   40D0 F5            [11]   88 	push	af
   40D1 C5            [11]   89 	push	bc
   40D2 D5            [11]   90 	push	de
   40D3 E5            [11]   91 	push	hl
   40D4 DD E5         [15]   92 	push	ix
   40D6 FD E5         [15]   93 	push	iy
   40D8 D9            [ 4]   94 	exx
   40D9 08            [ 4]   95 	ex	af, af' ;; '
   40DA F5            [11]   96 	push	af
   40DB C5            [11]   97 	push	bc
   40DC D5            [11]   98 	push	de
   40DD E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   40DE CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   40E1 E1            [10]  103 	pop	hl
   40E2 D1            [10]  104 	pop	de
   40E3 C1            [10]  105 	pop	bc
   40E4 F1            [10]  106 	pop	af
   40E5 08            [ 4]  107 	ex	af, af' ;; '
   40E6 D9            [ 4]  108 	exx
   40E7 FD E1         [14]  109 	pop	iy
   40E9 DD E1         [14]  110 	pop	ix
   40EB E1            [10]  111 	pop	hl
   40EC D1            [10]  112 	pop	de
   40ED C1            [10]  113 	pop	bc
   40EE F1            [10]  114 	pop	af
   40EF C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   40F0                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   40F0 F5            [11]  123 	push	af
   40F1 C5            [11]  124 	push	bc
   40F2 D5            [11]  125 	push	de
   40F3 E5            [11]  126 	push	hl
   40F4 DD E5         [15]  127 	push	ix
   40F6 FD E5         [15]  128 	push	iy
   40F8 D9            [ 4]  129 	exx
   40F9 08            [ 4]  130 	ex	af, af' ;; '
   40FA F5            [11]  131 	push	af
   40FB C5            [11]  132 	push	bc
   40FC D5            [11]  133 	push	de
   40FD E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   40FE CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   4101 E1            [10]  138 	pop	hl
   4102 D1            [10]  139 	pop	de
   4103 C1            [10]  140 	pop	bc
   4104 F1            [10]  141 	pop	af
   4105 08            [ 4]  142 	ex	af, af' ;; '
   4106 D9            [ 4]  143 	exx
   4107 FD E1         [14]  144 	pop	iy
   4109 DD E1         [14]  145 	pop	ix
   410B E1            [10]  146 	pop	hl
   410C D1            [10]  147 	pop	de
   410D C1            [10]  148 	pop	bc
   410E F1            [10]  149 	pop	af
   410F C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
