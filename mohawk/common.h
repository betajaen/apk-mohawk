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

#ifndef MOHAWK_COMMON_H
#define MOHAWK_COMMON_H

#include "apk/pod.h"

namespace Mohawk {

    typedef apk::uint   uint;
    typedef apk::uint8  uint8;
    typedef apk::uint16 uint16;
    typedef apk::uint32 uint32;
    typedef apk::int8   int8;
    typedef apk::int16  int16;
    typedef apk::int32  int32;

    typedef APK_SIZE_TYPE   usize;
    typedef APK_SSIZE_TYPE  isize;

    typedef apk::byte byte;

}

#endif