                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _myInterruptHandler
                             13 	.globl _bank0123
                             14 	.globl _calque4000
                             15 	.globl _calqueC000
                             16 	.globl _cpct_getRandom_mxor_u8
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_setPALColour
                             19 	.globl _cpct_setVideoMode
                             20 	.globl _cpct_drawCharM0
                             21 	.globl _cpct_isKeyPressed
                             22 	.globl _cpct_scanKeyboard_f
                             23 	.globl _cpct_setInterruptHandler
                             24 	.globl _cpct_disableFirmware
                             25 	.globl _g_items_0
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   0A80                      33 _myInterruptHandler_i_1_80:
   0A80                      34 	.ds 1
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/main.c:41: void myInterruptHandler() {
                             60 ;	---------------------------------
                             61 ; Function myInterruptHandler
                             62 ; ---------------------------------
   025C                      63 _myInterruptHandler::
                             64 ;src/main.c:45: cpct_setBorder(i+1);
   025C 21 80 0A      [10]   65 	ld	hl,#_myInterruptHandler_i_1_80 + 0
   025F 46            [ 7]   66 	ld	b, (hl)
   0260 04            [ 4]   67 	inc	b
   0261 C5            [11]   68 	push	bc
   0262 33            [ 6]   69 	inc	sp
   0263 3E 10         [ 7]   70 	ld	a, #0x10
   0265 F5            [11]   71 	push	af
   0266 33            [ 6]   72 	inc	sp
   0267 CD 66 08      [17]   73 	call	_cpct_setPALColour
                             74 ;src/main.c:46: if (++i > 5) i=0;
   026A FD 21 80 0A   [14]   75 	ld	iy, #_myInterruptHandler_i_1_80
   026E FD 34 00      [23]   76 	inc	0 (iy)
   0271 3E 05         [ 7]   77 	ld	a, #0x05
   0273 FD 96 00      [19]   78 	sub	a, 0 (iy)
   0276 D0            [11]   79 	ret	NC
   0277 FD 36 00 00   [19]   80 	ld	0 (iy), #0x00
   027B C9            [10]   81 	ret
   027C                      82 _g_items_0:
   027C 05                   83 	.db #0x05	; 5
   027D 0F                   84 	.db #0x0f	; 15
   027E 0F                   85 	.db #0x0f	; 15
   027F 00                   86 	.db #0x00	; 0
   0280 0F                   87 	.db #0x0f	; 15
   0281 0F                   88 	.db #0x0f	; 15
   0282 0F                   89 	.db #0x0f	; 15
   0283 0A                   90 	.db #0x0a	; 10
   0284 0F                   91 	.db #0x0f	; 15
   0285 0A                   92 	.db #0x0a	; 10
   0286 05                   93 	.db #0x05	; 5
   0287 00                   94 	.db #0x00	; 0
   0288 0F                   95 	.db #0x0f	; 15
   0289 0A                   96 	.db #0x0a	; 10
   028A 05                   97 	.db #0x05	; 5
   028B 00                   98 	.db #0x00	; 0
   028C 05                   99 	.db #0x05	; 5
   028D 0F                  100 	.db #0x0f	; 15
   028E 0A                  101 	.db #0x0a	; 10
   028F 0A                  102 	.db #0x0a	; 10
   0290 00                  103 	.db #0x00	; 0
   0291 0F                  104 	.db #0x0f	; 15
   0292 0F                  105 	.db #0x0f	; 15
   0293 0A                  106 	.db #0x0a	; 10
   0294 00                  107 	.db #0x00	; 0
   0295 0A                  108 	.db #0x0a	; 10
   0296 0A                  109 	.db #0x0a	; 10
   0297 0A                  110 	.db #0x0a	; 10
   0298 00                  111 	.db #0x00	; 0
   0299 00                  112 	.db #0x00	; 0
   029A 00                  113 	.db #0x00	; 0
   029B 00                  114 	.db #0x00	; 0
                            115 ;src/main.c:55: void main(void) {
                            116 ;	---------------------------------
                            117 ; Function main
                            118 ; ---------------------------------
   029C                     119 _main::
                            120 ;src/main.c:70: cpct_disableFirmware();
   029C CD 37 09      [17]  121 	call	_cpct_disableFirmware
                            122 ;src/main.c:77: bank0123();
   029F CD 6A 03      [17]  123 	call	_bank0123
                            124 ;src/main.c:78: calque4000();
   02A2 CD 54 03      [17]  125 	call	_calque4000
                            126 ;src/main.c:82: cpct_setVideoMode(0);
   02A5 2E 00         [ 7]  127 	ld	l, #0x00
   02A7 CD 0A 09      [17]  128 	call	_cpct_setVideoMode
                            129 ;src/main.c:83: while (1) {}
   02AA                     130 00102$:
                            131 ;src/main.c:132: while (1) {}
   02AA 18 FE         [12]  132 	jr	00102$
   02AC                     133 ___str_0:
   02AC 57 65 6C 63 6F 6D   134 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   02BB 00                  135 	.db 0x00
   02BC                     136 ___str_1:
   02BC 50 72 65 73 73 20   137 	.ascii "Press ENTER."
        45 4E 54 45 52 2E
   02C8 00                  138 	.db 0x00
                            139 	.area _CODE
                            140 	.area _INITIALIZER
                            141 	.area _CABS (ABS)
