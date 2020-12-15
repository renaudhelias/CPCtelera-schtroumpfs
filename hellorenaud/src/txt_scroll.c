#include <cpctelera.h>
#include "fontmap20x22.h"

void scroll(char * texte, unsigned int l) {
	u8* p;
	char c;
	unsigned int o;
	for(c=0;c<l;c=c+1) {
		if (texte[c]!=' ') {
			o=texte[c]-'A';
			p = cpct_getScreenPtr(CPCT_VMEM_START, c*G_TILE_FONTMAP20X22_00_W,120-1);
			cpct_drawSprite(g_tile_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
		}
	}
}

