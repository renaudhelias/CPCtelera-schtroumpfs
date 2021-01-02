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
   414B                      49 _akp_musicInit::
                             50 ;src/audio.c:50: __endasm;
                             51 ;;	backup Z80 state
   414B F5            [11]   52 	push	af
   414C C5            [11]   53 	push	bc
   414D D5            [11]   54 	push	de
   414E E5            [11]   55 	push	hl
   414F DD E5         [15]   56 	push	ix
   4151 FD E5         [15]   57 	push	iy
   4153 D9            [ 4]   58 	exx
   4154 08            [ 4]   59 	ex	af, af' ;; '
   4155 F5            [11]   60 	push	af
   4156 C5            [11]   61 	push	bc
   4157 D5            [11]   62 	push	de
   4158 E5            [11]   63 	push	hl
                             64 ;;	AKG6000.BIN/exemple.asm
   4159 01 00 D0      [10]   65 	ld	bc,#0xD000
   415C CD 00 C0      [17]   66 	call	#0xC000
                             67 ;;	restore Z80 state
   415F E1            [10]   68 	pop	hl
   4160 D1            [10]   69 	pop	de
   4161 C1            [10]   70 	pop	bc
   4162 F1            [10]   71 	pop	af
   4163 08            [ 4]   72 	ex	af, af' ;; '
   4164 D9            [ 4]   73 	exx
   4165 FD E1         [14]   74 	pop	iy
   4167 DD E1         [14]   75 	pop	ix
   4169 E1            [10]   76 	pop	hl
   416A D1            [10]   77 	pop	de
   416B C1            [10]   78 	pop	bc
   416C F1            [10]   79 	pop	af
   416D C9            [10]   80 	ret
                             81 ;src/audio.c:53: void akp_musicPlay()
                             82 ;	---------------------------------
                             83 ; Function akp_musicPlay
                             84 ; ---------------------------------
   416E                      85 _akp_musicPlay::
                             86 ;src/audio.c:86: __endasm;
                             87 ;;	backup Z80 state
   416E F5            [11]   88 	push	af
   416F C5            [11]   89 	push	bc
   4170 D5            [11]   90 	push	de
   4171 E5            [11]   91 	push	hl
   4172 DD E5         [15]   92 	push	ix
   4174 FD E5         [15]   93 	push	iy
   4176 D9            [ 4]   94 	exx
   4177 08            [ 4]   95 	ex	af, af' ;; '
   4178 F5            [11]   96 	push	af
   4179 C5            [11]   97 	push	bc
   417A D5            [11]   98 	push	de
   417B E5            [11]   99 	push	hl
                            100 ;;	AKG6000.BIN/exemple.asm
   417C CD 03 C0      [17]  101 	call	#0xC003
                            102 ;;	restore Z80 state
   417F E1            [10]  103 	pop	hl
   4180 D1            [10]  104 	pop	de
   4181 C1            [10]  105 	pop	bc
   4182 F1            [10]  106 	pop	af
   4183 08            [ 4]  107 	ex	af, af' ;; '
   4184 D9            [ 4]  108 	exx
   4185 FD E1         [14]  109 	pop	iy
   4187 DD E1         [14]  110 	pop	ix
   4189 E1            [10]  111 	pop	hl
   418A D1            [10]  112 	pop	de
   418B C1            [10]  113 	pop	bc
   418C F1            [10]  114 	pop	af
   418D C9            [10]  115 	ret
                            116 ;src/audio.c:89: void akp_sfxPlay()
                            117 ;	---------------------------------
                            118 ; Function akp_sfxPlay
                            119 ; ---------------------------------
   418E                     120 _akp_sfxPlay::
                            121 ;src/audio.c:122: __endasm;
                            122 ;;	backup Z80 state
   418E F5            [11]  123 	push	af
   418F C5            [11]  124 	push	bc
   4190 D5            [11]  125 	push	de
   4191 E5            [11]  126 	push	hl
   4192 DD E5         [15]  127 	push	ix
   4194 FD E5         [15]  128 	push	iy
   4196 D9            [ 4]  129 	exx
   4197 08            [ 4]  130 	ex	af, af' ;; '
   4198 F5            [11]  131 	push	af
   4199 C5            [11]  132 	push	bc
   419A D5            [11]  133 	push	de
   419B E5            [11]  134 	push	hl
                            135 ;;	AKG6000.BIN/exemple.asm
   419C CD 06 C0      [17]  136 	call	#0xC006
                            137 ;;	restore Z80 state
   419F E1            [10]  138 	pop	hl
   41A0 D1            [10]  139 	pop	de
   41A1 C1            [10]  140 	pop	bc
   41A2 F1            [10]  141 	pop	af
   41A3 08            [ 4]  142 	ex	af, af' ;; '
   41A4 D9            [ 4]  143 	exx
   41A5 FD E1         [14]  144 	pop	iy
   41A7 DD E1         [14]  145 	pop	ix
   41A9 E1            [10]  146 	pop	hl
   41AA D1            [10]  147 	pop	de
   41AB C1            [10]  148 	pop	bc
   41AC F1            [10]  149 	pop	af
   41AD C9            [10]  150 	ret
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
