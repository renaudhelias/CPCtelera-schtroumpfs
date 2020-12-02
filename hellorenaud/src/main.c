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
   //CPCT_BlendMode mode;
   // Clear Screen
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_setBorder(HW_BLACK);
   cpct_setPalette(g_tile_palette, 6);
   cpct_memset(CPCT_VMEM_START, 0, 0x4000);

   // Draw String on the middle of the screen
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 88);
//   cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);


   // CPCT_BLEND_XOR, CPCT_BLEND_AND x, CPCT_BLEND_OR, CPCT_BLEND_ADD, CPCT_BLEND_SUB, CPCT_BLEND_LDI x, CPCT_BLEND_ADC, CPCT_BLEND_SBC, CPCT_BLEND_NOP

   //mode = CPCT_BLEND_ADD;
   // Set the blend mode to use before drawing the sprite using blending
   //cpct_setBlendMode(mode);
   // Draw the sprite to screen with blending
   p = cpct_getScreenPtr(CPCT_VMEM_START, 16-1,16-1);
   cpct_drawSprite(sprite, p, 4, 8);

   //p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   //cpct_drawSpriteBlended(p, 32, 16, g_tile_schtroumpf);
   cpct_drawStringM0("Welcome to you!", pvmem, 2, 0);

   //mode = CPCT_BLEND_OR;
   //cpct_setBlendMode(mode);
   p = cpct_getScreenPtr(CPCT_VMEM_START, 10-1,80-1);
   cpct_drawSpriteMasked(g_tile_schtroumpf, p, G_TILE_SCHTROUMPF_W, G_TILE_SCHTROUMPF_H);

   // Loop forever
   while (1);
}
