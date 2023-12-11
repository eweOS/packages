#!/bin/bash

_patch_() {
  _PREV_PWD=$PWD
  cd "$srcdir/${1:-$pkgname-$pkgver}" && shift
  for FILE in ${source[@]}; do
    if [[ $FILE == *.patch ]]; then
      patch -p1 < $srcdir/$FILE
    fi
  done
  cd $_PREV_PWD
}
