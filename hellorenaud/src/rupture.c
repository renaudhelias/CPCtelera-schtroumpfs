
unsigned int vblPosition=0;

/**
 * Après un VSYNC qui met à 0 le compteur 6tics d'interruption.
 */
void killVBL() {
__asm
       ld bc,#0xbc07 ; Kill VBL
       ld a,#0x7f
       out (c),c
       inc b
       out (c),a
__endasm;
vblPosition=37;
}

void restoreVBL() {
__asm
       ld bc,#0xbc07 ; On repositionne la VBL
       ld a,(_vblPosition)
       out (c),c
       inc b
       out (c),a
__endasm;
}

/**
 * nbCharLigne 39 max
 **/
void rupture(unsigned char nbCharLigne) {
__asm
       ld bc,#0xbc04 ; Rupture 1
       ;;ld a,(_nbCharLigne)
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
       dec a
       out (c),c
       inc b
       out (c),a
__endasm;
vblPosition=vblPosition-nbCharLigne;
}

