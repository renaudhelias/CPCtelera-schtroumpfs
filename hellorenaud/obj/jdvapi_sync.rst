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
   4A99                      43 _callback_counter::
   4A99                      44 	.ds 1
   4A9A                      45 _aFunction::
   4A9A                      46 	.ds 2
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
   426E                      71 _vsync::
                             72 ;src/jdvapi_sync.c:13: __endasm;
   426E 06 F5         [ 7]   73 	ld	b,#0xf5 ;; PPI port B input
   4270                      74 	    _wait_vsync:
   4270 ED 78         [12]   75 	in	a,(c) ;; [4] read PPI port B input
                             76 ;;	(bit 0 = "1" if vsync is active,
                             77 ;;	or bit 0 = "0" if vsync is in-active)
   4272 1F            [ 4]   78 	rra	;; [1] put bit 0 into carry flag
   4273 D2 70 42      [10]   79 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             80 ;src/jdvapi_sync.c:14: callback_counter=0;
   4276 21 99 4A      [10]   81 	ld	hl,#_callback_counter + 0
   4279 36 00         [10]   82 	ld	(hl), #0x00
   427B C9            [10]   83 	ret
                             84 ;src/jdvapi_sync.c:17: void raster_halt()
                             85 ;	---------------------------------
                             86 ; Function raster_halt
                             87 ; ---------------------------------
   427C                      88 _raster_halt::
                             89 ;src/jdvapi_sync.c:25: __endasm;
   427C F3            [ 4]   90 	di
   427D 21 FB C9      [10]   91 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   4280 22 38 00      [16]   92 	LD	(#0x38),HL
   4283 FB            [ 4]   93 	ei
   4284 C9            [10]   94 	ret
                             95 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             96 ;	---------------------------------
                             97 ; Function callback
                             98 ; ---------------------------------
   4285                      99 _callback::
                            100 ;src/jdvapi_sync.c:49: __endasm;
   4285 CD 00 00      [17]  101 	call	0
   4288 C9            [10]  102 	ret
                            103 ;src/jdvapi_sync.c:54: void raster_handler()
                            104 ;	---------------------------------
                            105 ; Function raster_handler
                            106 ; ---------------------------------
   4289                     107 _raster_handler::
                            108 ;src/jdvapi_sync.c:73: __endasm;
                            109 ;;	backup Z80 state
   4289 F5            [11]  110 	push	af
   428A C5            [11]  111 	push	bc
   428B D5            [11]  112 	push	de
   428C E5            [11]  113 	push	hl
   428D DD E5         [15]  114 	push	ix
   428F FD E5         [15]  115 	push	iy
   4291 D9            [ 4]  116 	exx
   4292 08            [ 4]  117 	ex	af, af' ; '
   4293 F5            [11]  118 	push	af
   4294 C5            [11]  119 	push	bc
   4295 D5            [11]  120 	push	de
   4296 E5            [11]  121 	push	hl
                            122 ;;	here we do custom code..
                            123 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   4297 21 99 4A      [10]  124 	ld	hl,#_callback_counter + 0
   429A 4E            [ 7]  125 	ld	c, (hl)
   429B 06 00         [ 7]  126 	ld	b, #0x00
   429D 03            [ 6]  127 	inc	bc
   429E 21 06 00      [10]  128 	ld	hl, #0x0006
   42A1 E5            [11]  129 	push	hl
   42A2 C5            [11]  130 	push	bc
   42A3 CD 9F 49      [17]  131 	call	__modsint
   42A6 F1            [10]  132 	pop	af
   42A7 F1            [10]  133 	pop	af
   42A8 FD 21 99 4A   [14]  134 	ld	iy, #_callback_counter
   42AC FD 75 00      [19]  135 	ld	0 (iy), l
                            136 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   42AF 3A 99 4A      [13]  137 	ld	a, (_callback_counter)
   42B2 F5            [11]  138 	push	af
   42B3 33            [ 6]  139 	inc	sp
   42B4 2A 9A 4A      [16]  140 	ld	hl, (_aFunction)
   42B7 CD 1F 49      [17]  141 	call	___sdcc_call_hl
   42BA 33            [ 6]  142 	inc	sp
                            143 ;src/jdvapi_sync.c:95: __endasm;
                            144 ;;	restore Z80 state
   42BB E1            [10]  145 	pop	hl
   42BC D1            [10]  146 	pop	de
   42BD C1            [10]  147 	pop	bc
   42BE F1            [10]  148 	pop	af
   42BF 08            [ 4]  149 	ex	af, af' ; '
   42C0 D9            [ 4]  150 	exx
   42C1 FD E1         [14]  151 	pop	iy
   42C3 DD E1         [14]  152 	pop	ix
   42C5 E1            [10]  153 	pop	hl
   42C6 D1            [10]  154 	pop	de
   42C7 C1            [10]  155 	pop	bc
   42C8 F1            [10]  156 	pop	af
   42C9 FB            [ 4]  157 	ei
   42CA C9            [10]  158 	ret
   42CB C9            [10]  159 	ret
                            160 ;src/jdvapi_sync.c:99: void raster()
                            161 ;	---------------------------------
                            162 ; Function raster
                            163 ; ---------------------------------
   42CC                     164 _raster::
                            165 ;src/jdvapi_sync.c:108: __endasm;
   42CC F3            [ 4]  166 	di
   42CD FD 21 39 00   [14]  167 	ld	iy,#0x39
   42D1 FD 36 00 89   [19]  168 	ld	0 (iy),#<(_raster_handler)
   42D5 FD 36 01 42   [19]  169 	ld	1 (iy),#>(_raster_handler)
   42D9 FB            [ 4]  170 	ei
   42DA C9            [10]  171 	ret
                            172 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            173 ;	---------------------------------
                            174 ; Function handle_raster
                            175 ; ---------------------------------
   42DB                     176 _handle_raster::
                            177 ;src/jdvapi_sync.c:145: aFunction=callback;
   42DB 21 02 00      [10]  178 	ld	hl, #2+0
   42DE 39            [11]  179 	add	hl, sp
   42DF 7E            [ 7]  180 	ld	a, (hl)
   42E0 32 9A 4A      [13]  181 	ld	(#_aFunction + 0),a
   42E3 21 03 00      [10]  182 	ld	hl, #2+1
   42E6 39            [11]  183 	add	hl, sp
   42E7 7E            [ 7]  184 	ld	a, (hl)
   42E8 32 9B 4A      [13]  185 	ld	(#_aFunction + 1),a
   42EB C9            [10]  186 	ret
                            187 ;src/jdvapi_sync.c:148: void halt()
                            188 ;	---------------------------------
                            189 ; Function halt
                            190 ; ---------------------------------
   42EC                     191 _halt::
                            192 ;src/jdvapi_sync.c:152: __endasm;
   42EC 76            [ 4]  193 	halt
   42ED C9            [10]  194 	ret
                            195 ;src/jdvapi_sync.c:155: void calqueC000()
                            196 ;	---------------------------------
                            197 ; Function calqueC000
                            198 ; ---------------------------------
   42EE                     199 _calqueC000::
                            200 ;src/jdvapi_sync.c:162: __endasm;
   42EE 01 0C BC      [10]  201 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   42F1 ED 49         [12]  202 	out	(c),c ; le registre 12 du CRTC
   42F3 01 30 BD      [10]  203 	ld	bc,#0xBD00+48
   42F6 ED 49         [12]  204 	out	(c),c
   42F8 C9            [10]  205 	ret
                            206 ;src/jdvapi_sync.c:165: void calque8000()
                            207 ;	---------------------------------
                            208 ; Function calque8000
                            209 ; ---------------------------------
   42F9                     210 _calque8000::
                            211 ;src/jdvapi_sync.c:172: __endasm;
   42F9 01 0C BC      [10]  212 	ld	bc,#0xBC00+12 ; On met la valeur 32 dans
   42FC ED 49         [12]  213 	out	(c),c ; le registre 12 du CRTC
   42FE 01 20 BD      [10]  214 	ld	bc,#0xBD00+32
   4301 ED 49         [12]  215 	out	(c),c
   4303 C9            [10]  216 	ret
                            217 ;src/jdvapi_sync.c:175: void calque4000()
                            218 ;	---------------------------------
                            219 ; Function calque4000
                            220 ; ---------------------------------
   4304                     221 _calque4000::
                            222 ;src/jdvapi_sync.c:182: __endasm;
   4304 01 0C BC      [10]  223 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   4307 ED 49         [12]  224 	out	(c),c ; le registre 12 du CRTC
   4309 01 10 BD      [10]  225 	ld	bc,#0xBD00+16
   430C ED 49         [12]  226 	out	(c),c
   430E C9            [10]  227 	ret
                            228 ;src/jdvapi_sync.c:185: void calque4C00()
                            229 ;	---------------------------------
                            230 ; Function calque4C00
                            231 ; ---------------------------------
   430F                     232 _calque4C00::
                            233 ;src/jdvapi_sync.c:192: __endasm;
   430F 01 0C BC      [10]  234 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   4312 ED 49         [12]  235 	out	(c),c ; le registre 12 du CRTC
   4314 01 1C BD      [10]  236 	ld	bc,#0xBD00+28
   4317 ED 49         [12]  237 	out	(c),c
   4319 C9            [10]  238 	ret
                            239 ;src/jdvapi_sync.c:195: void bank0123()
                            240 ;	---------------------------------
                            241 ; Function bank0123
                            242 ; ---------------------------------
   431A                     243 _bank0123::
                            244 ;src/jdvapi_sync.c:200: __endasm;
   431A 01 C0 7F      [10]  245 	ld	bc,#0x7FC0+0 ; RAM rétablie
   431D ED 49         [12]  246 	out	(c),c
   431F C9            [10]  247 	ret
                            248 ;src/jdvapi_sync.c:203: void bank7_C000()
                            249 ;	---------------------------------
                            250 ; Function bank7_C000
                            251 ; ---------------------------------
   4320                     252 _bank7_C000::
                            253 ;src/jdvapi_sync.c:208: __endasm;
   4320 01 C1 7F      [10]  254 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   4323 ED 49         [12]  255 	out	(c),c
   4325 C9            [10]  256 	ret
                            257 ;src/jdvapi_sync.c:211: void bank4_4000()
                            258 ;	---------------------------------
                            259 ; Function bank4_4000
                            260 ; ---------------------------------
   4326                     261 _bank4_4000::
                            262 ;src/jdvapi_sync.c:216: __endasm;
   4326 01 C4 7F      [10]  263 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   4329 ED 49         [12]  264 	out	(c),c
   432B C9            [10]  265 	ret
                            266 ;src/jdvapi_sync.c:219: void bank5_4000()
                            267 ;	---------------------------------
                            268 ; Function bank5_4000
                            269 ; ---------------------------------
   432C                     270 _bank5_4000::
                            271 ;src/jdvapi_sync.c:224: __endasm;
   432C 01 C5 7F      [10]  272 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   432F ED 49         [12]  273 	out	(c),c
   4331 C9            [10]  274 	ret
                            275 ;src/jdvapi_sync.c:227: void bank6_4000()
                            276 ;	---------------------------------
                            277 ; Function bank6_4000
                            278 ; ---------------------------------
   4332                     279 _bank6_4000::
                            280 ;src/jdvapi_sync.c:232: __endasm;
   4332 01 C6 7F      [10]  281 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   4335 ED 49         [12]  282 	out	(c),c
   4337 C9            [10]  283 	ret
                            284 ;src/jdvapi_sync.c:235: void bank7_4000()
                            285 ;	---------------------------------
                            286 ; Function bank7_4000
                            287 ; ---------------------------------
   4338                     288 _bank7_4000::
                            289 ;src/jdvapi_sync.c:240: __endasm;
   4338 01 C7 7F      [10]  290 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   433B ED 49         [12]  291 	out	(c),c
   433D C9            [10]  292 	ret
                            293 ;src/jdvapi_sync.c:277: void overscanH()
                            294 ;	---------------------------------
                            295 ; Function overscanH
                            296 ; ---------------------------------
   433E                     297 _overscanH::
                            298 ;src/jdvapi_sync.c:297: __endasm;
   433E 01 01 BC      [10]  299 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   4341 ED 49         [12]  300 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   4343 01 30 BD      [10]  301 	ld	bc,#0xBD00+48
   4346 ED 49         [12]  302 	out	(c),c
   4348 01 02 BC      [10]  303 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   434B ED 49         [12]  304 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   434D 01 32 BD      [10]  305 	ld	bc,#0xBD00+50
   4350 ED 49         [12]  306 	out	(c),c
   4352 01 06 BC      [10]  307 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   4355 ED 49         [12]  308 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   4357 01 15 BD      [10]  309 	ld	bc,#0xBD00+21
   435A ED 49         [12]  310 	out	(c),c
   435C 01 07 BC      [10]  311 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   435F ED 49         [12]  312 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   4361 01 1D BD      [10]  313 	ld	bc,#0xBD00+29
   4364 ED 49         [12]  314 	out	(c),c
   4366 C9            [10]  315 	ret
                            316 ;src/jdvapi_sync.c:323: void scan()
                            317 ;	---------------------------------
                            318 ; Function scan
                            319 ; ---------------------------------
   4367                     320 _scan::
                            321 ;src/jdvapi_sync.c:342: __endasm;
   4367 01 01 BC      [10]  322 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   436A ED 49         [12]  323 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   436C 01 28 BD      [10]  324 	ld	bc,#0xBD00+40
   436F ED 49         [12]  325 	out	(c),c
   4371 01 02 BC      [10]  326 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   4374 ED 49         [12]  327 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   4376 01 2E BD      [10]  328 	ld	bc,#0xBD00+46
   4379 ED 49         [12]  329 	out	(c),c
   437B 01 06 BC      [10]  330 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   437E ED 49         [12]  331 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   4380 01 19 BD      [10]  332 	ld	bc,#0xBD00+25
   4383 ED 49         [12]  333 	out	(c),c
   4385 01 07 BC      [10]  334 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   4388 ED 49         [12]  335 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   438A 01 1E BD      [10]  336 	ld	bc,#0xBD00+30
   438D ED 49         [12]  337 	out	(c),c
   438F C9            [10]  338 	ret
                            339 	.area _CODE
                            340 	.area _INITIALIZER
   4A9F                     341 __xinit__callback_counter:
   4A9F 00                  342 	.db #0x00	; 0
   4AA0                     343 __xinit__aFunction:
   4AA0 85 42               344 	.dw _callback
                            345 	.area _CABS (ABS)
