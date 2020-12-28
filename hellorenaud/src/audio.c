
#ifndef NO_SOUND

// FIXME
//__asm
//.include /SoundEffects.asm/
//__endasm;

void akp_musicInit()
{
	__asm
	;; backup Z80 state
  push af
  push bc
  push de
  push hl
  push ix
  push iy
  exx
  ex af, af' ;; '
  push af
  push bc
  push de
  push hl

//jp idiot
//  	sfx:
//	#include "sfx.asm"
//idiot:
	
	;; AKG6000.BIN/exemple.asm
	ld bc,#0xD000
	//ld de,#_liste1 ;;sfx
	call #0xC000
	
	;; restore Z80 state
  pop hl
  pop de
  pop bc
  pop af
  ex af, af' ;; '
  exx
  pop iy
  pop ix
  pop hl
  pop de
  pop bc
  pop af
	__endasm;
}

void akp_musicPlay()
{
	__asm
	;; backup Z80 state
  push af
  push bc
  push de
  push hl
  push ix
  push iy
  exx
  ex af, af' ;; '
  push af
  push bc
  push de
  push hl
	
	;; AKG6000.BIN/exemple.asm
	call #0xC003
	
	;; restore Z80 state
  pop hl
  pop de
  pop bc
  pop af
  ex af, af' ;; '
  exx
  pop iy
  pop ix
  pop hl
  pop de
  pop bc
  pop af
	__endasm;
}

void akp_sfxPlay()
{
	__asm
	;; backup Z80 state
  push af
  push bc
  push de
  push hl
  push ix
  push iy
  exx
  ex af, af' ;; '
  push af
  push bc
  push de
  push hl
	
	;; AKG6000.BIN/exemple.asm
	call #0xC006
	
	;; restore Z80 state
  pop hl
  pop de
  pop bc
  pop af
  ex af, af' ;; '
  exx
  pop iy
  pop ix
  pop hl
  pop de
  pop bc
  pop af
	__endasm;
}
#endif
