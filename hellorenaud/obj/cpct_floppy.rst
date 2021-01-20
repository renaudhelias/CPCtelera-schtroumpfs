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
   490D                      49 _StoreDriveLetter::
                             50 ;src/cpct_floppy.c:21: __endasm;
                             51 ;;------------------------------------------------------------------------
                             52 ;;	store the drive number the loader was run from to InitializeAmsdos
   490D 2A 7D BE      [16]   53 	ld	hl,(#0xbe7d)
   4910 7E            [ 7]   54 	ld	a,(hl)
   4911 32 52 49      [13]   55 	ld	(_driveLoad+1),a
                             56 ;ld	(_driveSave+1),a
                             57 ;;------------------------------------------------------------------------
                             58 ;;	store jump restore call to InitializeAmsdos
                             59 ;ld	hl,(#0xbD38)
   4914 3A 38 BD      [13]   60 	ld	a,(#0xbD38)
   4917 32 29 49      [13]   61 	ld	(_firmJump+1),a
   491A C9            [10]   62 	ret
                             63 ;src/cpct_floppy.c:27: void InitializeAmsdos(void) __naked
                             64 ;	---------------------------------
                             65 ; Function InitializeAmsdos
                             66 ; ---------------------------------
   491B                      67 _InitializeAmsdos::
                             68 ;src/cpct_floppy.c:99: __endasm;
                             69 ;;	** INITIALISE ALTERNATE REGISTER SET FOR FIRMWARE **
   491B D9            [ 4]   70 	exx
   491C 01 88 7F      [10]   71 	ld	bc,#0x7f88 ;initialise lower rom and select mode 0
   491F ED 49         [12]   72 	out	(c),c ;this routine must be located above &4000
   4921 D9            [ 4]   73 	exx
   4922 08            [ 4]   74 	ex	af,AF
   4923 AF            [ 4]   75 	xor	a
   4924 08            [ 4]   76 	ex	af,af
                             77 ;;	** INITIALISE FIRMWARE **
   4925 CD 44 00      [17]   78 	call	#0x0044 ;initialise lower jumpblock (&0000-&0040)
                             79 ;and	high kernal jumpblock (&b800-&bae4)
   4928                      80 	      _firmJump:
   4928 CD BD 08      [17]   81 	call #0x08bd ;initialise firmware jumpblock entries
                             82 ;call	#0xBD37
                             83 ;(&bb00-	...)
   492B CD 00 BB      [17]   84 	call	#0xbb00 ;initialise keyboard manager
   492E CD 09 B9      [17]   85 	call	#0xb909 ;disable lower rom
                             86 ;;;	** INITIALISE DISK ROM FOR LOADING/SAVING **
                             87 ;
   4931 0E 07         [ 7]   88 	ld	c,#7 ;disk rom
   4933 11 00 80      [10]   89 	ld	de,#0x8000 ;lowest useable byte of memory
   4936 21 FF B0      [10]   90 	ld	hl,#0xb0ff ;highest useable byte of memory
   4939 CD CE BC      [17]   91 	call	#0xbcce ;initialise disk rom
   493C 0E 06         [ 7]   92 	ld	c,#6 ;disk rom
   493E 11 00 80      [10]   93 	ld	de,#0x8000 ;lowest useable byte of memory
   4941 21 FF B0      [10]   94 	ld	hl,#0xb0ff ;highest useable byte of memory
   4944 CD CE BC      [17]   95 	call	#0xbcce ;initialise disk rom
   4947 3E C9         [ 7]   96 	ld	a,#0xc9
   4949 32 5A BB      [13]   97 	ld	(#0xbb5a),a ;prevent printing of text characters
                             98 ;don	t get error messages corrupting screen
                             99 ;;	** INITIALISE ALL ROMS (FOR LOADING/SAVING) **
                            100 ;ld	c,#7 ;disk rom
                            101 ;ld	de,#0x8000 ;lowest useable byte of memory
                            102 ;ld	hl,#0xb0ff ;highest useable byte of memory
                            103 ;call	#0xbccB ;initialise disk rom (KL ROM WALK)
                            104 ;xor	a ;select drive (A)
                            105 ;ld	(#0xac00),a
   494C 3E FF         [ 7]  106 	ld	a,#0xff
   494E 32 78 BE      [13]  107 	ld	(#0xbe78),a ;turn of disc error messages
                            108 ;;------------------------------------------------------------------------
                            109 ;;	when AMSDOS is enabled, the drive reverts back to drive 0!
                            110 ;;	This will restore the drive number to the drive the loader was run from
   4951                     111 	      _driveLoad:
   4951 3E 00         [ 7]  112 	ld a, #0x00
   4953 2A 7D BE      [16]  113 	ld	hl,(#0xbe7d)
   4956 77            [ 7]  114 	ld	(hl),a
   4957 C9            [10]  115 	ret
                            116 ;src/cpct_floppy.c:103: void cpct_loadBinaryFile(const char *fileName, void *loadAddr) {
                            117 ;	---------------------------------
                            118 ; Function cpct_loadBinaryFile
                            119 ; ---------------------------------
   4958                     120 _cpct_loadBinaryFile::
                            121 ;src/cpct_floppy.c:157: __endasm;
   4958 21 02 00      [10]  122 	ld	hl, #2
   495B 39            [11]  123 	add	hl, sp
   495C 5E            [ 7]  124 	ld	e, (hl) ;; filename
   495D 23            [ 6]  125 	inc	hl
   495E 56            [ 7]  126 	ld	d, (hl)
   495F 23            [ 6]  127 	inc	hl
   4960 7E            [ 7]  128 	ld	a, (hl) ;; load address
   4961 23            [ 6]  129 	inc	hl
   4962 66            [ 7]  130 	ld	h, (hl)
   4963 6F            [ 4]  131 	ld	l,a
   4964 E5            [11]  132 	push	hl
   4965 EB            [ 4]  133 	ex	de,hl
   4966 CD 88 49      [17]  134 	call	get_str_length
                            135 ;;ld	de,#0x0c000 ;; two k buffer (not used with cas in direct)
   4969 11 00 00      [10]  136 	ld	de,#0x0 ;; two k buffer (not used with cas in direct)
   496C CD 77 BC      [17]  137 	call	cas_in_open
   496F E1            [10]  138 	pop	hl
   4970 30 10         [12]  139 	jr	nc,cpct_err
   4972 CD 83 BC      [17]  140 	call	cas_in_direct
   4975 30 0B         [12]  141 	jr	nc,cpct_err
   4977 CD 7A BC      [17]  142 	call	cas_in_close
   497A 30 06         [12]  143 	jr	nc,cpct_err
   497C 21 00 00      [10]  144 	ld	hl,#0
   497F C3 95 49      [10]  145 	jp	fin
   4982                     146 	cpct_err:
   4982 21 01 00      [10]  147 	ld	hl,#1
   4985 C3 95 49      [10]  148 	jp	fin
   4988                     149 	get_str_length:
   4988 E5            [11]  150 	push	hl
   4989 06 00         [ 7]  151 	ld	b,#0
   498B                     152 	gsl::
   498B 7E            [ 7]  153 	ld	a,(hl)
   498C B7            [ 4]  154 	or	a
   498D 28 04         [12]  155 	jr	z,gsl2
   498F 04            [ 4]  156 	inc	b
   4990 23            [ 6]  157 	inc	hl
   4991 18 F8         [12]  158 	jr	gsl
   4993                     159 	gsl2::
   4993 E1            [10]  160 	pop	hl
   4994 C9            [10]  161 	ret
                            162 ;;	Firmware
                     BC77   163 	cas_in_open=0x0bc77
                     BC83   164 	cas_in_direct=0x0bc83
                     BC7A   165 	cas_in_close=0x0bc7a
   4995                     166 	fin:
   4995 C9            [10]  167 	ret
                            168 	.area _CODE
                            169 	.area _INITIALIZER
                            170 	.area _CABS (ABS)
