                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module jdvapi_sync
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _scan
                             12 	.globl _overscanH
                             13 	.globl _bank7_4000
                             14 	.globl _bank6_4000
                             15 	.globl _bank5_4000
                             16 	.globl _bank4_4000
                             17 	.globl _bank7_C000
                             18 	.globl _bank0123
                             19 	.globl _calque4C00
                             20 	.globl _calque4000
                             21 	.globl _calqueC000
                             22 	.globl _halt
                             23 	.globl _handle_raster
                             24 	.globl _raster
                             25 	.globl _raster_handler
                             26 	.globl _callback
                             27 	.globl _raster_halt
                             28 	.globl _vsync
                             29 	.globl _aFunction
                             30 	.globl _callback_counter
                             31 ;--------------------------------------------------------
                             32 ; special function registers
                             33 ;--------------------------------------------------------
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DATA
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _INITIALIZED
   264A                      42 _callback_counter::
   264A                      43 	.ds 1
   264B                      44 _aFunction::
   264B                      45 	.ds 2
                             46 ;--------------------------------------------------------
                             47 ; absolute external ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DABS (ABS)
                             50 ;--------------------------------------------------------
                             51 ; global & static initialisations
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _GSINIT
                             55 	.area _GSFINAL
                             56 	.area _GSINIT
                             57 ;--------------------------------------------------------
                             58 ; Home
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _HOME
                             62 ;--------------------------------------------------------
                             63 ; code
                             64 ;--------------------------------------------------------
                             65 	.area _CODE
                             66 ;src/jdvapi_sync.c:3: void vsync()
                             67 ;	---------------------------------
                             68 ; Function vsync
                             69 ; ---------------------------------
   072B                      70 _vsync::
                             71 ;src/jdvapi_sync.c:13: __endasm;
   072B 06 F5         [ 7]   72 	ld	b,#0xf5 ;; PPI port B input
   072D                      73 	    _wait_vsync:
   072D ED 78         [12]   74 	in	a,(c) ;; [4] read PPI port B input
                             75 ;;	(bit 0 = "1" if vsync is active,
                             76 ;;	or bit 0 = "0" if vsync is in-active)
   072F 1F            [ 4]   77 	rra	;; [1] put bit 0 into carry flag
   0730 D2 2D 07      [10]   78 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             79 ;src/jdvapi_sync.c:14: callback_counter=0;
   0733 21 4A 26      [10]   80 	ld	hl,#_callback_counter + 0
   0736 36 00         [10]   81 	ld	(hl), #0x00
   0738 C9            [10]   82 	ret
                             83 ;src/jdvapi_sync.c:17: void raster_halt()
                             84 ;	---------------------------------
                             85 ; Function raster_halt
                             86 ; ---------------------------------
   0739                      87 _raster_halt::
                             88 ;src/jdvapi_sync.c:25: __endasm;
   0739 F3            [ 4]   89 	di
   073A 21 FB C9      [10]   90 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   073D 22 38 00      [16]   91 	LD	(#0x38),HL
   0740 FB            [ 4]   92 	ei
   0741 C9            [10]   93 	ret
                             94 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             95 ;	---------------------------------
                             96 ; Function callback
                             97 ; ---------------------------------
   0742                      98 _callback::
                             99 ;src/jdvapi_sync.c:49: __endasm;
   0742 CD 00 00      [17]  100 	call	0
   0745 C9            [10]  101 	ret
                            102 ;src/jdvapi_sync.c:54: void raster_handler()
                            103 ;	---------------------------------
                            104 ; Function raster_handler
                            105 ; ---------------------------------
   0746                     106 _raster_handler::
                            107 ;src/jdvapi_sync.c:73: __endasm;
                            108 ;;	backup Z80 state
   0746 F5            [11]  109 	push	af
   0747 C5            [11]  110 	push	bc
   0748 D5            [11]  111 	push	de
   0749 E5            [11]  112 	push	hl
   074A DD E5         [15]  113 	push	ix
   074C FD E5         [15]  114 	push	iy
   074E D9            [ 4]  115 	exx
   074F 08            [ 4]  116 	ex	af, af' ; '
   0750 F5            [11]  117 	push	af
   0751 C5            [11]  118 	push	bc
   0752 D5            [11]  119 	push	de
   0753 E5            [11]  120 	push	hl
                            121 ;;	here we do custom code..
                            122 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   0754 21 4A 26      [10]  123 	ld	hl,#_callback_counter + 0
   0757 4E            [ 7]  124 	ld	c, (hl)
   0758 06 00         [ 7]  125 	ld	b, #0x00
   075A 03            [ 6]  126 	inc	bc
   075B 21 06 00      [10]  127 	ld	hl, #0x0006
   075E E5            [11]  128 	push	hl
   075F C5            [11]  129 	push	bc
   0760 CD 50 25      [17]  130 	call	__modsint
   0763 F1            [10]  131 	pop	af
   0764 F1            [10]  132 	pop	af
   0765 FD 21 4A 26   [14]  133 	ld	iy, #_callback_counter
   0769 FD 75 00      [19]  134 	ld	0 (iy), l
                            135 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   076C 3A 4A 26      [13]  136 	ld	a, (_callback_counter)
   076F F5            [11]  137 	push	af
   0770 33            [ 6]  138 	inc	sp
   0771 2A 4B 26      [16]  139 	ld	hl, (_aFunction)
   0774 CD 1C 24      [17]  140 	call	___sdcc_call_hl
   0777 33            [ 6]  141 	inc	sp
                            142 ;src/jdvapi_sync.c:95: __endasm;
                            143 ;;	restore Z80 state
   0778 E1            [10]  144 	pop	hl
   0779 D1            [10]  145 	pop	de
   077A C1            [10]  146 	pop	bc
   077B F1            [10]  147 	pop	af
   077C 08            [ 4]  148 	ex	af, af' ; '
   077D D9            [ 4]  149 	exx
   077E FD E1         [14]  150 	pop	iy
   0780 DD E1         [14]  151 	pop	ix
   0782 E1            [10]  152 	pop	hl
   0783 D1            [10]  153 	pop	de
   0784 C1            [10]  154 	pop	bc
   0785 F1            [10]  155 	pop	af
   0786 FB            [ 4]  156 	ei
   0787 C9            [10]  157 	ret
   0788 C9            [10]  158 	ret
                            159 ;src/jdvapi_sync.c:99: void raster()
                            160 ;	---------------------------------
                            161 ; Function raster
                            162 ; ---------------------------------
   0789                     163 _raster::
                            164 ;src/jdvapi_sync.c:108: __endasm;
   0789 F3            [ 4]  165 	di
   078A FD 21 39 00   [14]  166 	ld	iy,#0x39
   078E FD 36 00 46   [19]  167 	ld	0 (iy),#<(_raster_handler)
   0792 FD 36 01 07   [19]  168 	ld	1 (iy),#>(_raster_handler)
   0796 FB            [ 4]  169 	ei
   0797 C9            [10]  170 	ret
                            171 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            172 ;	---------------------------------
                            173 ; Function handle_raster
                            174 ; ---------------------------------
   0798                     175 _handle_raster::
                            176 ;src/jdvapi_sync.c:145: aFunction=callback;
   0798 21 02 00      [10]  177 	ld	hl, #2+0
   079B 39            [11]  178 	add	hl, sp
   079C 7E            [ 7]  179 	ld	a, (hl)
   079D 32 4B 26      [13]  180 	ld	(#_aFunction + 0),a
   07A0 21 03 00      [10]  181 	ld	hl, #2+1
   07A3 39            [11]  182 	add	hl, sp
   07A4 7E            [ 7]  183 	ld	a, (hl)
   07A5 32 4C 26      [13]  184 	ld	(#_aFunction + 1),a
   07A8 C9            [10]  185 	ret
                            186 ;src/jdvapi_sync.c:148: void halt()
                            187 ;	---------------------------------
                            188 ; Function halt
                            189 ; ---------------------------------
   07A9                     190 _halt::
                            191 ;src/jdvapi_sync.c:152: __endasm;
   07A9 76            [ 4]  192 	halt
   07AA C9            [10]  193 	ret
                            194 ;src/jdvapi_sync.c:155: void calqueC000()
                            195 ;	---------------------------------
                            196 ; Function calqueC000
                            197 ; ---------------------------------
   07AB                     198 _calqueC000::
                            199 ;src/jdvapi_sync.c:162: __endasm;
   07AB 01 0C BC      [10]  200 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   07AE ED 49         [12]  201 	out	(c),c ; le registre 12 du CRTC
   07B0 01 30 BD      [10]  202 	ld	bc,#0xBD00+48
   07B3 ED 49         [12]  203 	out	(c),c
   07B5 C9            [10]  204 	ret
                            205 ;src/jdvapi_sync.c:165: void calque4000()
                            206 ;	---------------------------------
                            207 ; Function calque4000
                            208 ; ---------------------------------
   07B6                     209 _calque4000::
                            210 ;src/jdvapi_sync.c:172: __endasm;
   07B6 01 0C BC      [10]  211 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   07B9 ED 49         [12]  212 	out	(c),c ; le registre 12 du CRTC
   07BB 01 10 BD      [10]  213 	ld	bc,#0xBD00+16
   07BE ED 49         [12]  214 	out	(c),c
   07C0 C9            [10]  215 	ret
                            216 ;src/jdvapi_sync.c:175: void calque4C00()
                            217 ;	---------------------------------
                            218 ; Function calque4C00
                            219 ; ---------------------------------
   07C1                     220 _calque4C00::
                            221 ;src/jdvapi_sync.c:182: __endasm;
   07C1 01 0C BC      [10]  222 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   07C4 ED 49         [12]  223 	out	(c),c ; le registre 12 du CRTC
   07C6 01 1C BD      [10]  224 	ld	bc,#0xBD00+28
   07C9 ED 49         [12]  225 	out	(c),c
   07CB C9            [10]  226 	ret
                            227 ;src/jdvapi_sync.c:185: void bank0123()
                            228 ;	---------------------------------
                            229 ; Function bank0123
                            230 ; ---------------------------------
   07CC                     231 _bank0123::
                            232 ;src/jdvapi_sync.c:190: __endasm;
   07CC 01 C0 7F      [10]  233 	ld	bc,#0x7FC0+0 ; RAM rétablie
   07CF ED 49         [12]  234 	out	(c),c
   07D1 C9            [10]  235 	ret
                            236 ;src/jdvapi_sync.c:193: void bank7_C000()
                            237 ;	---------------------------------
                            238 ; Function bank7_C000
                            239 ; ---------------------------------
   07D2                     240 _bank7_C000::
                            241 ;src/jdvapi_sync.c:198: __endasm;
   07D2 01 C1 7F      [10]  242 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   07D5 ED 49         [12]  243 	out	(c),c
   07D7 C9            [10]  244 	ret
                            245 ;src/jdvapi_sync.c:201: void bank4_4000()
                            246 ;	---------------------------------
                            247 ; Function bank4_4000
                            248 ; ---------------------------------
   07D8                     249 _bank4_4000::
                            250 ;src/jdvapi_sync.c:206: __endasm;
   07D8 01 C4 7F      [10]  251 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   07DB ED 49         [12]  252 	out	(c),c
   07DD C9            [10]  253 	ret
                            254 ;src/jdvapi_sync.c:209: void bank5_4000()
                            255 ;	---------------------------------
                            256 ; Function bank5_4000
                            257 ; ---------------------------------
   07DE                     258 _bank5_4000::
                            259 ;src/jdvapi_sync.c:214: __endasm;
   07DE 01 C5 7F      [10]  260 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   07E1 ED 49         [12]  261 	out	(c),c
   07E3 C9            [10]  262 	ret
                            263 ;src/jdvapi_sync.c:217: void bank6_4000()
                            264 ;	---------------------------------
                            265 ; Function bank6_4000
                            266 ; ---------------------------------
   07E4                     267 _bank6_4000::
                            268 ;src/jdvapi_sync.c:222: __endasm;
   07E4 01 C6 7F      [10]  269 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   07E7 ED 49         [12]  270 	out	(c),c
   07E9 C9            [10]  271 	ret
                            272 ;src/jdvapi_sync.c:225: void bank7_4000()
                            273 ;	---------------------------------
                            274 ; Function bank7_4000
                            275 ; ---------------------------------
   07EA                     276 _bank7_4000::
                            277 ;src/jdvapi_sync.c:230: __endasm;
   07EA 01 C7 7F      [10]  278 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   07ED ED 49         [12]  279 	out	(c),c
   07EF C9            [10]  280 	ret
                            281 ;src/jdvapi_sync.c:267: void overscanH()
                            282 ;	---------------------------------
                            283 ; Function overscanH
                            284 ; ---------------------------------
   07F0                     285 _overscanH::
                            286 ;src/jdvapi_sync.c:287: __endasm;
   07F0 01 01 BC      [10]  287 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   07F3 ED 49         [12]  288 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   07F5 01 30 BD      [10]  289 	ld	bc,#0xBD00+48
   07F8 ED 49         [12]  290 	out	(c),c
   07FA 01 02 BC      [10]  291 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   07FD ED 49         [12]  292 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   07FF 01 32 BD      [10]  293 	ld	bc,#0xBD00+50
   0802 ED 49         [12]  294 	out	(c),c
   0804 01 06 BC      [10]  295 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   0807 ED 49         [12]  296 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   0809 01 15 BD      [10]  297 	ld	bc,#0xBD00+21
   080C ED 49         [12]  298 	out	(c),c
   080E 01 07 BC      [10]  299 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   0811 ED 49         [12]  300 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   0813 01 1D BD      [10]  301 	ld	bc,#0xBD00+29
   0816 ED 49         [12]  302 	out	(c),c
   0818 C9            [10]  303 	ret
                            304 ;src/jdvapi_sync.c:313: void scan()
                            305 ;	---------------------------------
                            306 ; Function scan
                            307 ; ---------------------------------
   0819                     308 _scan::
                            309 ;src/jdvapi_sync.c:332: __endasm;
   0819 01 01 BC      [10]  310 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   081C ED 49         [12]  311 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   081E 01 28 BD      [10]  312 	ld	bc,#0xBD00+40
   0821 ED 49         [12]  313 	out	(c),c
   0823 01 02 BC      [10]  314 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   0826 ED 49         [12]  315 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   0828 01 2E BD      [10]  316 	ld	bc,#0xBD00+46
   082B ED 49         [12]  317 	out	(c),c
   082D 01 06 BC      [10]  318 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   0830 ED 49         [12]  319 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   0832 01 19 BD      [10]  320 	ld	bc,#0xBD00+25
   0835 ED 49         [12]  321 	out	(c),c
   0837 01 07 BC      [10]  322 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   083A ED 49         [12]  323 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   083C 01 1E BD      [10]  324 	ld	bc,#0xBD00+30
   083F ED 49         [12]  325 	out	(c),c
   0841 C9            [10]  326 	ret
                            327 	.area _CODE
                            328 	.area _INITIALIZER
   2653                     329 __xinit__callback_counter:
   2653 00                  330 	.db #0x00	; 0
   2654                     331 __xinit__aFunction:
   2654 42 07               332 	.dw _callback
                            333 	.area _CABS (ABS)
