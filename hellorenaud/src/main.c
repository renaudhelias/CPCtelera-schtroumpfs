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

void myInterruptHandler() {


   static u8 i;
   cpct_setBorder(i+1);
   if (++i > 5) i=0;

#ifndef NO_SOUND
if (i==2) {
akp_musicPlay();
}
#endif
}

void main(void) {
   u8* pvmem;  // Pointer to video memory
   u8* p;
   u8* sprite=g_items_0;
   u8 pos;

//   SetupDOS();
//	if (1==1) return;
//   LoadFile("akg6000.bin", (char *)0x6000);
//   LoadFile("molusk.akg", (char *)0x7000);



   // Clear Screen (cpct_drawStringM0)
   cpct_disableFirmware();
   cpct_setStackLocation(0x8000);

// copy from &4000 bank4 to &C000
//bank4_4000();
//cpct_memcpy(0x4000, 0xC000, 0x4000);
//bank0123();
calque4000();

   // CLS with 0.
   //cpct_clearScreen_f64(0);
   cpct_setVideoMode(0);

   cpct_setBorder(HW_BLACK);
   cpct_setPalette(g_tile_palette, 16);
   //cpct_memset(CPCT_VMEM_START, 0, 0x4000);

   // horizontal scroll
   //cpct_setVideoMemoryOffset(3);

   // Draw the sprite to screen
   p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   cpct_drawSprite(sprite, p, 4, 8);

   // efface l'ecran
   //cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x4000);
   //cpct_memset_f64(CPCT_VMEM_START, 0xFFFF, 0x4000);

   //cpct_hflipSpriteMaskedM0 : affichage de la tete de mort de droite à gauche (flip)
   cpct_hflipSpriteM0(4, 8, sprite);
   cpct_drawSprite(sprite, p, 4, 8);

   p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,32-1);
   cpct_drawSolidBox(p, cpct_px2byteM0(2, 3), 10, 20);

   // Draw String on the middle of the screen
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
   cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);

   // le schtroumpf est affiché devant la phrase.
   p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);

   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 10, 150);
   cpct_drawStringM0("Press ENTER.", pvmem, 3, 2);
   // Loop forever
   cpct_srand(77);
   
   
#ifndef NO_SOUND
   akp_musicInit();
#endif

   cpct_scanKeyboard_f();
   while (!cpct_isKeyPressed(Key_Enter) && !cpct_isKeyPressed(Key_Return)){
      p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
      cpct_drawCharM0(p, 2,0, cpct_rand());
      cpct_scanKeyboard_f();
   }
calqueC000();
   cpct_setInterruptHandler(myInterruptHandler);
   while (1) {}

}
