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
   413F                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   413F F5            [11]   52 	push	af
   4140 C5            [11]   53 	push	bc
   4141 D5            [11]   54 	push	de
   4142 E5            [11]   55 	push	hl
   4143 DD E5         [15]   56 	push	ix
   4145 FD E5         [15]   57 	push	iy
   4147 D9            [ 4]   58 	exx
   4148 08            [ 4]   59 	ex	af, af' ;; '
   4149 F5            [11]   60 	push	af
   414A C5            [11]   61 	push	bc
   414B D5            [11]   62 	push	de
   414C E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   414D 01 00 D0      [10]   65 	ld	bc,#0xD000
   4150 CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   4153 E1            [10]   68 	pop	hl
   4154 D1            [10]   69 	pop	de
   4155 C1            [10]   70 	pop	bc
   4156 F1            [10]   71 	pop	af
   4157 08            [ 4]   72 	ex	af, af' ;; '
   4158 D9            [ 4]   73 	exx
   4159 FD E1         [14]   74 	pop	iy
   415B DD E1         [14]   75 	pop	ix
   415D E1            [10]   76 	pop	hl
   415E D1            [10]   77 	pop	de
   415F C1            [10]   78 	pop	bc
   4160 F1            [10]   79 	pop	af
   4161 C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   4162                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   4162 F5            [11]   88 	push	af
   4163 C5            [11]   89 	push	bc
   4164 D5            [11]   90 	push	de
   4165 E5            [11]   91 	push	hl
   4166 DD E5         [15]   92 	push	ix
   4168 FD E5         [15]   93 	push	iy
   416A D9            [ 4]   94 	exx
   416B 08            [ 4]   95 	ex	af, af' ;; '
   416C F5            [11]   96 	push	af
   416D C5            [11]   97 	push	bc
   416E D5            [11]   98 	push	de
   416F E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   4170 CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   4173 E1            [10]  103 	pop	hl
   4174 D1            [10]  104 	pop	de
   4175 C1            [10]  105 	pop	bc
   4176 F1            [10]  106 	pop	af
   4177 08            [ 4]  107 	ex	af, af' ;; '
   4178 D9            [ 4]  108 	exx
   4179 FD E1         [14]  109 	pop	iy
   417B DD E1         [14]  110 	pop	ix
   417D E1            [10]  111 	pop	hl
   417E D1            [10]  112 	pop	de
   417F C1            [10]  113 	pop	bc
   4180 F1            [10]  114 	pop	af
   4181 C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   4182                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   4182 F5            [11]  123 	push	af
   4183 C5            [11]  124 	push	bc
   4184 D5            [11]  125 	push	de
   4185 E5            [11]  126 	push	hl
   4186 DD E5         [15]  127 	push	ix
   4188 FD E5         [15]  128 	push	iy
   418A D9            [ 4]  129 	exx
   418B 08            [ 4]  130 	ex	af, af' ;; '
   418C F5            [11]  131 	push	af
   418D C5            [11]  132 	push	bc
   418E D5            [11]  133 	push	de
   418F E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   4190 CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   4193 E1            [10]  138 	pop	hl
   4194 D1            [10]  139 	pop	de
   4195 C1            [10]  140 	pop	bc
   4196 F1            [10]  141 	pop	af
   4197 08            [ 4]  142 	ex	af, af' ;; '
   4198 D9            [ 4]  143 	exx
   4199 FD E1         [14]  144 	pop	iy
   419B DD E1         [14]  145 	pop	ix
   419D E1            [10]  146 	pop	hl
   419E D1            [10]  147 	pop	de
   419F C1            [10]  148 	pop	bc
   41A0 F1            [10]  149 	pop	af
   41A1 C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
