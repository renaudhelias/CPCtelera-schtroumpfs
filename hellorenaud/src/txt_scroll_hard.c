#include <cpctelera.h>
#include "fontmap32x32plat.h"

#define SCREEN_WIDTH 160/2

/**
 * texte : le texte
 * l : la longueur du texte
 * step : le pas de l'animation, de 0 à N, N peu importe.
 */
void scroll_hard(char * texte, unsigned int l, int step, u8* screen_plot_address) {
	int div;
	int mod;
	unsigned int o;
	u16 pointeur=(u16)g_tile_fontmap32x32plat_000;

	// on cherche le caractère
	div=step/8;
	mod=step%8;
	if (div<0 || div>l) {return;}
	if (texte[div]==' ') {
		o=0;
	} else {
		o=texte[div]-'?';
	}
	cpct_drawSprite(pointeur+o*8*(32*2)+mod*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
}



//void draw(char * texte, int texte_cur, int offset) {
//	u16 pointeur=(u16)g_tile_fontmap32x32plat_000;
//	pointeur = pointeur+(texte[texte_cur]-'A')*(32*2)+2*(32*2);
//	cpct_drawSprite(pointeur+offset*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
//}

