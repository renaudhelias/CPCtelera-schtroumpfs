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
   26F3                      42 _callback_counter::
   26F3                      43 	.ds 1
   26F4                      44 _aFunction::
   26F4                      45 	.ds 2
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
   075E                      70 _vsync::
                             71 ;src/jdvapi_sync.c:13: __endasm;
   075E 06 F5         [ 7]   72 	ld	b,#0xf5 ;; PPI port B input
   0760                      73 	    _wait_vsync:
   0760 ED 78         [12]   74 	in	a,(c) ;; [4] read PPI port B input
                             75 ;;	(bit 0 = "1" if vsync is active,
                             76 ;;	or bit 0 = "0" if vsync is in-active)
   0762 1F            [ 4]   77 	rra	;; [1] put bit 0 into carry flag
   0763 D2 60 07      [10]   78 	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
                             79 ;src/jdvapi_sync.c:14: callback_counter=0;
   0766 21 F3 26      [10]   80 	ld	hl,#_callback_counter + 0
   0769 36 00         [10]   81 	ld	(hl), #0x00
   076B C9            [10]   82 	ret
                             83 ;src/jdvapi_sync.c:17: void raster_halt()
                             84 ;	---------------------------------
                             85 ; Function raster_halt
                             86 ; ---------------------------------
   076C                      87 _raster_halt::
                             88 ;src/jdvapi_sync.c:25: __endasm;
   076C F3            [ 4]   89 	di
   076D 21 FB C9      [10]   90 	LD	HL,#0xC9FB ;; deux instructions : EI RET
   0770 22 38 00      [16]   91 	LD	(#0x38),HL
   0773 FB            [ 4]   92 	ei
   0774 C9            [10]   93 	ret
                             94 ;src/jdvapi_sync.c:45: void callback(unsigned char counter){
                             95 ;	---------------------------------
                             96 ; Function callback
                             97 ; ---------------------------------
   0775                      98 _callback::
                             99 ;src/jdvapi_sync.c:49: __endasm;
   0775 CD 00 00      [17]  100 	call	0
   0778 C9            [10]  101 	ret
                            102 ;src/jdvapi_sync.c:54: void raster_handler()
                            103 ;	---------------------------------
                            104 ; Function raster_handler
                            105 ; ---------------------------------
   0779                     106 _raster_handler::
                            107 ;src/jdvapi_sync.c:73: __endasm;
                            108 ;;	backup Z80 state
   0779 F5            [11]  109 	push	af
   077A C5            [11]  110 	push	bc
   077B D5            [11]  111 	push	de
   077C E5            [11]  112 	push	hl
   077D DD E5         [15]  113 	push	ix
   077F FD E5         [15]  114 	push	iy
   0781 D9            [ 4]  115 	exx
   0782 08            [ 4]  116 	ex	af, af' ; '
   0783 F5            [11]  117 	push	af
   0784 C5            [11]  118 	push	bc
   0785 D5            [11]  119 	push	de
   0786 E5            [11]  120 	push	hl
                            121 ;;	here we do custom code..
                            122 ;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
   0787 21 F3 26      [10]  123 	ld	hl,#_callback_counter + 0
   078A 4E            [ 7]  124 	ld	c, (hl)
   078B 06 00         [ 7]  125 	ld	b, #0x00
   078D 03            [ 6]  126 	inc	bc
   078E 21 06 00      [10]  127 	ld	hl, #0x0006
   0791 E5            [11]  128 	push	hl
   0792 C5            [11]  129 	push	bc
   0793 CD DE 25      [17]  130 	call	__modsint
   0796 F1            [10]  131 	pop	af
   0797 F1            [10]  132 	pop	af
   0798 FD 21 F3 26   [14]  133 	ld	iy, #_callback_counter
   079C FD 75 00      [19]  134 	ld	0 (iy), l
                            135 ;src/jdvapi_sync.c:76: aFunction(callback_counter);
   079F 3A F3 26      [13]  136 	ld	a, (_callback_counter)
   07A2 F5            [11]  137 	push	af
   07A3 33            [ 6]  138 	inc	sp
   07A4 2A F4 26      [16]  139 	ld	hl, (_aFunction)
   07A7 CD 9C 24      [17]  140 	call	___sdcc_call_hl
   07AA 33            [ 6]  141 	inc	sp
                            142 ;src/jdvapi_sync.c:95: __endasm;
                            143 ;;	restore Z80 state
   07AB E1            [10]  144 	pop	hl
   07AC D1            [10]  145 	pop	de
   07AD C1            [10]  146 	pop	bc
   07AE F1            [10]  147 	pop	af
   07AF 08            [ 4]  148 	ex	af, af' ; '
   07B0 D9            [ 4]  149 	exx
   07B1 FD E1         [14]  150 	pop	iy
   07B3 DD E1         [14]  151 	pop	ix
   07B5 E1            [10]  152 	pop	hl
   07B6 D1            [10]  153 	pop	de
   07B7 C1            [10]  154 	pop	bc
   07B8 F1            [10]  155 	pop	af
   07B9 FB            [ 4]  156 	ei
   07BA C9            [10]  157 	ret
   07BB C9            [10]  158 	ret
                            159 ;src/jdvapi_sync.c:99: void raster()
                            160 ;	---------------------------------
                            161 ; Function raster
                            162 ; ---------------------------------
   07BC                     163 _raster::
                            164 ;src/jdvapi_sync.c:108: __endasm;
   07BC F3            [ 4]  165 	di
   07BD FD 21 39 00   [14]  166 	ld	iy,#0x39
   07C1 FD 36 00 79   [19]  167 	ld	0 (iy),#<(_raster_handler)
   07C5 FD 36 01 07   [19]  168 	ld	1 (iy),#>(_raster_handler)
   07C9 FB            [ 4]  169 	ei
   07CA C9            [10]  170 	ret
                            171 ;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
                            172 ;	---------------------------------
                            173 ; Function handle_raster
                            174 ; ---------------------------------
   07CB                     175 _handle_raster::
                            176 ;src/jdvapi_sync.c:145: aFunction=callback;
   07CB 21 02 00      [10]  177 	ld	hl, #2+0
   07CE 39            [11]  178 	add	hl, sp
   07CF 7E            [ 7]  179 	ld	a, (hl)
   07D0 32 F4 26      [13]  180 	ld	(#_aFunction + 0),a
   07D3 21 03 00      [10]  181 	ld	hl, #2+1
   07D6 39            [11]  182 	add	hl, sp
   07D7 7E            [ 7]  183 	ld	a, (hl)
   07D8 32 F5 26      [13]  184 	ld	(#_aFunction + 1),a
   07DB C9            [10]  185 	ret
                            186 ;src/jdvapi_sync.c:148: void halt()
                            187 ;	---------------------------------
                            188 ; Function halt
                            189 ; ---------------------------------
   07DC                     190 _halt::
                            191 ;src/jdvapi_sync.c:152: __endasm;
   07DC 76            [ 4]  192 	halt
   07DD C9            [10]  193 	ret
                            194 ;src/jdvapi_sync.c:155: void calqueC000()
                            195 ;	---------------------------------
                            196 ; Function calqueC000
                            197 ; ---------------------------------
   07DE                     198 _calqueC000::
                            199 ;src/jdvapi_sync.c:162: __endasm;
   07DE 01 0C BC      [10]  200 	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
   07E1 ED 49         [12]  201 	out	(c),c ; le registre 12 du CRTC
   07E3 01 30 BD      [10]  202 	ld	bc,#0xBD00+48
   07E6 ED 49         [12]  203 	out	(c),c
   07E8 C9            [10]  204 	ret
                            205 ;src/jdvapi_sync.c:165: void calque4000()
                            206 ;	---------------------------------
                            207 ; Function calque4000
                            208 ; ---------------------------------
   07E9                     209 _calque4000::
                            210 ;src/jdvapi_sync.c:172: __endasm;
   07E9 01 0C BC      [10]  211 	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
   07EC ED 49         [12]  212 	out	(c),c ; le registre 12 du CRTC
   07EE 01 10 BD      [10]  213 	ld	bc,#0xBD00+16
   07F1 ED 49         [12]  214 	out	(c),c
   07F3 C9            [10]  215 	ret
                            216 ;src/jdvapi_sync.c:175: void calque4C00()
                            217 ;	---------------------------------
                            218 ; Function calque4C00
                            219 ; ---------------------------------
   07F4                     220 _calque4C00::
                            221 ;src/jdvapi_sync.c:182: __endasm;
   07F4 01 0C BC      [10]  222 	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
   07F7 ED 49         [12]  223 	out	(c),c ; le registre 12 du CRTC
   07F9 01 1C BD      [10]  224 	ld	bc,#0xBD00+28
   07FC ED 49         [12]  225 	out	(c),c
   07FE C9            [10]  226 	ret
                            227 ;src/jdvapi_sync.c:185: void bank0123()
                            228 ;	---------------------------------
                            229 ; Function bank0123
                            230 ; ---------------------------------
   07FF                     231 _bank0123::
                            232 ;src/jdvapi_sync.c:190: __endasm;
   07FF 01 C0 7F      [10]  233 	ld	bc,#0x7FC0+0 ; RAM rétablie
   0802 ED 49         [12]  234 	out	(c),c
   0804 C9            [10]  235 	ret
                            236 ;src/jdvapi_sync.c:193: void bank7_C000()
                            237 ;	---------------------------------
                            238 ; Function bank7_C000
                            239 ; ---------------------------------
   0805                     240 _bank7_C000::
                            241 ;src/jdvapi_sync.c:198: __endasm;
   0805 01 C1 7F      [10]  242 	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
   0808 ED 49         [12]  243 	out	(c),c
   080A C9            [10]  244 	ret
                            245 ;src/jdvapi_sync.c:201: void bank4_4000()
                            246 ;	---------------------------------
                            247 ; Function bank4_4000
                            248 ; ---------------------------------
   080B                     249 _bank4_4000::
                            250 ;src/jdvapi_sync.c:206: __endasm;
   080B 01 C4 7F      [10]  251 	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
   080E ED 49         [12]  252 	out	(c),c
   0810 C9            [10]  253 	ret
                            254 ;src/jdvapi_sync.c:209: void bank5_4000()
                            255 ;	---------------------------------
                            256 ; Function bank5_4000
                            257 ; ---------------------------------
   0811                     258 _bank5_4000::
                            259 ;src/jdvapi_sync.c:214: __endasm;
   0811 01 C5 7F      [10]  260 	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
   0814 ED 49         [12]  261 	out	(c),c
   0816 C9            [10]  262 	ret
                            263 ;src/jdvapi_sync.c:217: void bank6_4000()
                            264 ;	---------------------------------
                            265 ; Function bank6_4000
                            266 ; ---------------------------------
   0817                     267 _bank6_4000::
                            268 ;src/jdvapi_sync.c:222: __endasm;
   0817 01 C6 7F      [10]  269 	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
   081A ED 49         [12]  270 	out	(c),c
   081C C9            [10]  271 	ret
                            272 ;src/jdvapi_sync.c:225: void bank7_4000()
                            273 ;	---------------------------------
                            274 ; Function bank7_4000
                            275 ; ---------------------------------
   081D                     276 _bank7_4000::
                            277 ;src/jdvapi_sync.c:230: __endasm;
   081D 01 C7 7F      [10]  278 	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
   0820 ED 49         [12]  279 	out	(c),c
   0822 C9            [10]  280 	ret
                            281 ;src/jdvapi_sync.c:267: void overscanH()
                            282 ;	---------------------------------
                            283 ; Function overscanH
                            284 ; ---------------------------------
   0823                     285 _overscanH::
                            286 ;src/jdvapi_sync.c:287: __endasm;
   0823 01 01 BC      [10]  287 	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
   0826 ED 49         [12]  288 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   0828 01 30 BD      [10]  289 	ld	bc,#0xBD00+48
   082B ED 49         [12]  290 	out	(c),c
   082D 01 02 BC      [10]  291 	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
   0830 ED 49         [12]  292 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   0832 01 32 BD      [10]  293 	ld	bc,#0xBD00+50
   0835 ED 49         [12]  294 	out	(c),c
   0837 01 06 BC      [10]  295 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   083A ED 49         [12]  296 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   083C 01 15 BD      [10]  297 	ld	bc,#0xBD00+21
   083F ED 49         [12]  298 	out	(c),c
   0841 01 07 BC      [10]  299 	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
   0844 ED 49         [12]  300 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   0846 01 1D BD      [10]  301 	ld	bc,#0xBD00+29
   0849 ED 49         [12]  302 	out	(c),c
   084B C9            [10]  303 	ret
                            304 ;src/jdvapi_sync.c:313: void scan()
                            305 ;	---------------------------------
                            306 ; Function scan
                            307 ; ---------------------------------
   084C                     308 _scan::
                            309 ;src/jdvapi_sync.c:332: __endasm;
   084C 01 01 BC      [10]  310 	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
   084F ED 49         [12]  311 	out	(c),c ; le registre 1 du CRTC -- RHdisp
   0851 01 28 BD      [10]  312 	ld	bc,#0xBD00+40
   0854 ED 49         [12]  313 	out	(c),c
   0856 01 02 BC      [10]  314 	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
   0859 ED 49         [12]  315 	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
   085B 01 2E BD      [10]  316 	ld	bc,#0xBD00+46
   085E ED 49         [12]  317 	out	(c),c
   0860 01 06 BC      [10]  318 	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
   0863 ED 49         [12]  319 	out	(c),c ; le registre 6 du CRTC -- RVdisp
   0865 01 19 BD      [10]  320 	ld	bc,#0xBD00+25
   0868 ED 49         [12]  321 	out	(c),c
   086A 01 07 BC      [10]  322 	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
   086D ED 49         [12]  323 	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
   086F 01 1E BD      [10]  324 	ld	bc,#0xBD00+30
   0872 ED 49         [12]  325 	out	(c),c
   0874 C9            [10]  326 	ret
                            327 	.area _CODE
                            328 	.area _INITIALIZER
   2700                     329 __xinit__callback_counter:
   2700 00                  330 	.db #0x00	; 0
   2701                     331 __xinit__aFunction:
   2701 75 07               332 	.dw _callback
                            333 	.area _CABS (ABS)
