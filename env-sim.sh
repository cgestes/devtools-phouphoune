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
#
# Env file to compile for iphone simulator
#
#export LDFLAGS="-arch i686 -isysroot ${sysroot} -Wl,-dead_strip -mmacosx-version-min=10.5"
#export CFLAGS="-arch i686 -pipe -mdynamic-no-pic -std=c99 -Wno-trigraphs -fpascal-strings -fasm-blocks -O0 -Wreturn-type -Wunused-variable -fmessage-length=0 -fvisibility=hidden -mmacosx-version-min=10.5  -I${sysroot}/usr/include/ -isysroot ${sysroot}"

dir=$(dirname $0)

. ${dir}/config.shh
DEV_TARGET="iPhoneSimulator"
. ${dir}/base.shh

# For iPhone simulator
alias c-sim="./configure --prefix=${prefix} --enable-static=yes --enable-shared=no"
alias c-iphone="echo fuck you"

export LDFLAGS="-arch i686 -pipe -no-cpp-precomp -isysroot ${sysroot} -mmacosx-version-min=${OSX_MIN_VERSION} -L{prefix}/lib"
export CFLAGS="-arch i686 -pipe -no-cpp-precomp -isysroot ${sysroot} -Mdynamic-no-pic -mmacosx-version-min=${OSX_MIN_VERSION} -I{prefix}/include"
export CXXFLAGS="$CFLAGS"
