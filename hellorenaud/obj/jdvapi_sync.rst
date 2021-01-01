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
   4BBC                      43 _callback_counter::
   4BBC                      44 	.ds 2
   4BBE                      45 _aFunction::
   4BBE                      46 	.ds 2
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
   4387                      71 _vsync::
                             72 ;src/jdvapi_sync.c:14: __endasm;
   4387 06 F5         [ 7]   73 	ld	b,#0xf5 ;; PPI port B input
   4389                      74 	    _wait_vsync:
   4389 ED 78         [12]   75 	in	a,(c) ;; [4] read PPI port B input
                             76 ;;	(bit 0 = "1" if vsync is active,
                             77 ;;	or bit 0 = "0" if vsync is in-active)
   438B 1F            [ 4]   78 	rra	;; [1] put bit 0 into carry flag
   438C D2 89 43      [10]   79 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             80 ;src/jdvapi_sync.c:15: callback_counter=0;
   438F 21 00 00      [10]   81 	ld	hl, #0x0000
   4392 22 BC 4B      [16]   82 	ld	(_callback_counter), hl
   4395 C9            [10]   83 	ret
                             84 ;src/jdvapi_sync.c:18: void raster_halt()
                             85 ;	---------------------------------
                             86 ; Function raster_halt
                             87 ; ---------------------------------
   4396                      88 _raster_halt::
                             89 ;src/jdvapi_sync.c:26: __endasm;
   4396 F3            [ 4]   90 	di
   4397 21 FB C9      [10]   91 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   439A 22 38 00      [16]   92 	LD	(#0x38),HL
   439D FB            [ 4]   93 	ei
   439E C9            [10]   94 	ret
                             95 ;src/jdvapi_sync.c:46: void callback(unsigned char counter){
                             96 ;	---------------------------------
                             97 ; Function callback
                             98 ; ---------------------------------
   439F                      99 _callback::
                            100 ;src/jdvapi_sync.c:50: __endasm;
   439F CD 00 00      [17]  101 	call	0
   43A2 C9            [10]  102 	ret
                            103 ;src/jdvapi_sync.c:55: void raster_handler()
                            104 ;	---------------------------------
                            105 ; Function raster_handler
                            106 ; ---------------------------------
   43A3                     107 _raster_handler::
                            108 ;src/jdvapi_sync.c:74: __endasm;
                            109 ;;	backup Z80 state
   43A3 F5            [11]  110 	push	af
   43A4 C5            [11]  111 	push	bc
   43A5 D5            [11]  112 	push	de
   43A6 E5            [11]  113 	push	hl
   43A7 DD E5         [15]  114 	push	ix
   43A9 FD E5         [15]  115 	push	iy
   43AB D9            [ 4]  116 	exx
   43AC 08            [ 4]  117 	ex	af, af' ; '
   43AD F5            [11]  118 	push	af
   43AE C5            [11]  119 	push	bc
   43AF D5            [11]  120 	push	de
   43B0 E5            [11]  121 	push	hl
                            122 ;;	here we do custom code..
                            123 ;src/jdvapi_sync.c:76: callback_counter=(callback_counter+1)%6;
   43B1 2A BC 4B      [16]  124 	ld	hl, (_callback_counter)
   43B4 23            [ 6]  125 	inc	hl
   43B5 01 06 00      [10]  126 	ld	bc, #0x0006
   43B8 C5            [11]  127 	push	bc
   43B9 E5            [11]  128 	push	hl
   43BA CD 4B 4B      [17]  129 	call	__moduint
   43BD F1            [10]  130 	pop	af
   43BE F1            [10]  131 	pop	af
   43BF 22 BC 4B      [16]  132 	ld	(_callback_counter), hl
                            133 ;src/jdvapi_sync.c:77: aFunction(callback_counter);
   43C2 21 BC 4B      [10]  134 	ld	hl,#_callback_counter + 0
   43C5 46            [ 7]  135 	ld	b, (hl)
   43C6 C5            [11]  136 	push	bc
   43C7 33            [ 6]  137 	inc	sp
   43C8 2A BE 4B      [16]  138 	ld	hl, (_aFunction)
   43CB CD B0 4A      [17]  139 	call	___sdcc_call_hl
   43CE 33            [ 6]  140 	inc	sp
                            141 ;src/jdvapi_sync.c:96: __endasm;
                            142 ;;	restore Z80 state
   43CF E1            [10]  143 	pop	hl
   43D0 D1            [10]  144 	pop	de
   43D1 C1            [10]  145 	pop	bc
   43D2 F1            [10]  146 	pop	af
   43D3 08            [ 4]  147 	ex	af, af' ; '
   43D4 D9            [ 4]  148 	exx
   43D5 FD E1         [14]  149 	pop	iy
   43D7 DD E1         [14]  150 	pop	ix
   43D9 E1            [10]  151 	pop	hl
   43DA D1            [10]  152 	pop	de
   43DB C1            [10]  153 	pop	bc
   43DC F1            [10]  154 	pop	af
   43DD FB            [ 4]  155 	ei
   43DE C9            [10]  156 	ret
   43DF C9            [10]  157 	ret
                            158 ;src/jdvapi_sync.c:100: void raster()
                            159 ;	---------------------------------
                            160 ; Function raster
                            161 ; ---------------------------------
   43E0                     162 _raster::
                            163 ;src/jdvapi_sync.c:109: __endasm;
   43E0 F3            [ 4]  164 	di
   43E1 FD 21 39 00   [14]  165 	ld	iy,#0x39
   43E5 FD 36 00 A3   [19]  166 	ld	0 (iy),#<(_raster_handler)
   43E9 FD 36 01 43   [19]  167 	ld	1 (iy),#>(_raster_handler)
   43ED FB            [ 4]  168 	ei
   43EE C9            [10]  169 	ret
                            170 ;src/jdvapi_sync.c:144: void handle_raster(MyFunctionReturningVoid callback) {
                            171 ;	---------------------------------
                            172 ; Function handle_raster
                            173 ; ---------------------------------
   43EF                     174 _handle_raster::
                            175 ;src/jdvapi_sync.c:146: aFunction=callback;
   43EF 21 02 00      [10]  176 	ld	hl, #2+0
   43F2 39            [11]  177 	add	hl, sp
   43F3 7E            [ 7]  178 	ld	a, (hl)
   43F4 32 BE 4B      [13]  179 	ld	(#_aFunction + 0),a
   43F7 21 03 00      [10]  180 	ld	hl, #2+1
   43FA 39            [11]  181 	add	hl, sp
   43FB 7E            [ 7]  182 	ld	a, (hl)
   43FC 32 BF 4B      [13]  183 	ld	(#_aFunction + 1),a
   43FF C9            [10]  184 	ret
                            185 ;src/jdvapi_sync.c:149: void halt()
                            186 ;	---------------------------------
                            187 ; Function halt
                            188 ; ---------------------------------
   4400                     189 _halt::
                            190 ;src/jdvapi_sync.c:153: __endasm;
   4400 76            [ 4]  191 	halt
   4401 C9            [10]  192 	ret
                            193 ;src/jdvapi_sync.c:156: void calqueC000()
                            194 ;	---------------------------------
                            195 ; Function calqueC000
                            196 ; ---------------------------------
   4402                     197 _calqueC000::
                            198 ;src/jdvapi_sync.c:163: __endasm;
   4402 01 0C BC      [10]  199 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   4405 ED 49         [12]  200 	out	(c),c ; le registre 12 du CRTC
   4407 01 30 BD      [10]  201 	ld	bc,#0xBD00+48
   440A ED 49         [12]  202 	out	(c),c
   440C C9            [10]  203 	ret
                            204 ;src/jdvapi_sync.c:166: void calque8000()
                            205 ;	---------------------------------
                            206 ; Function calque8000
                            207 ; ---------------------------------
   440D                     208 _calque8000::
                            209 ;src/jdvapi_sync.c:173: __endasm;
   440D 01 0C BC      [10]  210 	ld	bc,#0xBC00+12 ; On met la valeur 32 dans
   4410 ED 49         [12]  211 	out	(c),c ; le registre 12 du CRTC
   4412 01 20 BD      [10]  212 	ld	bc,#0xBD00+32
   4415 ED 49         [12]  213 	out	(c),c
   4417 C9            [10]  214 	ret
                            215 ;src/jdvapi_sync.c:176: void calque4000()
                            216 ;	---------------------------------
                            217 ; Function calque4000
                            218 ; ---------------------------------
   4418                     219 _calque4000::
                            220 ;src/jdvapi_sync.c:183: __endasm;
   4418 01 0C BC      [10]  221 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   441B ED 49         [12]  222 	out	(c),c ; le registre 12 du CRTC
   441D 01 10 BD      [10]  223 	ld	bc,#0xBD00+16
   4420 ED 49         [12]  224 	out	(c),c
   4422 C9            [10]  225 	ret
                            226 ;src/jdvapi_sync.c:186: void calque4C00()
                            227 ;	---------------------------------
                            228 ; Function calque4C00
                            229 ; ---------------------------------
   4423                     230 _calque4C00::
                            231 ;src/jdvapi_sync.c:193: __endasm;
   4423 01 0C BC      [10]  232 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   4426 ED 49         [12]  233 	out	(c),c ; le registre 12 du CRTC
   4428 01 1C BD      [10]  234 	ld	bc,#0xBD00+28
   442B ED 49         [12]  235 	out	(c),c
   442D C9            [10]  236 	ret
                            237 ;src/jdvapi_sync.c:196: void bank0123()
                            238 ;	---------------------------------
                            239 ; Function bank0123
                            240 ; ---------------------------------
   442E                     241 _bank0123::
                            242 ;src/jdvapi_sync.c:201: __endasm;
   442E 01 C0 7F      [10]  243 	ld	bc,#0x7FC0+0 ; RAM rétablie
   4431 ED 49         [12]  244 	out	(c),c
   4433 C9            [10]  245 	ret
                            246 ;src/jdvapi_sync.c:204: void bank7_C000()
                            247 ;	---------------------------------
                            248 ; Function bank7_C000
                            249 ; ---------------------------------
   4434                     250 _bank7_C000::
                            251 ;src/jdvapi_sync.c:209: __endasm;
   4434 01 C1 7F      [10]  252 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   4437 ED 49         [12]  253 	out	(c),c
   4439 C9            [10]  254 	ret
                            255 ;src/jdvapi_sync.c:212: void bank4_4000()
                            256 ;	---------------------------------
                            257 ; Function bank4_4000
                            258 ; ---------------------------------
   443A                     259 _bank4_4000::
                            260 ;src/jdvapi_sync.c:217: __endasm;
   443A 01 C4 7F      [10]  261 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   443D ED 49         [12]  262 	out	(c),c
   443F C9            [10]  263 	ret
                            264 ;src/jdvapi_sync.c:220: void bank5_4000()
                            265 ;	---------------------------------
                            266 ; Function bank5_4000
                            267 ; ---------------------------------
   4440                     268 _bank5_4000::
                            269 ;src/jdvapi_sync.c:225: __endasm;
   4440 01 C5 7F      [10]  270 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   4443 ED 49         [12]  271 	out	(c),c
   4445 C9            [10]  272 	ret
                            273 ;src/jdvapi_sync.c:228: void bank6_4000()
                            274 ;	---------------------------------
                            275 ; Function bank6_4000
                            276 ; ---------------------------------
   4446                     277 _bank6_4000::
                            278 ;src/jdvapi_sync.c:233: __endasm;
   4446 01 C6 7F      [10]  279 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   4449 ED 49         [12]  280 	out	(c),c
   444B C9            [10]  281 	ret
                            282 ;src/jdvapi_sync.c:236: void bank7_4000()
                            283 ;	---------------------------------
                            284 ; Function bank7_4000
                            285 ; ---------------------------------
   444C                     286 _bank7_4000::
                            287 ;src/jdvapi_sync.c:241: __endasm;
   444C 01 C7 7F      [10]  288 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   444F ED 49         [12]  289 	out	(c),c
   4451 C9            [10]  290 	ret
                            291 ;src/jdvapi_sync.c:278: void overscanH()
                            292 ;	---------------------------------
                            293 ; Function overscanH
                            294 ; ---------------------------------
   4452                     295 _overscanH::
                            296 ;src/jdvapi_sync.c:298: __endasm;
   4452 01 01 BC      [10]  297 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   4455 ED 49         [12]  298 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   4457 01 30 BD      [10]  299 	ld	bc,#0xBD00+48
   445A ED 49         [12]  300 	out	(c),c
   445C 01 02 BC      [10]  301 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   445F ED 49         [12]  302 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   4461 01 32 BD      [10]  303 	ld	bc,#0xBD00+50
   4464 ED 49         [12]  304 	out	(c),c
   4466 01 06 BC      [10]  305 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   4469 ED 49         [12]  306 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   446B 01 15 BD      [10]  307 	ld	bc,#0xBD00+21
   446E ED 49         [12]  308 	out	(c),c
   4470 01 07 BC      [10]  309 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   4473 ED 49         [12]  310 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   4475 01 1D BD      [10]  311 	ld	bc,#0xBD00+29
   4478 ED 49         [12]  312 	out	(c),c
   447A C9            [10]  313 	ret
                            314 ;src/jdvapi_sync.c:324: void scan()
                            315 ;	---------------------------------
                            316 ; Function scan
                            317 ; ---------------------------------
   447B                     318 _scan::
                            319 ;src/jdvapi_sync.c:343: __endasm;
   447B 01 01 BC      [10]  320 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   447E ED 49         [12]  321 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   4480 01 28 BD      [10]  322 	ld	bc,#0xBD00+40
   4483 ED 49         [12]  323 	out	(c),c
   4485 01 02 BC      [10]  324 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   4488 ED 49         [12]  325 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   448A 01 2E BD      [10]  326 	ld	bc,#0xBD00+46
   448D ED 49         [12]  327 	out	(c),c
   448F 01 06 BC      [10]  328 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   4492 ED 49         [12]  329 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   4494 01 19 BD      [10]  330 	ld	bc,#0xBD00+25
   4497 ED 49         [12]  331 	out	(c),c
   4499 01 07 BC      [10]  332 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   449C ED 49         [12]  333 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   449E 01 1E BD      [10]  334 	ld	bc,#0xBD00+30
   44A1 ED 49         [12]  335 	out	(c),c
   44A3 C9            [10]  336 	ret
                            337 	.area _CODE
                            338 	.area _INITIALIZER
   4BC3                     339 __xinit__callback_counter:
   4BC3 00 00               340 	.dw #0x0000
   4BC5                     341 __xinit__aFunction:
   4BC5 9F 43               342 	.dw _callback
                            343 	.area _CABS (ABS)
