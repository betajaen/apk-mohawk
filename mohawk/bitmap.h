/* ScummVM - Graphic Adventure Engine
 *
 * ScummVM is the legal property of its developers, whose names
 * are too numerous to list here. Please refer to the COPYRIGHT
 * file distributed with this source distribution.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#ifndef MOHAWK_BITMAP_H
#define MOHAWK_BITMAP_H

#include "mohawk/common.h"

namespace Mohawk {

class MohawkSurface;

enum BitmapFormat {
	kBitsPerPixel1 = 0x0000,
	kBitsPerPixel4 = 0x0001,
	kBitsPerPixel8 = 0x0002,
	kBitsPerPixel16 = 0x0003,
	kBitsPerPixel24 = 0x0004,
	kBitsPerPixelMask = 0x0007,
	kBitmapHasCLUT = 0x0008,
	kDrawMASK = 0x00f0,
	kDrawRaw = 0x0000,
	kDrawRLE8 = 0x0010,
	kDrawMSRLE8 = 0x0020,
	kDrawRLE = 0x0030,
	kPackMASK = 0x0f00,
	kPackNone = 0x0000,
	kPackLZ = 0x0100,
	kPackLZ1 = 0x0200,
	kPackRiven = 0x0400,
	kPackXDec = 0x0f00,
	kFlagMASK = 0xf000,
	kFlag16_80X86 = 0x1000, // 16 bit pixel data has been converted to 80X86 format
	kFlag24_MAC = 0x1000 // 24 bit pixel data has been converted to MAC 32 bit format
};

enum OldBitmapFormat {
	kOldPackLZ = 0x0020,
	kOldDrawRLE8 = 0x0100
};

struct BitmapHeader {
	uint16 width;
	uint16 height;
	int16 bytesPerRow;
	uint16 format;

	struct ColorTable {
		uint16 tableSize;
		byte rgbBits;
		byte colorCount;
		byte* palette;   // In 8bpp only
	} colorTable;
};

}

#endif