#include <cpctelera.h>
#include "fontmap32x32plat.h"
//#include "jdvapi_frame.h"

#define SCREEN_WIDTH 160/2

u8* plot_screen2;
u8 firstPlotScreen2=1;
u8 c_screen3;
// le plot de connait pas l'offset x8000 non
// le plot connait l'offset horizontal oui (plot++)
// il écrit quelque part qu'il ne doit pas, donc si je retire l'écriture, G devrait avoir qu'une seule barre. en fait G a une barre de plus.
// d'après moi c'est image.
// faut remonter au char-ligne le bug et aviser
// FIXME par de boucle for sur height mais sur 4*8 char-lines
u8 draw_char(u8 c, u8 ce2, u8* image, u8* plot) {
	u8 x;
	u8 y;
	u8 patch_y;
	u8* cur_plot;
	u8* last_plot;
	u8* cur_image;
	u8* p;
	u8 c_screen2=ce2;
	last_plot=plot+ 0x4000 +80u*c+ 0x3801;
	// les trou (border) sont au milieu donc c'est plus grand la valeur de saut.
	if (last_plot<0x4000) {
		if (c<c_screen3) {
			c_screen3=c;
			plot_screen2=0x8000;
		}
		if (c<c_screen2) {
			c_screen2=c;
		}
//		if (firstPlotScreen2) {
//			// début d'écran 2
//			plot_screen2=0x8000;
//			firstPlotScreen2=0;
//		}
	//if (plot-0x8000>640*200/8) {
	//on ne peut pas chercher où tombe le caractère.
	//if (plot+0x4000>0xFFCF || plot+0x4000<0x4000) {
		// moins un screen (rembobinage)
		//(0xC000 + ((nY / 8u) * 80u) + ((nY % 8u) * 2048u) + nX)

		//(0xC000 + ((640 / 8u) * 80u) + ((640 % 8u) * 2048u) + 200)
		// (640 / 8u) * 80u == 0x1900
		// 640*200/8 == 0x3E80
		//cur_plot = plot - 640*200/8;
//		cur_plot = plot - 0x4000 + 80u*c;
		p = cpct_getScreenPtr(plot_screen2+0x4000, 0,8*(c-c_screen2));
		if (c_screen2==3 && c==3) {
			cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
		} else if (c_screen2==2 && c==3) { // le "suivant" en bas, donc 0 1
			// a priori ça dessine au dessous des 32 lignes
			cpct_drawSolidBox(p,0xFF,2,8);
		} else {
			cpct_drawSolidBox(p,c_screen2,2,8);
			//cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
		}
		//p = cpct_getScreenPtr(plot_screen2+0x4000, 0,8*(c-c_screen2));
		// au début c'est c==3 - on va dire          => c-3
		// au suivant c'est c==2 + c==3              => c-2
		// puis finalement c'est c==1 + c==2 + c==3  => c-1
		//idiot depuis draw_char les c ne sont pas visible d'un à l'autre
		//cpct_drawTileAligned2x8_f((u8*)image+(2*8)*(c-c_screen2), p);
		

//		for (y=0;y<8;y++) {
//			for (x=0;x<2;x++) {
//				cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
//				cur_image=image+(c*8+((y+1)%8))*2+x;
//				if (cur_plot<0x4000) {
//					cur_plot=cur_plot-0x4000;
//				}
//				*cur_plot=*cur_image;
//			}
//		}
	} else {
		p = cpct_getScreenPtr(plot+0x4000, 0,8*c);
		cpct_drawTileAligned2x8_f((u8*)image+(2*8)*c, p);
	}
	return c_screen2;
}	

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
	u8 ce2;	
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
	//cpct_drawSprite((u8*)pointeur, plot, 2, 32);
	ce2=draw_char(0,4,(u8*)pointeur, plot);
	ce2=draw_char(1,ce2,(u8*)pointeur, plot);
	ce2=draw_char(2,ce2,(u8*)pointeur, plot);
	ce2=draw_char(3,ce2,(u8*)pointeur, plot);
	if (ce2==4) {
		// hors du coup
		plot_screen2=0x8000;
		c_screen3=4;
	} else {
		plot_screen2+=2;
		plot_screen2=(u8 *)(((u16)plot_screen2) & 0x87FF);
	}
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

