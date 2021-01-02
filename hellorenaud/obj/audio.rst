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
   41BA                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   41BA F5            [11]   52 	push	af
   41BB C5            [11]   53 	push	bc
   41BC D5            [11]   54 	push	de
   41BD E5            [11]   55 	push	hl
   41BE DD E5         [15]   56 	push	ix
   41C0 FD E5         [15]   57 	push	iy
   41C2 D9            [ 4]   58 	exx
   41C3 08            [ 4]   59 	ex	af, af' ;; '
   41C4 F5            [11]   60 	push	af
   41C5 C5            [11]   61 	push	bc
   41C6 D5            [11]   62 	push	de
   41C7 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   41C8 01 00 D0      [10]   65 	ld	bc,#0xD000
   41CB CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   41CE E1            [10]   68 	pop	hl
   41CF D1            [10]   69 	pop	de
   41D0 C1            [10]   70 	pop	bc
   41D1 F1            [10]   71 	pop	af
   41D2 08            [ 4]   72 	ex	af, af' ;; '
   41D3 D9            [ 4]   73 	exx
   41D4 FD E1         [14]   74 	pop	iy
   41D6 DD E1         [14]   75 	pop	ix
   41D8 E1            [10]   76 	pop	hl
   41D9 D1            [10]   77 	pop	de
   41DA C1            [10]   78 	pop	bc
   41DB F1            [10]   79 	pop	af
   41DC C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   41DD                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   41DD F5            [11]   88 	push	af
   41DE C5            [11]   89 	push	bc
   41DF D5            [11]   90 	push	de
   41E0 E5            [11]   91 	push	hl
   41E1 DD E5         [15]   92 	push	ix
   41E3 FD E5         [15]   93 	push	iy
   41E5 D9            [ 4]   94 	exx
   41E6 08            [ 4]   95 	ex	af, af' ;; '
   41E7 F5            [11]   96 	push	af
   41E8 C5            [11]   97 	push	bc
   41E9 D5            [11]   98 	push	de
   41EA E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   41EB CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   41EE E1            [10]  103 	pop	hl
   41EF D1            [10]  104 	pop	de
   41F0 C1            [10]  105 	pop	bc
   41F1 F1            [10]  106 	pop	af
   41F2 08            [ 4]  107 	ex	af, af' ;; '
   41F3 D9            [ 4]  108 	exx
   41F4 FD E1         [14]  109 	pop	iy
   41F6 DD E1         [14]  110 	pop	ix
   41F8 E1            [10]  111 	pop	hl
   41F9 D1            [10]  112 	pop	de
   41FA C1            [10]  113 	pop	bc
   41FB F1            [10]  114 	pop	af
   41FC C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   41FD                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   41FD F5            [11]  123 	push	af
   41FE C5            [11]  124 	push	bc
   41FF D5            [11]  125 	push	de
   4200 E5            [11]  126 	push	hl
   4201 DD E5         [15]  127 	push	ix
   4203 FD E5         [15]  128 	push	iy
   4205 D9            [ 4]  129 	exx
   4206 08            [ 4]  130 	ex	af, af' ;; '
   4207 F5            [11]  131 	push	af
   4208 C5            [11]  132 	push	bc
   4209 D5            [11]  133 	push	de
   420A E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   420B CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   420E E1            [10]  138 	pop	hl
   420F D1            [10]  139 	pop	de
   4210 C1            [10]  140 	pop	bc
   4211 F1            [10]  141 	pop	af
   4212 08            [ 4]  142 	ex	af, af' ;; '
   4213 D9            [ 4]  143 	exx
   4214 FD E1         [14]  144 	pop	iy
   4216 DD E1         [14]  145 	pop	ix
   4218 E1            [10]  146 	pop	hl
   4219 D1            [10]  147 	pop	de
   421A C1            [10]  148 	pop	bc
   421B F1            [10]  149 	pop	af
   421C C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
