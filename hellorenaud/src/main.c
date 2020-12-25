//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//------------------------------------------------------------------------------

#define NO_SOUND

#include <cpctelera.h>
#include "schtroumpf.h"
#include "schtroumpf4x32.h"
#include "fontmap32x32plat.h"
#include "rupture.h"
#ifndef NO_SOUND
#include "audio.h"
#endif
#include "jdvapi_sync.h"

// Tile g_items_0: 8x8 pixels, 4x8 bytes.
const u8 g_items_0[4 * 8] = {
	0x05, 0x0f, 0x0f, 0x00,
	0x0f, 0x0f, 0x0f, 0x0a,
	0x0f, 0x0a, 0x05, 0x00,
	0x0f, 0x0a, 0x05, 0x00,
	0x05, 0x0f, 0x0a, 0x0a,
	0x00, 0x0f, 0x0f, 0x0a,
	0x00, 0x0a, 0x0a, 0x0a,
	0x00, 0x00, 0x00, 0x00
};

// poke &C000+79, 255:REM en haut à droite
// FOR C=0 TO 3
// FOR L=0 TO 7
// POKE &C000+l*&800+80*C+79
// NEXT L
// NEXT C
/**
 * hScroll 0-80
 */
/*void monter(unsigned int c,u16 hScroll) {
	unsigned int l;
	u8* plot_column;
	for (l=0;l<8;l++) {
		// mode 0 : deux pixels par byte
		plot_column=(u8 *)(0x4000 + l*0x800 + 80*c + hScroll%80);
		//cpct_memcpy(plot_column,plot_column,1);
		*plot_column=*plot_column+0X33;
		// on loupe un caractère sur 2 puis on le rattrappe
		plot_column=plot_column-1;
		*plot_column=*plot_column+0X33;
	}
}*/

void wait_frame_flyback() {
__asm
ld b,#0xf5   ;wait frame flyback
l1: in a,(c)
rra
jr nc,l1
__endasm;
}

void crtc(u8* R12R13) {
__asm
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	h, 5 (ix)
	ld	l, 4 (ix)
ld bc,#0xbc00+12
out (c),c
inc b
out (c),h
dec b
inc c
out (c),c
inc b
out (c),l
	pop	ix
__endasm;

}

u8 intCounter=0;
u16 hOffset=0;
u8 slow=0;


u8* screen_location; //=0x1000;
u8* screen_plot_address; //=0x4000+80-2;


void myInterruptHandler() {
//	u8* scrLocation;
   //u8* p;
   intCounter=intCounter+1;
   if (intCounter == 6) intCounter=0;

   if (intCounter == 2) {
	cpct_setBorder(2);
   } else {
	cpct_setBorder(3);
   }

#ifndef NO_SOUND
if (intCounter==2) {
akp_musicPlay();
}
#endif

	if (intCounter==5) {
		//calque4000();
		//screen_location=0x1000;
		//screen_location++;
		//screen_location=((unsigned int)screen_location) & 0x13FF;
		//crtc((u16)screen_location);
		//crtc(0x1000);

		// horizontal scroll
		// FIXME 80 I do work in two images instead of one
		//hOffset=(hOffset+1)%(40*8);
		//if (hOffset/20==0) {
		//	monter(4,(hOffset%40)*2);
		//} else {
		//	monter(3,(hOffset%40)*2);
		//}
		//scrLocation = cpct_getScreenPtr(0xC000+hOffset, 0, 0);
		//*scrLocation=
		//testScrolled();
		// FIXME ici c'est pas bien : on influ que juste sur de début du scroll
		// paquets de 2byte donc 40 ici en largeur
		//cpct_setVideoMemoryOffset(hOffset%40);
		// FIXME c'est un unsigned int, donc c'est gros.
		
		//cpct_setVideoMemoryOffset(hOffset%(40*8));
__asm
ld bc,#0xbc06
out (c),c
ld bc,#0xbd04
out (c),c
__endasm;

		screen_location++;
		screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
		crtc(screen_location);

		screen_plot_address++;
		screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
		screen_plot_address++;
		screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);


		killVBL();
		rupture(19-1);
		
		
	}

        if (intCounter==2) {
__asm
ld bc,#0xbc06
out (c),c
ld bc,#0xbd19
out (c),c
__endasm;
		calqueC000();
		cpct_setVideoMemoryOffset(0);
		rupture(7);
	}

	if (intCounter==3) {
		calqueC000();
		cpct_setVideoMemoryOffset(0);
		restoreVBL();
		rupture(39-19-7+1);
	}

}

void draw(char * texte, int texte_cur, int offset) {
	u8* pointeur=(u16)g_tile_fontmap32x32plat_000;
	pointeur = pointeur+(texte[texte_cur]-'A')*(32*2)+2*(32*2);
	cpct_drawSprite(pointeur+offset*(32*2), screen_plot_address, G_TILE_FONTMAP32X32PLAT_000_W, G_TILE_FONTMAP32X32PLAT_000_H);
}

void main(void) {
   int t=0;
   int s=0;
   u8* p;
   u8* sprite=g_items_0;
   //char * texte="HELLO@LES@AMIS@@";
   int texte_length=16;
   int texte_cur=0;
   int o=0;
   int oc=0;
//   u16 p2;
//   int initInterruptDone;
// sdcc -mz80 -c --std-c99 --opt-code-speed --fno-omit-frame-pointer --oldralloc jdvapi_floppy.c
//   SetupDOS();
//	if (1==1) return;
//   LoadFile("akg6000.bin", (char *)0x6000);
//   LoadFile("molusk.akg", (char *)0x7000);

   // Clear Screen (cpct_drawStringM0)

#ifndef NO_SOUND
   akp_musicInit();
#endif
   cpct_disableFirmware();
   cpct_memcpy(0x7000,0x8000,0x1000);
   cpct_setStackLocation(0x7000);
   cpct_memset_f64(0x8000, 0x0000, 0x4000);
   //raster_halt();
//   cpct_setInterruptHandler(myInterruptHandler);



//   bank4_4000();
   bank0123();
//   calqueC000();
   // CLS with 0.
   //cpct_clearScreen_f64(0);
//This function requires the CPC firmware to be DISABLED
   cpct_setVideoMode(0);
//This function pas dans la doc
  cpct_setBorder(HW_BLACK);
//This function requires the CPC firmware to be DISABLED
   cpct_setPalette(g_tile_palette, 6);
//   cpct_memset(CPCT_VMEM_START, 0, 0x4000);



   // Draw the sprite to screen
   p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
//   cpct_drawSprite(sprite, p, 4, 8);

   // efface l'ecran
   //cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x4000);
   cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x2000);

   //cpct_hflipSpriteMaskedM0 : affichage de la tete de mort de droite à gauche (flip)
   cpct_hflipSpriteM0(4, 8, sprite);
   cpct_drawSprite(sprite, p, 4, 8);

   p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);

   cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);

   // le schtroumpf est affiché devant la phrase.
   p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);

//   p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,120-1);
//   cpct_drawSprite(g_tile_fontmap20x22_00, p, G_TILE_FONTMAP20X22_00_W, G_TILE_FONTMAP20X22_00_H);

   //scroll(" ABRUTI", 7);
   
//Faire BIP (PRINT CHR$(7))
//__asm
//ld a,#0x07
//call #0xBB5A
//__endasm;

   // Loop forever
//   cpct_srand(77);
   
   

//   cpct_scanKeyboard_f();
//   t=0;
//   while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
//      scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
//      t=t+1;
//      if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
//      if (t%128==0) {
//	      cpct_scanKeyboard_f();
//      }
//   }

 
  // horizontal scroll
//   cpct_setVideoMemoryOffset(0);
//   calque4000();
//   initInterruptDone=0;

//calque4000();

//cpct_disableFirmware();
//cpct_memset_f64(0x4000,0x00,0x4000); // SCR_VMEM, 0, 0x4000
calqueC000();
//cpct_scanKeyboard_f();

//   t=0;
//   while ((!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))) {
//	scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
//	t=t+1;
//	cpct_scanKeyboard_f();
//   }
calque8000(); // faut que le AND du début match

screen_location=(u8 *)(0x2000);
screen_plot_address=(u8 *)(0x8000+80-2);

   while (1) {
	//vsync();

	wait_frame_flyback();
	//p = cpct_getScreenPtr(screen_plot_address, 0,0);


		screen_location++;
		screen_location=(u8 *)(((unsigned int)screen_location) & 0x23FF);
		crtc(screen_location);

		screen_plot_address++;
		screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);
		screen_plot_address++;
		screen_plot_address=(u8 *)(((unsigned int)screen_plot_address) & 0x87FF);



	s=s+1;
	if (s==8) {s=0;}
	if (s==0) {texte_cur=texte_cur+1; if (texte_cur==texte_length) {texte_cur=0;}}

	//cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_0_W, G_TILE_SCHTROUMPF4X32_0_H);
//('G'-'A')*8
// 240/8=30
	//o=o+1;//(texte[texte_cur]-'?')*8+s;
	//if (o>=8) {o=0;}

	draw("HELLO@LES@AMIS@@",texte_cur,s);
      //intCounter=0;
      //killVBL();
      //rupture(39);
      //restoreVBL();


//      cpct_scanKeyboard_f();
//      if (cpct_isKeyPressed(Key_Space)) {
//          akp_sfxPlay();
//      }
   }

}
