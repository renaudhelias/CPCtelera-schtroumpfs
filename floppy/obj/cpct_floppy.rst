                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module cpct_floppy
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_loadBinaryFile
                             12 	.globl _InitializeAmsdos
                             13 	.globl _StoreDriveLetter
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
                             45 ;src/cpct_floppy.c:2: void StoreDriveLetter(void)
                             46 ;	---------------------------------
                             47 ; Function StoreDriveLetter
                             48 ; ---------------------------------
   405C                      49 _StoreDriveLetter::
                             50 ;src/cpct_floppy.c:21: __endasm;
                             51 ;;------------------------------------------------------------------------
                             52 ;;	store the drive number the loader was run from to InitializeAmsdos
   405C 2A 7D BE      [16]   53 	ld	hl,(#0xbe7d)
   405F 7E            [ 7]   54 	ld	a,(hl)
   4060 32 A1 40      [13]   55 	ld	(_driveLoad+1),a
                             56 ;ld	(_driveSave+1),a
                             57 ;;------------------------------------------------------------------------
                             58 ;;	store jump restore call to InitializeAmsdos
                             59 ;ld	hl,(#0xbD38)
   4063 3A 38 BD      [13]   60 	ld	a,(#0xbD38)
   4066 32 78 40      [13]   61 	ld	(_firmJump+1),a
   4069 C9            [10]   62 	ret
                             63 ;src/cpct_floppy.c:27: void InitializeAmsdos(void) __naked
                             64 ;	---------------------------------
                             65 ; Function InitializeAmsdos
                             66 ; ---------------------------------
   406A                      67 _InitializeAmsdos::
                             68 ;src/cpct_floppy.c:99: __endasm;
                             69 ;;	** INITIALISE ALTERNATE REGISTER SET FOR FIRMWARE **
   406A D9            [ 4]   70 	exx
   406B 01 88 7F      [10]   71 	ld	bc,#0x7f88 ;initialise lower rom and select mode 0
   406E ED 49         [12]   72 	out	(c),c ;this routine must be located above &4000
   4070 D9            [ 4]   73 	exx
   4071 08            [ 4]   74 	ex	af,AF
   4072 AF            [ 4]   75 	xor	a
   4073 08            [ 4]   76 	ex	af,af
                             77 ;;	** INITIALISE FIRMWARE **
   4074 CD 44 00      [17]   78 	call	#0x0044 ;initialise lower jumpblock (&0000-&0040)
                             79 ;and	high kernal jumpblock (&b800-&bae4)
   4077                      80 	      _firmJump:
   4077 CD BD 08      [17]   81 	call #0x08bd ;initialise firmware jumpblock entries
                             82 ;call	#0xBD37
                             83 ;(&bb00-	...)
   407A CD 00 BB      [17]   84 	call	#0xbb00 ;initialise keyboard manager
   407D CD 09 B9      [17]   85 	call	#0xb909 ;disable lower rom
                             86 ;;;	** INITIALISE DISK ROM FOR LOADING/SAVING **
                             87 ;
   4080 0E 07         [ 7]   88 	ld	c,#7 ;disk rom
   4082 11 00 80      [10]   89 	ld	de,#0x8000 ;lowest useable byte of memory
   4085 21 FF B0      [10]   90 	ld	hl,#0xb0ff ;highest useable byte of memory
   4088 CD CE BC      [17]   91 	call	#0xbcce ;initialise disk rom
   408B 0E 06         [ 7]   92 	ld	c,#6 ;disk rom
   408D 11 00 80      [10]   93 	ld	de,#0x8000 ;lowest useable byte of memory
   4090 21 FF B0      [10]   94 	ld	hl,#0xb0ff ;highest useable byte of memory
   4093 CD CE BC      [17]   95 	call	#0xbcce ;initialise disk rom
   4096 3E C9         [ 7]   96 	ld	a,#0xc9
   4098 32 5A BB      [13]   97 	ld	(#0xbb5a),a ;prevent printing of text characters
                             98 ;don	t get error messages corrupting screen
                             99 ;;	** INITIALISE ALL ROMS (FOR LOADING/SAVING) **
                            100 ;ld	c,#7 ;disk rom
                            101 ;ld	de,#0x8000 ;lowest useable byte of memory
                            102 ;ld	hl,#0xb0ff ;highest useable byte of memory
                            103 ;call	#0xbccB ;initialise disk rom (KL ROM WALK)
                            104 ;xor	a ;select drive (A)
                            105 ;ld	(#0xac00),a
   409B 3E FF         [ 7]  106 	ld	a,#0xff
   409D 32 78 BE      [13]  107 	ld	(#0xbe78),a ;turn of disc error messages
                            108 ;;------------------------------------------------------------------------
                            109 ;;	when AMSDOS is enabled, the drive reverts back to drive 0!
                            110 ;;	This will restore the drive number to the drive the loader was run from
   40A0                     111 	      _driveLoad:
   40A0 3E 00         [ 7]  112 	ld a, #0x00
   40A2 2A 7D BE      [16]  113 	ld	hl,(#0xbe7d)
   40A5 77            [ 7]  114 	ld	(hl),a
   40A6 C9            [10]  115 	ret
                            116 ;src/cpct_floppy.c:103: void cpct_loadBinaryFile(const char *fileName, void *loadAddr) {
                            117 ;	---------------------------------
                            118 ; Function cpct_loadBinaryFile
                            119 ; ---------------------------------
   40A7                     120 _cpct_loadBinaryFile::
                            121 ;src/cpct_floppy.c:157: __endasm;
   40A7 21 02 00      [10]  122 	ld	hl, #2
   40AA 39            [11]  123 	add	hl, sp
   40AB 5E            [ 7]  124 	ld	e, (hl) ;; filename
   40AC 23            [ 6]  125 	inc	hl
   40AD 56            [ 7]  126 	ld	d, (hl)
   40AE 23            [ 6]  127 	inc	hl
   40AF 7E            [ 7]  128 	ld	a, (hl) ;; load address
   40B0 23            [ 6]  129 	inc	hl
   40B1 66            [ 7]  130 	ld	h, (hl)
   40B2 6F            [ 4]  131 	ld	l,a
   40B3 E5            [11]  132 	push	hl
   40B4 EB            [ 4]  133 	ex	de,hl
   40B5 CD D7 40      [17]  134 	call	get_str_length
                            135 ;;ld	de,#0x0c000 ;; two k buffer (not used with cas in direct)
   40B8 11 00 00      [10]  136 	ld	de,#0x0 ;; two k buffer (not used with cas in direct)
   40BB CD 77 BC      [17]  137 	call	cas_in_open
   40BE E1            [10]  138 	pop	hl
   40BF 30 10         [12]  139 	jr	nc,cpct_err
   40C1 CD 83 BC      [17]  140 	call	cas_in_direct
   40C4 30 0B         [12]  141 	jr	nc,cpct_err
   40C6 CD 7A BC      [17]  142 	call	cas_in_close
   40C9 30 06         [12]  143 	jr	nc,cpct_err
   40CB 21 00 00      [10]  144 	ld	hl,#0
   40CE C3 E4 40      [10]  145 	jp	fin
   40D1                     146 	cpct_err:
   40D1 21 01 00      [10]  147 	ld	hl,#1
   40D4 C3 E4 40      [10]  148 	jp	fin
   40D7                     149 	get_str_length:
   40D7 E5            [11]  150 	push	hl
   40D8 06 00         [ 7]  151 	ld	b,#0
   40DA                     152 	gsl::
   40DA 7E            [ 7]  153 	ld	a,(hl)
   40DB B7            [ 4]  154 	or	a
   40DC 28 04         [12]  155 	jr	z,gsl2
   40DE 04            [ 4]  156 	inc	b
   40DF 23            [ 6]  157 	inc	hl
   40E0 18 F8         [12]  158 	jr	gsl
   40E2                     159 	gsl2::
   40E2 E1            [10]  160 	pop	hl
   40E3 C9            [10]  161 	ret
                            162 ;;	Firmware
                     BC77   163 	cas_in_open=0x0bc77
                     BC83   164 	cas_in_direct=0x0bc83
                     BC7A   165 	cas_in_close=0x0bc7a
   40E4                     166 	fin:
   40E4 C9            [10]  167 	ret
                            168 	.area _CODE
                            169 	.area _INITIALIZER
                            170 	.area _CABS (ABS)
