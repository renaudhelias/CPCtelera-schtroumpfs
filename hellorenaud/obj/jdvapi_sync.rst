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
   2517                      42 _callback_counter::
   2517                      43 	.ds 1
   2518                      44 _aFunction::
   2518                      45 	.ds 2
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
   04F9                      70 _vsync::
                             71 ;src/jdvapi_sync.c:13: __endasm;
   04F9 06 F5         [ 7]   72 	ld	b,#0xf5 ;; PPI port B input
   04FB                      73 	    _wait_vsync:
   04FB ED 78         [12]   74 	in	a,(c) ;; [4] read PPI port B input
                             75 ;;	(bit 0 = "1" if vsync is active,
                             76 ;;	or bit 0 = "0" if vsync is in-active)
   04FD 1F            [ 4]   77 	rra	;; [1] put bit 0 into carry flag
   04FE D2 FB 04      [10]   78 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             79 ;src/jdvapi_sync.c:14: callback_counter=0;
   0501 21 17 25      [10]   80 	ld	hl,#_callback_counter + 0
   0504 36 00         [10]   81 	ld	(hl), #0x00
   0506 C9            [10]   82 	ret
                             83 ;src/jdvapi_sync.c:17: void raster_halt()
                             84 ;	---------------------------------
                             85 ; Function raster_halt
                             86 ; ---------------------------------
   0507                      87 _raster_halt::
                             88 ;src/jdvapi_sync.c:25: __endasm;
   0507 F3            [ 4]   89 	di
   0508 21 FB C9      [10]   90 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   050B 22 38 00      [16]   91 	LD	(#0x38),HL
   050E FB            [ 4]   92 	ei
   050F C9            [10]   93 	ret
                             94 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             95 ;	---------------------------------
                             96 ; Function callback
                             97 ; ---------------------------------
   0510                      98 _callback::
                             99 ;src/jdvapi_sync.c:49: __endasm;
   0510 CD 00 00      [17]  100 	call	0
   0513 C9            [10]  101 	ret
                            102 ;src/jdvapi_sync.c:54: void raster_handler()
                            103 ;	---------------------------------
                            104 ; Function raster_handler
                            105 ; ---------------------------------
   0514                     106 _raster_handler::
                            107 ;src/jdvapi_sync.c:73: __endasm;
                            108 ;;	backup Z80 state
   0514 F5            [11]  109 	push	af
   0515 C5            [11]  110 	push	bc
   0516 D5            [11]  111 	push	de
   0517 E5            [11]  112 	push	hl
   0518 DD E5         [15]  113 	push	ix
   051A FD E5         [15]  114 	push	iy
   051C D9            [ 4]  115 	exx
   051D 08            [ 4]  116 	ex	af, af' ; '
   051E F5            [11]  117 	push	af
   051F C5            [11]  118 	push	bc
   0520 D5            [11]  119 	push	de
   0521 E5            [11]  120 	push	hl
                            121 ;;	here we do custom code..
                            122 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   0522 21 17 25      [10]  123 	ld	hl,#_callback_counter + 0
   0525 4E            [ 7]  124 	ld	c, (hl)
   0526 06 00         [ 7]  125 	ld	b, #0x00
   0528 03            [ 6]  126 	inc	bc
   0529 21 06 00      [10]  127 	ld	hl, #0x0006
   052C E5            [11]  128 	push	hl
   052D C5            [11]  129 	push	bc
   052E CD 21 24      [17]  130 	call	__modsint
   0531 F1            [10]  131 	pop	af
   0532 F1            [10]  132 	pop	af
   0533 FD 21 17 25   [14]  133 	ld	iy, #_callback_counter
   0537 FD 75 00      [19]  134 	ld	0 (iy), l
                            135 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   053A 3A 17 25      [13]  136 	ld	a, (_callback_counter)
   053D F5            [11]  137 	push	af
   053E 33            [ 6]  138 	inc	sp
   053F 2A 18 25      [16]  139 	ld	hl, (_aFunction)
   0542 CD C0 22      [17]  140 	call	___sdcc_call_hl
   0545 33            [ 6]  141 	inc	sp
                            142 ;src/jdvapi_sync.c:95: __endasm;
                            143 ;;	restore Z80 state
   0546 E1            [10]  144 	pop	hl
   0547 D1            [10]  145 	pop	de
   0548 C1            [10]  146 	pop	bc
   0549 F1            [10]  147 	pop	af
   054A 08            [ 4]  148 	ex	af, af' ; '
   054B D9            [ 4]  149 	exx
   054C FD E1         [14]  150 	pop	iy
   054E DD E1         [14]  151 	pop	ix
   0550 E1            [10]  152 	pop	hl
   0551 D1            [10]  153 	pop	de
   0552 C1            [10]  154 	pop	bc
   0553 F1            [10]  155 	pop	af
   0554 FB            [ 4]  156 	ei
   0555 C9            [10]  157 	ret
   0556 C9            [10]  158 	ret
                            159 ;src/jdvapi_sync.c:99: void raster()
                            160 ;	---------------------------------
                            161 ; Function raster
                            162 ; ---------------------------------
   0557                     163 _raster::
                            164 ;src/jdvapi_sync.c:108: __endasm;
   0557 F3            [ 4]  165 	di
   0558 FD 21 39 00   [14]  166 	ld	iy,#0x39
   055C FD 36 00 14   [19]  167 	ld	0 (iy),#<(_raster_handler)
   0560 FD 36 01 05   [19]  168 	ld	1 (iy),#>(_raster_handler)
   0564 FB            [ 4]  169 	ei
   0565 C9            [10]  170 	ret
                            171 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            172 ;	---------------------------------
                            173 ; Function handle_raster
                            174 ; ---------------------------------
   0566                     175 _handle_raster::
                            176 ;src/jdvapi_sync.c:145: aFunction=callback;
   0566 21 02 00      [10]  177 	ld	hl, #2+0
   0569 39            [11]  178 	add	hl, sp
   056A 7E            [ 7]  179 	ld	a, (hl)
   056B 32 18 25      [13]  180 	ld	(#_aFunction + 0),a
   056E 21 03 00      [10]  181 	ld	hl, #2+1
   0571 39            [11]  182 	add	hl, sp
   0572 7E            [ 7]  183 	ld	a, (hl)
   0573 32 19 25      [13]  184 	ld	(#_aFunction + 1),a
   0576 C9            [10]  185 	ret
                            186 ;src/jdvapi_sync.c:148: void halt()
                            187 ;	---------------------------------
                            188 ; Function halt
                            189 ; ---------------------------------
   0577                     190 _halt::
                            191 ;src/jdvapi_sync.c:152: __endasm;
   0577 76            [ 4]  192 	halt
   0578 C9            [10]  193 	ret
                            194 ;src/jdvapi_sync.c:155: void calqueC000()
                            195 ;	---------------------------------
                            196 ; Function calqueC000
                            197 ; ---------------------------------
   0579                     198 _calqueC000::
                            199 ;src/jdvapi_sync.c:162: __endasm;
   0579 01 0C BC      [10]  200 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   057C ED 49         [12]  201 	out	(c),c ; le registre 12 du CRTC
   057E 01 30 BD      [10]  202 	ld	bc,#0xBD00+48
   0581 ED 49         [12]  203 	out	(c),c
   0583 C9            [10]  204 	ret
                            205 ;src/jdvapi_sync.c:165: void calque4000()
                            206 ;	---------------------------------
                            207 ; Function calque4000
                            208 ; ---------------------------------
   0584                     209 _calque4000::
                            210 ;src/jdvapi_sync.c:172: __endasm;
   0584 01 0C BC      [10]  211 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   0587 ED 49         [12]  212 	out	(c),c ; le registre 12 du CRTC
   0589 01 10 BD      [10]  213 	ld	bc,#0xBD00+16
   058C ED 49         [12]  214 	out	(c),c
   058E C9            [10]  215 	ret
                            216 ;src/jdvapi_sync.c:175: void calque4C00()
                            217 ;	---------------------------------
                            218 ; Function calque4C00
                            219 ; ---------------------------------
   058F                     220 _calque4C00::
                            221 ;src/jdvapi_sync.c:182: __endasm;
   058F 01 0C BC      [10]  222 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   0592 ED 49         [12]  223 	out	(c),c ; le registre 12 du CRTC
   0594 01 1C BD      [10]  224 	ld	bc,#0xBD00+28
   0597 ED 49         [12]  225 	out	(c),c
   0599 C9            [10]  226 	ret
                            227 ;src/jdvapi_sync.c:185: void bank0123()
                            228 ;	---------------------------------
                            229 ; Function bank0123
                            230 ; ---------------------------------
   059A                     231 _bank0123::
                            232 ;src/jdvapi_sync.c:190: __endasm;
   059A 01 C0 7F      [10]  233 	ld	bc,#0x7FC0+0 ; RAM rétablie
   059D ED 49         [12]  234 	out	(c),c
   059F C9            [10]  235 	ret
                            236 ;src/jdvapi_sync.c:193: void bank7_C000()
                            237 ;	---------------------------------
                            238 ; Function bank7_C000
                            239 ; ---------------------------------
   05A0                     240 _bank7_C000::
                            241 ;src/jdvapi_sync.c:198: __endasm;
   05A0 01 C1 7F      [10]  242 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   05A3 ED 49         [12]  243 	out	(c),c
   05A5 C9            [10]  244 	ret
                            245 ;src/jdvapi_sync.c:201: void bank4_4000()
                            246 ;	---------------------------------
                            247 ; Function bank4_4000
                            248 ; ---------------------------------
   05A6                     249 _bank4_4000::
                            250 ;src/jdvapi_sync.c:206: __endasm;
   05A6 01 C4 7F      [10]  251 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   05A9 ED 49         [12]  252 	out	(c),c
   05AB C9            [10]  253 	ret
                            254 ;src/jdvapi_sync.c:209: void bank5_4000()
                            255 ;	---------------------------------
                            256 ; Function bank5_4000
                            257 ; ---------------------------------
   05AC                     258 _bank5_4000::
                            259 ;src/jdvapi_sync.c:214: __endasm;
   05AC 01 C5 7F      [10]  260 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   05AF ED 49         [12]  261 	out	(c),c
   05B1 C9            [10]  262 	ret
                            263 ;src/jdvapi_sync.c:217: void bank6_4000()
                            264 ;	---------------------------------
                            265 ; Function bank6_4000
                            266 ; ---------------------------------
   05B2                     267 _bank6_4000::
                            268 ;src/jdvapi_sync.c:222: __endasm;
   05B2 01 C6 7F      [10]  269 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   05B5 ED 49         [12]  270 	out	(c),c
   05B7 C9            [10]  271 	ret
                            272 ;src/jdvapi_sync.c:225: void bank7_4000()
                            273 ;	---------------------------------
                            274 ; Function bank7_4000
                            275 ; ---------------------------------
   05B8                     276 _bank7_4000::
                            277 ;src/jdvapi_sync.c:230: __endasm;
   05B8 01 C7 7F      [10]  278 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   05BB ED 49         [12]  279 	out	(c),c
   05BD C9            [10]  280 	ret
                            281 ;src/jdvapi_sync.c:267: void overscanH()
                            282 ;	---------------------------------
                            283 ; Function overscanH
                            284 ; ---------------------------------
   05BE                     285 _overscanH::
                            286 ;src/jdvapi_sync.c:287: __endasm;
   05BE 01 01 BC      [10]  287 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   05C1 ED 49         [12]  288 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   05C3 01 30 BD      [10]  289 	ld	bc,#0xBD00+48
   05C6 ED 49         [12]  290 	out	(c),c
   05C8 01 02 BC      [10]  291 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   05CB ED 49         [12]  292 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   05CD 01 32 BD      [10]  293 	ld	bc,#0xBD00+50
   05D0 ED 49         [12]  294 	out	(c),c
   05D2 01 06 BC      [10]  295 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   05D5 ED 49         [12]  296 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   05D7 01 15 BD      [10]  297 	ld	bc,#0xBD00+21
   05DA ED 49         [12]  298 	out	(c),c
   05DC 01 07 BC      [10]  299 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   05DF ED 49         [12]  300 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   05E1 01 1D BD      [10]  301 	ld	bc,#0xBD00+29
   05E4 ED 49         [12]  302 	out	(c),c
   05E6 C9            [10]  303 	ret
                            304 ;src/jdvapi_sync.c:313: void scan()
                            305 ;	---------------------------------
                            306 ; Function scan
                            307 ; ---------------------------------
   05E7                     308 _scan::
                            309 ;src/jdvapi_sync.c:332: __endasm;
   05E7 01 01 BC      [10]  310 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   05EA ED 49         [12]  311 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   05EC 01 28 BD      [10]  312 	ld	bc,#0xBD00+40
   05EF ED 49         [12]  313 	out	(c),c
   05F1 01 02 BC      [10]  314 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   05F4 ED 49         [12]  315 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   05F6 01 2E BD      [10]  316 	ld	bc,#0xBD00+46
   05F9 ED 49         [12]  317 	out	(c),c
   05FB 01 06 BC      [10]  318 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   05FE ED 49         [12]  319 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   0600 01 19 BD      [10]  320 	ld	bc,#0xBD00+25
   0603 ED 49         [12]  321 	out	(c),c
   0605 01 07 BC      [10]  322 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   0608 ED 49         [12]  323 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   060A 01 1E BD      [10]  324 	ld	bc,#0xBD00+30
   060D ED 49         [12]  325 	out	(c),c
   060F C9            [10]  326 	ret
                            327 	.area _CODE
                            328 	.area _INITIALIZER
   251B                     329 __xinit__callback_counter:
   251B 00                  330 	.db #0x00	; 0
   251C                     331 __xinit__aFunction:
   251C 10 05               332 	.dw _callback
                            333 	.area _CABS (ABS)
