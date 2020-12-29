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
   40AA                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   40AA F5            [11]   52 	push	af
   40AB C5            [11]   53 	push	bc
   40AC D5            [11]   54 	push	de
   40AD E5            [11]   55 	push	hl
   40AE DD E5         [15]   56 	push	ix
   40B0 FD E5         [15]   57 	push	iy
   40B2 D9            [ 4]   58 	exx
   40B3 08            [ 4]   59 	ex	af, af' ;; '
   40B4 F5            [11]   60 	push	af
   40B5 C5            [11]   61 	push	bc
   40B6 D5            [11]   62 	push	de
   40B7 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   40B8 01 00 D0      [10]   65 	ld	bc,#0xD000
   40BB CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   40BE E1            [10]   68 	pop	hl
   40BF D1            [10]   69 	pop	de
   40C0 C1            [10]   70 	pop	bc
   40C1 F1            [10]   71 	pop	af
   40C2 08            [ 4]   72 	ex	af, af' ;; '
   40C3 D9            [ 4]   73 	exx
   40C4 FD E1         [14]   74 	pop	iy
   40C6 DD E1         [14]   75 	pop	ix
   40C8 E1            [10]   76 	pop	hl
   40C9 D1            [10]   77 	pop	de
   40CA C1            [10]   78 	pop	bc
   40CB F1            [10]   79 	pop	af
   40CC C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   40CD                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   40CD F5            [11]   88 	push	af
   40CE C5            [11]   89 	push	bc
   40CF D5            [11]   90 	push	de
   40D0 E5            [11]   91 	push	hl
   40D1 DD E5         [15]   92 	push	ix
   40D3 FD E5         [15]   93 	push	iy
   40D5 D9            [ 4]   94 	exx
   40D6 08            [ 4]   95 	ex	af, af' ;; '
   40D7 F5            [11]   96 	push	af
   40D8 C5            [11]   97 	push	bc
   40D9 D5            [11]   98 	push	de
   40DA E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   40DB CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   40DE E1            [10]  103 	pop	hl
   40DF D1            [10]  104 	pop	de
   40E0 C1            [10]  105 	pop	bc
   40E1 F1            [10]  106 	pop	af
   40E2 08            [ 4]  107 	ex	af, af' ;; '
   40E3 D9            [ 4]  108 	exx
   40E4 FD E1         [14]  109 	pop	iy
   40E6 DD E1         [14]  110 	pop	ix
   40E8 E1            [10]  111 	pop	hl
   40E9 D1            [10]  112 	pop	de
   40EA C1            [10]  113 	pop	bc
   40EB F1            [10]  114 	pop	af
   40EC C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   40ED                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   40ED F5            [11]  123 	push	af
   40EE C5            [11]  124 	push	bc
   40EF D5            [11]  125 	push	de
   40F0 E5            [11]  126 	push	hl
   40F1 DD E5         [15]  127 	push	ix
   40F3 FD E5         [15]  128 	push	iy
   40F5 D9            [ 4]  129 	exx
   40F6 08            [ 4]  130 	ex	af, af' ;; '
   40F7 F5            [11]  131 	push	af
   40F8 C5            [11]  132 	push	bc
   40F9 D5            [11]  133 	push	de
   40FA E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   40FB CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   40FE E1            [10]  138 	pop	hl
   40FF D1            [10]  139 	pop	de
   4100 C1            [10]  140 	pop	bc
   4101 F1            [10]  141 	pop	af
   4102 08            [ 4]  142 	ex	af, af' ;; '
   4103 D9            [ 4]  143 	exx
   4104 FD E1         [14]  144 	pop	iy
   4106 DD E1         [14]  145 	pop	ix
   4108 E1            [10]  146 	pop	hl
   4109 D1            [10]  147 	pop	de
   410A C1            [10]  148 	pop	bc
   410B F1            [10]  149 	pop	af
   410C C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
