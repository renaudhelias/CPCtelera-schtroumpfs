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
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_setPALColour
                             14 	.globl _cpct_setPalette
                             15 	.globl _cpct_setVideoMode
                             16 	.globl _cpct_drawStringM0
                             17 	.globl _cpct_drawSpriteMasked
                             18 	.globl _cpct_drawSprite
                             19 	.globl _cpct_memset
                             20 	.globl _cpct_disableFirmware
                             21 	.globl _g_items_0
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _INITIALIZED
                             33 ;--------------------------------------------------------
                             34 ; absolute external ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DABS (ABS)
                             37 ;--------------------------------------------------------
                             38 ; global & static initialisations
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _GSINIT
                             42 	.area _GSFINAL
                             43 	.area _GSINIT
                             44 ;--------------------------------------------------------
                             45 ; Home
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _HOME
                             49 ;--------------------------------------------------------
                             50 ; code
                             51 ;--------------------------------------------------------
                             52 	.area _CODE
                             53 ;src/main.c:34: void main(void) {
                             54 ;	---------------------------------
                             55 ; Function main
                             56 ; ---------------------------------
   4000                      57 _main::
                             58 ;src/main.c:37: u8* sprite=g_items_0;
                             59 ;src/main.c:40: cpct_disableFirmware();
   4000 CD 7F 46      [17]   60 	call	_cpct_disableFirmware
                             61 ;src/main.c:41: cpct_setVideoMode(0);
   4003 2E 00         [ 7]   62 	ld	l, #0x00
   4005 CD 53 46      [17]   63 	call	_cpct_setVideoMode
                             64 ;src/main.c:42: cpct_setBorder(HW_BLACK);
   4008 21 10 14      [10]   65 	ld	hl, #0x1410
   400B E5            [11]   66 	push	hl
   400C CD C2 44      [17]   67 	call	_cpct_setPALColour
                             68 ;src/main.c:43: cpct_setPalette(g_tile_palette, 6);
   400F 21 06 00      [10]   69 	ld	hl, #0x0006
   4012 E5            [11]   70 	push	hl
   4013 21 A5 40      [10]   71 	ld	hl, #_g_tile_palette
   4016 E5            [11]   72 	push	hl
   4017 CD AB 44      [17]   73 	call	_cpct_setPalette
                             74 ;src/main.c:44: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   401A 21 00 40      [10]   75 	ld	hl, #0x4000
   401D E5            [11]   76 	push	hl
   401E AF            [ 4]   77 	xor	a, a
   401F F5            [11]   78 	push	af
   4020 33            [ 6]   79 	inc	sp
   4021 26 C0         [ 7]   80 	ld	h, #0xc0
   4023 E5            [11]   81 	push	hl
   4024 CD 71 46      [17]   82 	call	_cpct_memset
                             83 ;src/main.c:47: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   4027 21 14 58      [10]   84 	ld	hl, #0x5814
   402A E5            [11]   85 	push	hl
   402B 21 00 C0      [10]   86 	ld	hl, #0xc000
   402E E5            [11]   87 	push	hl
   402F CD 90 46      [17]   88 	call	_cpct_getScreenPtr
                             89 ;src/main.c:57: p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   4032 E5            [11]   90 	push	hl
   4033 21 0F 0F      [10]   91 	ld	hl, #0x0f0f
   4036 E5            [11]   92 	push	hl
   4037 21 00 C0      [10]   93 	ld	hl, #0xc000
   403A E5            [11]   94 	push	hl
   403B CD 90 46      [17]   95 	call	_cpct_getScreenPtr
   403E 11 04 08      [10]   96 	ld	de, #0x0804
   4041 D5            [11]   97 	push	de
   4042 E5            [11]   98 	push	hl
   4043 21 75 40      [10]   99 	ld	hl, #_g_items_0
   4046 E5            [11]  100 	push	hl
   4047 CD F2 44      [17]  101 	call	_cpct_drawSprite
   404A C1            [10]  102 	pop	bc
                            103 ;src/main.c:62: cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);
   404B 21 02 00      [10]  104 	ld	hl, #0x0002
   404E E5            [11]  105 	push	hl
   404F C5            [11]  106 	push	bc
   4050 21 95 40      [10]  107 	ld	hl, #___str_0
   4053 E5            [11]  108 	push	hl
   4054 CD CE 44      [17]  109 	call	_cpct_drawStringM0
   4057 21 06 00      [10]  110 	ld	hl, #6
   405A 39            [11]  111 	add	hl, sp
   405B F9            [ 6]  112 	ld	sp, hl
                            113 ;src/main.c:66: p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   405C 21 09 4F      [10]  114 	ld	hl, #0x4f09
   405F E5            [11]  115 	push	hl
   4060 21 00 C0      [10]  116 	ld	hl, #0xc000
   4063 E5            [11]  117 	push	hl
   4064 CD 90 46      [17]  118 	call	_cpct_getScreenPtr
                            119 ;src/main.c:67: cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);
   4067 01 AB 40      [10]  120 	ld	bc, #_g_tile_schtroumpf+0
   406A 11 10 20      [10]  121 	ld	de, #0x2010
   406D D5            [11]  122 	push	de
   406E E5            [11]  123 	push	hl
   406F C5            [11]  124 	push	bc
   4070 CD 24 46      [17]  125 	call	_cpct_drawSpriteMasked
                            126 ;src/main.c:70: while (1);
   4073                     127 00102$:
   4073 18 FE         [12]  128 	jr	00102$
   4075                     129 _g_items_0:
   4075 05                  130 	.db #0x05	; 5
   4076 0F                  131 	.db #0x0f	; 15
   4077 0F                  132 	.db #0x0f	; 15
   4078 00                  133 	.db #0x00	; 0
   4079 0F                  134 	.db #0x0f	; 15
   407A 0F                  135 	.db #0x0f	; 15
   407B 0F                  136 	.db #0x0f	; 15
   407C 0A                  137 	.db #0x0a	; 10
   407D 0F                  138 	.db #0x0f	; 15
   407E 0A                  139 	.db #0x0a	; 10
   407F 05                  140 	.db #0x05	; 5
   4080 00                  141 	.db #0x00	; 0
   4081 0F                  142 	.db #0x0f	; 15
   4082 0A                  143 	.db #0x0a	; 10
   4083 05                  144 	.db #0x05	; 5
   4084 00                  145 	.db #0x00	; 0
   4085 05                  146 	.db #0x05	; 5
   4086 0F                  147 	.db #0x0f	; 15
   4087 0A                  148 	.db #0x0a	; 10
   4088 0A                  149 	.db #0x0a	; 10
   4089 00                  150 	.db #0x00	; 0
   408A 0F                  151 	.db #0x0f	; 15
   408B 0F                  152 	.db #0x0f	; 15
   408C 0A                  153 	.db #0x0a	; 10
   408D 00                  154 	.db #0x00	; 0
   408E 0A                  155 	.db #0x0a	; 10
   408F 0A                  156 	.db #0x0a	; 10
   4090 0A                  157 	.db #0x0a	; 10
   4091 00                  158 	.db #0x00	; 0
   4092 00                  159 	.db #0x00	; 0
   4093 00                  160 	.db #0x00	; 0
   4094 00                  161 	.db #0x00	; 0
   4095                     162 ___str_0:
   4095 57 65 6C 63 6F 6D   163 	.ascii "Welcome to you!"
        65 20 74 6F 20 79
        6F 75 21
   40A4 00                  164 	.db 0x00
                            165 	.area _CODE
                            166 	.area _INITIALIZER
                            167 	.area _CABS (ABS)
