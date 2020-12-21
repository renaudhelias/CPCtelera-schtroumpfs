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
#include "fontmap20x22.h"
#include "txt_scroll.h"
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
void monter(unsigned int c,u16 hScroll) {
	unsigned int l;
	u8* plot_column;
	for (l=0;l<8;l++) {
		// mode 0 : deux pixels par byte
		plot_column=(u8 *)(0x4000 + l*0x800 + 80*c+(hScroll/2)%80);
		//cpct_memcpy(plot_column,plot_column,1);
		*plot_column=*plot_column+0X33;
		// on loupe un caractère sur 2 puis on le rattrappe
		plot_column=plot_column-1;
		*plot_column=*plot_column+0X33;
	}
}

void monterDerniereColonne(u16 hScroll) {
	if (hScroll/80==0) {
		monter(4,hScroll);
	} else if (hScroll/80==1) {
		monter(3,hScroll);
	}
}

u8 intCounter=0;
u16 hScroll=0;
u8 slow=0;

void myInterruptHandler() {
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
		calque4000();
		// horizontal scroll
		hScroll+=1;
		if (hScroll==160) {hScroll=0;}
		monterDerniereColonne(hScroll);
		cpct_setVideoMemoryOffset((hScroll/2)%80);
		killVBL();
		rupture(19-1);
	}

        if (intCounter==2) {
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

void main(void) {
   int t=0;
   u8* p;
   u8* sprite=g_items_0;
   int initInterruptDone;
// sdcc -mz80 -c --std-c99 --opt-code-speed --fno-omit-frame-pointer --oldralloc jdvapi_floppy.c
//   SetupDOS();
//	if (1==1) return;
//   LoadFile("akg6000.bin", (char *)0x6000);
//   LoadFile("molusk.akg", (char *)0x7000);

   // Clear Screen (cpct_drawStringM0)

#ifndef NO_SOUND
   akp_musicInit();
#endif
   //cpct_disableFirmware();
   //raster_halt();
   //cpct_setStackLocation(0x8000);
   cpct_setInterruptHandler(myInterruptHandler);



   bank4_4000();
   bank0123();
   calqueC000();
   // CLS with 0.
   //cpct_clearScreen_f64(0);
   cpct_setVideoMode(0);


   cpct_setBorder(HW_BLACK);
   cpct_setPalette(g_tile_palette, 6);
   cpct_memset(CPCT_VMEM_START, 0, 0x4000);



   // Draw the sprite to screen
   p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   cpct_drawSprite(sprite, p, 4, 8);

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
   cpct_srand(77);
   
   

   cpct_scanKeyboard_f();
   t=0;
   while (t%128!=0 || (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return))){
      scroll("WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS WE WISH YOU A MERRY CHRISTMAS AND A HAPPY NEW YEAR", 110, t);
      t=t+1;
      if (t>110*G_TILE_FONTMAP20X22_00_W+160) {t=0;}
      if (t%128==0) {
	      cpct_scanKeyboard_f();
      }
   }

 
  // horizontal scroll
   cpct_setVideoMemoryOffset(0);
   calque4000();
   initInterruptDone=0;
   while (1) {
      vsync();
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
