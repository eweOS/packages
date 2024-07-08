#!/bin/bash

if [ ! -f "PKGBUILD" ]; then
  echo "error: no PKGBUILD file found!"
  exit 1
fi

newpkgver=$1

if [ -z $newpkgver ]; then
  echo "error: no pkgver specified!"
  exit 1
fi

if grep -q "^\s*pkgver\s*()" PKGBUILD; then
  echo "error: PKGBUILD uses pkgver, can not auto bump"
  exit 1
fi

if grep "^pkgver=" PKGBUILD | grep -q '\$'; then
  echo "error: pkgver contains reference to another variable"
  exit 1
fi

declare `grep "^pkgver=.*$" PKGBUILD`

#Check if pkgver really exists
(( $pkgver )) 2>/dev/null

sed -i "s/^pkgver=.*$/pkgver=$newpkgver/" PKGBUILD

declare `grep "^pkgrel=.*$" PKGBUILD`

#Check if pkgrel really exists
(( $pkgrel )) 2>/dev/null

sed -i "s/^pkgrel=.*$/pkgrel=1/" PKGBUILD
