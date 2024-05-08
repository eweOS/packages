#!/bin/bash

if [ ! -f "PKGBUILD" ]; then
  echo "error: no PKGBUILD file found!"
  exit 1
fi

declare `grep "^pkgrel=.*$" PKGBUILD`

#Check if pkgrel really exists
(( $pkgrel )) 2>/dev/null

echo "old pkgrel=$pkgrel"

pkgrel=$((pkgrel+1))

echo "new pkgrel=$pkgrel"

sed -i "s/^pkgrel=.*$/pkgrel=$pkgrel/" PKGBUILD

