;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module jdvapi_sync
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scan
	.globl _overscanH
	.globl _bank7_4000
	.globl _bank6_4000
	.globl _bank5_4000
	.globl _bank4_4000
	.globl _bank7_C000
	.globl _bank0123
	.globl _calque4C00
	.globl _calque4000
	.globl _calque8000
	.globl _calqueC000
	.globl _halt
	.globl _handle_raster
	.globl _raster
	.globl _raster_handler
	.globl _callback
	.globl _raster_halt
	.globl _vsync
	.globl _aFunction
	.globl _callback_counter
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_callback_counter::
	.ds 1
_aFunction::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/jdvapi_sync.c:3: void vsync()
;	---------------------------------
; Function vsync
; ---------------------------------
_vsync::
;src/jdvapi_sync.c:13: __endasm;
	ld	b,#0xf5 ;; PPI port B input
	    _wait_vsync:
	in	a,(c) ;; [4] read PPI port B input
;;	(bit 0 = "1" if vsync is active,
;;	or bit 0 = "0" if vsync is in-active)
	rra	;; [1] put bit 0 into carry flag
	jp	nc,_wait_vsync ;; [3] if carry not set, loop, otherwise continue
;src/jdvapi_sync.c:14: callback_counter=0;
	ld	hl,#_callback_counter + 0
	ld	(hl), #0x00
	ret
;src/jdvapi_sync.c:17: void raster_halt()
;	---------------------------------
; Function raster_halt
; ---------------------------------
_raster_halt::
;src/jdvapi_sync.c:25: __endasm;
	di
	LD	HL,#0xC9FB ;; deux instructions : EI RET
	LD	(#0x38),HL
	ei
	ret
;src/jdvapi_sync.c:45: void callback(unsigned char counter){
;	---------------------------------
; Function callback
; ---------------------------------
_callback::
;src/jdvapi_sync.c:49: __endasm;
	call	0
	ret
;src/jdvapi_sync.c:54: void raster_handler()
;	---------------------------------
; Function raster_handler
; ---------------------------------
_raster_handler::
;src/jdvapi_sync.c:73: __endasm;
;;	backup Z80 state
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	push	iy
	exx
	ex	af, af' ; '
	push	af
	push	bc
	push	de
	push	hl
;;	here we do custom code..
;src/jdvapi_sync.c:75: callback_counter=(callback_counter+1)%6;
	ld	hl,#_callback_counter + 0
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	hl, #0x0006
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	iy, #_callback_counter
	ld	0 (iy), l
;src/jdvapi_sync.c:76: aFunction(callback_counter);
	ld	a, (_callback_counter)
	push	af
	inc	sp
	ld	hl, (_aFunction)
	call	___sdcc_call_hl
	inc	sp
;src/jdvapi_sync.c:95: __endasm;
;;	restore Z80 state
	pop	hl
	pop	de
	pop	bc
	pop	af
	ex	af, af' ; '
	exx
	pop	iy
	pop	ix
	pop	hl
	pop	de
	pop	bc
	pop	af
	ei
	ret
	ret
;src/jdvapi_sync.c:99: void raster()
;	---------------------------------
; Function raster
; ---------------------------------
_raster::
;src/jdvapi_sync.c:108: __endasm;
	di
	ld	iy,#0x39
	ld	0 (iy),#<(_raster_handler)
	ld	1 (iy),#>(_raster_handler)
	ei
	ret
;src/jdvapi_sync.c:143: void handle_raster(MyFunctionReturningVoid callback) {
;	---------------------------------
; Function handle_raster
; ---------------------------------
_handle_raster::
;src/jdvapi_sync.c:145: aFunction=callback;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_aFunction + 0),a
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_aFunction + 1),a
	ret
;src/jdvapi_sync.c:148: void halt()
;	---------------------------------
; Function halt
; ---------------------------------
_halt::
;src/jdvapi_sync.c:152: __endasm;
	halt
	ret
;src/jdvapi_sync.c:155: void calqueC000()
;	---------------------------------
; Function calqueC000
; ---------------------------------
_calqueC000::
;src/jdvapi_sync.c:162: __endasm;
	ld	bc,#0xBC00+12 ; On met la valeur 48 dans
	out	(c),c ; le registre 12 du CRTC
	ld	bc,#0xBD00+48
	out	(c),c
	ret
;src/jdvapi_sync.c:165: void calque8000()
;	---------------------------------
; Function calque8000
; ---------------------------------
_calque8000::
;src/jdvapi_sync.c:172: __endasm;
	ld	bc,#0xBC00+12 ; On met la valeur 32 dans
	out	(c),c ; le registre 12 du CRTC
	ld	bc,#0xBD00+32
	out	(c),c
	ret
;src/jdvapi_sync.c:175: void calque4000()
;	---------------------------------
; Function calque4000
; ---------------------------------
_calque4000::
;src/jdvapi_sync.c:182: __endasm;
	ld	bc,#0xBC00+12 ; On met la valeur 16 dans
	out	(c),c ; le registre 12 du CRTC
	ld	bc,#0xBD00+16
	out	(c),c
	ret
;src/jdvapi_sync.c:185: void calque4C00()
;	---------------------------------
; Function calque4C00
; ---------------------------------
_calque4C00::
;src/jdvapi_sync.c:192: __endasm;
	ld	bc,#0xBC00+12 ; On met la valeur 28 dans
	out	(c),c ; le registre 12 du CRTC
	ld	bc,#0xBD00+28
	out	(c),c
	ret
;src/jdvapi_sync.c:195: void bank0123()
;	---------------------------------
; Function bank0123
; ---------------------------------
_bank0123::
;src/jdvapi_sync.c:200: __endasm;
	ld	bc,#0x7FC0+0 ; RAM rétablie
	out	(c),c
	ret
;src/jdvapi_sync.c:203: void bank7_C000()
;	---------------------------------
; Function bank7_C000
; ---------------------------------
_bank7_C000::
;src/jdvapi_sync.c:208: __endasm;
	ld	bc,#0x7FC0+1 ; RAM_7 sur &C000-&FFFF
	out	(c),c
	ret
;src/jdvapi_sync.c:211: void bank4_4000()
;	---------------------------------
; Function bank4_4000
; ---------------------------------
_bank4_4000::
;src/jdvapi_sync.c:216: __endasm;
	ld	bc,#0x7FC0+4 ; RAM_4 sur &4000-&7FFF
	out	(c),c
	ret
;src/jdvapi_sync.c:219: void bank5_4000()
;	---------------------------------
; Function bank5_4000
; ---------------------------------
_bank5_4000::
;src/jdvapi_sync.c:224: __endasm;
	ld	bc,#0x7FC0+5 ; RAM_5 sur &4000-&7FFF
	out	(c),c
	ret
;src/jdvapi_sync.c:227: void bank6_4000()
;	---------------------------------
; Function bank6_4000
; ---------------------------------
_bank6_4000::
;src/jdvapi_sync.c:232: __endasm;
	ld	bc,#0x7FC0+6 ; RAM_6 sur &4000-&7FFF
	out	(c),c
	ret
;src/jdvapi_sync.c:235: void bank7_4000()
;	---------------------------------
; Function bank7_4000
; ---------------------------------
_bank7_4000::
;src/jdvapi_sync.c:240: __endasm;
	ld	bc,#0x7FC0+7 ; RAM_7 sur &4000-&7FFF
	out	(c),c
	ret
;src/jdvapi_sync.c:277: void overscanH()
;	---------------------------------
; Function overscanH
; ---------------------------------
_overscanH::
;src/jdvapi_sync.c:297: __endasm;
	ld	bc,#0xBC00+1 ; On met la valeur 48 dans
	out	(c),c ; le registre 1 du CRTC -- RHdisp
	ld	bc,#0xBD00+48
	out	(c),c
	ld	bc,#0xBC00+2 ; On met la valeur 50 dans
	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
	ld	bc,#0xBD00+50
	out	(c),c
	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
	out	(c),c ; le registre 6 du CRTC -- RVdisp
	ld	bc,#0xBD00+21
	out	(c),c
	ld	bc,#0xBC00+7 ; On remet la valeur 43 dans
	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
	ld	bc,#0xBD00+29
	out	(c),c
	ret
;src/jdvapi_sync.c:323: void scan()
;	---------------------------------
; Function scan
; ---------------------------------
_scan::
;src/jdvapi_sync.c:342: __endasm;
	ld	bc,#0xBC00+1 ; On remet la valeur 40 dans
	out	(c),c ; le registre 1 du CRTC -- RHdisp
	ld	bc,#0xBD00+40
	out	(c),c
	ld	bc,#0xBC00+2 ; On remet la valeur 46 dans
	out	(c),c ; le registre 2 du CRTC -- RHsyncpos
	ld	bc,#0xBD00+46
	out	(c),c
	ld	bc,#0xBC00+6 ; On remet la valeur 25 dans
	out	(c),c ; le registre 6 du CRTC -- RVdisp
	ld	bc,#0xBD00+25
	out	(c),c
	ld	bc,#0xBC00+7 ; On remet la valeur 30 dans
	out	(c),c ; le registre 7 du CRTC -- RVsyncpos
	ld	bc,#0xBD00+30
	out	(c),c
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__callback_counter:
	.db #0x00	; 0
__xinit__aFunction:
	.dw _callback
	.area _CABS (ABS)
