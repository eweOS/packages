#!/bin/bash

_patch_() {
  cd "$srcdir/${1:-$pkgname-$pkgver}" && shift
  for FILE in ${source[@]}; do
    if [[ $FILE == *.patch ]]; then
      patch -p1 < $srcdir/$FILE
    fi
  done
}
