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
                             21 	.globl _calque8000
                             22 	.globl _calqueC000
                             23 	.globl _halt
                             24 	.globl _handle_raster
                             25 	.globl _raster
                             26 	.globl _raster_handler
                             27 	.globl _callback
                             28 	.globl _raster_halt
                             29 	.globl _vsync
                             30 	.globl _aFunction
                             31 	.globl _callback_counter
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
   4C18                      43 _callback_counter::
   4C18                      44 	.ds 2
   4C1A                      45 _aFunction::
   4C1A                      46 	.ds 2
                             47 ;--------------------------------------------------------
                             48 ; absolute external ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DABS (ABS)
                             51 ;--------------------------------------------------------
                             52 ; global & static initialisations
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _GSINIT
                             56 	.area _GSFINAL
                             57 	.area _GSINIT
                             58 ;--------------------------------------------------------
                             59 ; Home
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _HOME
                             63 ;--------------------------------------------------------
                             64 ; code
                             65 ;--------------------------------------------------------
                             66 	.area _CODE
                             67 ;src/jdvapi_sync.c:4: void vsync()
                             68 ;	---------------------------------
                             69 ; Function vsync
                             70 ; ---------------------------------
   439A                      71 _vsync::
                             72 ;src/jdvapi_sync.c:14: __endasm;
   439A 06 F5         [ 7]   73 	ld	b,#0xf5 ;; PPI port B input
   439C                      74 	    _wait_vsync:
   439C ED 78         [12]   75 	in	a,(c) ;; [4] read PPI port B input
                             76 ;;	(bit 0 = "1" if vsync is active,
                             77 ;;	or bit 0 = "0" if vsync is in-active)
   439E 1F            [ 4]   78 	rra	;; [1] put bit 0 into carry flag
   439F D2 9C 43      [10]   79 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             80 ;src/jdvapi_sync.c:15: callback_counter=0;
   43A2 21 00 00      [10]   81 	ld	hl, #0x0000
   43A5 22 18 4C      [16]   82 	ld	(_callback_counter), hl
   43A8 C9            [10]   83 	ret
                             84 ;src/jdvapi_sync.c:18: void raster_halt()
                             85 ;	---------------------------------
                             86 ; Function raster_halt
                             87 ; ---------------------------------
   43A9                      88 _raster_halt::
                             89 ;src/jdvapi_sync.c:26: __endasm;
   43A9 F3            [ 4]   90 	di
   43AA 21 FB C9      [10]   91 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   43AD 22 38 00      [16]   92 	LD	(#0x38),HL
   43B0 FB            [ 4]   93 	ei
   43B1 C9            [10]   94 	ret
                             95 ;src/jdvapi_sync.c:46: void callback(unsigned char counter){
                             96 ;	---------------------------------
                             97 ; Function callback
                             98 ; ---------------------------------
   43B2                      99 _callback::
                            100 ;src/jdvapi_sync.c:50: __endasm;
   43B2 CD 00 00      [17]  101 	call	0
   43B5 C9            [10]  102 	ret
                            103 ;src/jdvapi_sync.c:55: void raster_handler()
                            104 ;	---------------------------------
                            105 ; Function raster_handler
                            106 ; ---------------------------------
   43B6                     107 _raster_handler::
                            108 ;src/jdvapi_sync.c:74: __endasm;
                            109 ;;	backup Z80 state
   43B6 F5            [11]  110 	push	af
   43B7 C5            [11]  111 	push	bc
   43B8 D5            [11]  112 	push	de
   43B9 E5            [11]  113 	push	hl
   43BA DD E5         [15]  114 	push	ix
   43BC FD E5         [15]  115 	push	iy
   43BE D9            [ 4]  116 	exx
   43BF 08            [ 4]  117 	ex	af, af' ; '
   43C0 F5            [11]  118 	push	af
   43C1 C5            [11]  119 	push	bc
   43C2 D5            [11]  120 	push	de
   43C3 E5            [11]  121 	push	hl
                            122 ;;	here we do custom code..
                            123 ;src/jdvapi_sync.c:76: callback_counter=(callback_counter+1)%6;
   43C4 2A 18 4C      [16]  124 	ld	hl, (_callback_counter)
   43C7 23            [ 6]  125 	inc	hl
   43C8 01 06 00      [10]  126 	ld	bc, #0x0006
   43CB C5            [11]  127 	push	bc
   43CC E5            [11]  128 	push	hl
   43CD CD 5E 4B      [17]  129 	call	__moduint
   43D0 F1            [10]  130 	pop	af
   43D1 F1            [10]  131 	pop	af
   43D2 22 18 4C      [16]  132 	ld	(_callback_counter), hl
                            133 ;src/jdvapi_sync.c:77: aFunction(callback_counter);
   43D5 21 18 4C      [10]  134 	ld	hl,#_callback_counter + 0
   43D8 46            [ 7]  135 	ld	b, (hl)
   43D9 C5            [11]  136 	push	bc
   43DA 33            [ 6]  137 	inc	sp
   43DB 2A 1A 4C      [16]  138 	ld	hl, (_aFunction)
   43DE CD C3 4A      [17]  139 	call	___sdcc_call_hl
   43E1 33            [ 6]  140 	inc	sp
                            141 ;src/jdvapi_sync.c:96: __endasm;
                            142 ;;	restore Z80 state
   43E2 E1            [10]  143 	pop	hl
   43E3 D1            [10]  144 	pop	de
   43E4 C1            [10]  145 	pop	bc
   43E5 F1            [10]  146 	pop	af
   43E6 08            [ 4]  147 	ex	af, af' ; '
   43E7 D9            [ 4]  148 	exx
   43E8 FD E1         [14]  149 	pop	iy
   43EA DD E1         [14]  150 	pop	ix
   43EC E1            [10]  151 	pop	hl
   43ED D1            [10]  152 	pop	de
   43EE C1            [10]  153 	pop	bc
   43EF F1            [10]  154 	pop	af
   43F0 FB            [ 4]  155 	ei
   43F1 C9            [10]  156 	ret
   43F2 C9            [10]  157 	ret
                            158 ;src/jdvapi_sync.c:100: void raster()
                            159 ;	---------------------------------
                            160 ; Function raster
                            161 ; ---------------------------------
   43F3                     162 _raster::
                            163 ;src/jdvapi_sync.c:109: __endasm;
   43F3 F3            [ 4]  164 	di
   43F4 FD 21 39 00   [14]  165 	ld	iy,#0x39
   43F8 FD 36 00 B6   [19]  166 	ld	0 (iy),#<(_raster_handler)
   43FC FD 36 01 43   [19]  167 	ld	1 (iy),#>(_raster_handler)
   4400 FB            [ 4]  168 	ei
   4401 C9            [10]  169 	ret
                            170 ;src/jdvapi_sync.c:144: void handle_raster(MyFunctionReturningVoid callback) {
                            171 ;	---------------------------------
                            172 ; Function handle_raster
                            173 ; ---------------------------------
   4402                     174 _handle_raster::
                            175 ;src/jdvapi_sync.c:146: aFunction=callback;
   4402 21 02 00      [10]  176 	ld	hl, #2+0
   4405 39            [11]  177 	add	hl, sp
   4406 7E            [ 7]  178 	ld	a, (hl)
   4407 32 1A 4C      [13]  179 	ld	(#_aFunction + 0),a
   440A 21 03 00      [10]  180 	ld	hl, #2+1
   440D 39            [11]  181 	add	hl, sp
   440E 7E            [ 7]  182 	ld	a, (hl)
   440F 32 1B 4C      [13]  183 	ld	(#_aFunction + 1),a
   4412 C9            [10]  184 	ret
                            185 ;src/jdvapi_sync.c:149: void halt()
                            186 ;	---------------------------------
                            187 ; Function halt
                            188 ; ---------------------------------
   4413                     189 _halt::
                            190 ;src/jdvapi_sync.c:153: __endasm;
   4413 76            [ 4]  191 	halt
   4414 C9            [10]  192 	ret
                            193 ;src/jdvapi_sync.c:156: void calqueC000()
                            194 ;	---------------------------------
                            195 ; Function calqueC000
                            196 ; ---------------------------------
   4415                     197 _calqueC000::
                            198 ;src/jdvapi_sync.c:163: __endasm;
   4415 01 0C BC      [10]  199 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   4418 ED 49         [12]  200 	out	(c),c ; le registre 12 du CRTC
   441A 01 30 BD      [10]  201 	ld	bc,#0xBD00+48
   441D ED 49         [12]  202 	out	(c),c
   441F C9            [10]  203 	ret
                            204 ;src/jdvapi_sync.c:166: void calque8000()
                            205 ;	---------------------------------
                            206 ; Function calque8000
                            207 ; ---------------------------------
   4420                     208 _calque8000::
                            209 ;src/jdvapi_sync.c:173: __endasm;
   4420 01 0C BC      [10]  210 	ld	bc,#0xBC00+12 ; On met la valeur 32 dans
   4423 ED 49         [12]  211 	out	(c),c ; le registre 12 du CRTC
   4425 01 20 BD      [10]  212 	ld	bc,#0xBD00+32
   4428 ED 49         [12]  213 	out	(c),c
   442A C9            [10]  214 	ret
                            215 ;src/jdvapi_sync.c:176: void calque4000()
                            216 ;	---------------------------------
                            217 ; Function calque4000
                            218 ; ---------------------------------
   442B                     219 _calque4000::
                            220 ;src/jdvapi_sync.c:183: __endasm;
   442B 01 0C BC      [10]  221 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   442E ED 49         [12]  222 	out	(c),c ; le registre 12 du CRTC
   4430 01 10 BD      [10]  223 	ld	bc,#0xBD00+16
   4433 ED 49         [12]  224 	out	(c),c
   4435 C9            [10]  225 	ret
                            226 ;src/jdvapi_sync.c:186: void calque4C00()
                            227 ;	---------------------------------
                            228 ; Function calque4C00
                            229 ; ---------------------------------
   4436                     230 _calque4C00::
                            231 ;src/jdvapi_sync.c:193: __endasm;
   4436 01 0C BC      [10]  232 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   4439 ED 49         [12]  233 	out	(c),c ; le registre 12 du CRTC
   443B 01 1C BD      [10]  234 	ld	bc,#0xBD00+28
   443E ED 49         [12]  235 	out	(c),c
   4440 C9            [10]  236 	ret
                            237 ;src/jdvapi_sync.c:196: void bank0123()
                            238 ;	---------------------------------
                            239 ; Function bank0123
                            240 ; ---------------------------------
   4441                     241 _bank0123::
                            242 ;src/jdvapi_sync.c:201: __endasm;
   4441 01 C0 7F      [10]  243 	ld	bc,#0x7FC0+0 ; RAM rétablie
   4444 ED 49         [12]  244 	out	(c),c
   4446 C9            [10]  245 	ret
                            246 ;src/jdvapi_sync.c:204: void bank7_C000()
                            247 ;	---------------------------------
                            248 ; Function bank7_C000
                            249 ; ---------------------------------
   4447                     250 _bank7_C000::
                            251 ;src/jdvapi_sync.c:209: __endasm;
   4447 01 C1 7F      [10]  252 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   444A ED 49         [12]  253 	out	(c),c
   444C C9            [10]  254 	ret
                            255 ;src/jdvapi_sync.c:212: void bank4_4000()
                            256 ;	---------------------------------
                            257 ; Function bank4_4000
                            258 ; ---------------------------------
   444D                     259 _bank4_4000::
                            260 ;src/jdvapi_sync.c:217: __endasm;
   444D 01 C4 7F      [10]  261 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   4450 ED 49         [12]  262 	out	(c),c
   4452 C9            [10]  263 	ret
                            264 ;src/jdvapi_sync.c:220: void bank5_4000()
                            265 ;	---------------------------------
                            266 ; Function bank5_4000
                            267 ; ---------------------------------
   4453                     268 _bank5_4000::
                            269 ;src/jdvapi_sync.c:225: __endasm;
   4453 01 C5 7F      [10]  270 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   4456 ED 49         [12]  271 	out	(c),c
   4458 C9            [10]  272 	ret
                            273 ;src/jdvapi_sync.c:228: void bank6_4000()
                            274 ;	---------------------------------
                            275 ; Function bank6_4000
                            276 ; ---------------------------------
   4459                     277 _bank6_4000::
                            278 ;src/jdvapi_sync.c:233: __endasm;
   4459 01 C6 7F      [10]  279 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   445C ED 49         [12]  280 	out	(c),c
   445E C9            [10]  281 	ret
                            282 ;src/jdvapi_sync.c:236: void bank7_4000()
                            283 ;	---------------------------------
                            284 ; Function bank7_4000
                            285 ; ---------------------------------
   445F                     286 _bank7_4000::
                            287 ;src/jdvapi_sync.c:241: __endasm;
   445F 01 C7 7F      [10]  288 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   4462 ED 49         [12]  289 	out	(c),c
   4464 C9            [10]  290 	ret
                            291 ;src/jdvapi_sync.c:278: void overscanH()
                            292 ;	---------------------------------
                            293 ; Function overscanH
                            294 ; ---------------------------------
   4465                     295 _overscanH::
                            296 ;src/jdvapi_sync.c:298: __endasm;
   4465 01 01 BC      [10]  297 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   4468 ED 49         [12]  298 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   446A 01 30 BD      [10]  299 	ld	bc,#0xBD00+48
   446D ED 49         [12]  300 	out	(c),c
   446F 01 02 BC      [10]  301 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   4472 ED 49         [12]  302 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   4474 01 32 BD      [10]  303 	ld	bc,#0xBD00+50
   4477 ED 49         [12]  304 	out	(c),c
   4479 01 06 BC      [10]  305 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   447C ED 49         [12]  306 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   447E 01 15 BD      [10]  307 	ld	bc,#0xBD00+21
   4481 ED 49         [12]  308 	out	(c),c
   4483 01 07 BC      [10]  309 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   4486 ED 49         [12]  310 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   4488 01 1D BD      [10]  311 	ld	bc,#0xBD00+29
   448B ED 49         [12]  312 	out	(c),c
   448D C9            [10]  313 	ret
                            314 ;src/jdvapi_sync.c:324: void scan()
                            315 ;	---------------------------------
                            316 ; Function scan
                            317 ; ---------------------------------
   448E                     318 _scan::
                            319 ;src/jdvapi_sync.c:343: __endasm;
   448E 01 01 BC      [10]  320 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   4491 ED 49         [12]  321 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   4493 01 28 BD      [10]  322 	ld	bc,#0xBD00+40
   4496 ED 49         [12]  323 	out	(c),c
   4498 01 02 BC      [10]  324 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   449B ED 49         [12]  325 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   449D 01 2E BD      [10]  326 	ld	bc,#0xBD00+46
   44A0 ED 49         [12]  327 	out	(c),c
   44A2 01 06 BC      [10]  328 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   44A5 ED 49         [12]  329 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   44A7 01 19 BD      [10]  330 	ld	bc,#0xBD00+25
   44AA ED 49         [12]  331 	out	(c),c
   44AC 01 07 BC      [10]  332 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   44AF ED 49         [12]  333 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   44B1 01 1E BD      [10]  334 	ld	bc,#0xBD00+30
   44B4 ED 49         [12]  335 	out	(c),c
   44B6 C9            [10]  336 	ret
                            337 	.area _CODE
                            338 	.area _INITIALIZER
   4C20                     339 __xinit__callback_counter:
   4C20 00 00               340 	.dw #0x0000
   4C22                     341 __xinit__aFunction:
   4C22 B2 43               342 	.dw _callback
                            343 	.area _CABS (ABS)
