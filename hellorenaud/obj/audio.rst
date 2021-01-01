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
   4174                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   4174 F5            [11]   52 	push	af
   4175 C5            [11]   53 	push	bc
   4176 D5            [11]   54 	push	de
   4177 E5            [11]   55 	push	hl
   4178 DD E5         [15]   56 	push	ix
   417A FD E5         [15]   57 	push	iy
   417C D9            [ 4]   58 	exx
   417D 08            [ 4]   59 	ex	af, af' ;; '
   417E F5            [11]   60 	push	af
   417F C5            [11]   61 	push	bc
   4180 D5            [11]   62 	push	de
   4181 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   4182 01 00 D0      [10]   65 	ld	bc,#0xD000
   4185 CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   4188 E1            [10]   68 	pop	hl
   4189 D1            [10]   69 	pop	de
   418A C1            [10]   70 	pop	bc
   418B F1            [10]   71 	pop	af
   418C 08            [ 4]   72 	ex	af, af' ;; '
   418D D9            [ 4]   73 	exx
   418E FD E1         [14]   74 	pop	iy
   4190 DD E1         [14]   75 	pop	ix
   4192 E1            [10]   76 	pop	hl
   4193 D1            [10]   77 	pop	de
   4194 C1            [10]   78 	pop	bc
   4195 F1            [10]   79 	pop	af
   4196 C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   4197                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   4197 F5            [11]   88 	push	af
   4198 C5            [11]   89 	push	bc
   4199 D5            [11]   90 	push	de
   419A E5            [11]   91 	push	hl
   419B DD E5         [15]   92 	push	ix
   419D FD E5         [15]   93 	push	iy
   419F D9            [ 4]   94 	exx
   41A0 08            [ 4]   95 	ex	af, af' ;; '
   41A1 F5            [11]   96 	push	af
   41A2 C5            [11]   97 	push	bc
   41A3 D5            [11]   98 	push	de
   41A4 E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   41A5 CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   41A8 E1            [10]  103 	pop	hl
   41A9 D1            [10]  104 	pop	de
   41AA C1            [10]  105 	pop	bc
   41AB F1            [10]  106 	pop	af
   41AC 08            [ 4]  107 	ex	af, af' ;; '
   41AD D9            [ 4]  108 	exx
   41AE FD E1         [14]  109 	pop	iy
   41B0 DD E1         [14]  110 	pop	ix
   41B2 E1            [10]  111 	pop	hl
   41B3 D1            [10]  112 	pop	de
   41B4 C1            [10]  113 	pop	bc
   41B5 F1            [10]  114 	pop	af
   41B6 C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   41B7                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   41B7 F5            [11]  123 	push	af
   41B8 C5            [11]  124 	push	bc
   41B9 D5            [11]  125 	push	de
   41BA E5            [11]  126 	push	hl
   41BB DD E5         [15]  127 	push	ix
   41BD FD E5         [15]  128 	push	iy
   41BF D9            [ 4]  129 	exx
   41C0 08            [ 4]  130 	ex	af, af' ;; '
   41C1 F5            [11]  131 	push	af
   41C2 C5            [11]  132 	push	bc
   41C3 D5            [11]  133 	push	de
   41C4 E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   41C5 CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   41C8 E1            [10]  138 	pop	hl
   41C9 D1            [10]  139 	pop	de
   41CA C1            [10]  140 	pop	bc
   41CB F1            [10]  141 	pop	af
   41CC 08            [ 4]  142 	ex	af, af' ;; '
   41CD D9            [ 4]  143 	exx
   41CE FD E1         [14]  144 	pop	iy
   41D0 DD E1         [14]  145 	pop	ix
   41D2 E1            [10]  146 	pop	hl
   41D3 D1            [10]  147 	pop	de
   41D4 C1            [10]  148 	pop	bc
   41D5 F1            [10]  149 	pop	af
   41D6 C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
