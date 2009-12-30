#!/bin/bash
#from http://sites.google.com/site/olipion/cross-compilation/usefull-scripts
#this will be usefull to create a single env that contain both library version

LIB_LIPO=/Users/olivier/Documents/IphoneDevProjects/3rdParty/iphone
LIB_OS=/Users/olivier/Documents/IphoneDevProjects/3rdParty/iphone-os/lib
LIB_SIM=/Users/olivier/Documents/IphoneDevProjects/3rdParty/iphone-sim/lib
DEVROOT=/Developer/Platforms/iPhoneOS.platform/Developer
cd $LIB_SIM
find . -name "*.a" -print > $LIB_LIPO/lib.sim
cd $LIB_OS
find . -name "*.a" -print > $LIB_LIPO/lib.os
cd $LIB_LIPO
sort lib.* | awk '{if ($0 == prev) print $0;prev=$0}' > lib.iphone
for l in `cat lib.iphone`; do
 baseDir=`dirname $l`
 if [ ! $baseDir = "." ] ; then
   if [ ! -d lib/test ] ; then
     echo "Need to create directory $LIB_LIPO/lib/$baseDir"
     mkdir -p $LIB_LIPO/lib/$baseDir 2> /dev/null
   fi
 fi
 echo "Lipo on $l"
 $DEVROOT/usr/bin/lipo -arch arm $LIB_OS/$l -arch i386 $LIB_SIM/$l -create -output lib/$l
done
rm -f $LIB_LIPO/lib.*
