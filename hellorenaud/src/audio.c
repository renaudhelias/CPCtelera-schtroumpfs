
#ifndef NO_SOUND

int i;



typedef struct {
  unsigned char volume;
  unsigned int period;
} SOUND;

typedef struct {
  unsigned char volume;
  unsigned char noise;
  unsigned int period;
} SFX;

typedef struct {
  unsigned char sound_speed;
  SOUND sound_loops[3];
  unsigned char sound_end;
  unsigned char sfx_speed;
  SFX sfx_loops[3];
  unsigned char sfx_end;
} SFX_SOUND;

struct AKG_SFX {
 unsigned int liste[2];
 SFX_SOUND sfx_sound[2];
};
//const struct SFX effet = {.volume=10,.noise=7,.period=8};
const struct AKG_SFX effets = {
	.liste={0,0},
	.sfx_sound={{0,{{61,239},{57,239},{53,239}},4,0,{{189,1,95},{189,1,99},{177,1,102}},4},
		{0,{{61,239},{57,239},{53,239}},4,1,{{189,1,301},{189,8,319},{185,2,402}},4}
		}
};

void akp_musicInit()
{
i=i+1;
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

//LD reg16,(nn)
//LD (nn),reg16
//LD reg16,nn
       //LD reg16,nn
	//LD reg16,nn
//LD (nn),reg16
	ld bc,#_effets ;; OK
	ld hl,#_effets ;; OK
//LD A,(reg16)
	ld (#_effets),bc ;; OK
	inc bc
	inc bc
	ld de,#0x0040
	add hl,de
	ld a,h
	ld (bc),a
        inc bc
	ld a,l
	ld (bc),a

	
	;; AKG6000.BIN/exemple.asm
	ld bc,#0x7000
	ld de,#_effets ;;sfx
	call #0x6000
	
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
	call #0x6003
	
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
