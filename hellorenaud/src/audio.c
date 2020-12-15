
#ifndef NO_SOUND

int i;

//__asm
//#include "SoundEffects.asm"
//__endasm;

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
  SOUND sound_loops[15];
  unsigned char sound_end;
  unsigned char sfx_speed;
  SFX sfx_loops[4];
  unsigned char sfx_end;
} SFX_SOUND;

struct AKG_SFX {
 //unsigned int liste[2];
 SFX_SOUND sfx_sound;
};
struct AKG_SIMPLE_SFX {
  unsigned char sfx_speed;
  SFX sfx_loops[9];
  unsigned char sfx_end;
};

struct AKG_LIST_SFX {
  unsigned int liste;
};


//const struct SFX effet = {.volume=10,.noise=7,.period=8};
const struct AKG_LIST_SFX liste1 = {
  .liste=0
};
const struct AKG_LIST_SFX liste2 = {
  .liste=0
};
const struct AKG_SFX effets1 = {
//	.liste={0,0},
	.sfx_sound={0,{{61,239},{57,239},{53,239},{49,239},{455,239},{41,239},{37,239},{33,239},{29,239},{25,239},{21,339},{17,239},{13,239},{9,239},{5,239}},4,0,{{189,1,95},{189,1,99},{177,1,102},{173,1,106}},4},
		
};

const struct AKG_SIMPLE_SFX effets2 = {
	.sfx_speed=0,
	.sfx_loops={{189,1,301},{189,8,319},{185,2,402},{181,16,213},{177,2,225},{173,2,239},{165,16,358},{157,31,119},{153,7,80}},
	.sfx_end=4
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
	ld bc,#_effets1 ;; OK
	ld (#_liste1),bc ;; OK
        ld bc,#_effets2 ;; #_effets2 ;; OK
	ld (#_liste2),bc ;; OK
	
	;; AKG6000.BIN/exemple.asm
	ld bc,#0x7000
	ld de,#_liste1 ;;sfx
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
	call #0x6006
	
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
