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

dir=$(dirname $0)

. ${dir}/config.shh
DEV_TARGET="iPhoneOS"
. ${dir}/base.shh

# for iPhone simulator
alias c-sim="echo fuck you"
alias c-iphone="./configure --prefix=${prefix} --enable-static=yes --enable-shared=no --host='arm-apple-darwin9'"

export LDFLAGS="-arch armv6 -pipe -no-cpp-precomp -isysroot ${sysroot} -L${prefix}/lib"
export CFLAGS="-arch armv6 -pipe -no-cpp-precomp -isysroot ${sysroot} -I${prefix}/include"
export CXXFLAGS="${CFLAGS}"
