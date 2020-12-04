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

#include <cpctelera.h>
#include "schtroumpf.h"

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

void main(void) {
   u8* pvmem;  // Pointer to video memory
   u8* p;
   u8* sprite=g_items_0;
   u8 pos;
   u32 seed;

   // Clear Screen
   cpct_disableFirmware();
   // CLS with 0.
   cpct_clearScreen_f64(0);
   cpct_setVideoMode(0);
   cpct_setBorder(HW_BLACK);
   cpct_setPalette(g_tile_palette, 6);
   cpct_memset(CPCT_VMEM_START, 0, 0x4000);

   // Draw the sprite to screen
   p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   cpct_drawSprite(sprite, p, 4, 8);

   // efface l'ecran
   cpct_memset_f64 (CPCT_VMEM_START, 0xFFFF, 0x4000);

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

   // Loop forever
   while (1){
      seed++;

      cpct_scanKeyboard_f();

      // Check if user has pressed a Cursor Key and, if so, move the sprite if
      // it will still be inside screen boundaries
      if      (cpct_isKeyPressed(Key_CursorRight) && pos < 0xFF ) ++pos; 
      else if (cpct_isKeyPressed(Key_CursorLeft)  && pos > 0    ) --pos; 
      if      (cpct_isKeyPressed(Key_CursorUp)    && pos > 0    ) --pos;
      else if (cpct_isKeyPressed(Key_CursorDown)  && pos < 0xFF ) ++pos;
 
      p = cpct_getScreenPtr(CPCT_VMEM_START, 32-1,16-1);
      cpct_drawCharM0(p, 2,0, pos);
      p = cpct_getScreenPtr(CPCT_VMEM_START, 8-1, 94);
      cpct_srand(seed);
      cpct_drawCharM0(p, 2,0, cpct_rand());
   }

}
