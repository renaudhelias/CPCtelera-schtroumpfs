#include <cpctelera.h>
#include "fontmap32x32plat.h"
//#include "jdvapi_frame.h"

#define SCREEN_WIDTH 160/2

const char texte []="WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR FROM THSF AND TETALAB      AZERTYUIOPQSDFG     \0";

/**
 * texte : le texte
 * l : la longueur du texte
 * step : le pas de l'animation, de 0 à N, N peu importe.
 */
void scroll_hard(u16 step, u8* screen_plot_address) {
	u16 div;
	u16 mod;
	u16 o;
	//u8* p;
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

	//cpct_drawSolidBox(plot,0xFF,2,32);
	cpct_drawSprite((u8*)pointeur, plot, 2, 32);

	//cpct_drawSpriteBlended(plot, G_TILE_FONTMAP32X32PLAT_000_H, G_TILE_FONTMAP32X32PLAT_000_W, (u8*)pointeur);
	// FIXME, c'est pire sans _f
	//p = cpct_getScreenPtr(plot, 0,0);
	//cpct_drawTileAligned2x8_f((u8*)pointeur, p);
	//p = cpct_getScreenPtr(plot, 0,8);
	//cpct_drawTileAligned2x8_f((u8*)pointeur+(2*8), p);
	//p = cpct_getScreenPtr(plot, 0,16);
	//cpct_drawTileAligned2x8_f((u8*)pointeur+(4*8), p);
	//p = cpct_getScreenPtr(plot, 0,24);
	//cpct_drawTileAligned2x8_f((u8*)pointeur+(6*8), p);
}

