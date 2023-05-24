#!/bin/bash

if [ -z $MQ_URL ]; then
	echo "Error: no message queue url specified."
	exit 1
fi
if [ -z $1 ]; then
	echo "Error: no package name specified."
	exit 1
fi
PKGNAME=$1

source ./package/PKGBUILD

for archi in "${arch[@]}"
do
   ./tools/tools/dispatch_build.sh $PKGNAME $archi
done


