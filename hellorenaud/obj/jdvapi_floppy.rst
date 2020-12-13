                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module jdvapi_floppy
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _LoadFile
                             12 	.globl _SetupDOS
                             13 	.globl _strlen
                             14 	.globl _nFileNameLen
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
   0D1B                      26 _nFileNameLen::
   0D1B                      27 	.ds 1
                             28 ;--------------------------------------------------------
                             29 ; absolute external ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DABS (ABS)
                             32 ;--------------------------------------------------------
                             33 ; global & static initialisations
                             34 ;--------------------------------------------------------
                             35 	.area _HOME
                             36 	.area _GSINIT
                             37 	.area _GSFINAL
                             38 	.area _GSINIT
                             39 ;--------------------------------------------------------
                             40 ; Home
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _HOME
                             44 ;--------------------------------------------------------
                             45 ; code
                             46 ;--------------------------------------------------------
                             47 	.area _CODE
                             48 ;src/jdvapi_floppy.c:19: void SetupDOS()
                             49 ;	---------------------------------
                             50 ; Function SetupDOS
                             51 ; ---------------------------------
   0138                      52 _SetupDOS::
                             53 ;src/jdvapi_floppy.c:52: __endasm;
   0138 DD 6E 02      [19]   54 	ld	l, 2 (ix) ;stack return address
   013B DD 66 03      [19]   55 	ld	h, 3 (ix) ;stack return address
   013E 22 5B 01      [16]   56 	ld	(_stack+1), hl
                             57 ;;------------------------------------------------------------------------
                             58 ;;	store the drive number the loader was run from
   0141 2A 7D BE      [16]   59 	ld	hl,(#0xbe7d)
   0144 7E            [ 7]   60 	ld	a,(hl)
   0145 32 55 01      [13]   61 	ld	(_drive+1),a
                             62 ;;------------------------------------------------------------------------
   0148 0E FF         [ 7]   63 	ld	c,#0xff ;; disable all roms
   014A 21 50 01      [10]   64 	ld	hl, #_start222 ;; execution address for program
   014D CD 16 BD      [17]   65 	call	#0xbd16 ;;mc_start_program ;; start it
   0150                      66 	    _start222::
   0150 00            [ 4]   67 	nop
   0151 CD CB BC      [17]   68 	call	#0xbccb ;;kl_rom_walk ;; enable all roms
                             69 ;;------------------------------------------------------------------------
                             70 ;;	when AMSDOS is enabled, the drive reverts back to drive 0!
                             71 ;;	This will restore the drive number to the drive the loader was run from
   0154                      72 	    _drive:
   0154 3E 00         [ 7]   73 	ld a, #0x00
   0156 2A 7D BE      [16]   74 	ld	hl,(#0xbe7d)
   0159 77            [ 7]   75 	ld	(hl),a
   015A                      76 	    _stack:
   015A 21 00 00      [10]   77 	ld hl, #0x0000
   015D E5            [11]   78 	push	hl
   015E E5            [11]   79 	push	hl
   015F C9            [10]   80 	ret
                             81 ;src/jdvapi_floppy.c:62: void LoadFile(char *sFileName, char *pLoadAddress)
                             82 ;	---------------------------------
                             83 ; Function LoadFile
                             84 ; ---------------------------------
   0160                      85 _LoadFile::
                             86 ;src/jdvapi_floppy.c:64: nFileNameLen = strlen(sFileName);
   0160 C1            [10]   87 	pop	bc
   0161 E1            [10]   88 	pop	hl
   0162 E5            [11]   89 	push	hl
   0163 C5            [11]   90 	push	bc
   0164 E5            [11]   91 	push	hl
   0165 CD 42 0B      [17]   92 	call	_strlen
   0168 F1            [10]   93 	pop	af
   0169 FD 21 1B 0D   [14]   94 	ld	iy, #_nFileNameLen
   016D FD 75 00      [19]   95 	ld	0 (iy), l
                             96 ;src/jdvapi_floppy.c:96: __endasm;
                             97 ;;	B = length of the filename in characters
   0170 21 1B 0D      [10]   98 	ld	hl, #_nFileNameLen;
   0173 46            [ 7]   99 	ld	b, (hl)
                            100 ;;	HL = address of the start of the filename
   0174 DD 6E 04      [19]  101 	LD	L, 4 (IX) ;sFileName
   0177 DD 66 05      [19]  102 	LD	H, 5 (IX) ;sFileName
                            103 ;;	DE = address of a 2k buffer
                            104 ;;	in disc mode: this buffer is not used when CAS IN DIRECT
                            105 ;;	firmware function is used, so it is safe to put it anywhere
                            106 ;;	you want.
   017A 11 00 00      [10]  107 	ld	de, #0x0
                            108 ;;	firmware function to open a file for reading
   017D CD 77 BC      [17]  109 	call	#0xbc77 ;;cas_in_open
                            110 ;;	firmware function to load the entire file
                            111 ;;	this will work with files that have a AMSDOS header (ASCII
                            112 ;;	files do not have a header)
                            113 ;;	HL = load address
   0180 DD 6E 06      [19]  114 	LD	L, 6 (IX) ;pLoadAddress
   0183 DD 66 07      [19]  115 	LD	H, 7 (IX) ;pLoadAddress
                            116 ;;	read file
   0186 CD 83 BC      [17]  117 	call	#0xbc83 ;;cas_in_direct
                            118 ;;	firmware function to close a file opened for reading
   0189 CD 7A BC      [17]  119 	call	#0xbc7a ;;cas_in_close
   018C C9            [10]  120 	ret
                            121 	.area _CODE
                            122 	.area _INITIALIZER
   0D1F                     123 __xinit__nFileNameLen:
   0D1F 00                  124 	.db #0x00	; 0
                            125 	.area _CABS (ABS)
