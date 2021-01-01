#include <cpctelera.h>
#include "fontmap32x32plat.h"
//#include "jdvapi_frame.h"

#define SCREEN_WIDTH 160/2

// le plot de connait pas l'offset x8000 non
// le plot connait l'offset horizontal oui (plot++)
// il écrit quelque part qu'il ne doit pas, donc si je retire l'écriture, G devrait avoir qu'une seule barre. en fait G a une barre de plus.
// d'après moi c'est image.
// faut remonter au char-ligne le bug et aviser
// FIXME par de boucle for sur height mais sur 4*8 char-lines
void draw_char(u8 c, u8* image, u8* plot) {
	u8 x;
	u8 y;
	u8 patch_y;
	u8* cur_plot;
	u8* last_plot;
	u8* cur_image;
	last_plot=plot+ 0x4000 +80u*c+ 0x3801;
	if (last_plot<0x4000) {
		for (y=0;y<8;y++) {
			for (x=0;x<2;x++) {
				cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
				cur_image=image+(c*8+y)*2+x;
				if (cur_plot<0x4000) {
					cur_plot=cur_plot-0x4000;
					//*cur_plot=*cur_image;
					*cur_plot=0xF0;
				} else {
					*cur_plot=0xFF;
				}
			}
		}
	} else {
		for (y=0;y<8;y++) {
			for (x=0;x<2;x++) {
				cur_plot=plot+ 0x4000 +80u*c+ ((y % 8u) * 2048u) + x;
				cur_image=image+(c*8+y)*2+x;
				*cur_plot=*cur_image;
			}
		}
	}
}	



/*void put_frame(unsigned char *pAddress, unsigned char nWidth, unsigned char nHeight, const unsigned char *image)
{
  __asm
    LD L, 4(IX) 		; HL --> Adr destination
    LD H, 5(IX) 
    LD C, 6(IX) 		; C --> Largeur en octet
    LD B, 7(IX)         ; B --> Hauteur
    LD E, 8(IX) 		; DE --> Adresse image source.
    LD D, 9(IX) 

    _loop_alto000:
       PUSH BC				; Sauvegarde de BC sur la pile (width et height)
       LD B,C				; Charge C (width) dans B
       PUSH HL				; Sauvegarde de HL (adresse de la destination)
    _loop_ancho000:
       LD A,(DE)			; Met dans A un octet de de la source
       LD (HL),A			; Met dans la destination A
       INC DE				; Avance dans l'adresse de la source
       INC HL				; Avance dans l'adresse de la destination
       DJNZ _loop_ancho000		; Décrémente B qui contient la largeur. Si on à pas finit de copier 
							; l'équivalent de la largeur on saute à _loop_ancho.
       POP HL				; récupère l'adresse de la cible sauvegardé sur la pile
       LD A,H				; Charge la partie haute dans A
       ADD #0x08			; Ajoute la valeur 8 à A --> Permet de passer à la ligne suivante
       LD H,A				; Réinjecte A dans H, HL nous donne ainsi l'adresse de début de la ligne suivante
       SUB #0xC0			; On vérifie que la ligne suivante en mémoire n'est pas à remonter ... 
       JP NC, _sig_linea000	; Non, elle est à la suite en mémoire donc tout va bien
       LD BC, #0x8050		; On doit remonter, on va ajouter C000 (notre page par défaut + 0x080 pour la ligne suivante)
       ADD HL,BC			; Ajoute ça dans l'adresse de destination --> On est sur la nouvelle ligne
    _sig_linea000:
       POP BC				; Récupère BC --> pour récupérer la hauteur
       DJNZ _loop_alto000		; Enlève 1 à la hauteur, si on à pas tout traité, on reboucle au début _loop_alto
  __endasm;
}*/

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
	//cpct_drawSprite((u8*)pointeur, plot, 2, 32);
	draw_char(0,(u8*)pointeur, plot);
	draw_char(1,(u8*)pointeur, plot);
	draw_char(2,(u8*)pointeur, plot);
	draw_char(3,(u8*)pointeur, plot);
	//put_frame( plot, 2, 32,(u8*)pointeur);
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

