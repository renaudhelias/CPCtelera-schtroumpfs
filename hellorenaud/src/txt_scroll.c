#include <cpctelera.h>
#include "fontmap20x22.h"

#define SCREEN_WIDTH 160

void scroll(char * texte, unsigned int l, unsigned int step) {
	u8* p;
	char c;
	unsigned int o;
	for(c=step;c<G_TILE_FONTMAP20X22_00_W*l;c=c+1) {
		if (c-step>SCREEN_WIDTH) {return;}
		if (texte[c]!=' ' && c%G_TILE_FONTMAP20X22_00_W==0) {
			o=texte[c/G_TILE_FONTMAP20X22_00_W]-'A';
			p = cpct_getScreenPtr(CPCT_VMEM_START, c-step,120-1);
			cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
		}
	}
}

