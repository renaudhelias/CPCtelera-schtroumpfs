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
   246E                      42 _callback_counter::
   246E                      43 	.ds 1
   246F                      44 _aFunction::
   246F                      45 	.ds 2
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
   0450                      70 _vsync::
                             71 ;src/jdvapi_sync.c:13: __endasm;
   0450 06 F5         [ 7]   72 	ld	b,#0xf5 ;; PPI port B input
   0452                      73 	    _wait_vsync:
   0452 ED 78         [12]   74 	in	a,(c) ;; [4] read PPI port B input
                             75 ;;	(bit 0 = "1" if vsync is active,
                             76 ;;	or bit 0 = "0" if vsync is in-active)
   0454 1F            [ 4]   77 	rra	;; [1] put bit 0 into carry flag
   0455 D2 52 04      [10]   78 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             79 ;src/jdvapi_sync.c:14: callback_counter=0;
   0458 21 6E 24      [10]   80 	ld	hl,#_callback_counter + 0
   045B 36 00         [10]   81 	ld	(hl), #0x00
   045D C9            [10]   82 	ret
                             83 ;src/jdvapi_sync.c:17: void raster_halt()
                             84 ;	---------------------------------
                             85 ; Function raster_halt
                             86 ; ---------------------------------
   045E                      87 _raster_halt::
                             88 ;src/jdvapi_sync.c:25: __endasm;
   045E F3            [ 4]   89 	di
   045F 21 FB C9      [10]   90 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   0462 22 38 00      [16]   91 	LD	(#0x38),HL
   0465 FB            [ 4]   92 	ei
   0466 C9            [10]   93 	ret
                             94 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             95 ;	---------------------------------
                             96 ; Function callback
                             97 ; ---------------------------------
   0467                      98 _callback::
                             99 ;src/jdvapi_sync.c:49: __endasm;
   0467 CD 00 00      [17]  100 	call	0
   046A C9            [10]  101 	ret
                            102 ;src/jdvapi_sync.c:54: void raster_handler()
                            103 ;	---------------------------------
                            104 ; Function raster_handler
                            105 ; ---------------------------------
   046B                     106 _raster_handler::
                            107 ;src/jdvapi_sync.c:73: __endasm;
                            108 ;;	backup Z80 state
   046B F5            [11]  109 	push	af
   046C C5            [11]  110 	push	bc
   046D D5            [11]  111 	push	de
   046E E5            [11]  112 	push	hl
   046F DD E5         [15]  113 	push	ix
   0471 FD E5         [15]  114 	push	iy
   0473 D9            [ 4]  115 	exx
   0474 08            [ 4]  116 	ex	af, af' ; '
   0475 F5            [11]  117 	push	af
   0476 C5            [11]  118 	push	bc
   0477 D5            [11]  119 	push	de
   0478 E5            [11]  120 	push	hl
                            121 ;;	here we do custom code..
                            122 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   0479 21 6E 24      [10]  123 	ld	hl,#_callback_counter + 0
   047C 4E            [ 7]  124 	ld	c, (hl)
   047D 06 00         [ 7]  125 	ld	b, #0x00
   047F 03            [ 6]  126 	inc	bc
   0480 21 06 00      [10]  127 	ld	hl, #0x0006
   0483 E5            [11]  128 	push	hl
   0484 C5            [11]  129 	push	bc
   0485 CD 78 23      [17]  130 	call	__modsint
   0488 F1            [10]  131 	pop	af
   0489 F1            [10]  132 	pop	af
   048A FD 21 6E 24   [14]  133 	ld	iy, #_callback_counter
   048E FD 75 00      [19]  134 	ld	0 (iy), l
                            135 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   0491 3A 6E 24      [13]  136 	ld	a, (_callback_counter)
   0494 F5            [11]  137 	push	af
   0495 33            [ 6]  138 	inc	sp
   0496 2A 6F 24      [16]  139 	ld	hl, (_aFunction)
   0499 CD 17 22      [17]  140 	call	___sdcc_call_hl
   049C 33            [ 6]  141 	inc	sp
                            142 ;src/jdvapi_sync.c:95: __endasm;
                            143 ;;	restore Z80 state
   049D E1            [10]  144 	pop	hl
   049E D1            [10]  145 	pop	de
   049F C1            [10]  146 	pop	bc
   04A0 F1            [10]  147 	pop	af
   04A1 08            [ 4]  148 	ex	af, af' ; '
   04A2 D9            [ 4]  149 	exx
   04A3 FD E1         [14]  150 	pop	iy
   04A5 DD E1         [14]  151 	pop	ix
   04A7 E1            [10]  152 	pop	hl
   04A8 D1            [10]  153 	pop	de
   04A9 C1            [10]  154 	pop	bc
   04AA F1            [10]  155 	pop	af
   04AB FB            [ 4]  156 	ei
   04AC C9            [10]  157 	ret
   04AD C9            [10]  158 	ret
                            159 ;src/jdvapi_sync.c:99: void raster()
                            160 ;	---------------------------------
                            161 ; Function raster
                            162 ; ---------------------------------
   04AE                     163 _raster::
                            164 ;src/jdvapi_sync.c:108: __endasm;
   04AE F3            [ 4]  165 	di
   04AF FD 21 39 00   [14]  166 	ld	iy,#0x39
   04B3 FD 36 00 6B   [19]  167 	ld	0 (iy),#<(_raster_handler)
   04B7 FD 36 01 04   [19]  168 	ld	1 (iy),#>(_raster_handler)
   04BB FB            [ 4]  169 	ei
   04BC C9            [10]  170 	ret
                            171 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            172 ;	---------------------------------
                            173 ; Function handle_raster
                            174 ; ---------------------------------
   04BD                     175 _handle_raster::
                            176 ;src/jdvapi_sync.c:145: aFunction=callback;
   04BD 21 02 00      [10]  177 	ld	hl, #2+0
   04C0 39            [11]  178 	add	hl, sp
   04C1 7E            [ 7]  179 	ld	a, (hl)
   04C2 32 6F 24      [13]  180 	ld	(#_aFunction + 0),a
   04C5 21 03 00      [10]  181 	ld	hl, #2+1
   04C8 39            [11]  182 	add	hl, sp
   04C9 7E            [ 7]  183 	ld	a, (hl)
   04CA 32 70 24      [13]  184 	ld	(#_aFunction + 1),a
   04CD C9            [10]  185 	ret
                            186 ;src/jdvapi_sync.c:148: void halt()
                            187 ;	---------------------------------
                            188 ; Function halt
                            189 ; ---------------------------------
   04CE                     190 _halt::
                            191 ;src/jdvapi_sync.c:152: __endasm;
   04CE 76            [ 4]  192 	halt
   04CF C9            [10]  193 	ret
                            194 ;src/jdvapi_sync.c:155: void calqueC000()
                            195 ;	---------------------------------
                            196 ; Function calqueC000
                            197 ; ---------------------------------
   04D0                     198 _calqueC000::
                            199 ;src/jdvapi_sync.c:162: __endasm;
   04D0 01 0C BC      [10]  200 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   04D3 ED 49         [12]  201 	out	(c),c ; le registre 12 du CRTC
   04D5 01 30 BD      [10]  202 	ld	bc,#0xBD00+48
   04D8 ED 49         [12]  203 	out	(c),c
   04DA C9            [10]  204 	ret
                            205 ;src/jdvapi_sync.c:165: void calque4000()
                            206 ;	---------------------------------
                            207 ; Function calque4000
                            208 ; ---------------------------------
   04DB                     209 _calque4000::
                            210 ;src/jdvapi_sync.c:172: __endasm;
   04DB 01 0C BC      [10]  211 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   04DE ED 49         [12]  212 	out	(c),c ; le registre 12 du CRTC
   04E0 01 10 BD      [10]  213 	ld	bc,#0xBD00+16
   04E3 ED 49         [12]  214 	out	(c),c
   04E5 C9            [10]  215 	ret
                            216 ;src/jdvapi_sync.c:175: void calque4C00()
                            217 ;	---------------------------------
                            218 ; Function calque4C00
                            219 ; ---------------------------------
   04E6                     220 _calque4C00::
                            221 ;src/jdvapi_sync.c:182: __endasm;
   04E6 01 0C BC      [10]  222 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   04E9 ED 49         [12]  223 	out	(c),c ; le registre 12 du CRTC
   04EB 01 1C BD      [10]  224 	ld	bc,#0xBD00+28
   04EE ED 49         [12]  225 	out	(c),c
   04F0 C9            [10]  226 	ret
                            227 ;src/jdvapi_sync.c:185: void bank0123()
                            228 ;	---------------------------------
                            229 ; Function bank0123
                            230 ; ---------------------------------
   04F1                     231 _bank0123::
                            232 ;src/jdvapi_sync.c:190: __endasm;
   04F1 01 C0 7F      [10]  233 	ld	bc,#0x7FC0+0 ; RAM rétablie
   04F4 ED 49         [12]  234 	out	(c),c
   04F6 C9            [10]  235 	ret
                            236 ;src/jdvapi_sync.c:193: void bank7_C000()
                            237 ;	---------------------------------
                            238 ; Function bank7_C000
                            239 ; ---------------------------------
   04F7                     240 _bank7_C000::
                            241 ;src/jdvapi_sync.c:198: __endasm;
   04F7 01 C1 7F      [10]  242 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   04FA ED 49         [12]  243 	out	(c),c
   04FC C9            [10]  244 	ret
                            245 ;src/jdvapi_sync.c:201: void bank4_4000()
                            246 ;	---------------------------------
                            247 ; Function bank4_4000
                            248 ; ---------------------------------
   04FD                     249 _bank4_4000::
                            250 ;src/jdvapi_sync.c:206: __endasm;
   04FD 01 C4 7F      [10]  251 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   0500 ED 49         [12]  252 	out	(c),c
   0502 C9            [10]  253 	ret
                            254 ;src/jdvapi_sync.c:209: void bank5_4000()
                            255 ;	---------------------------------
                            256 ; Function bank5_4000
                            257 ; ---------------------------------
   0503                     258 _bank5_4000::
                            259 ;src/jdvapi_sync.c:214: __endasm;
   0503 01 C5 7F      [10]  260 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   0506 ED 49         [12]  261 	out	(c),c
   0508 C9            [10]  262 	ret
                            263 ;src/jdvapi_sync.c:217: void bank6_4000()
                            264 ;	---------------------------------
                            265 ; Function bank6_4000
                            266 ; ---------------------------------
   0509                     267 _bank6_4000::
                            268 ;src/jdvapi_sync.c:222: __endasm;
   0509 01 C6 7F      [10]  269 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   050C ED 49         [12]  270 	out	(c),c
   050E C9            [10]  271 	ret
                            272 ;src/jdvapi_sync.c:225: void bank7_4000()
                            273 ;	---------------------------------
                            274 ; Function bank7_4000
                            275 ; ---------------------------------
   050F                     276 _bank7_4000::
                            277 ;src/jdvapi_sync.c:230: __endasm;
   050F 01 C7 7F      [10]  278 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   0512 ED 49         [12]  279 	out	(c),c
   0514 C9            [10]  280 	ret
                            281 ;src/jdvapi_sync.c:267: void overscanH()
                            282 ;	---------------------------------
                            283 ; Function overscanH
                            284 ; ---------------------------------
   0515                     285 _overscanH::
                            286 ;src/jdvapi_sync.c:287: __endasm;
   0515 01 01 BC      [10]  287 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   0518 ED 49         [12]  288 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   051A 01 30 BD      [10]  289 	ld	bc,#0xBD00+48
   051D ED 49         [12]  290 	out	(c),c
   051F 01 02 BC      [10]  291 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   0522 ED 49         [12]  292 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   0524 01 32 BD      [10]  293 	ld	bc,#0xBD00+50
   0527 ED 49         [12]  294 	out	(c),c
   0529 01 06 BC      [10]  295 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   052C ED 49         [12]  296 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   052E 01 15 BD      [10]  297 	ld	bc,#0xBD00+21
   0531 ED 49         [12]  298 	out	(c),c
   0533 01 07 BC      [10]  299 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   0536 ED 49         [12]  300 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   0538 01 1D BD      [10]  301 	ld	bc,#0xBD00+29
   053B ED 49         [12]  302 	out	(c),c
   053D C9            [10]  303 	ret
                            304 ;src/jdvapi_sync.c:313: void scan()
                            305 ;	---------------------------------
                            306 ; Function scan
                            307 ; ---------------------------------
   053E                     308 _scan::
                            309 ;src/jdvapi_sync.c:332: __endasm;
   053E 01 01 BC      [10]  310 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   0541 ED 49         [12]  311 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   0543 01 28 BD      [10]  312 	ld	bc,#0xBD00+40
   0546 ED 49         [12]  313 	out	(c),c
   0548 01 02 BC      [10]  314 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   054B ED 49         [12]  315 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   054D 01 2E BD      [10]  316 	ld	bc,#0xBD00+46
   0550 ED 49         [12]  317 	out	(c),c
   0552 01 06 BC      [10]  318 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   0555 ED 49         [12]  319 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   0557 01 19 BD      [10]  320 	ld	bc,#0xBD00+25
   055A ED 49         [12]  321 	out	(c),c
   055C 01 07 BC      [10]  322 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   055F ED 49         [12]  323 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   0561 01 1E BD      [10]  324 	ld	bc,#0xBD00+30
   0564 ED 49         [12]  325 	out	(c),c
   0566 C9            [10]  326 	ret
                            327 	.area _CODE
                            328 	.area _INITIALIZER
   2472                     329 __xinit__callback_counter:
   2472 00                  330 	.db #0x00	; 0
   2473                     331 __xinit__aFunction:
   2473 67 04               332 	.dw _callback
                            333 	.area _CABS (ABS)
