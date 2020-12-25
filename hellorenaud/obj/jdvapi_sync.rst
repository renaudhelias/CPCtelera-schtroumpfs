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
   6569                      43 _callback_counter::
   6569                      44 	.ds 1
   656A                      45 _aFunction::
   656A                      46 	.ds 2
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
   45E8                      71 _vsync::
                             72 ;src/jdvapi_sync.c:13: __endasm;
   45E8 06 F5         [ 7]   73 	ld	b,#0xf5 ;; PPI port B input
   45EA                      74 	    _wait_vsync:
   45EA ED 78         [12]   75 	in	a,(c) ;; [4] read PPI port B input
                             76 ;;	(bit 0 = "1" if vsync is active,
                             77 ;;	or bit 0 = "0" if vsync is in-active)
   45EC 1F            [ 4]   78 	rra	;; [1] put bit 0 into carry flag
   45ED D2 EA 45      [10]   79 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             80 ;src/jdvapi_sync.c:14: callback_counter=0;
   45F0 21 69 65      [10]   81 	ld	hl,#_callback_counter + 0
   45F3 36 00         [10]   82 	ld	(hl), #0x00
   45F5 C9            [10]   83 	ret
                             84 ;src/jdvapi_sync.c:17: void raster_halt()
                             85 ;	---------------------------------
                             86 ; Function raster_halt
                             87 ; ---------------------------------
   45F6                      88 _raster_halt::
                             89 ;src/jdvapi_sync.c:25: __endasm;
   45F6 F3            [ 4]   90 	di
   45F7 21 FB C9      [10]   91 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   45FA 22 38 00      [16]   92 	LD	(#0x38),HL
   45FD FB            [ 4]   93 	ei
   45FE C9            [10]   94 	ret
                             95 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             96 ;	---------------------------------
                             97 ; Function callback
                             98 ; ---------------------------------
   45FF                      99 _callback::
                            100 ;src/jdvapi_sync.c:49: __endasm;
   45FF CD 00 00      [17]  101 	call	0
   4602 C9            [10]  102 	ret
                            103 ;src/jdvapi_sync.c:54: void raster_handler()
                            104 ;	---------------------------------
                            105 ; Function raster_handler
                            106 ; ---------------------------------
   4603                     107 _raster_handler::
                            108 ;src/jdvapi_sync.c:73: __endasm;
                            109 ;;	backup Z80 state
   4603 F5            [11]  110 	push	af
   4604 C5            [11]  111 	push	bc
   4605 D5            [11]  112 	push	de
   4606 E5            [11]  113 	push	hl
   4607 DD E5         [15]  114 	push	ix
   4609 FD E5         [15]  115 	push	iy
   460B D9            [ 4]  116 	exx
   460C 08            [ 4]  117 	ex	af, af' ; '
   460D F5            [11]  118 	push	af
   460E C5            [11]  119 	push	bc
   460F D5            [11]  120 	push	de
   4610 E5            [11]  121 	push	hl
                            122 ;;	here we do custom code..
                            123 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   4611 21 69 65      [10]  124 	ld	hl,#_callback_counter + 0
   4614 4E            [ 7]  125 	ld	c, (hl)
   4615 06 00         [ 7]  126 	ld	b, #0x00
   4617 03            [ 6]  127 	inc	bc
   4618 21 06 00      [10]  128 	ld	hl, #0x0006
   461B E5            [11]  129 	push	hl
   461C C5            [11]  130 	push	bc
   461D CD 71 64      [17]  131 	call	__modsint
   4620 F1            [10]  132 	pop	af
   4621 F1            [10]  133 	pop	af
   4622 FD 21 69 65   [14]  134 	ld	iy, #_callback_counter
   4626 FD 75 00      [19]  135 	ld	0 (iy), l
                            136 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   4629 3A 69 65      [13]  137 	ld	a, (_callback_counter)
   462C F5            [11]  138 	push	af
   462D 33            [ 6]  139 	inc	sp
   462E 2A 6A 65      [16]  140 	ld	hl, (_aFunction)
   4631 CD 25 63      [17]  141 	call	___sdcc_call_hl
   4634 33            [ 6]  142 	inc	sp
                            143 ;src/jdvapi_sync.c:95: __endasm;
                            144 ;;	restore Z80 state
   4635 E1            [10]  145 	pop	hl
   4636 D1            [10]  146 	pop	de
   4637 C1            [10]  147 	pop	bc
   4638 F1            [10]  148 	pop	af
   4639 08            [ 4]  149 	ex	af, af' ; '
   463A D9            [ 4]  150 	exx
   463B FD E1         [14]  151 	pop	iy
   463D DD E1         [14]  152 	pop	ix
   463F E1            [10]  153 	pop	hl
   4640 D1            [10]  154 	pop	de
   4641 C1            [10]  155 	pop	bc
   4642 F1            [10]  156 	pop	af
   4643 FB            [ 4]  157 	ei
   4644 C9            [10]  158 	ret
   4645 C9            [10]  159 	ret
                            160 ;src/jdvapi_sync.c:99: void raster()
                            161 ;	---------------------------------
                            162 ; Function raster
                            163 ; ---------------------------------
   4646                     164 _raster::
                            165 ;src/jdvapi_sync.c:108: __endasm;
   4646 F3            [ 4]  166 	di
   4647 FD 21 39 00   [14]  167 	ld	iy,#0x39
   464B FD 36 00 03   [19]  168 	ld	0 (iy),#<(_raster_handler)
   464F FD 36 01 46   [19]  169 	ld	1 (iy),#>(_raster_handler)
   4653 FB            [ 4]  170 	ei
   4654 C9            [10]  171 	ret
                            172 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            173 ;	---------------------------------
                            174 ; Function handle_raster
                            175 ; ---------------------------------
   4655                     176 _handle_raster::
                            177 ;src/jdvapi_sync.c:145: aFunction=callback;
   4655 21 02 00      [10]  178 	ld	hl, #2+0
   4658 39            [11]  179 	add	hl, sp
   4659 7E            [ 7]  180 	ld	a, (hl)
   465A 32 6A 65      [13]  181 	ld	(#_aFunction + 0),a
   465D 21 03 00      [10]  182 	ld	hl, #2+1
   4660 39            [11]  183 	add	hl, sp
   4661 7E            [ 7]  184 	ld	a, (hl)
   4662 32 6B 65      [13]  185 	ld	(#_aFunction + 1),a
   4665 C9            [10]  186 	ret
                            187 ;src/jdvapi_sync.c:148: void halt()
                            188 ;	---------------------------------
                            189 ; Function halt
                            190 ; ---------------------------------
   4666                     191 _halt::
                            192 ;src/jdvapi_sync.c:152: __endasm;
   4666 76            [ 4]  193 	halt
   4667 C9            [10]  194 	ret
                            195 ;src/jdvapi_sync.c:155: void calqueC000()
                            196 ;	---------------------------------
                            197 ; Function calqueC000
                            198 ; ---------------------------------
   4668                     199 _calqueC000::
                            200 ;src/jdvapi_sync.c:162: __endasm;
   4668 01 0C BC      [10]  201 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   466B ED 49         [12]  202 	out	(c),c ; le registre 12 du CRTC
   466D 01 30 BD      [10]  203 	ld	bc,#0xBD00+48
   4670 ED 49         [12]  204 	out	(c),c
   4672 C9            [10]  205 	ret
                            206 ;src/jdvapi_sync.c:165: void calque8000()
                            207 ;	---------------------------------
                            208 ; Function calque8000
                            209 ; ---------------------------------
   4673                     210 _calque8000::
                            211 ;src/jdvapi_sync.c:172: __endasm;
   4673 01 0C BC      [10]  212 	ld	bc,#0xBC00+12 ; On met la valeur 32 dans
   4676 ED 49         [12]  213 	out	(c),c ; le registre 12 du CRTC
   4678 01 20 BD      [10]  214 	ld	bc,#0xBD00+32
   467B ED 49         [12]  215 	out	(c),c
   467D C9            [10]  216 	ret
                            217 ;src/jdvapi_sync.c:175: void calque4000()
                            218 ;	---------------------------------
                            219 ; Function calque4000
                            220 ; ---------------------------------
   467E                     221 _calque4000::
                            222 ;src/jdvapi_sync.c:182: __endasm;
   467E 01 0C BC      [10]  223 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   4681 ED 49         [12]  224 	out	(c),c ; le registre 12 du CRTC
   4683 01 10 BD      [10]  225 	ld	bc,#0xBD00+16
   4686 ED 49         [12]  226 	out	(c),c
   4688 C9            [10]  227 	ret
                            228 ;src/jdvapi_sync.c:185: void calque4C00()
                            229 ;	---------------------------------
                            230 ; Function calque4C00
                            231 ; ---------------------------------
   4689                     232 _calque4C00::
                            233 ;src/jdvapi_sync.c:192: __endasm;
   4689 01 0C BC      [10]  234 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   468C ED 49         [12]  235 	out	(c),c ; le registre 12 du CRTC
   468E 01 1C BD      [10]  236 	ld	bc,#0xBD00+28
   4691 ED 49         [12]  237 	out	(c),c
   4693 C9            [10]  238 	ret
                            239 ;src/jdvapi_sync.c:195: void bank0123()
                            240 ;	---------------------------------
                            241 ; Function bank0123
                            242 ; ---------------------------------
   4694                     243 _bank0123::
                            244 ;src/jdvapi_sync.c:200: __endasm;
   4694 01 C0 7F      [10]  245 	ld	bc,#0x7FC0+0 ; RAM rétablie
   4697 ED 49         [12]  246 	out	(c),c
   4699 C9            [10]  247 	ret
                            248 ;src/jdvapi_sync.c:203: void bank7_C000()
                            249 ;	---------------------------------
                            250 ; Function bank7_C000
                            251 ; ---------------------------------
   469A                     252 _bank7_C000::
                            253 ;src/jdvapi_sync.c:208: __endasm;
   469A 01 C1 7F      [10]  254 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   469D ED 49         [12]  255 	out	(c),c
   469F C9            [10]  256 	ret
                            257 ;src/jdvapi_sync.c:211: void bank4_4000()
                            258 ;	---------------------------------
                            259 ; Function bank4_4000
                            260 ; ---------------------------------
   46A0                     261 _bank4_4000::
                            262 ;src/jdvapi_sync.c:216: __endasm;
   46A0 01 C4 7F      [10]  263 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   46A3 ED 49         [12]  264 	out	(c),c
   46A5 C9            [10]  265 	ret
                            266 ;src/jdvapi_sync.c:219: void bank5_4000()
                            267 ;	---------------------------------
                            268 ; Function bank5_4000
                            269 ; ---------------------------------
   46A6                     270 _bank5_4000::
                            271 ;src/jdvapi_sync.c:224: __endasm;
   46A6 01 C5 7F      [10]  272 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   46A9 ED 49         [12]  273 	out	(c),c
   46AB C9            [10]  274 	ret
                            275 ;src/jdvapi_sync.c:227: void bank6_4000()
                            276 ;	---------------------------------
                            277 ; Function bank6_4000
                            278 ; ---------------------------------
   46AC                     279 _bank6_4000::
                            280 ;src/jdvapi_sync.c:232: __endasm;
   46AC 01 C6 7F      [10]  281 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   46AF ED 49         [12]  282 	out	(c),c
   46B1 C9            [10]  283 	ret
                            284 ;src/jdvapi_sync.c:235: void bank7_4000()
                            285 ;	---------------------------------
                            286 ; Function bank7_4000
                            287 ; ---------------------------------
   46B2                     288 _bank7_4000::
                            289 ;src/jdvapi_sync.c:240: __endasm;
   46B2 01 C7 7F      [10]  290 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   46B5 ED 49         [12]  291 	out	(c),c
   46B7 C9            [10]  292 	ret
                            293 ;src/jdvapi_sync.c:277: void overscanH()
                            294 ;	---------------------------------
                            295 ; Function overscanH
                            296 ; ---------------------------------
   46B8                     297 _overscanH::
                            298 ;src/jdvapi_sync.c:297: __endasm;
   46B8 01 01 BC      [10]  299 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   46BB ED 49         [12]  300 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   46BD 01 30 BD      [10]  301 	ld	bc,#0xBD00+48
   46C0 ED 49         [12]  302 	out	(c),c
   46C2 01 02 BC      [10]  303 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   46C5 ED 49         [12]  304 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   46C7 01 32 BD      [10]  305 	ld	bc,#0xBD00+50
   46CA ED 49         [12]  306 	out	(c),c
   46CC 01 06 BC      [10]  307 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   46CF ED 49         [12]  308 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   46D1 01 15 BD      [10]  309 	ld	bc,#0xBD00+21
   46D4 ED 49         [12]  310 	out	(c),c
   46D6 01 07 BC      [10]  311 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   46D9 ED 49         [12]  312 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   46DB 01 1D BD      [10]  313 	ld	bc,#0xBD00+29
   46DE ED 49         [12]  314 	out	(c),c
   46E0 C9            [10]  315 	ret
                            316 ;src/jdvapi_sync.c:323: void scan()
                            317 ;	---------------------------------
                            318 ; Function scan
                            319 ; ---------------------------------
   46E1                     320 _scan::
                            321 ;src/jdvapi_sync.c:342: __endasm;
   46E1 01 01 BC      [10]  322 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   46E4 ED 49         [12]  323 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   46E6 01 28 BD      [10]  324 	ld	bc,#0xBD00+40
   46E9 ED 49         [12]  325 	out	(c),c
   46EB 01 02 BC      [10]  326 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   46EE ED 49         [12]  327 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   46F0 01 2E BD      [10]  328 	ld	bc,#0xBD00+46
   46F3 ED 49         [12]  329 	out	(c),c
   46F5 01 06 BC      [10]  330 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   46F8 ED 49         [12]  331 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   46FA 01 19 BD      [10]  332 	ld	bc,#0xBD00+25
   46FD ED 49         [12]  333 	out	(c),c
   46FF 01 07 BC      [10]  334 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   4702 ED 49         [12]  335 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   4704 01 1E BD      [10]  336 	ld	bc,#0xBD00+30
   4707 ED 49         [12]  337 	out	(c),c
   4709 C9            [10]  338 	ret
                            339 	.area _CODE
                            340 	.area _INITIALIZER
   6572                     341 __xinit__callback_counter:
   6572 00                  342 	.db #0x00	; 0
   6573                     343 __xinit__aFunction:
   6573 FF 45               344 	.dw _callback
                            345 	.area _CABS (ABS)
