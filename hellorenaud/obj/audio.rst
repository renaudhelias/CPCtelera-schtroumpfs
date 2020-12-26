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
                             45 ;src/audio.c:8: void akp_musicInit()
                             46 ;	---------------------------------
                             47 ; Function akp_musicInit
                             48 ; ---------------------------------
   3FE9                      49 _akp_musicInit::
                             50 ;src/audio.c:48: __endasm;
                             51 ;;	backup Z80 state
   3FE9 F5            [11]   52 	push	af
   3FEA C5            [11]   53 	push	bc
   3FEB D5            [11]   54 	push	de
   3FEC E5            [11]   55 	push	hl
   3FED DD E5         [15]   56 	push	ix
   3FEF FD E5         [15]   57 	push	iy
   3FF1 D9            [ 4]   58 	exx
   3FF2 08            [ 4]   59 	ex	af, af' ;; '
   3FF3 F5            [11]   60 	push	af
   3FF4 C5            [11]   61 	push	bc
   3FF5 D5            [11]   62 	push	de
   3FF6 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   3FF7 01 00 D0      [10]   65 	ld	bc,#0xD000
   3FFA CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   3FFD E1            [10]   68 	pop	hl
   3FFE D1            [10]   69 	pop	de
   3FFF C1            [10]   70 	pop	bc
   4000 F1            [10]   71 	pop	af
   4001 08            [ 4]   72 	ex	af, af' ;; '
   4002 D9            [ 4]   73 	exx
   4003 FD E1         [14]   74 	pop	iy
   4005 DD E1         [14]   75 	pop	ix
   4007 E1            [10]   76 	pop	hl
   4008 D1            [10]   77 	pop	de
   4009 C1            [10]   78 	pop	bc
   400A F1            [10]   79 	pop	af
   400B C9            [10]   80 	ret
                             81 ;src/audio.c:51: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   400C                      85 _akp_musicPlay::
                             86 ;src/audio.c:84: __endasm;
                             87 ;;	backup Z80 state
   400C F5            [11]   88 	push	af
   400D C5            [11]   89 	push	bc
   400E D5            [11]   90 	push	de
   400F E5            [11]   91 	push	hl
   4010 DD E5         [15]   92 	push	ix
   4012 FD E5         [15]   93 	push	iy
   4014 D9            [ 4]   94 	exx
   4015 08            [ 4]   95 	ex	af, af' ;; '
   4016 F5            [11]   96 	push	af
   4017 C5            [11]   97 	push	bc
   4018 D5            [11]   98 	push	de
   4019 E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   401A CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   401D E1            [10]  103 	pop	hl
   401E D1            [10]  104 	pop	de
   401F C1            [10]  105 	pop	bc
   4020 F1            [10]  106 	pop	af
   4021 08            [ 4]  107 	ex	af, af' ;; '
   4022 D9            [ 4]  108 	exx
   4023 FD E1         [14]  109 	pop	iy
   4025 DD E1         [14]  110 	pop	ix
   4027 E1            [10]  111 	pop	hl
   4028 D1            [10]  112 	pop	de
   4029 C1            [10]  113 	pop	bc
   402A F1            [10]  114 	pop	af
   402B C9            [10]  115 	ret
                            116 ;src/audio.c:87: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   402C                     120 _akp_sfxPlay::
                            121 ;src/audio.c:120: __endasm;
                            122 ;;	backup Z80 state
   402C F5            [11]  123 	push	af
   402D C5            [11]  124 	push	bc
   402E D5            [11]  125 	push	de
   402F E5            [11]  126 	push	hl
   4030 DD E5         [15]  127 	push	ix
   4032 FD E5         [15]  128 	push	iy
   4034 D9            [ 4]  129 	exx
   4035 08            [ 4]  130 	ex	af, af' ;; '
   4036 F5            [11]  131 	push	af
   4037 C5            [11]  132 	push	bc
   4038 D5            [11]  133 	push	de
   4039 E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   403A CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   403D E1            [10]  138 	pop	hl
   403E D1            [10]  139 	pop	de
   403F C1            [10]  140 	pop	bc
   4040 F1            [10]  141 	pop	af
   4041 08            [ 4]  142 	ex	af, af' ;; '
   4042 D9            [ 4]  143 	exx
   4043 FD E1         [14]  144 	pop	iy
   4045 DD E1         [14]  145 	pop	ix
   4047 E1            [10]  146 	pop	hl
   4048 D1            [10]  147 	pop	de
   4049 C1            [10]  148 	pop	bc
   404A F1            [10]  149 	pop	af
   404B C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
