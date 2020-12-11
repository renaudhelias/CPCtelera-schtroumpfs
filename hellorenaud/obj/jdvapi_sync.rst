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
   4C87                      42 _callback_counter::
   4C87                      43 	.ds 1
   4C88                      44 _aFunction::
   4C88                      45 	.ds 2
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
   4295                      70 _vsync::
                             71 ;src/jdvapi_sync.c:13: __endasm;
   4295 06 F5         [ 7]   72 	ld	b,#0xf5 ;; PPI port B input
   4297                      73 	    _wait_vsync:
   4297 ED 78         [12]   74 	in	a,(c) ;; [4] read PPI port B input
                             75 ;;	(bit 0 = "1" if vsync is active,
                             76 ;;	or bit 0 = "0" if vsync is in-active)
   4299 1F            [ 4]   77 	rra	;; [1] put bit 0 into carry flag
   429A D2 97 42      [10]   78 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             79 ;src/jdvapi_sync.c:14: callback_counter=0;
   429D 21 87 4C      [10]   80 	ld	hl,#_callback_counter + 0
   42A0 36 00         [10]   81 	ld	(hl), #0x00
   42A2 C9            [10]   82 	ret
                             83 ;src/jdvapi_sync.c:17: void raster_halt()
                             84 ;	---------------------------------
                             85 ; Function raster_halt
                             86 ; ---------------------------------
   42A3                      87 _raster_halt::
                             88 ;src/jdvapi_sync.c:25: __endasm;
   42A3 F3            [ 4]   89 	di
   42A4 21 FB C9      [10]   90 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   42A7 22 38 00      [16]   91 	LD	(#0x38),HL
   42AA FB            [ 4]   92 	ei
   42AB C9            [10]   93 	ret
                             94 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             95 ;	---------------------------------
                             96 ; Function callback
                             97 ; ---------------------------------
   42AC                      98 _callback::
                             99 ;src/jdvapi_sync.c:49: __endasm;
   42AC CD 00 00      [17]  100 	call	0
   42AF C9            [10]  101 	ret
                            102 ;src/jdvapi_sync.c:54: void raster_handler()
                            103 ;	---------------------------------
                            104 ; Function raster_handler
                            105 ; ---------------------------------
   42B0                     106 _raster_handler::
                            107 ;src/jdvapi_sync.c:73: __endasm;
                            108 ;;	backup Z80 state
   42B0 F5            [11]  109 	push	af
   42B1 C5            [11]  110 	push	bc
   42B2 D5            [11]  111 	push	de
   42B3 E5            [11]  112 	push	hl
   42B4 DD E5         [15]  113 	push	ix
   42B6 FD E5         [15]  114 	push	iy
   42B8 D9            [ 4]  115 	exx
   42B9 08            [ 4]  116 	ex	af, af'
   42BA F5            [11]  117 	push	af
   42BB C5            [11]  118 	push	bc
   42BC D5            [11]  119 	push	de
   42BD E5            [11]  120 	push	hl
                            121 ;;	here we do custom code..
                            122 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   42BE 21 87 4C      [10]  123 	ld	hl,#_callback_counter + 0
   42C1 4E            [ 7]  124 	ld	c, (hl)
   42C2 06 00         [ 7]  125 	ld	b, #0x00
   42C4 03            [ 6]  126 	inc	bc
   42C5 21 06 00      [10]  127 	ld	hl, #0x0006
   42C8 E5            [11]  128 	push	hl
   42C9 C5            [11]  129 	push	bc
   42CA CD A1 4B      [17]  130 	call	__modsint
   42CD F1            [10]  131 	pop	af
   42CE F1            [10]  132 	pop	af
   42CF FD 21 87 4C   [14]  133 	ld	iy, #_callback_counter
   42D3 FD 75 00      [19]  134 	ld	0 (iy), l
                            135 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   42D6 3A 87 4C      [13]  136 	ld	a, (_callback_counter)
   42D9 F5            [11]  137 	push	af
   42DA 33            [ 6]  138 	inc	sp
   42DB 2A 88 4C      [16]  139 	ld	hl, (_aFunction)
   42DE CD 3E 4A      [17]  140 	call	___sdcc_call_hl
   42E1 33            [ 6]  141 	inc	sp
                            142 ;src/jdvapi_sync.c:95: __endasm;
                            143 ;;	restore Z80 state
   42E2 E1            [10]  144 	pop	hl
   42E3 D1            [10]  145 	pop	de
   42E4 C1            [10]  146 	pop	bc
   42E5 F1            [10]  147 	pop	af
   42E6 08            [ 4]  148 	ex	af, af'
   42E7 D9            [ 4]  149 	exx
   42E8 FD E1         [14]  150 	pop	iy
   42EA DD E1         [14]  151 	pop	ix
   42EC E1            [10]  152 	pop	hl
   42ED D1            [10]  153 	pop	de
   42EE C1            [10]  154 	pop	bc
   42EF F1            [10]  155 	pop	af
   42F0 FB            [ 4]  156 	ei
   42F1 C9            [10]  157 	ret
   42F2 C9            [10]  158 	ret
                            159 ;src/jdvapi_sync.c:99: void raster()
                            160 ;	---------------------------------
                            161 ; Function raster
                            162 ; ---------------------------------
   42F3                     163 _raster::
                            164 ;src/jdvapi_sync.c:108: __endasm;
   42F3 F3            [ 4]  165 	di
   42F4 FD 21 39 00   [14]  166 	ld	iy,#0x39
   42F8 FD 36 00 B0   [19]  167 	ld	0 (iy),#<(_raster_handler)
   42FC FD 36 01 42   [19]  168 	ld	1 (iy),#>(_raster_handler)
   4300 FB            [ 4]  169 	ei
   4301 C9            [10]  170 	ret
                            171 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            172 ;	---------------------------------
                            173 ; Function handle_raster
                            174 ; ---------------------------------
   4302                     175 _handle_raster::
                            176 ;src/jdvapi_sync.c:145: aFunction=callback;
   4302 21 02 00      [10]  177 	ld	hl, #2+0
   4305 39            [11]  178 	add	hl, sp
   4306 7E            [ 7]  179 	ld	a, (hl)
   4307 32 88 4C      [13]  180 	ld	(#_aFunction + 0),a
   430A 21 03 00      [10]  181 	ld	hl, #2+1
   430D 39            [11]  182 	add	hl, sp
   430E 7E            [ 7]  183 	ld	a, (hl)
   430F 32 89 4C      [13]  184 	ld	(#_aFunction + 1),a
   4312 C9            [10]  185 	ret
                            186 ;src/jdvapi_sync.c:148: void halt()
                            187 ;	---------------------------------
                            188 ; Function halt
                            189 ; ---------------------------------
   4313                     190 _halt::
                            191 ;src/jdvapi_sync.c:152: __endasm;
   4313 76            [ 4]  192 	halt
   4314 C9            [10]  193 	ret
                            194 ;src/jdvapi_sync.c:155: void calqueC000()
                            195 ;	---------------------------------
                            196 ; Function calqueC000
                            197 ; ---------------------------------
   4315                     198 _calqueC000::
                            199 ;src/jdvapi_sync.c:162: __endasm;
   4315 01 0C BC      [10]  200 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   4318 ED 49         [12]  201 	out	(c),c ; le registre 12 du CRTC
   431A 01 30 BD      [10]  202 	ld	bc,#0xBD00+48
   431D ED 49         [12]  203 	out	(c),c
   431F C9            [10]  204 	ret
                            205 ;src/jdvapi_sync.c:165: void calque4000()
                            206 ;	---------------------------------
                            207 ; Function calque4000
                            208 ; ---------------------------------
   4320                     209 _calque4000::
                            210 ;src/jdvapi_sync.c:172: __endasm;
   4320 01 0C BC      [10]  211 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   4323 ED 49         [12]  212 	out	(c),c ; le registre 12 du CRTC
   4325 01 10 BD      [10]  213 	ld	bc,#0xBD00+16
   4328 ED 49         [12]  214 	out	(c),c
   432A C9            [10]  215 	ret
                            216 ;src/jdvapi_sync.c:175: void calque4C00()
                            217 ;	---------------------------------
                            218 ; Function calque4C00
                            219 ; ---------------------------------
   432B                     220 _calque4C00::
                            221 ;src/jdvapi_sync.c:182: __endasm;
   432B 01 0C BC      [10]  222 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   432E ED 49         [12]  223 	out	(c),c ; le registre 12 du CRTC
   4330 01 1C BD      [10]  224 	ld	bc,#0xBD00+28
   4333 ED 49         [12]  225 	out	(c),c
   4335 C9            [10]  226 	ret
                            227 ;src/jdvapi_sync.c:185: void bank0123()
                            228 ;	---------------------------------
                            229 ; Function bank0123
                            230 ; ---------------------------------
   4336                     231 _bank0123::
                            232 ;src/jdvapi_sync.c:190: __endasm;
   4336 01 C0 7F      [10]  233 	ld	bc,#0x7FC0+0 ; RAM rétablie
   4339 ED 49         [12]  234 	out	(c),c
   433B C9            [10]  235 	ret
                            236 ;src/jdvapi_sync.c:193: void bank7_C000()
                            237 ;	---------------------------------
                            238 ; Function bank7_C000
                            239 ; ---------------------------------
   433C                     240 _bank7_C000::
                            241 ;src/jdvapi_sync.c:198: __endasm;
   433C 01 C1 7F      [10]  242 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   433F ED 49         [12]  243 	out	(c),c
   4341 C9            [10]  244 	ret
                            245 ;src/jdvapi_sync.c:201: void bank4_4000()
                            246 ;	---------------------------------
                            247 ; Function bank4_4000
                            248 ; ---------------------------------
   4342                     249 _bank4_4000::
                            250 ;src/jdvapi_sync.c:206: __endasm;
   4342 01 C4 7F      [10]  251 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   4345 ED 49         [12]  252 	out	(c),c
   4347 C9            [10]  253 	ret
                            254 ;src/jdvapi_sync.c:209: void bank5_4000()
                            255 ;	---------------------------------
                            256 ; Function bank5_4000
                            257 ; ---------------------------------
   4348                     258 _bank5_4000::
                            259 ;src/jdvapi_sync.c:214: __endasm;
   4348 01 C5 7F      [10]  260 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   434B ED 49         [12]  261 	out	(c),c
   434D C9            [10]  262 	ret
                            263 ;src/jdvapi_sync.c:217: void bank6_4000()
                            264 ;	---------------------------------
                            265 ; Function bank6_4000
                            266 ; ---------------------------------
   434E                     267 _bank6_4000::
                            268 ;src/jdvapi_sync.c:222: __endasm;
   434E 01 C6 7F      [10]  269 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   4351 ED 49         [12]  270 	out	(c),c
   4353 C9            [10]  271 	ret
                            272 ;src/jdvapi_sync.c:225: void bank7_4000()
                            273 ;	---------------------------------
                            274 ; Function bank7_4000
                            275 ; ---------------------------------
   4354                     276 _bank7_4000::
                            277 ;src/jdvapi_sync.c:230: __endasm;
   4354 01 C7 7F      [10]  278 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   4357 ED 49         [12]  279 	out	(c),c
   4359 C9            [10]  280 	ret
                            281 ;src/jdvapi_sync.c:267: void overscanH()
                            282 ;	---------------------------------
                            283 ; Function overscanH
                            284 ; ---------------------------------
   435A                     285 _overscanH::
                            286 ;src/jdvapi_sync.c:287: __endasm;
   435A 01 01 BC      [10]  287 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   435D ED 49         [12]  288 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   435F 01 30 BD      [10]  289 	ld	bc,#0xBD00+48
   4362 ED 49         [12]  290 	out	(c),c
   4364 01 02 BC      [10]  291 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   4367 ED 49         [12]  292 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   4369 01 32 BD      [10]  293 	ld	bc,#0xBD00+50
   436C ED 49         [12]  294 	out	(c),c
   436E 01 06 BC      [10]  295 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   4371 ED 49         [12]  296 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   4373 01 15 BD      [10]  297 	ld	bc,#0xBD00+21
   4376 ED 49         [12]  298 	out	(c),c
   4378 01 07 BC      [10]  299 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   437B ED 49         [12]  300 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   437D 01 1D BD      [10]  301 	ld	bc,#0xBD00+29
   4380 ED 49         [12]  302 	out	(c),c
   4382 C9            [10]  303 	ret
                            304 ;src/jdvapi_sync.c:313: void scan()
                            305 ;	---------------------------------
                            306 ; Function scan
                            307 ; ---------------------------------
   4383                     308 _scan::
                            309 ;src/jdvapi_sync.c:332: __endasm;
   4383 01 01 BC      [10]  310 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   4386 ED 49         [12]  311 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   4388 01 28 BD      [10]  312 	ld	bc,#0xBD00+40
   438B ED 49         [12]  313 	out	(c),c
   438D 01 02 BC      [10]  314 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   4390 ED 49         [12]  315 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   4392 01 2E BD      [10]  316 	ld	bc,#0xBD00+46
   4395 ED 49         [12]  317 	out	(c),c
   4397 01 06 BC      [10]  318 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   439A ED 49         [12]  319 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   439C 01 19 BD      [10]  320 	ld	bc,#0xBD00+25
   439F ED 49         [12]  321 	out	(c),c
   43A1 01 07 BC      [10]  322 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   43A4 ED 49         [12]  323 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   43A6 01 1E BD      [10]  324 	ld	bc,#0xBD00+30
   43A9 ED 49         [12]  325 	out	(c),c
   43AB C9            [10]  326 	ret
                            327 	.area _CODE
                            328 	.area _INITIALIZER
   4C8B                     329 __xinit__callback_counter:
   4C8B 00                  330 	.db #0x00	; 0
   4C8C                     331 __xinit__aFunction:
   4C8C AC 42               332 	.dw _callback
                            333 	.area _CABS (ABS)
