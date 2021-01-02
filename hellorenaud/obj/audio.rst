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
   4197                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   4197 F5            [11]   52 	push	af
   4198 C5            [11]   53 	push	bc
   4199 D5            [11]   54 	push	de
   419A E5            [11]   55 	push	hl
   419B DD E5         [15]   56 	push	ix
   419D FD E5         [15]   57 	push	iy
   419F D9            [ 4]   58 	exx
   41A0 08            [ 4]   59 	ex	af, af' ;; '
   41A1 F5            [11]   60 	push	af
   41A2 C5            [11]   61 	push	bc
   41A3 D5            [11]   62 	push	de
   41A4 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   41A5 01 00 D0      [10]   65 	ld	bc,#0xD000
   41A8 CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   41AB E1            [10]   68 	pop	hl
   41AC D1            [10]   69 	pop	de
   41AD C1            [10]   70 	pop	bc
   41AE F1            [10]   71 	pop	af
   41AF 08            [ 4]   72 	ex	af, af' ;; '
   41B0 D9            [ 4]   73 	exx
   41B1 FD E1         [14]   74 	pop	iy
   41B3 DD E1         [14]   75 	pop	ix
   41B5 E1            [10]   76 	pop	hl
   41B6 D1            [10]   77 	pop	de
   41B7 C1            [10]   78 	pop	bc
   41B8 F1            [10]   79 	pop	af
   41B9 C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   41BA                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   41BA F5            [11]   88 	push	af
   41BB C5            [11]   89 	push	bc
   41BC D5            [11]   90 	push	de
   41BD E5            [11]   91 	push	hl
   41BE DD E5         [15]   92 	push	ix
   41C0 FD E5         [15]   93 	push	iy
   41C2 D9            [ 4]   94 	exx
   41C3 08            [ 4]   95 	ex	af, af' ;; '
   41C4 F5            [11]   96 	push	af
   41C5 C5            [11]   97 	push	bc
   41C6 D5            [11]   98 	push	de
   41C7 E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   41C8 CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   41CB E1            [10]  103 	pop	hl
   41CC D1            [10]  104 	pop	de
   41CD C1            [10]  105 	pop	bc
   41CE F1            [10]  106 	pop	af
   41CF 08            [ 4]  107 	ex	af, af' ;; '
   41D0 D9            [ 4]  108 	exx
   41D1 FD E1         [14]  109 	pop	iy
   41D3 DD E1         [14]  110 	pop	ix
   41D5 E1            [10]  111 	pop	hl
   41D6 D1            [10]  112 	pop	de
   41D7 C1            [10]  113 	pop	bc
   41D8 F1            [10]  114 	pop	af
   41D9 C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   41DA                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   41DA F5            [11]  123 	push	af
   41DB C5            [11]  124 	push	bc
   41DC D5            [11]  125 	push	de
   41DD E5            [11]  126 	push	hl
   41DE DD E5         [15]  127 	push	ix
   41E0 FD E5         [15]  128 	push	iy
   41E2 D9            [ 4]  129 	exx
   41E3 08            [ 4]  130 	ex	af, af' ;; '
   41E4 F5            [11]  131 	push	af
   41E5 C5            [11]  132 	push	bc
   41E6 D5            [11]  133 	push	de
   41E7 E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   41E8 CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   41EB E1            [10]  138 	pop	hl
   41EC D1            [10]  139 	pop	de
   41ED C1            [10]  140 	pop	bc
   41EE F1            [10]  141 	pop	af
   41EF 08            [ 4]  142 	ex	af, af' ;; '
   41F0 D9            [ 4]  143 	exx
   41F1 FD E1         [14]  144 	pop	iy
   41F3 DD E1         [14]  145 	pop	ix
   41F5 E1            [10]  146 	pop	hl
   41F6 D1            [10]  147 	pop	de
   41F7 C1            [10]  148 	pop	bc
   41F8 F1            [10]  149 	pop	af
   41F9 C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
