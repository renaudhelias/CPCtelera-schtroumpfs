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
   4049                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   4049 F5            [11]   52 	push	af
   404A C5            [11]   53 	push	bc
   404B D5            [11]   54 	push	de
   404C E5            [11]   55 	push	hl
   404D DD E5         [15]   56 	push	ix
   404F FD E5         [15]   57 	push	iy
   4051 D9            [ 4]   58 	exx
   4052 08            [ 4]   59 	ex	af, af' ;; '
   4053 F5            [11]   60 	push	af
   4054 C5            [11]   61 	push	bc
   4055 D5            [11]   62 	push	de
   4056 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   4057 01 00 D0      [10]   65 	ld	bc,#0xD000
   405A CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   405D E1            [10]   68 	pop	hl
   405E D1            [10]   69 	pop	de
   405F C1            [10]   70 	pop	bc
   4060 F1            [10]   71 	pop	af
   4061 08            [ 4]   72 	ex	af, af' ;; '
   4062 D9            [ 4]   73 	exx
   4063 FD E1         [14]   74 	pop	iy
   4065 DD E1         [14]   75 	pop	ix
   4067 E1            [10]   76 	pop	hl
   4068 D1            [10]   77 	pop	de
   4069 C1            [10]   78 	pop	bc
   406A F1            [10]   79 	pop	af
   406B C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   406C                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   406C F5            [11]   88 	push	af
   406D C5            [11]   89 	push	bc
   406E D5            [11]   90 	push	de
   406F E5            [11]   91 	push	hl
   4070 DD E5         [15]   92 	push	ix
   4072 FD E5         [15]   93 	push	iy
   4074 D9            [ 4]   94 	exx
   4075 08            [ 4]   95 	ex	af, af' ;; '
   4076 F5            [11]   96 	push	af
   4077 C5            [11]   97 	push	bc
   4078 D5            [11]   98 	push	de
   4079 E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   407A CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   407D E1            [10]  103 	pop	hl
   407E D1            [10]  104 	pop	de
   407F C1            [10]  105 	pop	bc
   4080 F1            [10]  106 	pop	af
   4081 08            [ 4]  107 	ex	af, af' ;; '
   4082 D9            [ 4]  108 	exx
   4083 FD E1         [14]  109 	pop	iy
   4085 DD E1         [14]  110 	pop	ix
   4087 E1            [10]  111 	pop	hl
   4088 D1            [10]  112 	pop	de
   4089 C1            [10]  113 	pop	bc
   408A F1            [10]  114 	pop	af
   408B C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   408C                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   408C F5            [11]  123 	push	af
   408D C5            [11]  124 	push	bc
   408E D5            [11]  125 	push	de
   408F E5            [11]  126 	push	hl
   4090 DD E5         [15]  127 	push	ix
   4092 FD E5         [15]  128 	push	iy
   4094 D9            [ 4]  129 	exx
   4095 08            [ 4]  130 	ex	af, af' ;; '
   4096 F5            [11]  131 	push	af
   4097 C5            [11]  132 	push	bc
   4098 D5            [11]  133 	push	de
   4099 E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   409A CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   409D E1            [10]  138 	pop	hl
   409E D1            [10]  139 	pop	de
   409F C1            [10]  140 	pop	bc
   40A0 F1            [10]  141 	pop	af
   40A1 08            [ 4]  142 	ex	af, af' ;; '
   40A2 D9            [ 4]  143 	exx
   40A3 FD E1         [14]  144 	pop	iy
   40A5 DD E1         [14]  145 	pop	ix
   40A7 E1            [10]  146 	pop	hl
   40A8 D1            [10]  147 	pop	de
   40A9 C1            [10]  148 	pop	bc
   40AA F1            [10]  149 	pop	af
   40AB C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
