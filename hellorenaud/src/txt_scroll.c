#include <cpctelera.h>
#include "fontmap20x22.h"

#define SCREEN_WIDTH 160/2

/**
 * texte : le texte
 * l : la longueur du texte
 * step : le pas de l'animation, de 0 à N, N peu importe.
 */
void scroll(char * texte, unsigned int l, int step) {
	u8* p;
	int c1;
	int c2;
	int div;
	int mod;
	unsigned int o;
	c2=step+SCREEN_WIDTH; // on insère du vide au début de step
	// c parcours la largeur de l'écran, c'est le premier ruban
	for(c1=0;c1<=(SCREEN_WIDTH-G_TILE_FONTMAP20X22_00_W);c1=c1+1) {
		// c2 avance, c'est un renderer
		c2=c2+1;
		// on coupe le second ruban
		if (c2 < 0) {continue;}
		if (c2 > l*G_TILE_FONTMAP20X22_00_W) {continue;}
		// on cherche le caractère
		div=c2/G_TILE_FONTMAP20X22_00_W;
		mod=c2%G_TILE_FONTMAP20X22_00_W;
		if (mod==0) {
			if (texte[div]!=' ') { // on zap les espaces FIXME mauvais pour le timing !
				o=texte[div]-'A';
				// on affiche c2 en c1
				p = cpct_getScreenPtr(CPCT_VMEM_START, c1,120-1);
				cpct_drawSprite(g_tile_fontmap20x22_tileset[o], p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);
			}
		}
	}
}

