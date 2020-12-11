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
   4AD0                      26 _nFileNameLen::
   4AD0                      27 	.ds 1
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
   4000                      52 _SetupDOS::
                             53 ;src/jdvapi_floppy.c:52: __endasm;
   4000 DD 6E 02      [19]   54 	ld	l, 2 (ix) ;stack return address
   4003 DD 66 03      [19]   55 	ld	h, 3 (ix) ;stack return address
   4006 22 23 40      [16]   56 	ld	(_stack+1), hl
                             57 ;;------------------------------------------------------------------------
                             58 ;;	store the drive number the loader was run from
   4009 2A 7D BE      [16]   59 	ld	hl,(#0xbe7d)
   400C 7E            [ 7]   60 	ld	a,(hl)
   400D 32 1D 40      [13]   61 	ld	(_drive+1),a
                             62 ;;------------------------------------------------------------------------
   4010 0E FF         [ 7]   63 	ld	c,#0xff ;; disable all roms
   4012 21 18 40      [10]   64 	ld	hl, #_start222 ;; execution address for program
   4015 CD 16 BD      [17]   65 	call	#0xbd16 ;;mc_start_program ;; start it
   4018                      66 	    _start222::
   4018 00            [ 4]   67 	nop
   4019 CD CB BC      [17]   68 	call	#0xbccb ;;kl_rom_walk ;; enable all roms
                             69 ;;------------------------------------------------------------------------
                             70 ;;	when AMSDOS is enabled, the drive reverts back to drive 0!
                             71 ;;	This will restore the drive number to the drive the loader was run from
   401C                      72 	    _drive:
   401C 3E 00         [ 7]   73 	ld a, #0x00
   401E 2A 7D BE      [16]   74 	ld	hl,(#0xbe7d)
   4021 77            [ 7]   75 	ld	(hl),a
   4022                      76 	    _stack:
   4022 21 00 00      [10]   77 	ld hl, #0x0000
   4025 E5            [11]   78 	push	hl
   4026 E5            [11]   79 	push	hl
   4027 C9            [10]   80 	ret
                             81 ;src/jdvapi_floppy.c:62: void LoadFile(char *sFileName, char *pLoadAddress)
                             82 ;	---------------------------------
                             83 ; Function LoadFile
                             84 ; ---------------------------------
   4028                      85 _LoadFile::
                             86 ;src/jdvapi_floppy.c:64: nFileNameLen = strlen(sFileName);
   4028 C1            [10]   87 	pop	bc
   4029 E1            [10]   88 	pop	hl
   402A E5            [11]   89 	push	hl
   402B C5            [11]   90 	push	bc
   402C E5            [11]   91 	push	hl
   402D CD A9 49      [17]   92 	call	_strlen
   4030 F1            [10]   93 	pop	af
   4031 FD 21 D0 4A   [14]   94 	ld	iy, #_nFileNameLen
   4035 FD 75 00      [19]   95 	ld	0 (iy), l
                             96 ;src/jdvapi_floppy.c:96: __endasm;
                             97 ;;	B = length of the filename in characters
   4038 21 D0 4A      [10]   98 	ld	hl, #_nFileNameLen;
   403B 46            [ 7]   99 	ld	b, (hl)
                            100 ;;	HL = address of the start of the filename
   403C DD 6E 04      [19]  101 	LD	L, 4 (IX) ;sFileName
   403F DD 66 05      [19]  102 	LD	H, 5 (IX) ;sFileName
                            103 ;;	DE = address of a 2k buffer
                            104 ;;	in disc mode: this buffer is not used when CAS IN DIRECT
                            105 ;;	firmware function is used, so it is safe to put it anywhere
                            106 ;;	you want.
   4042 11 00 00      [10]  107 	ld	de, #0x0
                            108 ;;	firmware function to open a file for reading
   4045 CD 77 BC      [17]  109 	call	#0xbc77 ;;cas_in_open
                            110 ;;	firmware function to load the entire file
                            111 ;;	this will work with files that have a AMSDOS header (ASCII
                            112 ;;	files do not have a header)
                            113 ;;	HL = load address
   4048 DD 6E 06      [19]  114 	LD	L, 6 (IX) ;pLoadAddress
   404B DD 66 07      [19]  115 	LD	H, 7 (IX) ;pLoadAddress
                            116 ;;	read file
   404E CD 83 BC      [17]  117 	call	#0xbc83 ;;cas_in_direct
                            118 ;;	firmware function to close a file opened for reading
   4051 CD 7A BC      [17]  119 	call	#0xbc7a ;;cas_in_close
   4054 C9            [10]  120 	ret
                            121 	.area _CODE
                            122 	.area _INITIALIZER
   4AD1                     123 __xinit__nFileNameLen:
   4AD1 00                  124 	.db #0x00	; 0
                            125 	.area _CABS (ABS)
