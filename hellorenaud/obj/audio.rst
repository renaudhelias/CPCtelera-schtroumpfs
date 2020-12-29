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
   4034                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   4034 F5            [11]   52 	push	af
   4035 C5            [11]   53 	push	bc
   4036 D5            [11]   54 	push	de
   4037 E5            [11]   55 	push	hl
   4038 DD E5         [15]   56 	push	ix
   403A FD E5         [15]   57 	push	iy
   403C D9            [ 4]   58 	exx
   403D 08            [ 4]   59 	ex	af, af' ;; '
   403E F5            [11]   60 	push	af
   403F C5            [11]   61 	push	bc
   4040 D5            [11]   62 	push	de
   4041 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   4042 01 00 D0      [10]   65 	ld	bc,#0xD000
   4045 CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   4048 E1            [10]   68 	pop	hl
   4049 D1            [10]   69 	pop	de
   404A C1            [10]   70 	pop	bc
   404B F1            [10]   71 	pop	af
   404C 08            [ 4]   72 	ex	af, af' ;; '
   404D D9            [ 4]   73 	exx
   404E FD E1         [14]   74 	pop	iy
   4050 DD E1         [14]   75 	pop	ix
   4052 E1            [10]   76 	pop	hl
   4053 D1            [10]   77 	pop	de
   4054 C1            [10]   78 	pop	bc
   4055 F1            [10]   79 	pop	af
   4056 C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   4057                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   4057 F5            [11]   88 	push	af
   4058 C5            [11]   89 	push	bc
   4059 D5            [11]   90 	push	de
   405A E5            [11]   91 	push	hl
   405B DD E5         [15]   92 	push	ix
   405D FD E5         [15]   93 	push	iy
   405F D9            [ 4]   94 	exx
   4060 08            [ 4]   95 	ex	af, af' ;; '
   4061 F5            [11]   96 	push	af
   4062 C5            [11]   97 	push	bc
   4063 D5            [11]   98 	push	de
   4064 E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   4065 CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   4068 E1            [10]  103 	pop	hl
   4069 D1            [10]  104 	pop	de
   406A C1            [10]  105 	pop	bc
   406B F1            [10]  106 	pop	af
   406C 08            [ 4]  107 	ex	af, af' ;; '
   406D D9            [ 4]  108 	exx
   406E FD E1         [14]  109 	pop	iy
   4070 DD E1         [14]  110 	pop	ix
   4072 E1            [10]  111 	pop	hl
   4073 D1            [10]  112 	pop	de
   4074 C1            [10]  113 	pop	bc
   4075 F1            [10]  114 	pop	af
   4076 C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   4077                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   4077 F5            [11]  123 	push	af
   4078 C5            [11]  124 	push	bc
   4079 D5            [11]  125 	push	de
   407A E5            [11]  126 	push	hl
   407B DD E5         [15]  127 	push	ix
   407D FD E5         [15]  128 	push	iy
   407F D9            [ 4]  129 	exx
   4080 08            [ 4]  130 	ex	af, af' ;; '
   4081 F5            [11]  131 	push	af
   4082 C5            [11]  132 	push	bc
   4083 D5            [11]  133 	push	de
   4084 E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   4085 CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   4088 E1            [10]  138 	pop	hl
   4089 D1            [10]  139 	pop	de
   408A C1            [10]  140 	pop	bc
   408B F1            [10]  141 	pop	af
   408C 08            [ 4]  142 	ex	af, af' ;; '
   408D D9            [ 4]  143 	exx
   408E FD E1         [14]  144 	pop	iy
   4090 DD E1         [14]  145 	pop	ix
   4092 E1            [10]  146 	pop	hl
   4093 D1            [10]  147 	pop	de
   4094 C1            [10]  148 	pop	bc
   4095 F1            [10]  149 	pop	af
   4096 C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
