#!/bin/sh
##
## Author(s):
##  - ctaf42 <ctaf42@gmail.com>
##
## Copyright (C) 2009 ctaf42
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
##
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##


devroot="/Developer/Platforms/${DEV_TARGET}.platform/Developer"
sysroot="${devroot}/SDKs/${DEV_TARGET}${IPHONE_TARGET}.sdk"
prefix="${DIST_DIR}/${DEV_TARGET}${IPHONE_TARGET}/"

echo "$ Simulation enviromment $"
echo "Iphone Target: ${IPHONE_TARGET}"
echo "Gcc   Version: ${GCC_VERSION}"
echo "sysroot      : ${sysroot}"
echo "prefix       : ${prefix}"

#prefer cpp than g++, cpp will do preprocessor
export CPP="${devroot}/usr/bin/cpp-${GCC_VERSION}"
export CC="${devroot}/usr/bin/gcc-${GCC_VERSION}"
export AR="${devroot}/usr/bin/ar"
export LD="${devroot}/usr/bin/ld"
export STRIP="${devroot}/usr/bin/strip"
export AS="${devroot}/usr/bin/as"
export NM="${devroot}/usr/bin/nm"
export RANLIB="${devroot}/usr/bin/ranlib"


