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

//#define NO_SOUND

#include <cpctelera.h>
#include "schtroumpf.h"
#include "schtroumpf4x32.h"
#include "fontmap32x32plat.h"
#include "rupture.h"
#include "txt_scroll_hard.h"
#ifndef NO_SOUND
#include "audio.h"
#endif
#include "jdvapi_sync.h"
#include "cpct_floppy.h"

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
//cpct_setVideoMemoryPage(cpct_page80);
//cpct_setVideoMemoryOffset((unsigned char)(((unsigned int)R12R13)>>2));
}

u8 intCounter=0;

u8* screen_location; //=0x1000;
u8* screen_plot_address; //=0x4000+80-2;


void myInterruptHandler() {
//	u8* scrLocation;
   //u8* p;
   intCounter=intCounter+1;
   if (intCounter == 6) intCounter=0;

   if (intCounter == 2) {
	cpct_setBorder(0x54);
   } else {
	cpct_setBorder(0x50);
   }

	if (intCounter==5) {
__asm
ld bc,#0xbc06
out (c),c
ld bc,#0xbd04
out (c),c
__endasm;

		crtc(screen_location);

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
		cpct_setVideoMemoryPage(cpct_pageC0);
		cpct_setVideoMemoryOffset(0);
		rupture(7);
	}

	if (intCounter==3) {
		cpct_setVideoMemoryPage(cpct_pageC0);
		cpct_setVideoMemoryOffset(0);
		restoreVBL();
		rupture(39-19-7+1);
	}

#ifndef NO_SOUND
if (intCounter==4) {
   bank7_C000();
   akp_musicPlay();
   bank0123();
}
#endif

}


void main(void) {
   u16 t=0;
   //u8 s=0;
   u8* p;
   u8* sprite=g_items_0;

StoreDriveLetter();
InitializeAmsdos();

   cpct_setVideoMode(0);
   cpct_setBorder(HW_BLACK);
   cpct_setPalette(g_tile_palette, 6);

cpct_loadBinaryFile("CPC-BAT.SCR", 0xC000);



#ifndef NO_SOUND
   bank7_C000();
   akp_musicInit();
   bank0123();
#endif
   // prepare 0x8000
   cpct_disableFirmware();
   cpct_memcpy(0x6000,0x8000,0x2000);// la pile peut etre négative...
   cpct_setStackLocation(0x6000);
   cpct_memset_f64(0x8000, 0x0000, 0x4000);

   //load fond
   //SetupDOS();
   //LoadFile("FOND.SCR",0xC000);

   bank0123();

   // Draw the sprite to screen
   p = cpct_getScreenPtr(CPCT_VMEM_START, 0,110+16);
   cpct_hflipSpriteM0(4, 8, sprite);
   cpct_drawSprite(sprite, p, 4, 8);

   // le schtroumpf
   p = cpct_getScreenPtr(CPCT_VMEM_START, 1,96+16);
   cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);

calque8000();
//calqueC000();

screen_location=(u8 *)(0x2000);
screen_plot_address=(u8 *)(0x8000+80-2);

   cpct_setInterruptHandler(myInterruptHandler);
   t=0;
   while (1) {
	cpct_waitVSYNC();

	screen_location++;
	screen_location=(u8 *)(((u16)screen_location) & 0x23FF);

//crtc(screen_location);

	screen_plot_address+=2;
	screen_plot_address=(u8 *)(((u16)screen_plot_address) & 0x87FF);
	
	//p = cpct_getScreenPtr(screen_plot_address, 0,0);
	//s=(s+1)%8;
	//cpct_drawSprite(g_tile_schtroumpf4x32_tileset[s], screen_plot_address, G_TILE_SCHTROUMPF4X32_0_W, G_TILE_SCHTROUMPF4X32_0_H);

      scroll_hard(t,screen_plot_address);
      // size of texte
      t=t+1;

cpct_scanKeyboard_f();
if (cpct_isAnyKeyPressed_f()){
	cpct_memset_f64(0x8000, 0x0000, 0x4000);
}

      //intCounter=0;
      //killVBL();
      //rupture(39);
      //restoreVBL();
   }

}
