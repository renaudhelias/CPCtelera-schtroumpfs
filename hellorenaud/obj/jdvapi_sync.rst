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
   4ABF                      43 _callback_counter::
   4ABF                      44 	.ds 1
   4AC0                      45 _aFunction::
   4AC0                      46 	.ds 2
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
                             67 ;src/jdvapi_sync.c:3: void vsync()
                             68 ;	---------------------------------
                             69 ; Function vsync
                             70 ; ---------------------------------
   42A8                      71 _vsync::
                             72 ;src/jdvapi_sync.c:13: __endasm;
   42A8 06 F5         [ 7]   73 	ld	b,#0xf5 ;; PPI port B input
   42AA                      74 	    _wait_vsync:
   42AA ED 78         [12]   75 	in	a,(c) ;; [4] read PPI port B input
                             76 ;;	(bit 0 = "1" if vsync is active,
                             77 ;;	or bit 0 = "0" if vsync is in-active)
   42AC 1F            [ 4]   78 	rra	;; [1] put bit 0 into carry flag
   42AD D2 AA 42      [10]   79 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             80 ;src/jdvapi_sync.c:14: callback_counter=0;
   42B0 21 BF 4A      [10]   81 	ld	hl,#_callback_counter + 0
   42B3 36 00         [10]   82 	ld	(hl), #0x00
   42B5 C9            [10]   83 	ret
                             84 ;src/jdvapi_sync.c:17: void raster_halt()
                             85 ;	---------------------------------
                             86 ; Function raster_halt
                             87 ; ---------------------------------
   42B6                      88 _raster_halt::
                             89 ;src/jdvapi_sync.c:25: __endasm;
   42B6 F3            [ 4]   90 	di
   42B7 21 FB C9      [10]   91 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   42BA 22 38 00      [16]   92 	LD	(#0x38),HL
   42BD FB            [ 4]   93 	ei
   42BE C9            [10]   94 	ret
                             95 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             96 ;	---------------------------------
                             97 ; Function callback
                             98 ; ---------------------------------
   42BF                      99 _callback::
                            100 ;src/jdvapi_sync.c:49: __endasm;
   42BF CD 00 00      [17]  101 	call	0
   42C2 C9            [10]  102 	ret
                            103 ;src/jdvapi_sync.c:54: void raster_handler()
                            104 ;	---------------------------------
                            105 ; Function raster_handler
                            106 ; ---------------------------------
   42C3                     107 _raster_handler::
                            108 ;src/jdvapi_sync.c:73: __endasm;
                            109 ;;	backup Z80 state
   42C3 F5            [11]  110 	push	af
   42C4 C5            [11]  111 	push	bc
   42C5 D5            [11]  112 	push	de
   42C6 E5            [11]  113 	push	hl
   42C7 DD E5         [15]  114 	push	ix
   42C9 FD E5         [15]  115 	push	iy
   42CB D9            [ 4]  116 	exx
   42CC 08            [ 4]  117 	ex	af, af' ; '
   42CD F5            [11]  118 	push	af
   42CE C5            [11]  119 	push	bc
   42CF D5            [11]  120 	push	de
   42D0 E5            [11]  121 	push	hl
                            122 ;;	here we do custom code..
                            123 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   42D1 21 BF 4A      [10]  124 	ld	hl,#_callback_counter + 0
   42D4 4E            [ 7]  125 	ld	c, (hl)
   42D5 06 00         [ 7]  126 	ld	b, #0x00
   42D7 03            [ 6]  127 	inc	bc
   42D8 21 06 00      [10]  128 	ld	hl, #0x0006
   42DB E5            [11]  129 	push	hl
   42DC C5            [11]  130 	push	bc
   42DD CD D9 49      [17]  131 	call	__modsint
   42E0 F1            [10]  132 	pop	af
   42E1 F1            [10]  133 	pop	af
   42E2 FD 21 BF 4A   [14]  134 	ld	iy, #_callback_counter
   42E6 FD 75 00      [19]  135 	ld	0 (iy), l
                            136 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   42E9 3A BF 4A      [13]  137 	ld	a, (_callback_counter)
   42EC F5            [11]  138 	push	af
   42ED 33            [ 6]  139 	inc	sp
   42EE 2A C0 4A      [16]  140 	ld	hl, (_aFunction)
   42F1 CD 59 49      [17]  141 	call	___sdcc_call_hl
   42F4 33            [ 6]  142 	inc	sp
                            143 ;src/jdvapi_sync.c:95: __endasm;
                            144 ;;	restore Z80 state
   42F5 E1            [10]  145 	pop	hl
   42F6 D1            [10]  146 	pop	de
   42F7 C1            [10]  147 	pop	bc
   42F8 F1            [10]  148 	pop	af
   42F9 08            [ 4]  149 	ex	af, af' ; '
   42FA D9            [ 4]  150 	exx
   42FB FD E1         [14]  151 	pop	iy
   42FD DD E1         [14]  152 	pop	ix
   42FF E1            [10]  153 	pop	hl
   4300 D1            [10]  154 	pop	de
   4301 C1            [10]  155 	pop	bc
   4302 F1            [10]  156 	pop	af
   4303 FB            [ 4]  157 	ei
   4304 C9            [10]  158 	ret
   4305 C9            [10]  159 	ret
                            160 ;src/jdvapi_sync.c:99: void raster()
                            161 ;	---------------------------------
                            162 ; Function raster
                            163 ; ---------------------------------
   4306                     164 _raster::
                            165 ;src/jdvapi_sync.c:108: __endasm;
   4306 F3            [ 4]  166 	di
   4307 FD 21 39 00   [14]  167 	ld	iy,#0x39
   430B FD 36 00 C3   [19]  168 	ld	0 (iy),#<(_raster_handler)
   430F FD 36 01 42   [19]  169 	ld	1 (iy),#>(_raster_handler)
   4313 FB            [ 4]  170 	ei
   4314 C9            [10]  171 	ret
                            172 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            173 ;	---------------------------------
                            174 ; Function handle_raster
                            175 ; ---------------------------------
   4315                     176 _handle_raster::
                            177 ;src/jdvapi_sync.c:145: aFunction=callback;
   4315 21 02 00      [10]  178 	ld	hl, #2+0
   4318 39            [11]  179 	add	hl, sp
   4319 7E            [ 7]  180 	ld	a, (hl)
   431A 32 C0 4A      [13]  181 	ld	(#_aFunction + 0),a
   431D 21 03 00      [10]  182 	ld	hl, #2+1
   4320 39            [11]  183 	add	hl, sp
   4321 7E            [ 7]  184 	ld	a, (hl)
   4322 32 C1 4A      [13]  185 	ld	(#_aFunction + 1),a
   4325 C9            [10]  186 	ret
                            187 ;src/jdvapi_sync.c:148: void halt()
                            188 ;	---------------------------------
                            189 ; Function halt
                            190 ; ---------------------------------
   4326                     191 _halt::
                            192 ;src/jdvapi_sync.c:152: __endasm;
   4326 76            [ 4]  193 	halt
   4327 C9            [10]  194 	ret
                            195 ;src/jdvapi_sync.c:155: void calqueC000()
                            196 ;	---------------------------------
                            197 ; Function calqueC000
                            198 ; ---------------------------------
   4328                     199 _calqueC000::
                            200 ;src/jdvapi_sync.c:162: __endasm;
   4328 01 0C BC      [10]  201 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   432B ED 49         [12]  202 	out	(c),c ; le registre 12 du CRTC
   432D 01 30 BD      [10]  203 	ld	bc,#0xBD00+48
   4330 ED 49         [12]  204 	out	(c),c
   4332 C9            [10]  205 	ret
                            206 ;src/jdvapi_sync.c:165: void calque8000()
                            207 ;	---------------------------------
                            208 ; Function calque8000
                            209 ; ---------------------------------
   4333                     210 _calque8000::
                            211 ;src/jdvapi_sync.c:172: __endasm;
   4333 01 0C BC      [10]  212 	ld	bc,#0xBC00+12 ; On met la valeur 32 dans
   4336 ED 49         [12]  213 	out	(c),c ; le registre 12 du CRTC
   4338 01 20 BD      [10]  214 	ld	bc,#0xBD00+32
   433B ED 49         [12]  215 	out	(c),c
   433D C9            [10]  216 	ret
                            217 ;src/jdvapi_sync.c:175: void calque4000()
                            218 ;	---------------------------------
                            219 ; Function calque4000
                            220 ; ---------------------------------
   433E                     221 _calque4000::
                            222 ;src/jdvapi_sync.c:182: __endasm;
   433E 01 0C BC      [10]  223 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   4341 ED 49         [12]  224 	out	(c),c ; le registre 12 du CRTC
   4343 01 10 BD      [10]  225 	ld	bc,#0xBD00+16
   4346 ED 49         [12]  226 	out	(c),c
   4348 C9            [10]  227 	ret
                            228 ;src/jdvapi_sync.c:185: void calque4C00()
                            229 ;	---------------------------------
                            230 ; Function calque4C00
                            231 ; ---------------------------------
   4349                     232 _calque4C00::
                            233 ;src/jdvapi_sync.c:192: __endasm;
   4349 01 0C BC      [10]  234 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   434C ED 49         [12]  235 	out	(c),c ; le registre 12 du CRTC
   434E 01 1C BD      [10]  236 	ld	bc,#0xBD00+28
   4351 ED 49         [12]  237 	out	(c),c
   4353 C9            [10]  238 	ret
                            239 ;src/jdvapi_sync.c:195: void bank0123()
                            240 ;	---------------------------------
                            241 ; Function bank0123
                            242 ; ---------------------------------
   4354                     243 _bank0123::
                            244 ;src/jdvapi_sync.c:200: __endasm;
   4354 01 C0 7F      [10]  245 	ld	bc,#0x7FC0+0 ; RAM rétablie
   4357 ED 49         [12]  246 	out	(c),c
   4359 C9            [10]  247 	ret
                            248 ;src/jdvapi_sync.c:203: void bank7_C000()
                            249 ;	---------------------------------
                            250 ; Function bank7_C000
                            251 ; ---------------------------------
   435A                     252 _bank7_C000::
                            253 ;src/jdvapi_sync.c:208: __endasm;
   435A 01 C1 7F      [10]  254 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   435D ED 49         [12]  255 	out	(c),c
   435F C9            [10]  256 	ret
                            257 ;src/jdvapi_sync.c:211: void bank4_4000()
                            258 ;	---------------------------------
                            259 ; Function bank4_4000
                            260 ; ---------------------------------
   4360                     261 _bank4_4000::
                            262 ;src/jdvapi_sync.c:216: __endasm;
   4360 01 C4 7F      [10]  263 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   4363 ED 49         [12]  264 	out	(c),c
   4365 C9            [10]  265 	ret
                            266 ;src/jdvapi_sync.c:219: void bank5_4000()
                            267 ;	---------------------------------
                            268 ; Function bank5_4000
                            269 ; ---------------------------------
   4366                     270 _bank5_4000::
                            271 ;src/jdvapi_sync.c:224: __endasm;
   4366 01 C5 7F      [10]  272 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   4369 ED 49         [12]  273 	out	(c),c
   436B C9            [10]  274 	ret
                            275 ;src/jdvapi_sync.c:227: void bank6_4000()
                            276 ;	---------------------------------
                            277 ; Function bank6_4000
                            278 ; ---------------------------------
   436C                     279 _bank6_4000::
                            280 ;src/jdvapi_sync.c:232: __endasm;
   436C 01 C6 7F      [10]  281 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   436F ED 49         [12]  282 	out	(c),c
   4371 C9            [10]  283 	ret
                            284 ;src/jdvapi_sync.c:235: void bank7_4000()
                            285 ;	---------------------------------
                            286 ; Function bank7_4000
                            287 ; ---------------------------------
   4372                     288 _bank7_4000::
                            289 ;src/jdvapi_sync.c:240: __endasm;
   4372 01 C7 7F      [10]  290 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   4375 ED 49         [12]  291 	out	(c),c
   4377 C9            [10]  292 	ret
                            293 ;src/jdvapi_sync.c:277: void overscanH()
                            294 ;	---------------------------------
                            295 ; Function overscanH
                            296 ; ---------------------------------
   4378                     297 _overscanH::
                            298 ;src/jdvapi_sync.c:297: __endasm;
   4378 01 01 BC      [10]  299 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   437B ED 49         [12]  300 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   437D 01 30 BD      [10]  301 	ld	bc,#0xBD00+48
   4380 ED 49         [12]  302 	out	(c),c
   4382 01 02 BC      [10]  303 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   4385 ED 49         [12]  304 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   4387 01 32 BD      [10]  305 	ld	bc,#0xBD00+50
   438A ED 49         [12]  306 	out	(c),c
   438C 01 06 BC      [10]  307 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   438F ED 49         [12]  308 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   4391 01 15 BD      [10]  309 	ld	bc,#0xBD00+21
   4394 ED 49         [12]  310 	out	(c),c
   4396 01 07 BC      [10]  311 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   4399 ED 49         [12]  312 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   439B 01 1D BD      [10]  313 	ld	bc,#0xBD00+29
   439E ED 49         [12]  314 	out	(c),c
   43A0 C9            [10]  315 	ret
                            316 ;src/jdvapi_sync.c:323: void scan()
                            317 ;	---------------------------------
                            318 ; Function scan
                            319 ; ---------------------------------
   43A1                     320 _scan::
                            321 ;src/jdvapi_sync.c:342: __endasm;
   43A1 01 01 BC      [10]  322 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   43A4 ED 49         [12]  323 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   43A6 01 28 BD      [10]  324 	ld	bc,#0xBD00+40
   43A9 ED 49         [12]  325 	out	(c),c
   43AB 01 02 BC      [10]  326 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   43AE ED 49         [12]  327 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   43B0 01 2E BD      [10]  328 	ld	bc,#0xBD00+46
   43B3 ED 49         [12]  329 	out	(c),c
   43B5 01 06 BC      [10]  330 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   43B8 ED 49         [12]  331 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   43BA 01 19 BD      [10]  332 	ld	bc,#0xBD00+25
   43BD ED 49         [12]  333 	out	(c),c
   43BF 01 07 BC      [10]  334 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   43C2 ED 49         [12]  335 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   43C4 01 1E BD      [10]  336 	ld	bc,#0xBD00+30
   43C7 ED 49         [12]  337 	out	(c),c
   43C9 C9            [10]  338 	ret
                            339 	.area _CODE
                            340 	.area _INITIALIZER
   4AC8                     341 __xinit__callback_counter:
   4AC8 00                  342 	.db #0x00	; 0
   4AC9                     343 __xinit__aFunction:
   4AC9 BF 42               344 	.dw _callback
                            345 	.area _CABS (ABS)
