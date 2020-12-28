#include <cpctelera.h>
#include "fontmap32x32plat.h"
//#include "jdvapi_frame.h"

#define SCREEN_WIDTH 160/2

const char texte []="WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR                                                ";

/**
 * texte : le texte
 * l : la longueur du texte
 * step : le pas de l'animation, de 0 à N, N peu importe.
 */
void scroll_hard(int step, u8* screen_plot_address) {
	int div;
	int mod;
	unsigned int o;
	u16 pointeur;
	u8* plot=screen_plot_address;

	// on cherche le caractère
	div=step/8;
	mod=step%8;
	div=div%128;
	if (texte[div]==' ') {
		o=0;
	} else {
		o=texte[div]-'?';
	}

	pointeur=(u16)g_tile_fontmap32x32plat_000+o*8*(32*2)+mod*(32*2);

	cpct_drawSprite((u8*)pointeur, plot, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
}

