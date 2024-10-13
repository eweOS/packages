#!/bin/bash

_patch_() {
  _PREV_PWD=$PWD
  cd "$srcdir/${1:-$pkgname-$pkgver}" && shift
  for FILE in ${source[@]}; do
    realfile=${FILE%::*}
    if [[ $realfile == *.patch ]]; then
      msg2 "Applying $realfile"
      patch -p1 < $srcdir/$realfile
    fi
  done
  cd $_PREV_PWD
}
